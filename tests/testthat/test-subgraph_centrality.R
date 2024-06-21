test_that("subgraph_centrality works", {
  g <- make_graph("Frucht")
  expect_equal(
    subgraph_centrality(g),
    Matrix::diag(Matrix::expm(as_adj(g, sparse = FALSE))),
    tolerance = 1e-10
  )

  g <- make_graph("Grotzsch")
  expect_equal(
    subgraph_centrality(g),
    Matrix::diag(Matrix::expm(as_adj(g, sparse = FALSE))),
    tolerance = 1e-10
  )
})

test_that("subgraph_centrality ignored edge directions", {
  withr::local_seed(137)
  g <- sample_gnm(10, 20, directed = TRUE)
  expect_equal(
    subgraph_centrality((g)),
    subgraph_centrality(as.undirected(g, mode = "each"))
  )
})
