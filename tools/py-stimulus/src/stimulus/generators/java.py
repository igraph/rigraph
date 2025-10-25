"""Java interface, experimental version using JNI (Java Native Interface)

TODO: - everything :) This is just a PoC implementation.
"""

from typing import Any, Dict, IO

from stimulus.errors import StimulusError
from stimulus.model import ParamMode, ParamSpec

from .base import BlockBasedCodeGenerator
from .utils import create_indentation_function


indent = create_indentation_function("  ")


class JavaCodeGenerator(BlockBasedCodeGenerator):
    """Class containing the common parts of JavaJavaCodeGenerator and
    JavaCCodeGenerator"""

    package = "net.sf.igraph"

    def get_function_metadata(
        self, name: str, type_param: str = "JAVATYPE"
    ) -> Dict[str, Any]:
        """Returns metadata for the given function based on the parameters.
        f is the name of the function. The result is a dict with the following
        keys:

        - java_modifiers: Java modifiers to be used in the .java file
        - return_type: return type of the function
        - name: name of the function
        - argument_types: list of argument types
        - self_name: name of the "self" argument
        - is_static: whether the function is static
        - is_constructor: whether the function is a constructor
        """
        spec = self.get_function_descriptor(name)
        is_constructor = False

        # We will collect data related to the current function in a dict
        data = {}
        data["name"] = spec.get_name_in_generated_code("Java")
        data["java_modifiers"] = ["public"]

        # Check parameter types to determine Java calling semantics
        types = {"IN": [], "OUT": [], "INOUT": []}
        for param in spec.iter_parameters():
            types[param.mode_str].append(param)

        if len(types["OUT"]) + len(types["INOUT"]) == 1:
            # If a single one is OUT or INOUT and all others are
            # INs, then this is our lucky day - the method fits the Java
            # semantics
            if len(types["OUT"]) > 0:
                return_type_name = types["OUT"][0].type
            else:
                return_type_name = types["INOUT"][0].type
        elif len(types["OUT"]) + len(types["INOUT"]) == 0 and spec.return_type:
            # There are only input parameters and the return type is specified,
            # this also fits the Java semantics
            return_type_name = spec.return_type
        else:
            raise StimulusError(
                "{}: calling convention unsupported yet".format(data["name"])
            )

        # Loop through the input parameters
        method_arguments = []
        found_self = False
        for param in spec.iter_parameters():
            if param.mode is ParamMode.IN:
                continue

            type_name = param.type
            if not found_self and type_name == "GRAPH":
                # this will be the 'self' argument
                found_self = True
                data["self_name"] = param.name
                continue
            tdesc = self.get_or_create_type_descriptor(type_name)
            if type_param not in tdesc:
                raise StimulusError(
                    "{}: unknown input type {} (needs {}), skipping".format(
                        data["name"], type_name, type_param
                    )
                )
            method_arguments.append(" ".join([tdesc[type_param], param.name]))
        data["argument_types"] = method_arguments

        if not found_self:
            # Loop through INOUT arguments if we found no "self" yet
            for param in spec.iter_parameters():
                if param.mode is ParamMode.OUT and param.type == "GRAPH":
                    found_self = True
                    data["self_name"] = param.name
                    break

        tdesc = self.get_or_create_type_descriptor(return_type_name)
        if type_param not in tdesc:
            raise StimulusError(
                "{}: unknown return type {}, skipping".format(
                    data["name"], return_type_name
                )
            )
        data["return_type"] = tdesc[type_param]

        if not found_self:
            data["java_modifiers"].append("static")
            data["name"] = data["name"][0].upper() + data["name"][1:]

        data["java_modifiers"] = " ".join(data["java_modifiers"])
        data["is_static"] = not found_self
        data["is_constructor"] = is_constructor

        return data


class JavaJavaCodeGenerator(JavaCodeGenerator):
    def generate_function(self, name: str, out: IO[str]) -> None:
        try:
            func_metadata = self.get_function_metadata(name)
            func_metadata["arguments"] = ", ".join(func_metadata["argument_types"])
            out.write(
                "    %(java_modifiers)s native %(return_type)s %(name)s(%(arguments)s);\n"
                % func_metadata
            )
        except StimulusError as e:
            out.write("    // %s\n" % str(e))


class JavaCCodeGenerator(JavaCodeGenerator):
    def generate_function(self, function: str, out: IO[str]) -> None:
        try:
            self.metadata = self.get_function_metadata(function, "CTYPE")
        except StimulusError as e:
            out.write("\n/* %s */\n" % str(e))
            return

        # Check types
        if not self.check_types_of_function(function, "error"):
            return

        desc = self.get_function_descriptor(function)

        ## Compile the output
        ## This code generator is quite difficult, so we use different
        ## functions to generate the approprite chunks and then
        ## compile them together using a simple template.
        ## See the documentation of each chunk below.
        params = desc.parameters
        try:
            res = {}
            res["func"] = function
            res["header"] = self.chunk_header(function, params)
            res["decl"] = self.chunk_declaration(function, params)
            res["before"] = self.chunk_before(function, params)
            res["inconv"] = self.chunk_inconv(function)
            res["call"] = self.chunk_call(function, params)
            res["outconv"] = self.chunk_outconv(function, params)
            res["after"] = self.chunk_after(function, params)
        except StimulusError as e:
            out.write("/* %s */\n" % str(e))
            return

        # Replace into the template
        text = (
            """
/*-------------------------------------------/
/ %(func)-42s /
/-------------------------------------------*/
%(header)s {
                                        /* Declarations */
%(decl)s

%(before)s
                                        /* Convert input */
%(inconv)s
                                        /* Call igraph */
%(call)s
                                        /* Convert output */
%(outconv)s

%(after)s

  return result;
}\n"""
            % res
        )

        out.write(text)

    def chunk_header(self, function: str, params: Dict[str, ParamSpec]) -> str:
        """The header.

        The name of the function is the igraph function name minus the
        igraph_ prefix, camelcased and prefixed with the underscored
        Java classname: net_sf_igraph_Graph_. The arguments
        are mapped from the JAVATYPE key of the type dict. Static
        methods also need a 'jclass cls' argument, ordinary methods
        need 'jobject jobj'. Besides that, the Java environment pointer
        is also passed.
        """
        data = self.get_function_metadata(function, "JAVATYPE")

        data["funcname"] = "Java_%s_Graph_%s" % (
            self.package.replace(".", "_"),
            data["name"],
        )

        if data["is_static"]:
            data["argument_types"].insert(0, "jclass cls")
        else:
            data["argument_types"].insert(0, "jobject " + data["self_name"])
        data["argument_types"].insert(0, "JNIEnv *env")

        data["types"] = ", ".join(data["argument_types"])

        res = "JNIEXPORT %(return_type)s JNICALL %(funcname)s(%(types)s)" % data
        return res

    def chunk_declaration(self, function: str, params: Dict[str, ParamSpec]) -> str:
        """The declaration part of the function body

        There are a couple of things to declare. First a C type is
        needed for every argument, these will be supplied in the C
        igraph call. Then, all 'OUT' arguments need an appropriate variable as
        well, the result will be stored here. The return type
        of the C function also needs to be declared, that comes
        next. The result variable will contain the final result. Finally,
        if the method is not static but we are returning a new Graph object
        (e.g. in the case of igraph_linegraph), we need a jclass variable
        to store the Java class object."""

        desc = self.get_function_descriptor(function)

        def do_cpar(spec: ParamSpec) -> str:
            type_desc = self.get_type_descriptor(spec.type)
            return type_desc.declare_c_variable(f"c_{spec.name}", mode=spec.mode)

        def do_jpar(spec: ParamSpec) -> str:
            type_desc = self.get_type_descriptor(spec.type)
            return type_desc.declare_c_variable(
                f"j_{spec.name}", mode=spec.mode, name_token="%J%"
            )

        inout = [do_cpar(param) for param in desc.iter_parameters()]
        out = [
            do_jpar(param)
            for param in desc.iter_parameters()
            if param.mode is ParamMode.OUT
        ]

        return_type_desc = self.get_type_descriptor(desc.return_type)
        retdecl = return_type_desc.declare_c_variable("c__result")

        rnames = [n for n, p in params.items() if p.is_output]
        jretdecl = ""
        if len(rnames) > 0:
            n = rnames[0]
            rtname = params[n].type
        else:
            rtname = desc.return_type

        rt = self.get_type_descriptor(rtname)
        if "JAVADECL" in rt:
            jretdecl = rt["JAVADECL"]
        elif "JAVATYPE" in rt:
            jretdecl = rt["JAVATYPE"] + " result;"

        decls = inout + out + [retdecl, jretdecl]
        if not self.metadata["is_static"] and rtname == "GRAPH":
            self.metadata["need_class_decl"] = True
            decls.append(
                "jclass cls = (*env)->GetObjectClass(env, %s);"
                % self.metadata["self_name"]
            )
        else:
            self.metadata["need_class_decl"] = False
        return indent("\n".join(i for i in decls if i != ""))

    def chunk_before(self, function: str, params: Dict[str, ParamSpec]) -> str:
        """We simply call Java_igraph_before"""
        return "  Java_igraph_before();"

    def chunk_inconv(self, function: str) -> str:
        """Input conversions. Not only for types with mode 'IN' and
        'INOUT', eg. for 'OUT' vector types we need to allocate the
        required memory here, do all the initializations, etc. Types
        without INCONV fields are ignored. The usual %C%, %I% is
        performed at the end.
        """

        desc = self.get_function_descriptor(function)

        def do_par(param: ParamSpec):
            cname = "c_" + param.name
            t = self.get_type_descriptor(param.type)
            inconv = t.get_input_conversion_template_for(param.mode)
            if inconv:
                inconv = indent(inconv)
            for i, dep in enumerate(param.dependencies):
                inconv = inconv.replace("%C" + str(i + 1) + "%", "c_" + dep)

            return inconv.replace("%C%", cname).replace("%I%", param.name)

        inconv = [do_par(param) for param in desc.iter_parameters()]
        inconv = [i for i in inconv if i != ""]

        return "\n".join(inconv)

    def chunk_call(self, function, params):
        """Every single argument is included, independently of their
        mode. If a type has a 'CALL' field then that is used after the
        usual %C% and %I% substitutions, otherwise the standard 'c_'
        prefixed C argument name is used.
        """
        types = [self.get_type_descriptor(params[n].type) for n in params]
        call = list(
            map(lambda t, n: t.get("CALL", "c_" + n), types, list(params.keys()))
        )
        call = list(
            map(
                lambda c, n: c.replace("%C%", "c_" + n).replace("%I%", n),
                call,
                list(params.keys()),
            )
        )
        lines = [
            "  if ((*env)->ExceptionCheck(env)) {",
            "    c__result = IGRAPH_EINVAL;",
            "  } else {",
            "    c__result = " + function + "(" + ", ".join(call) + ");",
            "  }",
        ]
        return "\n".join(lines)

    def chunk_outconv(self, function: str, params: Dict[str, ParamSpec]) -> str:
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
        the returned type and this will be the result. The case of
        more than one 'OUT' and 'INOUT' arguments is not yet supported by
        the Java interface.
        """

        spec = self.get_function_descriptor(function)

        def do_par(pname):
            cname = "c_" + pname
            jname = "j_" + pname
            t = self.get_type_descriptor(params[pname].type)
            outconv = t.get_output_conversion_template_for(params[pname].mode)
            if outconv:
                outconv = indent(outconv)
            return outconv.replace("%C%", cname).replace("%I%", jname)

        outconv = [do_par(n) for n in params]
        outconv = [o for o in outconv if o != ""]

        retpars = [(n, p) for n, p in params.items() if p.is_output]
        if len(retpars) == 0:
            # return the return value of the function
            rt = self.get_type_descriptor(spec.return_type)
            retconv = rt.get_output_conversion_template_for(ParamMode.OUT)
            if retconv:
                retconv = indent(retconv)
            retconv = retconv.replace("%C%", "c__result").replace("%I%", "result")
            if len(retconv) > 0:
                outconv.append(retconv)
            ret = "\n".join(outconv)
        elif len(retpars) == 1:
            # return the single output value
            if retpars[0][1].mode is ParamMode.OUT:
                # OUT parameter
                retconv = "  result = j_" + retpars[0][0] + ";"
            else:
                # INOUT parameter
                retconv = "  result = " + retpars[0][0] + ";"
            outconv.append(retconv)

            outconv.insert(0, "if (c__result == 0) {")
            outconv.extend(["} else {", "  result = 0;", "}"])
            outconv = [indent(line) for line in outconv]
            ret = "\n".join(outconv)
        else:
            raise StimulusError(
                "{}: the case of multiple outputs not supported yet".format(function)
            )

        return ret

    def chunk_after(self, function, params):
        """We simply call Java_igraph_after"""
        return "  Java_igraph_after();"
