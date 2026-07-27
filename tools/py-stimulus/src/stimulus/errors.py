from typing import Optional

__all__ = (
    "StimulusError",
    "ParseError",
    "CodeGenerationError",
    "InvalidDependencyError",
    "NoSuchTypeError",
)


class StimulusError(RuntimeError):
    """Base class for all errors specific to the `stimulus` package."""

    msg: str

    def __init__(self, message: str):
        super().__init__(message)
        self.msg = message

    def __str__(self):
        return str(self.msg)


class ParseError(StimulusError):
    """Base class for errors thrown while parsing input files."""

    lineno: Optional[int]

    def __init__(self, message: str, lineno: Optional[int] = None):
        super().__init__(
            f"{message} in line {lineno}" if lineno is not None else message
        )
        self.lineno = lineno


class CodeGenerationError(StimulusError):
    """Base class for errors thrown while generating code."""

    pass


class InvalidDependencyError(CodeGenerationError):
    """Error thrown when a parameter specification refers to a non-existing
    parameter in a dependency.
    """

    pass


class NoSuchTypeError(CodeGenerationError):
    """Error thrown when the code generator attempts to look up a type by
    name and there is no such type in the registry.
    """

    type: str
    #: Name of the type for which the lookup failed

    def __init__(self, type: str, *, message: Optional[str] = None):
        super().__init__(message or f"No such type: {type!r}")
        self.type = type
