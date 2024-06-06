test_that("weighted_cliques works", {
  g <- make_graph(~ A - B - C - A - D - E - F - G - H - D - F - H - E - G - D)
  weights <- c(5, 5, 5, 3, 3, 3, 3, 2)

  check.clique <- function(graph, vids, min_weight) {
    s <- induced_subgraph(graph, vids)
    ecount(s) == vcount(s) * (vcount(s) - 1) / 2 && sum(V(s)$weight) >= min_weight
  }

  expect_equal(
    lapply(largest_weighted_cliques(g, vertex.weights = weights), as.numeric),
    list(c(1, 2, 3))
  )

  V(g)$weight <- weights
  cl <- sapply(weighted_cliques(g, min.weight = 9), check.clique, graph = g, min_weight = 9)
  expect_equal(cl, rep(TRUE, 14))

  g <- make_graph("zachary")
  weights <- rep(1, vcount(g))
  weights[c(1, 2, 3, 4, 14)] <- 3
  expect_equal(weighted_clique_num(g, vertex.weights = weights), 15)

  V(g)$weight <- weights * 2
  expect_equal(weighted_clique_num(g), 30)
})
