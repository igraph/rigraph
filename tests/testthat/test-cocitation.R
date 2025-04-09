test_that("cocitation works", {
  g <- make_full_graph(10, directed = TRUE)
  cocite_mat <- matrix(8, 10, 10) - diag(8, 10)
  expect_equal(cocitation(g), cocite_mat)
})

test_that("bibcoupling works", {
  g <- make_full_graph(10, directed = TRUE)
  bib_mat <- matrix(8, 10, 10) - diag(8, 10)
  expect_equal(bibcoupling(g), bib_mat)
})
