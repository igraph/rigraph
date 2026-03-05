"""Registry object that maps language identifiers to the corresponding code
generators.
"""

from typing import Callable, Dict

from .base import CodeGenerator

__all__ = ("get_code_generator_factory_for_language", "is_valid_language")


#: Dictionary mapping language codes to code generators
_registry: Dict[str, Callable[[], CodeGenerator]] = {}

#: Flag storing whether the registry has already been initialized with the
#: code generators
_registry_initialized: bool = False


def get_code_generator_factory_for_language(
    lang: str,
) -> Callable[[], CodeGenerator]:
    """Returns the class or factory function that is responsible for generating
    code in the given language.
    """
    global _registry_initialized, _registry

    if not _registry_initialized:
        _register_code_generators()
        _registry_initialized = True

    return _registry[lang]


def is_valid_language(lang: str) -> bool:
    """Returns whether there is a class or factory function that is responsible
    for generating code in the given language.
    """
    try:
        get_code_generator_factory_for_language(lang)
        return True
    except KeyError:
        return False


def _register_code_generators() -> None:
    """Register all code generators in the project into the registry."""
    from .debug import FunctionSpecificationValidator, ListTypesCodeGenerator
    from .java import JavaCCodeGenerator, JavaJavaCodeGenerator
    from .python import PythonCTypesCodeGenerator, PythonCTypesTypedWrapperCodeGenerator
    from .r import (
        RCCodeGenerator,
        RInitCodeGenerator,
        RRCodeGenerator,
    )
    from .shell import ShellCodeGenerator

    updates = {
        "ci:validate": FunctionSpecificationValidator,
        "debug:list-types": ListTypesCodeGenerator,
        "java:c": JavaCCodeGenerator,
        "java:java": JavaJavaCodeGenerator,
        "python:ctypes": PythonCTypesCodeGenerator,
        "python:ctypes-typed-wrapper": PythonCTypesTypedWrapperCodeGenerator,
        "r:c": RCCodeGenerator,
        "r:init": RInitCodeGenerator,
        "r:r": RRCodeGenerator,
        "shell": ShellCodeGenerator,
        # legacy names
        "RC": RCCodeGenerator,
        "RInit": RInitCodeGenerator,
        "RR": RRCodeGenerator,
        "Shell": ShellCodeGenerator,
    }

    _registry.update(updates)
