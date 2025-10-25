"""Code generator classes that are meant for debugging purposes only.

The classes in this module are not really "code generators" in the traditional
sense; they consume the loaded functions and type definitions and print various
pieces of information based on them, but they do not produce any runnable code.
Typically, they are used from the command line as follows::

    $ stimulus -f functions.yaml -t types.yaml -l DebugListTypes
"""

from collections import Counter
from functools import partial
from textwrap import dedent
from typing import IO, List, Sequence

from stimulus.errors import InvalidDependencyError, NoSuchTypeError

from .base import SingleBlockCodeGenerator
from .utils import create_indentation_function

__all__ = ("ListTypesCodeGenerator",)

indent = create_indentation_function("    ")


class ListTypesCodeGenerator(SingleBlockCodeGenerator):
    """Debugging aid that lists all the types that appear in the function
    definitions.
    """

    def __init__(self, *args, **kwds):
        super().__init__(*args, **kwds)
        self.collected_types = Counter()

    def generate_function(self, name: str, output: IO[str]) -> None:
        spec = self.get_function_descriptor(name)
        self.collected_types.update(param.type for param in spec.iter_parameters())
        self.collected_types.update((spec.return_type,))

    def generate_functions_block(self, output: IO[str]) -> None:
        super().generate_functions_block(output)
        write = partial(print, file=output)
        for type, count in sorted(self.collected_types.items()):
            write(type, count)


class FunctionSpecificationValidator(SingleBlockCodeGenerator):
    """Dummy code generator that simply prints C functions that call the
    original C functions from igraph. This file can then be compiled with a
    C++ compiler to validate whether the function specifications are correct
    when linked with igraph.
    """

    functions: List[str]
    """List to collect the names of all the functions that were matched by
    the generator.
    """

    unknown_types: Counter
    """Dictionary that counts how many times we have seen an unknown type
    so we can figure out which ones need to be prioritized.
    """

    def __init__(self, *args, **kwds):
        super().__init__(*args, **kwds)
        self.functions = []
        self.unknown_types = Counter()

    def generate_preamble(self, inputs: Sequence[str], output: IO[str]) -> None:
        write = partial(print, file=output)

        write("#include <igraph.h>\n")
        write("#include <cstdio>")
        write("#include <type_traits>\n")

    def generate_function(self, name: str, output: IO[str]) -> None:
        write = partial(print, file=output)

        args: List[str] = []

        # Determine parameter declarations in C
        func_desc = self.get_function_descriptor(name)
        param_names = {param.name for param in func_desc.iter_parameters()}
        for param in func_desc.iter_parameters():
            if param.is_deprecated:
                # Ignore deprecated parameters; they are only used in the R
                # interface to show deprecation warnings
                continue

            try:
                param_type_desc = self.get_type_descriptor(param.type)
                arg = param_type_desc.declare_c_function_argument(
                    param.name, mode=param.mode
                )
            except NoSuchTypeError:
                arg = "void*"
                self.unknown_types[param.type] += 1

            if arg:
                args.append(arg)

            # Check whether the other parameters named in the dependencies are
            # all valid
            for dependency in param.dependencies:
                if dependency not in param_names:
                    raise InvalidDependencyError(
                        f"{func_desc.name} parameter {param.name!r} refers to "
                        f"an unknown dependency: {dependency!r}"
                    )

        # Determine return type in C
        return_type_desc = self.get_type_descriptor(func_desc.return_type)
        return_type = return_type_desc.get_c_type()
        if return_type is None:
            raise NoSuchTypeError(
                func_desc.return_type,
                message=f"{func_desc.name} declares a return value that has no corresponding C type",
            )

        # Write the function declaration to the output
        args_str = ", ".join(args) or "void"
        write(f"{return_type} generated_{name}({args_str});")

        self.functions.append(name)

    def generate_epilogue(self, inputs: Sequence[str], output: IO[str]) -> None:
        write = partial(print, file=output)

        checks = "\n".join(
            dedent(
                f"""\
                static_assert(
                    std::is_same<
                        decltype({name}),
                        decltype(generated_{name})
                    >::value,
                    "{name} prototype mismatch"
                );"""
            )
            for name in self.functions
        )
        checks = indent(checks)
        write()
        write("int main() {")

        # Turn off the GCC warning about deprecated declarations because we
        # also want to check those
        write()
        write("#if defined(__GNUC__)")
        write("#  pragma GCC diagnostic push")
        write('#  pragma GCC diagnostic ignored "-Wdeprecated-declarations"')
        write("#endif")
        write()

        write(checks)

        write()
        write("#if defined(__GNUC__)")
        write("#  pragma GCC diagnostic pop")
        write("#endif")

        write()
        write('    printf("Everything OK!\\n");')
        write("    return 0;")
        write("}")

        if self.unknown_types:
            self.log.info("Most common types that were not known to the type system:")
            for type, count in self.unknown_types.most_common(10):
                self.log.info(f"  {type} ({count})")
