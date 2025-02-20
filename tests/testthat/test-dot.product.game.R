test_that("Dot product rng works", {
  withr::local_seed(42)
  vecs <- cbind(
    c(0, 1, 1, 1, 0) / 3, c(0, 1, 1, 0, 1) / 3, c(1, 1, 1, 1, 0) / 4,
    c(0, 1, 1, 1, 0)
  )

  g <- sample_dot_product(vecs)
  g0 <- graph_from_literal(1:2:3 - 4)
  expect_equal(as.matrix(g[]), as.matrix(g0[]), ignore_attr = TRUE)

  vecs <- replicate(5, rep(1 / 2, 4))
  g <- sample_dot_product(vecs)
  expect_equal(g[], make_full_graph(5)[], ignore_attr = TRUE)

  g2 <- sample_dot_product(vecs, directed = TRUE)
  expect_equal(g2[], make_full_graph(5, directed = TRUE)[], ignore_attr = TRUE)

  vecs <- replicate(100, rep(sqrt(1 / 8), 4))
  g <- sample_dot_product(vecs)
  expect_ecount(g, 2451)

  g2 <- sample_dot_product(vecs, directed = TRUE)
  expect_ecount(g2, 4941)
})

test_that("MISSING TITLE", {
  withr::local_seed(42)
  latent_features <- cbind(
    c(0, 1, 1, 1, 0) / 3, c(0, 1, 1, 0, 1) / 3, c(1, 1, 1, 1, 0) / 4,
    c(0, 1, 1, 1, 0)
  )
  expected_probs <- t(latent_features)%*%latent_features
  diag(expected_probs) <- 0
  num_graphs <- 1000
  edge_counts <- matrix(0, nrow = 4, ncol = 4)

  for (i in seq_len(num_graphs)) {
    g <- sample_dot_product(latent_features)
    adj_matrix <- as_adjacency_matrix(g, sparse = FALSE)
    edge_counts <- edge_counts + adj_matrix
  }
  empirical_probs <- edge_counts / num_graphs
  diag(empirical_probs) <- 0
  tolerance <- 0.05
  expect_true(all(abs(empirical_probs - expected_probs) < tolerance))
})

test_that("Dot product rng gives warnings", {
  vecs <- cbind(c(1, 1, 1) / 3, -c(1, 1, 1) / 3)
  expect_warning(
    g <- sample_dot_product(vecs),
    "Negative connection probability in dot-product graph"
  )

  vecs <- cbind(c(1, 1, 1), c(1, 1, 1))
  expect_warning(
    g <- sample_dot_product(vecs),
    paste0("Greater than 1 connection probability ", "in dot-product graph")
  )
})
