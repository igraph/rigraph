# The suite

The testthat suite under `tests/testthat/`.

* A test file mirrors its source file: `R/name.R` is tested in `tests/testthat/test-name.R`.
* New functionality comes with tests; a new generated `*_impl()` gets one in `test-aaa-auto.R`.
* `testthat::test_local(reporter = "check")` runs the suite, and `filter = "name"` one file of it;
  `devtools::check()` is the final step before a change is done.
* `tests/testthat/helper-skip.R` holds `skip_if_engine_before()`, the gate the vendoring series puts on a test the vendored C library cannot pass yet
  ([`operations/vendoring/adaptation/`](/handbook/operations/vendoring/adaptation/README.md)).

*To deepen: absorb `CONTRIBUTING.md` § Test Cases, and describe the other helpers in `tests/testthat/helper*.R`.*
