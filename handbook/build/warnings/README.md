# Warnings

What the compiler may say about the code this repository owns, and where that is checked.
[`scripts/warnings.sh`](/scripts/warnings.sh) is the check, and its header says how to run it.

**The glue compiles without warnings; the vendored code is counted, never enforced.**
A warning belongs to the file it points at, not to the translation unit that raised it,
so a glue file that includes an igraph header does not answer for what that header says.

* **Glue** is `src/` outside `src/vendor/`: the hand-written C and C++,
  `src/rinterface.c`, whose generator and definitions live here ([`architecture/stimulus/`](/handbook/architecture/stimulus/README.md)),
  and `src/cpp11.cpp`.
  A warning there is fixed here, at its cause: in the source, or in the generator for a generated file.
* **Vendored** is `src/vendor/`: the igraph C library and what it vendors in turn, ARPACK's Fortran among it.
  A warning there is fixed upstream, in igraph/igraph, and arrives with the commit the series vendors
  ([`operations/vendoring/model/`](/handbook/operations/vendoring/model/README.md)).
  The gate never fails on it, so the series replays upstream as it is.
* **External** is a header outside the checkout, R's or cpp11's, and is counted like the vendored code.

The one answer never available is silencing a single site with a `#pragma` or a cast that only hides the warning.

## The flags

`-Wall -pedantic` is what CRAN's own GCC checks compile with, and the gate starts there.
`-Wextra` is added, because on the glue it costs nothing today.
Two categories are then switched off, each for a reason the glue cannot remove:

* **`-Wunused-parameter`.**
  Callbacks implement signatures igraph and R dictate, the RNG and attribute handlers among them.
* **`-Wcast-function-type`.**
  R registers native routines through `DL_FUNC`, a cast `cpp11::cpp_register()` writes for every entry point in `src/cpp11.cpp`.

ISO C's conversions between function and object pointers are dropped from the report,
the exemption R CMD check makes for them too:
igraph keeps an R closure behind `igraph_function_pointer_t`, so the glue cannot avoid one.

**None of this reaches `src/Makevars` or `~/.R/Makevars`.**
CRAN rejects `-Wno-*` in a package's own flags,
and a user Makevars is read by every later build in the job, R CMD check's among them.
The gate compiles the glue objects through a makefile of its own and leaves the package build alone.

## What R CMD check already catches

R CMD check scans the install log for a fixed list of *significant warnings*
(`tools:::.check_packages`: implicit declarations, `-Wformat`, `-Wstrict-prototypes` and a few more),
and the `check` step fails on any WARNING, vendored code included.
It sees only the flags the job's R was built with, which are fewer than CRAN's.
A full build under CRAN's `-Wall -pedantic` raises none of the significant ones today,
so the gate here is for the warnings CRAN prints without failing on.

## Where it runs

* **On every pull request**, in the `rcc` smoke test, through `custom/after-install`.
  The answer is the same in every matrix entry, so it runs in one.
* **On every series commit**, as the `warnings` gate of [`scripts/rcc-one.sh`](/scripts/rcc-one.sh)
  ([`operations/ci/per-commit/`](/handbook/operations/ci/per-commit/README.md)).
  A vendored commit that makes the glue warn, a renamed or deprecated declaration say,
  is repaired on the R side like any other breakage the walk surfaces
  ([`operations/vendoring/adaptation/`](/handbook/operations/vendoring/adaptation/README.md)).
* **Locally**, `scripts/warnings.sh` for the glue in seconds,
  and `scripts/warnings.sh vendored` for the whole vendored tree, which lists its warnings and always succeeds.

The gate is GCC's, and CI's GCC is newer than a development box's,
so a run that is clean locally is evidence rather than proof.
Clang is welcome as a second opinion, and is not wired into the gate.
