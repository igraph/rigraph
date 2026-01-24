test_that("error messages include source file and line information", {
  expect_snapshot(
    error = TRUE,
    {
      test_error_with_source()
    },
    transform = function(x) sub(":(\\d+)", ":<linenumber>", x)
  )
})
