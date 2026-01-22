# Extracted from test-error-formatting.R:4

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "igraph", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
expect_snapshot_igraph_error({
    test_error_with_source()
  })
