test_that("Dot product rng works", {
  withr::local_seed(42)
  vecs <- cbind(
    c(0, 1, 1, 1, 0) / 3, c(0, 1, 1, 0, 1) / 3, c(1, 1, 1, 1, 0) / 4,
    c(0, 1, 1, 1, 0)
  )

  g <- sample_dot_product(vecs)
  g0 <- graph_from_literal(1:2:3 - 4)
  expect_equal(as.matrix(g[]), as.matrix(g0[]), ignore_attr = TRUE)

  g2 <- sample_dot_product(vecs, directed = TRUE)
  g20 <- graph_from_literal(1:2:3:4, 1 - +3, 1 - +4, 3 - +4, 4 + -1, 4 + -3)
  expect_true(all.equal(g20[], g[], check.attributes=FALSE))

  vecs <- replicate(5, rep(1 / 2, 4))
  g <- sample_dot_product(vecs)
  expect_equal(g[], make_full_graph(5)[], ignore_attr = TRUE)

  g2 <- sample_dot_product(vecs, directed = TRUE)
  expect_equal(g2[], make_full_graph(5, directed = TRUE)[], ignore_attr = TRUE)

  vecs <- replicate(100, rep(sqrt(1 / 8), 4))
  g <- sample_dot_product(vecs)
  expect_ecount(g, 2454)

  g2 <- sample_dot_product(vecs, directed = TRUE)
  expect_ecount(g2, 4938)
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
