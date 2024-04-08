test_that("degree works", {
  g <- sample_gnp(100, 1 / 100)
  d <- degree(g)
  el <- as_edgelist(g)
  expect_equal(as.numeric(table(el)), d[d != 0])

  expect_equal(degree(g) / (vcount(g) - 1), degree(g, normalized = TRUE))

  g2 <- sample_gnp(100, 2 / 100, directed = TRUE)
  din <- degree(g2, mode = "in")
  dout <- degree(g2, mode = "out")
  el2 <- as_edgelist(g2)
  expect_equal(as.numeric(table(el2[, 1])), dout[dout != 0])
  expect_equal(as.numeric(table(el2[, 2])), din[din != 0])

  expect_equal(
    degree(g2, mode = "in") / (vcount(g2) - 1),
    degree(g2, mode = "in", normalized = TRUE)
  )
  expect_equal(
    degree(g2, mode = "out") / (vcount(g2) - 1),
    degree(g2, mode = "out", normalized = TRUE)
  )
  expect_equal(
    degree(g2, mode = "all") / (vcount(g2) - 1),
    degree(g2, mode = "all", normalized = TRUE)
  )
})
