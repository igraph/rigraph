# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 302. power_law_fit_impl

test_that("power_law_fit_impl basic", {
  igraph_local_seed(20250909)
  expect_snapshot(power_law_fit_impl(
    data = c(1, 2, 3)
  ))
  expect_snapshot(power_law_fit_impl(
    data = c(1, 2, 3),
    xmin = 1,
    force_continuous = TRUE
  ))

  # Structured tests
  result <- power_law_fit_impl(
    data = c(1, 2, 3)
  )
  expect_type(result, "list")
})

test_that("power_law_fit_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(power_law_fit_impl(
    data = "a"
  ))
})

# 306. solve_lsap_impl

test_that("solve_lsap_impl basic", {
  igraph_local_seed(20250909)
  expect_snapshot(solve_lsap_impl(
    c = matrix(1:4, ncol = 2),
    n = 2
  ))

  # Structured tests
  result <- solve_lsap_impl(
    c = matrix(1:4, ncol = 2),
    n = 2
  )
  expect_true(is.numeric(result))
})

test_that("solve_lsap_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(solve_lsap_impl(
    c = "a",
    n = 2
  ))
})

# 333. version_impl

test_that("version_impl basic", {
  igraph_local_seed(12345)
  version_impl_clean <- function() {
    v <- version_impl()

    paste(v$major, v$minor, v$subminor, sep = ".")
  }
  expect_snapshot(version_impl_clean())

  # Structured tests
  result <- version_impl_clean()
  expect_type(result, "character")
})

test_that("version_impl errors", {
  igraph_local_seed(12345)
  # version_impl() has no parameters, so testing with invalid arguments
  expect_snapshot_igraph_error(version_impl(
    "invalid"
  ))
})

# eigen_matrix_impl
test_that("eigen_matrix_impl basic", {
  igraph_local_seed(20250909)

  # FIXME: Add functionality tests once we understand the expected behavior
  # The function requires complex matrix setup and understanding of eigenvalue computation
  # For now, just verify the function exists and has correct signature
  expect_true(is.function(eigen_matrix_impl))
  expect_named(
    formals(eigen_matrix_impl),
    c("A", "sA", "fun", "n", "algorithm", "which", "options")
  )
})

test_that("eigen_matrix_impl errors", {
  igraph_local_seed(20250909)

  # Test with invalid matrix dimensions
  expect_error(eigen_matrix_impl(
    A = matrix(0, 0, 0),
    sA = Matrix::Matrix(matrix(0, 0, 0), sparse = TRUE),
    fun = NULL,
    n = 0,
    algorithm = "auto",
    which = list(pos = "LM", howmany = 1)
  ))
})

# eigen_matrix_symmetric_impl
test_that("eigen_matrix_symmetric_impl basic", {
  igraph_local_seed(20250909)

  # FIXME: Add functionality tests once we understand the expected behavior
  # The function requires complex matrix setup and understanding of eigenvalue computation
  # For now, just verify the function exists and has correct signature
  expect_true(is.function(eigen_matrix_symmetric_impl))
  expect_named(
    formals(eigen_matrix_symmetric_impl),
    c("A", "sA", "fun", "n", "algorithm", "which", "options")
  )
})

test_that("eigen_matrix_symmetric_impl errors", {
  igraph_local_seed(20250909)

  # Test with invalid matrix dimensions
  expect_error(eigen_matrix_symmetric_impl(
    A = matrix(0, 0, 0),
    sA = Matrix::Matrix(matrix(0, 0, 0), sparse = TRUE),
    fun = NULL,
    n = 0,
    algorithm = "auto",
    which = list(pos = "LM", howmany = 1)
  ))
})
