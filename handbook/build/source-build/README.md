# Source build

How `R CMD INSTALL` builds the package from this tree.

`configure` writes `src/Makevars` from `src/Makevars.in`, finding GLPK, GMP and libxml2 where the system has them;
`src/sources-*.mk` list the objects and are written by `rconfigure.py`, which vendoring runs
([`operations/vendoring/pipeline/`](/handbook/operations/vendoring/pipeline/README.md)).

**Build artifacts are never committed:** `*.d`, `*.o` and `*.so` in `src/`, and `tests/testthat/testthat-problems.rds`.
The `src/*.dd` dependency files are committed, and change only when a source file is added or its local dependencies change;
system headers stay out of them ([`src/README.md`](/src/README.md)).

*To deepen: absorb `CONTRIBUTING.md` § Development and Compilation and its Windows section, and `src/README.md`.*
