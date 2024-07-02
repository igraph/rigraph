test_that("subgraph_centrality() works", {
  frucht_graph <- make_graph("Frucht")
  expect_equal(
    subgraph_centrality(frucht_graph),
    Matrix::diag(Matrix::expm(as_adj(frucht_graph, sparse = FALSE))),
    tolerance = 1e-10
  )

  grotzsch_graph <- make_graph("Grotzsch")
  expect_equal(
    subgraph_centrality(grotzsch_graph),
    Matrix::diag(Matrix::expm(as_adj(grotzsch_graph, sparse = FALSE))),
    tolerance = 1e-10
  )
})

test_that("subgraph_centrality() ignored edge directions", {
  withr::local_seed(137)
  g <- sample_gnm(10, 20, directed = TRUE)
  expect_equal(
    subgraph_centrality((g)),
    subgraph_centrality(as.undirected(g, mode = "each"))
  )
})
