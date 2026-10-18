# New functions

What a new exported function needs before it merges.

* Examples, tests, and complete documentation of its arguments and return value.
* A concept, so that it appears in the pkgdown reference index.
* An "experimental" badge, `r lifecycle::badge("experimental")`.
* Arguments in `snake_case` with suitable defaults, and an ellipsis guarded by `check_dots_empty()` between the head and the keyword-only options,
  following the zoning rules in [`CONTRIBUTING.md`](/CONTRIBUTING.md#argument-order-and-the-ellipsis).
* Argument validation with the built-in `check_*()` functions or `igraph_arg_match()`.
* A callback argument is optional: `callback = NULL` uses a sensible built-in callback or an existing function;
  [`tools/AGENTS.md`](/tools/AGENTS.md) is the implementation guide.

A function exported from the C library is generated, never written by hand ([`stimulus/`](/handbook/architecture/stimulus/README.md)):
its `*_impl()` gets a test in `tests/testthat/test-aaa-<category>.R` ([the suite](/handbook/testing/suite/README.md)),
and a graph constructor prefers `GATTR` and `GATTR-PARAM` in the Stimulus definitions over assigning attributes by hand.
