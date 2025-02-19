test_that("identical_graphs works", {
  g <- make_ring(5)
  g2 <- make_ring(5)

  expect_identical_graphs(g, g2)

  g2 <- make_ring(6)

  expect_false(identical_graphs(g, g2))
})

test_that("identical_graphs considers attributes", {
  g <- sample_pa(10)
  g2 <- g

  expect_identical_graphs(g, g2)

  g2$m <- 2

  expect_false(identical_graphs(g, g2))
  expect_identical_graphs(g, g2, attrs = FALSE)
})
