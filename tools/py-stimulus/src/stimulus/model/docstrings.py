from typing import Callable, Optional

__all__ = ("DocstringProvider",)


DocstringProvider = Callable[[str], Optional[str]]
"""Interface specification for functions that can be called with a function name
and return the docstring corresponding to the given function or ``None`` if
no docstring is available.
"""
