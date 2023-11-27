test_that("graph.get.subisomorphisms.vf2() works even if the graph has a vertex attribute named x", {
  g <- make_full_graph(4)
  V(g)$x <- 1:4
  subs <- graph.get.subisomorphisms.vf2(g, make_ring(4))
  expect_equal(length(subs), 24)
})
