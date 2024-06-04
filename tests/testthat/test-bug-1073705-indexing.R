test_that("Weighted indexing does not remove edges", {
  g <- make_ring(10)
  g[1, 2, attr = "weight"] <- 0
  expect_true("weight" %in% edge_attr_names(g))
  expect_equal(E(g)$weight, c(0, rep(NA, 9)))

  el <- as_edgelist(g)
  g[from = el[, 1], to = el[, 2], attr = "sim"] <- rep(0:1, length.out = ecount(g))
  expect_true("sim" %in% edge_attr_names(g))
  expect_equal(E(g)$sim, rep(0:1, 5))

  V(g)$name <- letters[seq_len(vcount(g))]
  el <- as_edgelist(g)
  g[from = el[, 1], to = el[, 2], attr = "sim"] <- rep(1:0, length.out = ecount(g))
  expect_equal(E(g)$sim, rep(1:0, 5))
})
