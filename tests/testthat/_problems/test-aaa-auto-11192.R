# Extracted from test-aaa-auto.R:11192

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
M <- Matrix::sparseMatrix(
    i = c(1, 2, 3, 4),
    j = c(2, 3, 4, 1),
    x = c(2.5, 1.0, 3.0, 0.5),
    dims = c(4, 4)
  )
expect_snapshot(sparse_weighted_adjacency_impl(adjmatrix = M))
