"""Code generators for an experimental generated Python interface of igraph."""

from contextlib import contextmanager, ExitStack
from dataclasses import dataclass
from functools import lru_cache
from typing import Callable, Dict, IO, Iterator, List, Optional, Sequence, Set, Tuple

from stimulus.errors import CodeGenerationError, NoSuchTypeError
from stimulus.model.functions import FunctionDescriptor
from stimulus.model.parameters import DefaultValueType, ParamMode, ParamSpec
from stimulus.model.types import TypeDescriptor

from .base import SingleBlockCodeGenerator
from .utils import create_indentation_function, remove_prefix


indent = create_indentation_function("    ")


@lru_cache(maxsize=128)
def _get_ctypes_arg_type_from_c_arg_type(c_type: str):
    # Strip "const" from the front
    c_type = c_type.strip()
    while c_type.startswith("const "):
        c_type = c_type[6:].strip()

    # Replace pointer asterisks
    wrap_counter = 0
    while c_type.endswith("*"):
        c_type = c_type[:-1].strip()
        wrap_counter += 1

    # Add c_ prefix if needed
    if c_type in (
        "char",
        "int",
        "float",
        "double",
        "size_t",
        "ssize_t",
        "bool",
        "void",
    ):
        c_type = f"c_{c_type}"

    # Some ctypes types have specific aliases for the single-pointer case
    if wrap_counter > 0 and c_type in ("c_void", "c_char", "c_wchar"):
        wrap_counter -= 1
        c_type = f"{c_type}_p"

    # Wrap the type in POINTER() as many times as needed
    while wrap_counter > 0:
        c_type = f"POINTER({c_type})"
        wrap_counter -= 1

    # c_void should be substituted with None
    if c_type == "c_void":
        c_type = "None"

    return c_type


def _get_python_type_from_type_spec(
    type_spec: TypeDescriptor, out: bool = False
) -> Optional[str]:
    if out and "PY_RETURN_TYPE" in type_spec:
        return type_spec.get("PY_RETURN_TYPE")
    elif "PY_TYPE" in type_spec:
        return type_spec.get("PY_TYPE")
    else:
        raise CodeGenerationError(f"no Python type known for type: {type_spec.name}")


def _format_docstring(value: str) -> str:
    """Formats a Python docstring."""
    value = indent(value.strip()).strip()
    if "\n" not in value:
        return f'    """{value}"""'
    else:
        return f'    """{value}\n    """'


class IndentedWriter:
    """Helper class to dynamically manage indentation levels while creating the
    body of a function.
    """

    _indentation: str = "    "
    """The indentation prefix for each line for a single indentation level."""

    _level: int = 0
    """The current indentation level."""

    _writer: Callable[[str], None]
    """The writer function to wrap."""

    def __init__(self, writer: Callable[[str], None], *, level: int = 0):
        """Constructor."""
        self._writer = writer
        self._level = level

    @contextmanager
    def indent(self) -> Iterator[None]:
        """Context manager that increases the current indentation level
        while the execution is in the context.
        """
        self._level += 1
        try:
            yield
        finally:
            self._level -= 1

    def write(self, line: str) -> None:
        if line:
            line = (self._indentation * self._level) + line
        self._writer(line)

    __call__ = write


class PythonCTypesCodeGenerator(SingleBlockCodeGenerator):
    """Code generator that generates argument and return value specifications
    of each igraph function using the Python ctypes module.

    This generator generates a Python code snippet that can be inserted into
    a Python source file, assuming that the following assumptions hold:

    * the Python source file contains a variable named ``_lib`` that refers to
      igraph's C shared library as loaded by ``ctypes``

    * it also has a callable named ``handle_igraph_error_t`` that takes an
      igraph error code and raises an approprate exception if the error code
      is nonzero (and returns ``None`` otherwise)

    * all the C data types used in the functions are present in the Python
      namespace, aliased to the appropriate ctypes types
    """

    bitfield_types: Set[str]
    enum_types: Set[str]
    lines: List[str]

    def generate_preamble(self, inputs: Sequence[str], output: IO[str]) -> None:
        self.bitfield_types = set()
        self.enum_types = set()
        self.lines = []
        return super().generate_preamble(inputs, output)

    def generate_function(self, name: str, output: IO[str]) -> None:
        self.lines.append("")
        try:
            self._generate_function(name, self.lines.append)
        except CodeGenerationError as ex:
            self.lines.append(f"# {name}: {ex}")

    def _generate_function(self, name: str, write: Callable[[str], None]) -> None:
        # Check types
        self.check_types_of_function(name)

        # Get function specification
        spec = self.get_function_descriptor(name)

        # Construct Python return type
        return_type = self.get_type_descriptor(spec.return_type)
        py_return_type: Optional[str] = return_type.get("CTYPES_RETURN_TYPE")
        if not py_return_type:
            # Try deriving the ctypes type
            py_return_type = _get_ctypes_arg_type_from_c_arg_type(
                return_type.get_c_type()
            )

        if not py_return_type:
            raise NoSuchTypeError(
                spec.return_type,
                message=f"No ctypes return type known for abstract type {spec.return_type}",
            )

        # Remember the type if it is an enum type or a bitfield type
        if return_type.is_enum:
            self.enum_types.add(py_return_type)
        if return_type.is_bitfield:
            self.bitfield_types.add(py_return_type)

        # Construct Python argument types in the ctypes layer
        py_arg_types: List[str] = []
        for parameter in spec.iter_parameters():
            if parameter.is_deprecated:
                continue

            param_type = self.get_type_descriptor(parameter.type)
            c_arg_type = param_type.declare_c_function_argument(mode=parameter.mode)
            if not c_arg_type:
                # This argument is not present in the C function calls
                continue

            py_arg_type = _get_ctypes_arg_type_from_c_arg_type(c_arg_type)
            py_arg_types.append(py_arg_type)

            # Remember the type if it is an enum type or a bitfield type
            if param_type.is_enum:
                self.enum_types.add(py_arg_type)
            if param_type.is_bitfield:
                self.bitfield_types.add(py_arg_type)

        py_arg_types_joined = ", ".join(py_arg_types)

        write(f"{name} = _lib.{name}")
        write(f"{name}.restype = {py_return_type}")
        write(f"{name}.argtypes = [{py_arg_types_joined}]")

    def generate_epilogue(self, inputs: Sequence[str], output: IO[str]) -> None:
        write = output.write

        if self.enum_types:
            write("# Set up aliases for all enum types\n")
            write("\n")
            for enum_type in sorted(self.enum_types):
                write(f"{enum_type} = c_int\n")
            write("\n")

        if self.bitfield_types:
            write("# Set up aliases for all bitfield types\n")
            write("\n")
            for bitfield_type in sorted(self.bitfield_types):
                write(f"{bitfield_type} = c_int\n")
            write("\n")

        write("# Add argument and return types for functions imported from igraph\n")
        write("\n".join(self.lines))
        write("\n")

        return super().generate_epilogue(inputs, output)


@dataclass
class ArgInfo:
    param_spec: ParamSpec
    type_spec: TypeDescriptor

    c_name: str
    py_name: str
    py_type: str

    appears_in_argument_list: bool = False
    default_value: Optional[str] = None

    @classmethod
    def from_param_spec(
        cls, spec: ParamSpec, type_descriptor_getter: Callable[[str], TypeDescriptor]
    ):
        type = type_descriptor_getter(spec.type)

        py_name = spec.name

        # Translate Python reserved keywords
        if py_name in ("from", "in", "lambda"):
            py_name += "_"

        c_name = f"c_{spec.name}"

        py_type = _get_python_type_from_type_spec(type)
        if spec.is_optional and py_type and not py_type.startswith("Optional["):
            py_type = f"Optional[{py_type}]"

        result = cls(
            param_spec=spec,
            type_spec=type,
            c_name=c_name,
            py_name=py_name,
            py_type=py_type or "None",
        )

        if py_type is None:
            # Python type of argument is explicitly declared to be "null", so
            # we need to exclude it from the argument list no matter what
            result.appears_in_argument_list = False
        elif spec.is_deprecated:
            # Deprecated args do not appear in the argument list either
            result.appears_in_argument_list = False
        else:
            # IN and INOUT arguments will appear in the Python call signature;
            # pure OUT arguments will not
            result.appears_in_argument_list = spec.is_input

        # Map default value to Python
        if spec.has_default_value:
            result.default_value = spec.get_default_value(type) or "None"

            # Map "NULL" to "None"
            if result.default_value == "NULL":
                result.default_value = "None"

            # For enums, prefix the name of the default value with the name
            # of the enum
            if (
                type.is_enum
                and spec.default is not None
                and spec.default[0] == DefaultValueType.ABSTRACT
                and result.default_value == spec.default[1]
                and py_type is not None
            ):
                result.default_value = py_type + "." + result.default_value
        else:
            result.default_value = None

        return result

    @property
    def name(self) -> str:
        return self.param_spec.name

    def get_argument_for_function_call(self, args: Dict[str, "ArgInfo"]) -> str:
        template = self.type_spec.get("CALL")
        if template:
            return self._apply_replacements(template, args)
        else:
            return self.c_name

    def get_input_conversion(self, args: Dict[str, "ArgInfo"]) -> Optional[str]:
        if not self.appears_in_argument_list:
            default = "%C% = None"
        elif self.param_spec.is_input:
            default = "%C% = %I%"
        else:
            default = ""
        template = self.type_spec.get_input_conversion_template_for(
            self.param_spec.mode, default=default
        )
        if not template:
            if not self.param_spec.is_input:
                raise CodeGenerationError(
                    f"Cannot construct an instance of abstract type {self.type_spec.name}"
                )
            else:
                return None
        else:
            if (
                self.param_spec.is_input
                and self.param_spec.is_optional
                and self.default_value in (None, "None")
            ):
                template = f"{template} if %I% is not None else None"
            return self._apply_replacements(template, args)

    def get_output_conversion(self, args: Dict[str, "ArgInfo"]) -> Optional[str]:
        if self.param_spec.mode == ParamMode.OUT:
            default = "%I% = %C%.value"
        else:
            default = ""
        template = self.type_spec.get_output_conversion_template_for(
            self.param_spec.mode, default=default
        )
        if not template:
            return None
        else:
            return self._apply_replacements(template, args)

    def get_python_declaration(self) -> str:
        """Returns the declaration of this argument for the Python function header."""
        if self.default_value is None and not self.param_spec.is_optional:
            return f"{self.py_name}: {self.py_type}"
        elif self.default_value == "None" and not self.py_type.startswith("Optional["):
            return f"{self.py_name}: Optional[{self.py_type}] = None"
        else:
            return f"{self.py_name}: {self.py_type} = {self.default_value}"

    @property
    def needs_exit_stack(self) -> bool:
        """Returns whether this argument needs an exit stack for properly
        handling its input and/or output conversions.
        """
        return self.type_spec.has_flag("stack")

    def _apply_replacements(self, value: str, args: Dict[str, "ArgInfo"]) -> str:
        value = value.replace("%I%", self.py_name)
        value = value.replace("%C%", self.c_name)
        if self.needs_exit_stack:
            value = value.replace("%S%", "py__stack")

        for index, dep in enumerate(self.param_spec.dependencies, 1):
            arg = args.get(dep)
            if arg is None:
                raise CodeGenerationError(
                    f"Unknown dependency for parameter {self.py_name!r}: {dep!r}"
                )
            value = value.replace(f"%I{index}%", arg.py_name)
            value = value.replace(f"%C{index}%", arg.c_name)

        return value


class PythonCTypesTypedWrapperCodeGenerator(SingleBlockCodeGenerator):
    def generate_function(self, name: str, output: IO[str]) -> None:
        write = output.write

        lines = [""]
        try:
            self._generate_function(name, lines.append)
            lines.append("")
            write("\n".join(lines))
        except CodeGenerationError as ex:
            write(f"\n# {name}: {ex}\n")

    def _generate_function(self, name: str, write: Callable[[str], None]) -> None:
        writer = IndentedWriter(write)
        write = writer.write

        # Check types
        self.check_types_of_function(name)

        # Get function specification
        spec = self.get_function_descriptor(name)

        # Derive Python name of the function from its C name
        py_name = self._get_python_name(spec)

        # Construct Python arguments
        args = self._process_argument_list(spec)

        # Decide in which order the arguments should appear on the Python side.
        # Arguments with no default values must appear earlier even if they are
        # declared later on the C side. Python's sort is stable so the code
        # below will keep the order when possible.
        arg_specs = [
            arg_spec
            for arg_spec in spec.iter_reordered_parameters()
            if args[arg_spec.name].appears_in_argument_list
        ]
        arg_specs = sorted(
            arg_specs,
            key=lambda arg_spec: 1
            if arg_spec.default is None and not arg_spec.is_optional
            else 2,
        )

        # Determine return type and argument ordering
        py_return_type, return_arg_names, return_types = self._get_return_type_and_args(
            spec
        )
        py_args = [
            args[arg_spec.name].get_python_declaration() for arg_spec in arg_specs
        ]

        # Find the longest suffix of the argument list that consists solely of
        # keyword-only arguments, and insert * in py_args as needed
        idx = len(arg_specs)
        while idx > 0 and arg_specs[idx - 1].is_keyword_only:
            idx -= 1
        if idx < len(arg_specs):
            py_args.insert(idx, "*")

        # Print function header
        write("")
        write(f"def {py_name}({', '.join(py_args)}) -> {py_return_type}:")

        # Print documentation string (if any)
        docstring = self.docstring_provider(spec.name) or (
            f"Type-annotated wrapper for ``{spec.name}``."
        )
        write(_format_docstring(docstring))

        # Check whether we will need an exit stack in the generated code
        needs_exit_stack = any(
            args[param_spec.name].needs_exit_stack
            for param_spec in spec.iter_parameters()
        )

        with ExitStack() as stack:
            stack.enter_context(writer.indent())

            # Add exit stack context if needed
            if needs_exit_stack:
                write("# Create exit stack for graceful cleanup")
                write("with ExitStack() as py__stack:")
                write("")
                stack.enter_context(writer.indent())

            # Add input conversion calls
            convs = [
                args[param_spec.name].get_input_conversion(args)
                for param_spec in spec.iter_parameters()
            ]
            convs = [conv for conv in convs if conv]
            if convs:
                write("# Prepare input arguments")
                for conv in convs:
                    write(conv)
                write("")

            write("# Call wrapped function")
            needs_return_value_from_c_call = "" in return_arg_names
            c_args = ", ".join(
                args[arg_spec.name].get_argument_for_function_call(args)
                for arg_spec in spec.iter_parameters()
            )
            c_call = f"{name}({c_args})"
            if needs_return_value_from_c_call:
                c_call = f"c__result = {c_call}"
            write(c_call)

            # Add output conversion calls
            convs = [
                args[param_spec.name].get_output_conversion(args)
                for param_spec in spec.iter_parameters()
            ]
            convs = [conv for conv in convs if conv]
            if convs:
                write("")
                write("# Prepare output arguments")
                for conv in convs:
                    write(conv)

            if return_arg_names:
                return_var = "c__result"

                try:
                    idx = return_arg_names.index("")
                except ValueError:
                    tmpl = ""
                    idx = -1
                else:
                    tmpl = return_types[idx].get_output_conversion_template_for(
                        ParamMode.OUT
                    )

                if tmpl:
                    conv = tmpl.replace("%I%", "py__result").replace("%C%", "c__result")
                    return_var = "py__result"
                    write("")
                    write("# Prepare return value")
                    write(conv)

                write("")
                write("# Construct return value")
                if len(return_arg_names) == 1:
                    if needs_return_value_from_c_call:
                        var_name = return_var
                    else:
                        var_name = args[return_arg_names[0]].py_name
                    write(f"return {var_name}")
                else:
                    joint_parts = ", ".join(
                        args[name].py_name if name else return_var
                        for name in return_arg_names
                    )
                    write(f"return {joint_parts}")

        # If an exit stack was needed, let the type checker know that it is
        # impossible to get outside the stack
        if needs_exit_stack and return_arg_names:
            with writer.indent():
                write("")
                write("# Help the type checker to figure out that we never get here")
                write('assert False, "unreachable"  # noqa: B011')

    def _get_python_name(self, spec: FunctionDescriptor) -> str:
        return spec.get("NAME") or remove_prefix(spec.name, "igraph_")

    def _get_return_type_and_args(
        self, spec: FunctionDescriptor
    ) -> Tuple[str, List[str], List[TypeDescriptor]]:
        """Returns the return type of the given function, the names of the
        C arguments from which the output arguments are created and the
        corresponding type descriptors.

        An empty string in the returned argument list means that the return
        value of the C function should be converted into the return value of
        the Python function.

        The rules are as follows:

        - The index of each argument marked as OUT appears in the returned list
          of arguments.

        - INOUT parameters are _not_ returned, but it is assumed that the
          function will mutate these arguments in-place.

        - If the function is declared to return with an `ERROR` abstract type,
          it is assumed that the underlying ctypes wrapper handles the error and
          raises appropriate exceptions.

        - If the function is declared to return any other abstract type than
          `ERROR` or `VOID`, the return value itself is _also_ considered and
          -1 is prepended to the list of argument indices.
        """
        arg_names: List[str] = []
        arg_types: List[TypeDescriptor] = []
        arg_type_strs: List[str]

        return_type = self.get_type_descriptor(spec.return_type)
        if return_type.name != "ERROR" and return_type.name != "VOID":
            arg_names.append("")
            arg_types.append(return_type)

        for parameter in spec.iter_parameters():
            if not parameter.is_deprecated and not parameter.is_input:
                arg_names.append(parameter.name)
                arg_types.append(self.get_type_descriptor(parameter.type))

        arg_type_strs = []
        for arg_spec in arg_types:
            py_type = _get_python_type_from_type_spec(arg_spec, out=True)
            if py_type is None:
                raise CodeGenerationError(
                    f"no Python type known for type {arg_spec.name!r} and "
                    f"it needs to be used as a return value"
                )
            arg_type_strs.append(py_type)

        if not arg_type_strs:
            output_type = "None"
        elif len(arg_type_strs) == 1:
            output_type = arg_type_strs[0]
        else:
            output_type = "tuple[" + ", ".join(arg_type_strs) + "]"

        return output_type, arg_names, arg_types

    def _process_argument_list(self, spec: FunctionDescriptor) -> Dict[str, ArgInfo]:
        return {
            param.name: ArgInfo.from_param_spec(param, self.get_type_descriptor)
            for param in spec.iter_parameters()
        }
