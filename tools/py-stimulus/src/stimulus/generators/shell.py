"""Shell interface generator, allowing one to invoke igraph functions directly
from the command line.
"""

from collections import OrderedDict
from typing import Any, Dict, IO

from stimulus.model import ParamMode, ParamSpec

from .base import SingleBlockCodeGenerator
from .utils import create_indentation_function

__all__ = ("ShellCodeGenerator",)

################################################################################
# Shell interface, igraph functions directly from the command line
# TODO: - read/write default input/output from/to stdin/stdout
#       - short options
#       - prefixed output (?)
#       - default values depending on other parameters
#       - other input/output graph formats, to be controlled by
#         environment variables (?): IGRAPH_INGRAPH, IGRAPH_OUTGRAPH
################################################################################


indent = create_indentation_function("  ")

FUNCTION_TEMPLATE = """\
/*-------------------------------------------/
/ %(func)-42s /
/-------------------------------------------*/
void shell_%(func)s_usage(char **argv) {
%(usage)s
  exit(1);
}

int shell_%(func)s(int argc, char **argv) {

%(decl)s

  int shell_seen[%(nargs)s];
  int shell_index=-1;
  struct option shell_options[]= { %(args)s
                                   { "help", no_argument, 0, %(nargs)s },
                                   { 0, 0, 0, 0 }
                                 };

  /* 0 - not seen, 1 - seen as argument, 2 - seen as default */
  memset(shell_seen, 0, %(nargs)s*sizeof(int));
%(default)s

  /* Parse arguments and read input */
  while (getopt_long(argc, argv, "", shell_options, &shell_index) != -1) {

    if (shell_index==-1) {
      exit(1);
    }

    if (shell_seen[shell_index]==1) {
      fprintf(stderr, "Error, `--%%s' argument given twice.\\n",
              shell_options[shell_index].name);
      exit(1);
    }
    shell_seen[shell_index]=1;
%(inconv)s
    shell_index=-1;
  }

  /* Check that we have all arguments */
  for (shell_index=0; shell_index<%(nargs)s; shell_index++) {
    if (!shell_seen[shell_index]) {
      fprintf(stderr, "Error, argument missing: `--%%s'.\\n",
              shell_options[shell_index].name);
      exit(1);
    }
  }

  /* Do the operation */
%(call)s

  /* Write the result */
%(outconv)s

  return 0;
}
"""


class ShellCodeGenerator(SingleBlockCodeGenerator):
    def generate_functions_block(self, out: IO[str]) -> None:
        out.write("\n/* Function prototypes first */\n\n")

        for name in self.iter_functions():
            self.generate_prototype(name, out)

        out.write("\n/* The main function */\n\n")
        out.write("int main(int argc, char **argv) {\n\n")
        out.write("  const char *base=basename(argv[0]);\n\n  ")

        for name in self.iter_functions():
            out.write(
                f'if (!strcasecmp(base, "{name}")) {{\n'
                f"    return shell_{name}(argc, argv);\n"
                f"  }} else "
            )

        out.write('{\n    printf("Unknown function, exiting\\n");\n')
        out.write("  }\n\n  shell_igraph_usage(argc, argv);\n\n  return 0;\n}\n")

        out.write("\n/* The functions themselves at last */\n")

        for name in self.iter_functions():
            self.generate_function(name, out)

    def generate_prototype(self, name: str, out: IO[str]):
        """Generates the prototype of the C function that will handle the
        function with the given name.
        """
        out.write(f"int shell_{name}(int argc, char **argv);\n")

    def generate_function(self, name: str, out: IO[str]) -> None:
        # Check types
        self.check_types_of_function(name, errors="warn")

        # Enumerate parameters
        desc = self.get_function_descriptor(name)
        args = OrderedDict()
        for param in desc.iter_parameters():
            tname = param.type
            t = self.get_type_descriptor(tname)
            mode = param.mode
            if "INCONV" in t or "OUTCONV" in t:
                p = param.name
                args[p] = param.as_dict()
                args[p]["shell_no"] = len(args) - 1
                if mode is ParamMode.INOUT:
                    args[p]["mode"] = "IN"
                    args[p + "-out"] = param.as_dict()
                    args[p + "-out"]["mode"] = "OUT"
                    args[p + "-out"]["shell_no"] = len(args) - 1
                    if "INCONV" not in t or "IN" not in t["INCONV"]:
                        self.log.warning(f"No INCONV for type {tname!r}, mode IN")
                    if "OUTCONV" not in t or "OUT" not in t["OUTCONV"]:
                        self.log.warning(f"No OUTCONV for type {tname!r}, mode OUT")
            if mode is ParamMode.IN and ("INCONV" not in t or mode not in t["INCONV"]):
                self.log.warning(f"No INCONV for type {tname!r}, mode {mode}")
            if mode is ParamMode.OUT and (
                "OUTCONV" not in t or mode not in t["OUTCONV"]
            ):
                self.log.warning(f"No OUTCONV for type {tname!r}, mode {mode}")

        res: Dict[str, Any] = {"nargs": len(args)}
        params = desc.parameters
        res["func"] = name
        res["args"] = self.chunk_args(name, args)
        res["decl"] = self.chunk_decl(name, params)
        res["inconv"] = self.chunk_inconv(name, params, args)
        res["call"] = self.chunk_call(name, params)
        res["outconv"] = self.chunk_outconv(name, params)
        res["default"] = self.chunk_default(name, params, args)
        res["usage"] = self.chunk_usage(name, args)
        out.write(FUNCTION_TEMPLATE % res)

    def chunk_args(self, func_name: str, params: Dict[str, Dict[str, str]]) -> str:
        res = [
            [f'"{name}"', "required_argument", "0", str(p["shell_no"])]
            for name, p in params.items()
        ]
        res = ["{ " + ", ".join(e) + " }," for e in res]
        return "\n                                   ".join(res)

    def chunk_decl(self, name: str, params: Dict[str, ParamSpec]) -> str:
        spec = self.get_function_descriptor(name)

        def do_par(pname):
            param = params[name]
            type_desc = self.get_type_descriptor(params[pname].type)
            decl = type_desc.declare_c_variable(pname, mode=ParamMode.IN)

            default = param.get_default_value(type_desc) or ""

            if decl:
                if default:
                    return f"{decl}={default};"
                else:
                    return f"{decl};"
            else:
                return ""

        decl = [do_par(n) for n in params]
        inout = [
            "char* shell_arg_" + n + "=0;" for n, p in params.items() if p.is_output
        ]

        return_type_desc = self.get_type_descriptor(spec.return_type)
        retdecl = return_type_desc.declare_c_variable("shell_result")

        if spec.return_type != "ERROR":
            retchar = 'char *shell_arg_shell_result="-";'
        else:
            retchar = ""
        return indent("\n".join(decl + inout + [retdecl, retchar]))

    def chunk_default(
        self, name: str, params: Dict[str, ParamSpec], args: Dict[str, Dict[str, str]]
    ) -> str:
        def do_par(pname: str) -> str:
            if params[pname].has_default_value is not None:
                shell_no = args[pname]["shell_no"]
                res = f"  shell_seen[{shell_no}] = 2;"
            else:
                res = ""
            return res

        res = [do_par(n) for n in params]
        res = [n for n in res if n != ""]
        return "\n".join(res)

    def chunk_inconv(
        self,
        func_name: str,
        params: Dict[str, ParamSpec],
        args: Dict[str, Dict[str, str]],
    ) -> str:
        def do_par(pname):
            t = self.get_type_descriptor(params[pname].type)
            mode = params[pname].mode_str
            if "INCONV" in t and mode in t["INCONV"]:
                inconv = "" + t["INCONV"][mode]
            else:
                inconv = ""
            if pname.endswith("-out"):
                pname = pname[0:-4]
            return inconv.replace("%C%", pname)

        inconv = [
            "    case "
            + str(arg["shell_no"])
            + ": /* "
            + name
            + " */\n      "
            + do_par(name)
            for name, arg in args.items()
        ]
        inconv = [n + "\n      break;" for n in inconv]
        inconv = ["".join(n) for n in inconv]
        text = (
            "\n    switch (shell_index) {\n"
            + "\n".join(inconv)
            + "\n    case "
            + str(len(inconv))
            + ":\n      shell_"
            + func_name
            + "_usage(argv);\n      break;"
            + "\n    default:\n      break;\n    }\n"
        )
        return text

    def chunk_call(self, func_name: str, params: Dict[str, ParamSpec]) -> str:
        parts = []
        for name, spec in params.items():
            type = self.get_type_descriptor(spec.type)
            call = type.get("CALL", name).replace("%C%", name)
            parts.append(call)

        call = ", ".join(parts)
        return f"  shell_result = {func_name}({call});"

    def chunk_outconv(self, name: str, params: Dict[str, ParamSpec]) -> str:
        spec = self.get_function_descriptor(name)

        def do_par(pname):
            t = self.get_type_descriptor(params[pname].type)
            mode = params[pname].mode_str
            if "OUTCONV" in t and mode in t["OUTCONV"]:
                outconv = indent(t["OUTCONV"][mode])
            else:
                outconv = ""
            if pname.endswith("-out"):
                pname = pname[0:-4]
            return outconv.replace("%C%", pname)

        outconv = [do_par(n) for n in params]
        rt = self.get_type_descriptor(spec.return_type)
        if "OUTCONV" in rt and "OUT" in rt["OUTCONV"]:
            rtout = indent(rt["OUTCONV"]["OUT"])
        else:
            rtout = ""
        outconv.append(rtout.replace("%C%", "shell_result"))
        outconv = [o for o in outconv if o != ""]
        return "\n".join(outconv)

    def chunk_usage(self, func_name: str, params: Dict[str, ParamSpec]) -> str:
        res = " ".join(f"--{name}=<{name}>" for name in params)
        return f'  printf("%s {res}\\n", basename(argv[0]));'
