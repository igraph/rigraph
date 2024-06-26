test_that("VF2 isomorphism considers colors", {
  g <- make_full_graph(3)
  path <- make_ring(3, circular = F)
  V(g)$color <- c(1, 1, 2)
  V(path)$color <- c(1, 2, 1)
  n <- count_subgraph_isomorphisms(path, g, method = "vf2")
  expect_equal(n, 2)
})
