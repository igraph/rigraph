test_that("error messages include source file and line information", {
  # Note: We use expect_snapshot(error = TRUE) here instead of
  # expect_snapshot_igraph_error() because we need to test the actual
  # line numbers in the error message, which expect_snapshot_igraph_error()
  # would transform to "xx".
  expect_snapshot(
    error = TRUE,
    {
      test_error_with_source()
    }
  )
})
