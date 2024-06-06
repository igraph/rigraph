test_that("Dot product rng works", {
  withr::local_seed(42)
  vecs <- cbind(
    c(0, 1, 1, 1, 0) / 3, c(0, 1, 1, 0, 1) / 3, c(1, 1, 1, 1, 0) / 4,
    c(0, 1, 1, 1, 0)
  )

  g <- sample_dot_product(vecs)
  g0 <- graph_from_literal(1:2:3 - 4)
  expect_that(g[], is_equivalent_to(g0[]))

  g2 <- sample_dot_product(vecs, directed = TRUE)
  g20 <- graph_from_literal(1:2:3:4, 1 - +3, 1 - +4, 3 - +4, 4 + -1, 4 + -3)
  expect_that(g[], is_equivalent_to(g20[]))

  vecs <- replicate(5, rep(1 / 2, 4))
  g <- sample_dot_product(vecs)
  expect_that(g[], is_equivalent_to(make_full_graph(5)[]))

  g2 <- sample_dot_product(vecs, directed = TRUE)
  expect_that(g2[], is_equivalent_to(make_full_graph(5, directed = TRUE)[]))

  vecs <- replicate(100, rep(sqrt(1 / 8), 4))
  g <- sample_dot_product(vecs)
  expect_equal(ecount(g), 2454)

  g2 <- sample_dot_product(vecs, directed = TRUE)
  expect_equal(ecount(g2), 4938)
})

test_that("Dot product rng gives warnings", {
  vecs <- cbind(c(1, 1, 1) / 3, -c(1, 1, 1) / 3)
  expect_that(
    g <- sample_dot_product(vecs),
    gives_warning("Negative connection probability in dot-product graph")
  )

  vecs <- cbind(c(1, 1, 1), c(1, 1, 1))
  expect_that(
    g <- sample_dot_product(vecs),
    gives_warning(paste(sep = "", "Greater than 1 connection probability ", "in dot-product graph"))
  )
})
