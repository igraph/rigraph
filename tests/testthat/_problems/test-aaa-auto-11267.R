# Extracted from test-aaa-auto.R:11267

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "igraph", path = "..")
attach(test_env, warn.conflicts = FALSE)

# prequel ----------------------------------------------------------------------
skip_on_cran()

# test -------------------------------------------------------------------------
skip_if_not_installed("Matrix")
withr::local_seed(20250909)
local_igraph_options(print.id = FALSE)
expect_error(weighted_sparsemat_impl(
    A = matrix(1:4, 2, 2),
    directed = TRUE,
    attr = "weight",
    loops = FALSE
  ))
