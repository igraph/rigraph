test_that("get_diameter works", {
  g <- make_ring(10)
  E(g)$weight <- sample(seq_len(ecount(g)))
  d <- diameter(g)
  gd <- get_diameter(g)
  sp <- distances(g)

  expect_equal(d, max(sp))
  expect_equal(sp[gd[1], gd[length(gd)]], d)

  d <- diameter(g, weights = NA)
  gd <- get_diameter(g, weights = NA)
  sp <- distances(g, weights = NA)

  expect_equal(d, max(sp))
  length(gd) == d + 1
  expect_equal(sp[gd[1], gd[length(gd)]], d)
})
