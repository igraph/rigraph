# The suite

The testthat suite under `tests/testthat/`.

* A test file mirrors its source file: `R/name.R` is tested in `tests/testthat/test-name.R`.
* New functionality comes with tests; a new generated `*_impl()` gets one in `test-aaa-auto.R`.
* `testthat::test_local(reporter = "check")` runs the suite, and `filter = "name"` one file of it;
  `devtools::check()` is the final step before a change is done.

*To deepen: absorb `CONTRIBUTING.md` § Test Cases, and describe the other helpers in `tests/testthat/helper*.R`.*
