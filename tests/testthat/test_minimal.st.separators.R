test_that("min_st_separators works", {
  g <- make_graph("Zachary")
  msts <- min_st_separators(g)
  is <- sapply(msts, is_separator, graph = g)
  expect_that(unique(is), equals(TRUE))

  ## TODO: check that it is minimal
})
