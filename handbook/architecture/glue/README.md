# Glue

The hand-written C and C++ in `src/` between R and the C library:
`rinterface_extra.c`, `rcallback.c`, `rrandom.c`, `init.cpp`, `cpprinterface.cpp`, `simpleraytracer.cpp` and `uuid.c`.
`src/rinterface.c` beside them is generated ([`stimulus/`](/handbook/architecture/stimulus/README.md)),
and so are `src/cpp11.cpp` and `R/cpp11.R`, by `cpp11::cpp_register()`.

Vendoring syntax-checks every C and C++ file directly in `src/` against the freshly vendored headers after each vendor commit,
so a C API change upstream stops the walk at the commit that made it ([`operations/vendoring/pipeline/`](/handbook/operations/vendoring/pipeline/README.md)).

*To deepen: say what each glue file is for, how R's random number generator reaches the C library, and how callbacks cross into R ([`tools/AGENTS.md`](/tools/AGENTS.md) holds the callback guide).*
