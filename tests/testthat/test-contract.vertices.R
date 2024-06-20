test_that("contract works", {
  local_rng_version("3.5.0")
  withr::local_seed(42)

  g <- make_ring(10)
  g$name <- "Ring"
  V(g)$name <- letters[1:vcount(g)]
  E(g)$weight <- sample(ecount(g))

  g2 <- contract(g, rep(1:5, each = 2),
    vertex.attr.comb = toString
  )

  ## graph and edge attributes are kept, vertex attributes are
  ## combined using the 'toString' function.
  expect_equal(g2$name, g$name)
  expect_equal(V(g2)$name, c("a, b", "c, d", "e, f", "g, h", "i, j"))
  expect_equal(
    as.matrix(g2[]),
    cbind(c(10, 9, 0, 0, 7), c(9, 3, 6, 0, 0), c(0, 6, 4, 8, 0), c(0, 0, 8, 5, 1), c(7, 0, 0, 1, 2)),
    ignore_attr = TRUE
  )
})
