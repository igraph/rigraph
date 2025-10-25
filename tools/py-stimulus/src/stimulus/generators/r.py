"""GNU R interface, see http://www.r-project.org

TODO: free memory when CTRL+C pressed, even on Windows
"""

import re

from shlex import quote
from typing import Iterable, IO, Optional, Tuple

from stimulus.errors import NoSuchTypeError
from stimulus.model import ParamMode, ParamSpec
from stimulus.model.functions import FunctionDescriptor

from .base import (
    BlockBasedCodeGenerator,
    SingleBlockCodeGenerator,
)
from .utils import create_indentation_function


indent = create_indentation_function("  ")

init_functions = {
    "igraph_vector_int_t": "IGRAPH_R_CHECK(igraph_vector_int_init(&%C%, 0));\nIGRAPH_FINALLY(igraph_vector_int_destroy, &%C%);"
}


def get_r_parameter_name(param: ParamSpec) -> str:
    result = param.name_in_higher_level_interface
    if result == param.name:
        result = result.replace("_", ".")
    return result


def optional_wrapper_c(conv: str, c_type: str) -> str:
    # Workaround for legacy types in R which have Rf_isNull
    # TODO: refactoring types in R
    if "Rf_isNull" in conv:
        return conv
    result = ""
    optional_template = ["if (!Rf_isNull(%I%)) {\n", indent(conv), "\n}"]

    if c_type in init_functions:
        optional_template += [" else {\n", indent(init_functions[c_type]), "\n}"]

    return result.join(optional_template)


def optional_wrapper_r(conv: str) -> str:
    if "is.null" in conv:
        return conv

    return f"if (!is.null(%I%)) {conv}"


class RRCodeGenerator(SingleBlockCodeGenerator):
    def generate_function(self, function: str, out: IO[str]) -> None:
        # Check types
        self.check_types_of_function(function)

        # Get function specification
        spec = self.get_function_descriptor(function)

        # Derive name of R function
        name = spec.get_name_in_generated_code("R")

        ## Header
        ## do_par handles the translation of a single argument in the
        ## header. Pretty simple, the only difficulty is that we
        ## might need to add default values. Default values are taken
        ## from a language specific dictionary, this is compiled from
        ## the type file(s).

        ## So we take all arguments with mode 'IN' or 'INOUT' and
        ## check whether they have a default value. If yes then we
        ## check if the default value is given in the type file. If
        ## yes then we use the value given there, otherwise the
        ## default value is used as is.

        ## Finally, if the function designates one or more of its output
        ## parameters as primary parameters, and there is at least one
        ## non-primary output parameter, the function needs a "details"
        ## parameter as well that lets the user specify whether the
        ## non-primary parameters are needed.

        ## TODO(ntamas): if the function designates one or more of its
        ## arguments as "primary" and the user is not interested in the
        ## details, do not generate conversion code for the non-primary
        ## arguments if they are optional

        needs_details_arg = (
            spec.has_primary_output_parameter and spec.has_non_primary_output_parameter
        )

        out.write(name)
        out.write("_impl <- function(")

        def handle_input_argument(param: ParamSpec) -> str:
            tname = param.type
            type_desc = self.get_type_descriptor(tname)
            header = name_in_r_interface = get_r_parameter_name(param)
            if "HEADER" in type_desc:
                header = type_desc["HEADER"] or ""
            if header:
                header = header.replace("%I%", name_in_r_interface)
            else:
                header = ""

            default = param.get_default_value(type_desc) or (
                "NULL" if param.is_optional and header else ""
            )
            if default:
                header = f"{header}={default}"

            for i, dep in enumerate(param.dependencies):
                header = header.replace("%I" + str(i + 1) + "%", dep)

            if re.search("%I[0-9]*%", header):
                self.log.error(
                    f"Missing HEADER dependency for {tname} {param.name} in function {function}"
                )

            return header

        head = [
            handle_input_argument(param)
            for param in spec.iter_input_parameters(reorder=True)
            if not param.is_keyword_only
        ]
        head = [h for h in head if h != ""]

        head2 = [
            handle_input_argument(param)
            for param in spec.iter_input_parameters(reorder=True)
            if param.is_keyword_only
        ]
        head2 = [h for h in head2 if h != ""]

        if head2:
            head.append("...")
            head.extend(head2)
            has_dots_arg = True
        else:
            has_dots_arg = False

        if needs_details_arg:
            if "details" in head:
                # We already have another parameter named "details" so we
                # pretend that we don't have primary output parameters
                self.log.warn(
                    f"Primary parameters declared for function {function}, which already "
                    f"has an argument named 'details'; not adding another one."
                )
                needs_details_arg = False
        if needs_details_arg:
            head.append("details=FALSE")

        out.write(", ".join(head))
        out.write(") {\n")

        ## Argument checks, INCONV
        ##
        ## We take 'IN' and 'INOUT' mode arguments and if they have an
        ## INCONV field then we use that. This is typically for
        ## argument checks, like we check here that the argument
        ## supplied for a graph is indeed an igraph graph object. We
        ## also convert numeric vectors to 'double' here.

        ## The INCONV fields are simply concatenated by newline
        ## characters.
        out.write("  # Argument checks\n")

        if has_dots_arg:
            out.write("  check_dots_empty()\n")

        def handle_argument_check(param: ParamSpec) -> str:
            tname = param.type
            t = self.get_type_descriptor(tname)
            res = t.get_input_conversion_template_for(param.mode)

            if param.is_optional and param.is_input and res:
                res = optional_wrapper_r(res)

            # Replace template placeholders
            res = indent(res).replace("%I%", get_r_parameter_name(param))
            for i, dep in enumerate(param.dependencies):
                res = res.replace("%I" + str(i + 1) + "%", dep)

            if re.search("%I[0-9]*%", res):
                self.log.error(
                    f"Missing IN dependency for {tname} {param.name} in function {function}"
                )

            return res

        inconv = [handle_argument_check(param) for param in spec.iter_parameters()]
        inconv = [i for i in inconv if i != ""]
        out.write("\n".join(inconv) + "\n\n")

        ## Function call
        ## This is a bit more difficult than INCONV. Here we supply
        ## each argument to the .Call function, if the argument has a
        ## 'CALL' field then it is used, otherwise we simply use its
        ## name.
        ##
        ## Note that arguments with empty CALL fields are
        ## completely ignored, so giving an empty CALL field is
        ## different than not giving it at all.

        out.write("  on.exit( .Call(R_igraph_finalizer) )\n")
        out.write("  # Function call\n")
        out.write("  res <- .Call(R_" + function)

        parts = []
        for param in spec.iter_input_parameters():
            type = self.get_type_descriptor(param.type)
            name = get_r_parameter_name(param)
            call = type.get("CALL", name)
            if call:
                parts.append(call.replace("%I%", name))

        if len(parts):
            out.write(", " + ", ".join(parts))
        out.write(")\n")

        ## Output conversions
        def handle_output_argument(
            param: ParamSpec,
            realname: Optional[str] = None,
            *,
            iprefix: str = "",
        ):
            if realname is None:
                realname = get_r_parameter_name(param)

            tname = param.type
            t = self.get_type_descriptor(tname)
            outconv = indent(t.get_output_conversion_template_for(param.mode))
            outconv = outconv.replace("%I%", iprefix + realname)
            for i, dep in enumerate(param.dependencies):
                outconv = outconv.replace("%I" + str(i + 1) + "%", dep)

            if re.search("%I[0-9]*%", outconv):
                self.log.error(
                    f"Missing OUT dependency for {tname} {param.name} in function {function}"
                )

            return re.sub("%I[0-9]+%", "", outconv)

        retpars = [param.name for param in spec.iter_output_parameters()]

        if len(retpars) <= 1:
            outconv = [
                handle_output_argument(param, "res") for param in spec.iter_parameters()
            ]
        else:
            outconv = [
                handle_output_argument(param, iprefix="res$")
                for param in spec.iter_parameters()
            ]

        outconv = [o for o in outconv if o != ""]

        if len(retpars) == 0:
            # returning the return value of the function
            rt = self.get_type_descriptor(spec.return_type)
            retconv = indent(rt.get_output_conversion_template_for(ParamMode.OUT))
            retconv = retconv.replace("%I%", "res")
            # TODO: %I1% etc, is not handled here!
            outconv.append("")
            outconv.append(retconv)
        elif len(retpars) == 1:
            # returning a single output value
            pass
        else:
            # returning a list of output values
            if needs_details_arg:
                # user had the option to switch between the primary or all the
                # output arguments. If we only have a single primary argument,
                # simply return that; otherwise pick the relevant ones from the
                # result list
                pick_details = ["if (!details) {"]
                primary_params = list(spec.iter_primary_output_parameters())
                if len(primary_params) == 1:
                    primary_param = primary_params[0]
                    pick_details.append(f"  res <- res${primary_param.name}")
                else:
                    names = ", ".join(quote(param.name) for param in primary_params)
                    pick_details.append(f"  res <- res[c({names})]")
                pick_details.append("}")
                outconv.extend(indent(line) for line in pick_details)
            else:
                # just use the output arguments as they are
                pass
        out.write("\n".join(outconv) + "\n")

        ## Some graph attributes to add
        if "R" not in spec:
            # Convert legacy "GATTR-R", "GATTR-PARAM-R", "CLASS-R" and "PP-R"
            r_namespace = {}
            for key in ("GATTR", "GATTR-PARAM", "CLASS", "PP"):
                r_key = f"{key}-R"
                if r_key in spec:
                    r_namespace[key] = spec[r_key]
            if r_namespace:
                spec._obj["R"] = r_namespace

        r_spec = spec._obj.get("R", {})

        ## Add graph attributes
        if "GATTR" in r_spec or "GATTR-PARAM" in r_spec:
            gattrs_dict = {}
            lines = []

            gattrs = r_spec.get("GATTR")
            pars = r_spec.get("GATTR-PARAM")

            if isinstance(gattrs, dict):
                gattrs_dict.update(gattrs)
            elif gattrs is not None:
                for item in gattrs.split(","):
                    name, value = item.split(" IS ", 1)
                    name = name.strip()
                    value = value.strip()
                    gattrs_dict[name] = value

            if gattrs_dict:
                lines.extend(
                    f"res${name} <- {val!r}" for name, val in gattrs_dict.items()
                )

            if pars is not None:
                if isinstance(pars, str):
                    pars = pars.split(",")
                for par in pars:
                    par = par.strip().replace("_", ".")
                    lines.append(f"res${par} <- {par}")

            if lines:
                out.write('  if (igraph_opt("add.params")) {\n')
                for line in lines:
                    out.write(indent(indent(line)) + "\n")
                out.write("  }\n\n")

        ## Set the class if requested
        if "CLASS" in r_spec:
            out.write(f'  class(res) <- "{r_spec["CLASS"]}"\n')

        ## See if there is a postprocessor
        if "PP" in r_spec:
            out.write(f'  res <- {r_spec["PP"]}(res)\n')

        out.write("  res\n}\n\n")


class RCCodeGenerator(SingleBlockCodeGenerator):
    def generate_function(self, function: str, out: IO[str]) -> None:
        # Check types
        self.check_types_of_function(function, errors="error")

        desc = self.get_function_descriptor(function)

        ## Compile the output
        ## This code generator is quite difficult, so we use different
        ## functions to generate the approprite chunks and then
        ## compile them together using a simple template.
        ## See the documentation of each chunk below.
        res = {}
        res["func"] = function
        res["header"] = self.chunk_header(desc)
        res["decl"] = self.chunk_declaration(desc)
        res["inconv"] = self.chunk_inconv(desc)
        res["call"] = self.chunk_call(desc)
        res["outconv"] = self.chunk_outconv(desc)

        # Replace into the template
        text = (
            """
/*-------------------------------------------/
/ %(func)-42s /
/-------------------------------------------*/
%(header)s {
                                        /* Declarations */
%(decl)s
                                        /* Convert input */
%(inconv)s
                                        /* Call igraph */
%(call)s
                                        /* Convert output */
%(outconv)s

  UNPROTECT(1);
  return(r_result);
}\n"""
            % res
        )

        out.write(text)

    def chunk_header(self, desc: FunctionDescriptor) -> str:
        """The header. All functions return with a 'SEXP', so this is
        easy. We just take the 'IN' and 'INOUT' arguments, all will
        have type SEXP, and concatenate them by commas. The function name
        is created by prefixing the original name with 'R_'.
        """

        def do_par(spec: ParamSpec) -> str:
            t = self.get_type_descriptor(spec.type)
            if "HEADER" in t:
                if t["HEADER"]:
                    return t["HEADER"].replace("%I%", spec.name)
                else:
                    return ""
            else:
                return spec.name

        inout = [do_par(spec) for spec in desc.iter_input_parameters()]
        inout = ["SEXP " + n for n in inout if n != ""]
        return "SEXP R_" + desc.name + "(" + (", ".join(inout) or "void") + ")"

    def chunk_declaration(self, desc: FunctionDescriptor) -> str:
        """There are a couple of things to declare. First a C type is
        needed for every argument, these will be supplied in the C
        igraph call. Then, all 'OUT' arguments need a SEXP variable as
        well, the result will be stored here. The return type
        of the C function also needs to be declared, that comes
        next. The result and names SEXP variables will contain the
        final result, these are last. ('names' is not always used, but
        it is easier to always declare it.)
        """

        def do_par(spec: ParamSpec) -> str:
            type_desc = self.get_type_descriptor(spec.type)
            try:
                return type_desc.declare_c_variable(f"c_{spec.name}", mode=spec.mode)
            except NoSuchTypeError:
                return f"/* {spec.name} has no corresponding C type */"

        inout = [do_par(spec) for spec in desc.iter_parameters()]
        out = [
            f"SEXP {spec.name};"
            for spec in desc.iter_parameters()
            if spec.mode is ParamMode.OUT
        ]

        retpars = [spec.name for spec in desc.iter_output_parameters()]

        return_type_desc = self.get_type_descriptor(desc.return_type)
        retdecl = return_type_desc.declare_c_variable("c_result") if not retpars else ""

        if len(retpars) <= 1:
            res = "\n".join(inout + out + [retdecl] + ["SEXP r_result;"])
        else:
            res = "\n".join(inout + out + [retdecl] + ["SEXP r_result, r_names;"])
        return indent(res)

    def chunk_inconv(self, desc: FunctionDescriptor) -> str:
        """Input conversions. Not only for types with mode 'IN' and
        'INOUT', eg. for 'OUT' vector types we need to allocate the
        required memory here, do all the initializations, etc. Types
        without INCONV fields are ignored. The usual %C%, %I% is
        performed at the end.
        """

        def do_par(param: ParamSpec) -> str:
            cname = "c_" + param.name
            t = self.get_type_descriptor(param.type)

            # Get the template from the type specification
            inconv = t.get_input_conversion_template_for(param.mode)
            c_type = t.get_c_type(mode=param.mode)

            if not inconv and param.is_input and (t.is_enum or t.is_bitfield):
                # If the parameter is an input argument and its type is an
                # enum, we can provide a default conversion: we just cast its
                # numeric value to the right type
                if c_type is not None:
                    inconv = f"%C% = ({c_type}) Rf_asInteger(%I%);"

            if param.is_optional and param.is_input and inconv:
                inconv = optional_wrapper_c(inconv, c_type)

            # Replace the tokens in the type specification
            for i, dep in enumerate(param.dependencies):
                inconv = inconv.replace("%C" + str(i + 1) + "%", "c_" + dep)

            return indent(inconv).replace("%C%", cname).replace("%I%", param.name)

        inconv = [do_par(param) for param in desc.iter_parameters()]
        inconv = [i for i in inconv if i != ""]

        return "\n".join(inconv)

    def chunk_call(self, desc: FunctionDescriptor) -> str:
        """Every single argument is included, independently of their
        mode. If a type has a 'CALL' field then that is used after the
        usual %C% and %I% substitutions, otherwise the standard 'c_'
        prefixed C argument name is used.
        """

        calls = []
        for param in desc.iter_parameters():
            t = self.get_type_descriptor(param.type)
            type = t.get("CALL", f"c_{param.name}")

            if isinstance(type, dict):
                call = type.get(param.mode_str, "")
            else:
                call = type

            if call:
                if (
                    param.is_optional
                    and param.is_input
                    and not param.is_output
                    and call != "0"
                ):
                    call = f"(Rf_isNull(%I%) ? 0 : {call})"
                call = call.replace("%C%", f"c_{param.name}").replace("%I%", param.name)
                calls.append(call)

        calls = ", ".join(calls)
        res = ""
        # No return type means - return type is igraph_error_t
        if not desc.return_type:
            res = f"  IGRAPH_R_CHECK({desc.name}({calls}));\n"
        else:
            return_type = self.get_type_descriptor(desc.return_type)
            if return_type.name == "ERROR":
                res = f"  IGRAPH_R_CHECK({desc.name}({calls}));\n"
            elif return_type.name == "VOID":
                res = f"  {desc.name}({calls});\n"
            else:
                res = f"  c_result={desc.name}({calls});\n"

        return res

    def chunk_outconv(self, spec: FunctionDescriptor) -> str:
        """The output conversions, this is quite difficult. A function
        may report its results in two ways: by returning it directly
        or by setting a variable to which a pointer was passed. igraph
        usually uses the latter and returns error codes, except for
        some simple functions like 'igraph_vcount()' which cannot
        fail.

        First we add the output conversion for all types. This is
        easy. Note that even 'IN' arguments may have output
        conversion, eg. this is the place to free memory allocated to
        them in the 'INCONV' part.

        Then we check how many 'OUT' or 'INOUT' arguments we
        have. There are three cases. If there is a single such
        argument then that is already converted and we need to return
        that. If there is no such argument then the output of the
        function was returned, so we perform the output conversion for
        the returned type and this will be the result. If there are
        more than one 'OUT' and 'INOUT' arguments then they are
        collected in a named list. The names come from the argument
        names.
        """

        def do_par(param: ParamSpec) -> str:
            cname = f"c_{param.name}"
            t = self.get_type_descriptor(param.type)
            outconv = t.get_output_conversion_template_for(param.mode)

            outconv = indent(outconv)
            for i, dep in enumerate(param.dependencies):
                outconv = outconv.replace("%C" + str(i + 1) + "%", "c_" + dep)

            return outconv.replace("%C%", cname).replace("%I%", param.name)

        outconv = [do_par(param) for param in spec.iter_parameters()]
        outconv = [o for o in outconv if o != ""]

        # Consider only those parameters that have a corresponding declaration
        # in C.
        retpars = []
        for param in spec.iter_output_parameters():
            type_desc = self.get_type_descriptor(param.type)
            if type_desc.get_c_type(param.mode) is not None:
                retpars.append(param)

        if not retpars:
            # return the return value of the function
            rt = self.get_type_descriptor(spec.return_type)
            retconv = indent(rt.get_output_conversion_template_for(ParamMode.OUT))
            retconv = retconv.replace("%C%", "c_result").replace("%I%", "r_result")
            ret = "\n".join(outconv) + "\n" + retconv
        elif len(retpars) == 1:
            # return the single output value
            retconv = "  r_result = " + retpars[0].name + ";"
            ret = "\n".join(outconv) + "\n" + retconv
        else:
            # create a list of output values
            sets = [
                f"  SET_VECTOR_ELT(r_result, {index}, {param.name});"
                for index, param in enumerate(retpars)
            ]
            names = [
                f'  SET_STRING_ELT(r_names, {index}, Rf_mkChar("{param.name_in_higher_level_interface}"));'
                for index, param in enumerate(retpars)
            ]
            ret = "\n".join(
                [
                    f"  PROTECT(r_result=NEW_LIST({len(retpars)}));",
                    f"  PROTECT(r_names=NEW_CHARACTER({len(retpars)}));",
                ]
                + outconv
                + sets
                + names
                + ["  SET_NAMES(r_result, r_names);", f"  UNPROTECT({len(sets) + 1});"]
            )

        return ret


class RInitCodeGenerator(BlockBasedCodeGenerator):
    def _count_arguments(self, name: str) -> Tuple[int, int]:
        desc = self.get_function_descriptor(name)
        in_args, out_args = 0, 0
        for param in desc.iter_parameters():
            try:
                type_spec = self.get_type_descriptor(param.type)
            except NoSuchTypeError:
                # param should probably be included in the function header
                type_spec = None
            if (
                type_spec is None
                or "HEADER" not in type_spec
                or type_spec.get("HEADER") is not None
            ):
                if param.is_input:
                    in_args += 1
                if param.is_output:
                    out_args += 1
        return in_args, out_args

    def generate_declarations_block(self, out: IO[str]) -> None:
        for name in self.iter_functions():
            self.generate_declaration(name, out)

    def generate_declaration(self, name: str, out: IO[str]) -> None:
        num_input_args, num_output_args = self._count_arguments(name)

        # One output argument is used for the return value. The default generated
        # R wrapper only uses the first output argument.
        num_r_args = num_input_args

        args = ", ".join(["SEXP"] * num_r_args) or "void"
        out.write(f"extern SEXP R_{name}({args});\n")

    def generate_function(self, name: str, out: IO[str]) -> None:
        num_input_args, num_output_args = self._count_arguments(name)
        num_r_args = "{:>2}".format(num_input_args)
        padding = " " * (50 - len(name))
        out.write(
            f'    {{"R_{name}",{padding}(DL_FUNC) &R_{name},{padding}{num_r_args}}},\n'
        )

    def iter_functions(self, include_ignored: bool = False) -> Iterable[str]:
        return sorted(super().iter_functions(include_ignored=include_ignored))
