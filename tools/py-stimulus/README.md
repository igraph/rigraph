# `stimulus`

This repository hosts an experimental code generator for high-level interfaces
of igraph.

`stimulus` has already been used to generate a significant part of the codebase
of the R interface of igraph. The aim of this repository is to refactor it in a
way that makes it easier to potentially use `stimulus` for other high-level
interfaces (e.g., the Python interface, which still relies on hand-written code
for the Python bindings).

## Installation

Install [`uv`](https://astral.sh/uv) and then run `uv sync` to create a virtual
environment with all required dependencies. Then run `uv run stimulus --help` to
get help about the command line options.

## Documentation

See `docs/index.mdx` for generic usage instructions.
