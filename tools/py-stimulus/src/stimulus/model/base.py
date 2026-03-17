"""Base classes for model objects."""

from typing import Any, Dict, Iterable, Optional

__all__ = ("DescriptorMixin",)


class DescriptorMixin:
    """Mixin class for function and type descriptors."""

    _obj: Dict[str, Any]

    def _parse_as_boolean(self, key: str) -> Optional[bool]:
        value = self._obj.pop(key, None)
        if value is None:
            return None
        elif isinstance(value, (int, float)):
            return bool(value)
        elif isinstance(value, str):
            return value.lower() in ("true", "yes", "y")
        else:
            return bool(value)

    def _parse_as_comma_separated_list(self, key: str) -> Iterable[str]:
        value = self._obj.pop(key, None)
        if value is None:
            return ()
        if isinstance(value, str):
            return (
                stripped_part
                for part in value.split(",")
                if (stripped_part := part.strip())
            )
        elif hasattr(value, "__iter__"):
            return (part.strip() for part in value)  # type: ignore
        else:
            if key:
                raise RuntimeError(f"{key!r} key must map to a string or a list")
            else:
                raise RuntimeError("key must map to a string or a list")
