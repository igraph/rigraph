from dataclasses import dataclass, field
from deepmerge import always_merger
from typing import Any, Dict, Mapping, Optional, Set

from stimulus.errors import NoSuchTypeError

from .base import DescriptorMixin
from .parameters import ParamMode

__all__ = ("TypeDescriptor",)


_MISSING = object()


@dataclass
class TypeDescriptor(Mapping[str, Any], DescriptorMixin):
    """Dataclass that describes a single type that is used in a code generator."""

    name: str
    """Name of the type"""

    flags: Set[str] = field(default_factory=set)
    """The flags associated to the type"""

    _obj: Dict[str, str] = field(default_factory=dict)

    def __getitem__(self, key: str) -> Any:
        return self._obj[key]

    def __iter__(self):
        return iter(self._obj)

    def __len__(self):
        return len(self._obj)

    def declare_c_function_argument(
        self, name: Optional[str] = None, *, mode: ParamMode = ParamMode.OUT
    ) -> str:
        """Returns a string that declares a function argument in C using this
        type.

        Parameters:
            name: the name of the C argument to declare. May be left as an
                empty string or `None` if we only need the type declaration in
                the function header

        Returns:
            a C function argument declaration, without indentation or trailing
            newline, ready to be used in a function header, or an empty string
            if the argument with this abstract type should not be used in C
            function headers

        Raises:
            NoSuchTypeError: if the type specification does not specify
                explicitly the corresponding C type in the given mode (and does
                not state explicitly that the abstract type does _not_ have
                a corresponding C type either)
        """
        param_type = self.get_c_type(mode)
        by_ref = self.is_passed_by_reference

        if param_type is None:
            return ""  # no argument declaration needed

        if by_ref:
            # Argument is always passed by reference, but it gains a
            # "const" modifier if it is used as a purely input argument --
            # except when it is "void*" because everyone does all sorts of
            # nasty things with void pointers
            param_type += "*"
            if mode.is_input and not mode.is_output and param_type != "void*":
                param_type = f"const {param_type}"
        else:
            # Argument is passed by value by default, but it needs to
            # become a pointer if it is to be used in output or in-out mode
            if mode.is_output:
                param_type += "*"

        return f"{param_type} {name}" if name else param_type

    def declare_c_variable(
        self,
        name: str,
        *,
        mode: ParamMode = ParamMode.OUT,
        name_token: str = "%C%",
        type_token: str = "%T%",
    ) -> str:
        """Returns a string that declares a new variable in C using this type.

        Parameters:
            name: the name of the C variable to declare

        Returns:
            a C variable declaration, without indentation or trailing newline
        """
        mode_str = str(mode.value).upper()
        c_decl = self._obj.get("CDECL")
        if isinstance(c_decl, dict):
            c_decl = c_decl.get(mode_str)

        c_type = self.get_c_type(mode)

        if c_decl is None:
            c_decl = f"{type_token} {name_token};"

        if c_type is None and type_token in c_decl:
            c_decl = ""

        return c_decl.replace(type_token, c_type or "").replace(name_token, name)

    def get_c_type(self, mode: ParamMode = ParamMode.OUT) -> Optional[str]:
        """Returns a string that contains the C type corresponding to this
        abstract type, or `None` if the abstract type has no corresponding
        C type in the given mode.

        Returns:
            a non-empty string or `None` if the abstract type has no corresponding
            C type in the given mode

        Raises:
            NoSuchTypeError: if the type specification does not specify
                explicitly the corresponding C type in the given mode (and does
                not state explicitly that the abstract type does _not_ have
                a corresponding C type either)
        """
        mode_str = str(mode.value).upper()
        c_type = self._obj.get("CTYPE", _MISSING)
        if c_type is _MISSING:
            raise NoSuchTypeError(
                f"{self.name} does not specify its corresponding C type"
            )

        if isinstance(c_type, dict):
            try:
                value = c_type[mode_str]
            except KeyError:
                raise NoSuchTypeError(
                    f"{self.name} does not specify its corresponding C type in mode {mode_str}"
                ) from None
            if isinstance(value, str) or value is None:
                return value or None
            else:
                raise ValueError(
                    f"CTYPE declaration must be a string or a mapping, got {type(value)}"
                )
        elif isinstance(c_type, str) or c_type is None:
            return c_type or None
        else:
            raise ValueError(
                f"CTYPE declaration must be a string or a mapping, got {type(c_type)}"
            )

    def get_input_conversion_template_for(
        self, mode: ParamMode, *, default: str = ""
    ) -> str:
        """Returns a template string that specifies how parameters of this type
        should be converted when it is used as an input parameter.

        When the type definition contains several conversion code snippets
        depending on the mode of the parameter and there is no snippet for the
        `INOUT` mode, it is assumed to be identical to the code snippet for
        the `IN` mode.
        """
        if "INCONV" in self:
            inconv = self["INCONV"]
            if isinstance(inconv, str):
                return inconv if mode.is_input else default
            elif isinstance(inconv, dict):
                try:
                    return inconv[mode.value.upper()] or default
                except KeyError:
                    if mode is ParamMode.INOUT:
                        return self.get_input_conversion_template_for(
                            ParamMode.IN, default=default
                        )
                    else:
                        return default
            else:
                raise TypeError(
                    f"INCONV should be a string or a dict for type {self.name}"
                )
        else:
            return default

    def get_output_conversion_template_for(
        self, mode: ParamMode, *, default: str = ""
    ) -> str:
        """Returns a template string that specifies how parameters of this type
        should be converted when it is used as an output parameter.

        When the type definition contains several conversion code snippets
        depending on the mode of the parameter and there is no snippet for the
        `INOUT` mode, it is assumed to be identical to the code snippet for
        the `OUT` mode.
        """
        if "OUTCONV" in self:
            outconv = self["OUTCONV"]
            if isinstance(outconv, str):
                return outconv if mode.is_output else default
            elif isinstance(outconv, dict):
                try:
                    return outconv[mode.value.upper()] or default
                except KeyError:
                    if mode is ParamMode.INOUT:
                        return self.get_output_conversion_template_for(
                            ParamMode.OUT, default=default
                        )
                    else:
                        return default
            else:
                raise TypeError(
                    f"OUTCONV should be a string or a dict for type {self.name}"
                )
        else:
            return default

    def has_flag(self, flag: str) -> bool:
        """Checks whether the type descriptor has the given flag, in a
        case-insensitive manner.
        """
        return flag.lower() in self.flags

    @property
    def is_bitfield(self) -> bool:
        """Returns whether the type is a bitfield type in the C layer."""
        return self.has_flag("bits")

    @property
    def is_enum(self) -> bool:
        """Returns whether the type is an enumeration type in the C layer."""
        return self.has_flag("enum")

    @property
    def is_passed_by_reference(self) -> bool:
        """Returns whether the type is typically passed by reference in function
        calls in the C layer.
        """
        return self.has_flag("by_ref")

    def translate_default_value(self, value: Any) -> str:
        """Translates the default value of a parameter having this type to
        a string in the format that should be used in the output file.
        """
        mapping = self._obj.get("DEFAULT")
        if mapping is not None and value in mapping:
            return mapping[value]
        else:
            return str(value)

    def update_from(self, obj: Dict[str, str]) -> None:
        """Updates the type descriptor from an object typically parsed from
        a specification file.

        The rules are as follows:

          - The values from the ``FLAGS`` list are merged with the existing
            flags. ``FLAGS`` may also be a string, in which case it will be
            split along commas.

          - Any other key in `obj` is merged with the existing key-value store.
        """
        always_merger.merge(self._obj, obj)

        it = self._parse_as_comma_separated_list("FLAGS")
        self.flags |= {flag.lower() for flag in it}
