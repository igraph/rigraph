test_that("print.id in snapshot", {
  local_igraph_options(print.id = FALSE)
  expect_false(igraph_opt("print.id"))

  expect_snapshot({
    igraph_opt("print.id")
  })
})

# This test fails in RStudio IDE when clicking "Run Tests" in the file pane
test_that("print.id in snapshot (2)", {
  local_igraph_options(print.id = FALSE)
  expect_false(igraph_opt("print.id"))

  expect_snapshot({
    igraph_opt("print.id")
  })
})
