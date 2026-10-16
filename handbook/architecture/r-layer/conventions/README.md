# Conventions

How the R code in this package is written.

**Style.** The [tidyverse style guide](https://style.tidyverse.org) and the [tidyverse design guide](https://design.tidyverse.org) apply,
with two-space indentation, and `air format .` formats every R file before a commit (`air.toml` holds its settings).
Comments explain why and how; the what should be clear from the code, and each sentence takes its own line.

**Names.** New functions and all arguments use `snake_case`, and a variable's name says what it holds in its context.
`max` means maximal, the graph-theory term (no other vertex dominates it), and `largest` means maximum, the biggest value in a set.
`make_*()` creates a graph deterministically, and `sample_*()` samples one from an ensemble.

**Calls into C.** R code calls the C library only through the generated `*_impl()` functions in `R/aaa-*.R`,
never through `.Call()` elsewhere ([`stimulus/`](/handbook/architecture/stimulus/README.md));
all arguments to an `*_impl()` call are named.
A function touched for any reason has its remaining `.Call()` sites replaced in the same change.

**Packages.** Calls into other packages carry an explicit prefix, such as `withr::local_options()`.
The package's own name is never written into the code: it is read at run time, so that the `igraph.dev` flavor works unchanged
([`branches/flavors/`](/handbook/branches/flavors/README.md)), and a test guards it ([`testing/guards/`](/handbook/testing/guards/README.md)).

**Deprecations.** A deprecated function is not changed.
The deprecation tooling under `tools/` (`tools/migrations/`, `tools/*lifecycle*.R`) generates and checks the migration table.

*To deepen: absorb `CONTRIBUTING.md` § Writing igraph Code, and say what the lifecycle tooling under `tools/` generates and which CI step checks it.*
