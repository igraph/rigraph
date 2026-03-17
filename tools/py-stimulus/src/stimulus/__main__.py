import logging
import os
import sys

from argparse import ArgumentParser

from .generators import (
    get_code_generator_factory_for_language,
    is_valid_language,
)
from .providers.docstrings import FolderBasedDocstringProvider
from .version import __version__


def create_argument_parser() -> ArgumentParser:
    parser = ArgumentParser()

    parser.add_argument(
        "--version", action="version", version=f"%(prog)s {__version__}"
    )

    parser.add_argument(
        "-t",
        "--types",
        action="append",
        metavar="FILE",
        help="use the given type definition FILE",
        default=[],
    )

    parser.add_argument(
        "-f",
        "--functions",
        action="append",
        metavar="FILE",
        help="use the given function definition FILE",
        default=[],
    )

    parser.add_argument(
        "-l",
        "--language",
        action="append",
        metavar="LANGUAGE",
        help="generate code in the given LANGUAGE",
        default=[],
    )

    parser.add_argument(
        "-i",
        "--input",
        action="append",
        metavar="FILE",
        help="read input from the given FILE",
        default=[],
    )

    parser.add_argument(
        "-o",
        "--output",
        action="append",
        metavar="FILE",
        help="write output to the given FILE. Use '-' for standard output.",
        default=[],
    )

    parser.add_argument(
        "-D",
        "--docstring-dir",
        metavar="DIR",
        help="use docstrings from files stored in DIR",
        default=None,
    )

    return parser


def main():
    logging.basicConfig(
        format="%(levelname)-10s| %(message)s", level=logging.INFO, stream=sys.stderr
    )

    parser = create_argument_parser()
    options = parser.parse_args()

    type_files = options.types or ()
    function_files = options.functions
    inputs = options.input
    languages = options.language
    outputs = options.output
    docstring_dir = options.docstring_dir

    # Parameter checks
    # Note: the lists might be empty, but languages and outputs must
    # have the same length.
    if len(languages) != len(outputs):
        if len(languages) == 1 and not len(outputs):
            # Special case: just write to stdout
            outputs.append("-")
        else:
            parser.error("Number of languages and output files must match")

    for language in languages:
        if not is_valid_language(language):
            parser.error(f"Unknown language: {language}")

    for path in type_files:
        if not os.access(path, os.R_OK):
            parser.error(f"Cannot open type file: {path}")

    for path in function_files:
        if not os.access(path, os.R_OK):
            parser.error(f"Error: cannot open function file: {path}")

    for path in inputs:
        if not os.access(path, os.R_OK):
            parser.error(f"Error: cannot open input file: {path}")

    # Construct a log that the generators can write their messages to
    log = logging.getLogger()

    # OK, do the trick:
    for language, output in zip(languages, outputs):
        factory = get_code_generator_factory_for_language(language)

        generator = factory()
        generator.use_logger(log)
        for path in function_files:
            generator.load_function_descriptors_from_file(path)
        for path in type_files:
            generator.load_type_descriptors_from_file(path)
        if docstring_dir:
            generator.use_docstring_provider(
                FolderBasedDocstringProvider(docstring_dir)
            )

        if output == "-":
            generator.generate(inputs, sys.stdout)
        else:
            try:
                with open(output, "w") as fp:
                    generator.generate(inputs, fp)
            except Exception:
                # An error happened; delete the file and re-raise the exception
                try:
                    os.unlink(output)
                except Exception:
                    # Well, meh.
                    pass
                raise


if __name__ == "__main__":
    main()
