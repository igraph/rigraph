# Engine

The igraph C library this package carries in `src/vendor/cigraph/`, and the files around it in `src/vendor/`.

The tree is vendored, never edited: every change arrives as a vendor commit or as a `patch/` entry
([`operations/vendoring/`](/handbook/operations/vendoring/README.md)).
`src/vendor/igraph_version.h` records the version igraph's CMake derived, `git describe --tags` of the vendored commit.
Beside the vendored tree, `src/vendor/` holds files this package keeps by hand: `config.h`, `igraph_config.h`, the ARPACK copy, `uuid/`, and `simpleraytracer/`,
and files generated from the vendored tree: the lexers and parsers in `io/`, `igraph_threading.h`, and `igraph_export.h` from `tools/stimulus/`.

*To deepen: say which C library features the package build turns off or replaces, and why ARPACK is a separate copy.*
