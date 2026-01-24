# Extracted from test-aaa-auto.R:5126

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "igraph", path = "..")
attach(test_env, warn.conflicts = FALSE)

# prequel ----------------------------------------------------------------------
skip_on_cran()

# test -------------------------------------------------------------------------
withr::local_seed(20250909)
local_igraph_options(print.id = FALSE)
expect_snapshot_igraph_error(edgelist_percolation_impl(
    edges = "a"
  ))
