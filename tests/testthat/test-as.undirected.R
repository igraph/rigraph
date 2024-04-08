test_that("as.undirected keeps attributes", {
  g <- graph_from_literal(A + -+B, A - -+C, C + -+D)
  g$name <- "Tiny graph"
  E(g)$weight <- seq_len(ecount(g))

  g2 <- as.undirected(g, mode = "collapse")
  df2 <- as_data_frame(g2)
  g3 <- as.undirected(g, mode = "each")
  df3 <- as_data_frame(g3)
  g4 <- as.undirected(g, mode = "mutual")
  df4 <- as_data_frame(g4)

  expect_equal(g2$name, g$name)
  expect_equal(g3$name, g$name)
  expect_equal(g4$name, g$name)

  expect_equal(df2[order(df2[, 1], df2[, 2]), ]$weight, c(4, 2, 9))
  expect_equal(df3[order(df3[, 1], df3[, 2]), ]$weight, c(1, 3, 2, 4, 5))
  expect_equal(df4[order(df4[, 1], df4[, 2]), ]$weight, c(4, 9))
})
