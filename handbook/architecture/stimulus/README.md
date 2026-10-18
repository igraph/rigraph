# Stimulus

The code generator that writes the R/C interface: `src/rinterface.c` and `R/aaa-*.R`.

**Never edit what it writes.**
`make -f Makefile-cigraph src/rinterface.c r_wrappers` regenerates both from
the C library's own `src/vendor/cigraph/interfaces/functions.yaml` and `types.yaml`,
together with this package's `tools/stimulus/functions-R.yaml`, `types-RC.yaml` and `types-RR.yaml`.
Stimulus writes one `.build/aaa-auto.R`, which `tools/split-aaa-auto.R` splits into the per-category `R/aaa-*.R` files that `tools/aaa-categories.yaml` names.
A generated function without an entry there stops the split, so a function a newer C core adds needs its category first.
Entries for functions the vendored core does not generate yet are ignored, so they can go to `main` ahead of the core that adds them.
`tools/rebuild-cats.R` holds the placements and rewrites the YAML.
A change to the interface goes to those YAML files, or to a `patch/` entry when the C library's own definition is wrong
([`operations/vendoring/adaptation/`](/handbook/operations/vendoring/adaptation/README.md)).

**Stimulus is vendored too.** `tools/py-stimulus/` is a git subrepo of [igraph/stimulus](https://github.com/igraph/stimulus),
installed into `.venv/` by the Makefile from `tools/build-requirements.txt`.
A fix made there belongs upstream as well.

[`tools/README.md`](/tools/README.md) is the detailed guide to the definitions.

*To deepen: absorb `tools/README.md`, and say how a default value is spelled in `functions.yaml` and which type mappings live where.*
