test_that("error messages include source file and line information", {
  expect_snapshot_igraph_error({
    test_error_with_source()
  })
})
