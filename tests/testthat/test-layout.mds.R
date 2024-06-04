test_that("`layout_with_mds()` works", {
  ## A tree

  g <- make_tree(10, 2, "undirected")

  mymds <- function(g) {
    sp <- distances(g)
    sp <- sp * sp
    sp <- sp - rowMeans(sp) - rep(rowMeans(sp), each = nrow(sp)) + mean(sp)
    sp <- sp / -2
    ei <- eigen(sp)
    va <- sqrt(abs(ei$values[1:2]))
    ei$vectors[, 1:2] * rep(va, each = nrow(sp))
  }

  out1 <- layout_with_mds(g)
  expect_equal(out1, mymds(g))

  rlang::local_options(lifecycle_verbosity = "warning")

  expect_warning(out2 <- layout_with_mds(g, options = arpack_defaults))
  expect_equal(out2, out1)
})

test_that("`layout_with_mds()` stress test", {
  ## plot(g, layout=ll)

  ## A graph with multiple components, just test that it runs

  withr::local_seed(42)
  g <- make_ring(10) + make_ring(3)
  expect_equal(ncol(layout_with_mds(g)), 2)

  ## Small stress test

  for (i in 1:10) {
    g <- sample_gnp(100, 2 / 100)
    l <- layout_with_mds(g)
    expect_equal(ncol(l), 2)
  }
})
