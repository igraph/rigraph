test_that("min_st_separators works", {
  g <- make_graph("Zachary")
  msts <- min_st_separators(g)
  is <- sapply(msts, is_separator, graph = g)
  expect_equal(unique(is), TRUE)

  ## TODO: check that it is minimal
})

test_that("min_st_separators() works for the note case", {
  g <- make_graph(~ 0 - 1 - 2 - 3 - 4 - 1)
  expect_snapshot(
    min_st_separators(g),
    transform = function(x) gsub("from.*", "from something", x)
  )
})
