# Extracted from test-error-formatting.R:8

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "igraph", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
expect_snapshot(
    error = TRUE,
    {
      test_error_with_source()
    },
    transform = function(x) sub(":(\\d+)", ":<linenumber>", x)
  )
