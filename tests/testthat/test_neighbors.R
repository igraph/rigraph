test_that("neighbors works", {
  g <- sample_gnp(100, 20 / 100)
  al <- as_adj_list(g, mode = "all")
  for (i in 1:length(al)) {
    n <- neighbors(g, i, mode = "out")
    expect_that(sort(n), is_equivalent_to(al[[i]]))
  }
})

test_that("neighbors prints an error for an empty input vector", {
  g <- make_tree(10)
  expect_error(neighbors(g, numeric()), "No vertex was specified")
})
