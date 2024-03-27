test_that("can create graphs when igraph is not attached", {
  g <- callr::r(function() { igraph::make_ring(3, directed = TRUE) })
  g2 <- make_ring(3, directed = TRUE)
  expect_identical(
    unclass(g)[-igraph_t_idx_env],
    unclass(g2)[-igraph_t_idx_env]
  )
})
