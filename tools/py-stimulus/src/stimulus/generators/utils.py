"""Helper utility functions for code generators."""

from functools import lru_cache
from textwrap import indent
from typing import Callable


__all__ = ("create_indentation_function", "remove_prefix")


@lru_cache(maxsize=32)
def create_indentation_function(indentation: str) -> Callable[[str], str]:
    """Creates a function that indents the given input string with the
    given indentation, except when the input string is empty.
    """

    def func(input: str) -> str:
        return indent(input, indentation) if input else input

    return func


def remove_prefix(input: str, prefix: str) -> str:
    """Removes th given prefix from the input string if it is present.

    Parameters:
        input: the input string
        prefix: the prefix to remove

    Returns:
        the input string without the given prefix if it started with the prefix,
        or the input string intact otherwise
    """
    return input[len(prefix) :] if input.startswith(prefix) else input
