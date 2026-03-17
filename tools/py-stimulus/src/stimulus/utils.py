from typing import Callable, TypeVar

__all__ = ("camelcase", "constant")


def camelcase(s: str) -> str:
    """Returns a camelCase version of the given string (as used in Java
    libraries.
    """
    parts = s.split("_")
    result = [parts.pop(0)]
    for part in parts:
        result.append(part.capitalize())
    return "".join(result)


T = TypeVar("T")


def constant(value: T) -> Callable[..., T]:
    """Function factory that creates functions that return the same value
    irrespectively of the arguments passed to it.
    """

    def func(*args, **kwds) -> T:
        return value

    return func
