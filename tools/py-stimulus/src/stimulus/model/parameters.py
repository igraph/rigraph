from __future__ import annotations

from dataclasses import dataclass, field
from enum import Enum
from typing import Dict, List, Optional, Tuple, TYPE_CHECKING

if TYPE_CHECKING:
    from .types import TypeDescriptor

__all__ = ("ParamMode", "ParamSpec")


class ParamMode(Enum):
    """Enum representing the modes of function parameters."""

    IN = "in"
    OUT = "out"
    INOUT = "inout"

    @property
    def is_input(self) -> bool:
        return self is self.__class__.IN or self is self.__class__.INOUT

    @property
    def is_output(self) -> bool:
        return self is self.__class__.OUT or self is self.__class__.INOUT


class DefaultValueType(Enum):
    """Enum representing the different types of default values for function
    parameters.

    Default values may be abstract or explicit. Abstract default values are
    mapped to a language-specific literal using the type descriptor corresponding
    to the type of the parameter. Explicit default values are used verbatim
    in the generated code.
    """

    ABSTRACT = "abstract"
    EXPLICIT = "explicit"


@dataclass
class ParamSpec:
    """Specification of a single function parameter."""

    name: str
    """Name of the parameter in the function signature."""

    type: str
    """Type of the parameter in the function signature.

    This is the "abstract type" of the parameter, which is then mapped to a real
    type both in C and in the host language by the type definition files.
    """

    mode: ParamMode = ParamMode.IN
    """Mode of the parameter (input, output or both)."""

    default: Optional[Tuple[DefaultValueType, str]] = None
    """Default value of the parameter and its type."""

    is_optional: bool = False
    """Whether the parameter is an optional parameter.

    igraph's core is implemented in C, which does not really have optional
    parameters. However, a typical pattern is that certain values are used to
    denote that the caller of the function is not providing a value for the
    parameter (for input parameters) or is not interested in the value of the
    parameter after calling the function (for output parameters). This
    property can be used to mark such a parameter.
    """

    is_primary: bool = False
    """Whether the parameter is a primary parameter.

    This property has no semantic meaning for strictly input parameters. For
    in-out and output parameters, one or more parameters may be designated as
    the primary output(s) of the function. Higher level interfaces may use this
    to generate a "simplified" and a "complex" wrapper for the function, or
    may add an additional switch to the generated function that specifies
    whether the user wants the primary return value(s) only or all of them.
    """

    is_keyword_only: bool = False
    """Whether the parameter is keyword-only.

    Code generators for languages that distinguish between positional and
    keyword arguments may use this flag to determine whether an argument is to
    be used as a keyword argument only.
    """

    dependencies: List[str] = field(default_factory=list)
    """List of other parameters that the code generators will need to generate
    code for the in- and out-conversions of this parameter.
    """

    name_override: Optional[str] = None
    """Name of the parameter in the generated higher-level interface. This can
    be used in two cases: 1) when the parameter is used as an output and the
    code generator needs to return multiple output parameters to the caller,
    2) when the parameter is used as an input and the higher-level interface
    needs a different name due to compatibility issues or keyword restrictions.
    `None` means that the name is the same as the "real" name of the parameter.
    """

    @classmethod
    def from_string(cls, value: str):
        """Constructs a ParamSpec object from its string representation in a
        ``.yaml`` file.
        """
        value = value.strip()

        flags = ("PRIMARY", "OPTIONAL", "KW")
        flags_present = set()
        while True:
            for flag in flags:
                if value.startswith(flag):
                    flags_present.add(flag)
                    value = value[len(flag) :].strip()
                    break
            else:
                # No flag was stripped in this iteration, break out of the loop
                break

        parts = value.split(" ", 1)
        if parts[0] not in ("OUT", "IN", "INOUT"):
            parts = ["IN", parts[0]] + parts[1].split(" ", 1)
        else:
            parts = [parts[0]] + parts[1].split(" ", 1)
        if "=" in parts[2]:
            parts = parts[:2] + parts[2].split("=", 1)

        mode, type, name, *rest = [part.strip() for part in parts]

        return ParamSpec(
            name=str(name),
            mode=ParamMode(mode.lower()),
            type=str(type),
            default=(DefaultValueType.ABSTRACT, rest[0]) if rest else None,
            is_primary="PRIMARY" in flags_present,
            is_optional="OPTIONAL" in flags_present,
            is_keyword_only="KW" in flags_present,
        )

    def add_dependency(self, name: str) -> None:
        """Adds a new dependency to this parameter specification."""
        self.dependencies.append(name)

    def as_dict(self) -> Dict[str, str]:
        """Returns a dict representation of the parameter specification."""
        result = {"name": self.name, "mode": self.mode_str, "type": self.type}
        if self.default is not None:
            type, value = self.default
            if type is DefaultValueType.ABSTRACT:
                result["default"] = value
            else:
                raise RuntimeError(
                    "serializing explicit default values into a dict is not "
                    "supported yet"
                )
        return result

    def get_default_value(self, type_desc: TypeDescriptor) -> Optional[str]:
        """Returns the default value of this parameter, replacing any abstract
        default values from the corresponding type specification if needed.
        """
        if self.default is None:
            return None
        else:
            type, value = self.default
            if type is DefaultValueType.EXPLICIT:
                return value
            else:
                return type_desc.translate_default_value(value)

    def use_explicit_default_value(self, value: str) -> None:
        """Sets an explicit default value for this parameter, replacing any
        previous abstract default value.
        """
        self.default = (DefaultValueType.EXPLICIT, value)

    @property
    def has_default_value(self) -> bool:
        """Returns whether the parameter has an explicit or an abstract
        default value.
        """
        return self.default is not None

    @property
    def is_deprecated(self) -> bool:
        """Returns whether the function parameter is marked as deprecated."""
        return self.type == "DEPRECATED"

    @property
    def is_input(self) -> bool:
        """Returns whether the function parameter is an input argument."""
        return self.mode in (ParamMode.IN, ParamMode.INOUT)

    @property
    def is_output(self) -> bool:
        """Returns whether the function parameter is an output argument."""
        return self.mode in (ParamMode.OUT, ParamMode.INOUT)

    @property
    def mode_str(self) -> str:
        return str(self.mode.value).upper()

    @property
    def name_in_higher_level_interface(self) -> str:
        """Returns the name of the parameter when it is used in the higher-level
        interface.
        """
        return self.name_override or self.name
