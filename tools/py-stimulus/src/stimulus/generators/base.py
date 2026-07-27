import re

from abc import abstractmethod, ABCMeta
from collections import Counter, OrderedDict
from enum import Enum
from io import StringIO
from logging import Logger
from pathlib import Path
from shutil import copyfileobj
from typing import (
    Any,
    Dict,
    IO,
    Iterable,
    List,
    Sequence,
    Tuple,
)

from stimulus.errors import CodeGenerationError, NoSuchTypeError
from stimulus.model import DocstringProvider, FunctionDescriptor, TypeDescriptor
from stimulus.utils import constant

__all__ = (
    "BlockBasedCodeGenerator",
    "CodeGenerator",
    "CodeGeneratorBase",
    "InputPlacement",
    "SingleBlockCodeGenerator",
)


class CodeGenerator(metaclass=ABCMeta):
    """Interface specification for code generators."""

    name: str

    @abstractmethod
    def generate(self, inputs: List[str], output: IO[str]) -> None:
        """Generates code from the given input files into the given output
        stream, according to the function and type rules loaded into the
        generator.

        Parameters:
            inputs: the list of input files to process
            output: the output stream to write the generated code into
        """
        raise NotImplementedError

    @abstractmethod
    def load_function_descriptors_from_file(self, filename: str) -> None:
        """Loads function descriptors from the input file with the given name.

        Parameters:
            filename: the name of the input file
        """
        raise NotImplementedError

    @abstractmethod
    def load_function_descriptors_from_object(self, obj: Dict[str, Any]) -> None:
        """Loads function descriptors from the given object. The object is
        typically parsed from a specification file, although it can also come
        from other sources.

        Parameters:
            obj: the object to load the descriptors from
        """
        raise NotImplementedError

    @abstractmethod
    def load_type_descriptors_from_file(self, filename: str) -> None:
        """Loads type descriptors from the input file with the given name.

        Parameters:
            filename: the name of the input file
        """
        raise NotImplementedError

    @abstractmethod
    def load_type_descriptors_from_object(self, obj: Dict[str, Any]) -> None:
        """Loads type descriptors from the given object. The object is
        typically parsed from a specification file, although it can also come
        from other sources.

        Parameters:
            obj: the object to load the descriptors from
        """
        raise NotImplementedError

    @abstractmethod
    def use_docstring_provider(self, provider: DocstringProvider) -> None:
        """Instructs the code generator to use the given object to retrieve
        docstrings for the functions for which it generates code.
        """
        raise NotImplementedError

    @abstractmethod
    def use_logger(self, log: Logger) -> None:
        """Instructs the code generator to log any issues that it finds during
        code generation to the given logger.
        """
        raise NotImplementedError


def _nop(*args, **kwds) -> None:
    pass


class _DummyLogger:
    def __getattr__(self, name: str):
        return _nop


class CodeGeneratorBase(CodeGenerator):
    """Base class for code generator implementations."""

    log: Logger
    name: str

    _docstring_provider: DocstringProvider
    _function_descriptors: Dict[str, FunctionDescriptor]
    _type_descriptors: Dict[str, TypeDescriptor]

    _deps_cache: Dict[str, Dict[str, Tuple[str, ...]]]
    _ignore_cache: Dict[str, bool]

    def __init__(self):
        """Constructor."""
        # Set name, note this only works correctly if derived classes always
        # extend it as by prepending the language to the CodeGenerator class
        # name
        self.name = type(self).__name__
        if self.name.endswith("CodeGenerator"):
            self.name = self.name[0 : len(self.name) - len("CodeGenerator")]

        self.log = _DummyLogger()  # type: ignore

        self._docstring_provider = constant(None)
        self._function_descriptors = OrderedDict()
        self._type_descriptors = {}

        self._deps_cache = {}
        self._ignore_cache = {}

    def check_types_of_function(self, function: str, errors: str = "raise") -> bool:
        """Checks whether the types of all the input arguments of the given
        function are known to the code generator.

        Parameters:
            function: the name of the function to check
            errors: specifies what to do when an unknown type is found;
                ``"ignore"`` does nothing; ``"warn"`` prints a warning;
                ``"error"`` logs an error message; any other value raises an
                exception

        Returns:
            whether the types of all the input arguments of the given function
            are known to the code generator
        """
        spec = self.get_function_descriptor(function)
        ok = True

        for param in spec.iter_parameters():
            if param.is_deprecated:
                continue

            type_name = param.type
            if type_name not in self._type_descriptors:
                message = (
                    f"Parameter {param.name!r} of {function}() is of type "
                    f"{type_name!r}, but it is not known to the type system"
                )
                ok = False
                if errors == "ignore":
                    pass
                elif errors == "warn":
                    self.log.warning(message)
                elif errors == "error":
                    self.log.error(message)
                else:
                    raise NoSuchTypeError(type_name, message=message)

        return ok

    def load_function_descriptors_from_file(self, filename: str) -> None:
        specs = self._parse_file(filename)
        self.load_function_descriptors_from_object(specs)

    def load_function_descriptors_from_object(self, obj: Dict[str, Any]) -> None:
        for name, spec in obj.items():
            descriptor = self.get_or_create_function_descriptor(name)
            if spec is not None:
                descriptor.update_from(spec)

    def load_type_descriptors_from_file(self, filename: str) -> None:
        specs = self._parse_file(filename)
        self.load_type_descriptors_from_object(specs)

    def load_type_descriptors_from_object(self, obj: Dict[str, Any]) -> None:
        for name, spec in obj.items():
            descriptor = self.get_or_create_type_descriptor(name)
            if spec is not None:
                descriptor.update_from(spec)

    def use_docstring_provider(self, provider: DocstringProvider) -> None:
        self.docstring_provider = provider

    def use_logger(self, log: Logger) -> None:
        self.log = log

    def get_function_descriptor(self, name: str) -> FunctionDescriptor:
        return self._function_descriptors[name]

    def get_or_create_function_descriptor(self, name: str) -> FunctionDescriptor:
        try:
            descriptor = self.get_function_descriptor(name)
        except KeyError:
            descriptor = self._function_descriptors[name] = FunctionDescriptor(name)
        return descriptor

    def get_type_descriptor(self, name: str) -> TypeDescriptor:
        try:
            return self._type_descriptors[name]
        except KeyError:
            raise NoSuchTypeError(name) from None

    def get_or_create_type_descriptor(self, name: str) -> TypeDescriptor:
        try:
            descriptor = self.get_type_descriptor(name)
        except NoSuchTypeError:
            descriptor = self._type_descriptors[name] = TypeDescriptor(name)
        return descriptor

    @abstractmethod
    def generate_function(self, name: str, output: IO[str]) -> None:
        """Processes the function with the given name and generates the
        corresponding output on the output stream.

        This function is _not_ called for functions that are deemed to be
        ignored by `should_ignore_function()`.
        """
        raise NotImplementedError

    def generate_functions_block(self, output: IO[str]) -> None:
        """Generates the part of the output file that contains the generated code
        for functions.
        """
        for name in self.iter_functions():
            self.generate_function(name, output)

    def iter_functions(self, include_ignored: bool = False) -> Iterable[str]:
        """Iterator that yields the names of the functions in the function
        specification that are _not_ to be ignored by this generator.
        """
        if include_ignored:
            yield from self._function_descriptors.keys()
        else:
            for name in self._function_descriptors:
                if not self.should_ignore_function(name):
                    yield name

    def should_ignore_function(self, name: str) -> bool:
        """Returns whether the function with the given name should be ignored
        by this code generator.

        This function is memoized. Do not override this function; override
        `_should_ignore_function()` instead.

        Parameters:
            name: the name of the function

        Returns:
            whether the function should be ignored by this code generator
        """
        result = self._ignore_cache.get(name)
        if result is None:
            self._ignore_cache[name] = result = self._should_ignore_function(name)
        return result

    def _append_inputs(self, inputs: Sequence[str], output: IO[str]) -> None:
        for input in inputs:
            with Path(input).open() as fp:
                copyfileobj(fp, output)

    def _parse_file(self, name: str) -> Dict[str, Any]:
        """Parses a generic input file from YAML format."""
        from yaml import safe_load

        # Check for top-level duplicate keys
        with open(name) as fp:
            keys = Counter(
                line.strip().rstrip(":") for line in fp if line and line[0].isalpha()
            )
        duplicates = sorted(k for k, v in keys.items() if v > 1)
        if duplicates:
            raise ValueError(f"duplicate keys found: {', '.join(duplicates)}")

        # No top-level duplicate keys, load the YAML file
        with open(name) as fp:
            return safe_load(fp)

    def _should_ignore_function(self, name: str) -> bool:
        """Returns whether the function with the given name should be ignored
        by this code generator.

        Parameters:
            name: the name of the function

        Returns:
            whether the function should be ignored by this code generator
        """
        desc = self.get_function_descriptor(name)
        return self.name in desc.ignored_by


class BlockBasedCodeGenerator(CodeGeneratorBase):
    """Code generator that looks for block markers in input files and replaces
    each block with the corresponding content.

    Block markers are lines that look like this:

        % STIMULUS: block_name %

    where the colon and the whitespace after and before the percent signs are
    optional. Block names may contain alphanumeric characters, underscore and
    dash only.
    """

    _BLOCK_REGEXP = re.compile(r"^\s*%\s*STIMULUS:?\s*(?P<name>[-A-Za-z0-9_]*)\s*%")

    _block_cache: Dict[str, str]

    def __init__(self):
        super().__init__()
        self._block_cache = {}

    def generate(self, inputs: Sequence[str], out: IO[str]) -> None:
        for input in inputs:
            with open(input) as fp:
                for line in fp:
                    if not self._process_marker_line(line, out):
                        out.write(line)

    def _generate_block(self, name: str) -> str:
        """Generates the contents of the block with the given name.

        This function is called once per block; further occurrences of the same
        block are retrieved from the cache.
        """
        handler = getattr(self, f"generate_{name}_block", None)
        if handler is None:
            raise CodeGenerationError(f"Unhandled block in input file: {name}")

        buf = StringIO()
        handler(buf)
        return buf.getvalue()

    def _process_marker_line(self, line: str, out: IO[str]) -> bool:
        """Attempts to process a potential marker line in one of the input files.

        Marker lines are the ones that start with ``% STIMULUS``.

        Returns:
            whether the line was handled. Unhandled files should be forwarded to
            the output as is by the caller.
        """
        match = self._BLOCK_REGEXP.match(line)
        if match:
            block_name = match.group("name") or "functions"
            block = self._block_cache.get(block_name)
            if block is None:
                self._block_cache[block_name] = block = self._generate_block(block_name)
            out.write(block)
            return True
        else:
            return False


class InputPlacement(Enum):
    """Enum describing the possible placements of input files in a
    single-block code generator.
    """

    PREAMBLE = "preamble"
    EPILOGUE = "epilogue"


class SingleBlockCodeGenerator(CodeGeneratorBase):
    """Code generator that generates all functions in a single block and then
    puts the content of all input files before or after them.
    """

    def __init__(self, input_placement: InputPlacement = InputPlacement.PREAMBLE):
        super().__init__()
        self._input_placement = input_placement

    def generate(self, inputs: Sequence[str], output: IO[str]) -> None:
        self.generate_preamble(inputs, output)
        self.generate_functions_block(output)
        self.generate_epilogue(inputs, output)

    def generate_epilogue(self, inputs: Sequence[str], output: IO[str]) -> None:
        """Processes the input files with the given names and generates the
        epilogue of the output, i.e. the part that gets printed _after_ the
        processed functions.
        """
        if self._input_placement is InputPlacement.EPILOGUE:
            self._append_inputs(inputs, output)

    def generate_preamble(self, inputs: Sequence[str], output: IO[str]) -> None:
        """Processes the input files with the given names and generates the
        preamble of the output, i.e. the part that gets printed _before_ the
        processed functions.
        """
        if self._input_placement is InputPlacement.PREAMBLE:
            self._append_inputs(inputs, output)
