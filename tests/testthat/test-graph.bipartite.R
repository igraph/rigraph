test_that("make_bipartite_graph works", {
  I <- matrix(sample(0:1, 35, replace = TRUE, prob = c(3, 1)), ncol = 5)
  g <- graph_from_biadjacency_matrix(I)

  edges <- unlist(sapply(seq_len(nrow(I)), function(x) {
    w <- which(I[x, ] != 0) + nrow(I)
    if (length(w) != 0) {
      as.vector(rbind(x, w))
    } else {
      numeric()
    }
  }))
  g2 <- make_bipartite_graph(seq_len(nrow(I) + ncol(I)) > nrow(I), edges)
  I2 <- as_biadjacency_matrix(g2)

  expect_equal(I2, I, ignore_attr = TRUE)
})

test_that("make_bipartite_graph works with vertex names", {
  types <- c(0, 1, 0, 1, 0, 1)
  names(types) <- LETTERS[1:length(types)]
  edges <- c("A", "B", "C", "D", "E", "F", "A", "D", "D", "E", "B", "C", "C", "F")
  g <- make_bipartite_graph(types, edges)

  expect_equal(V(g)$name, c("A", "B", "C", "D", "E", "F"), ignore_attr = TRUE)
  expect_equal(V(g)$type, c(FALSE, TRUE, FALSE, TRUE, FALSE, TRUE), ignore_attr = TRUE)

  expect_error(make_bipartite_graph(types, c(edges, "Q")), "edge vector contains a vertex name that is not found")
})
