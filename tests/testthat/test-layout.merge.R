test_that("merge_coords works", {
  withr::local_seed(42)

  g <- list(make_ring(10), make_ring(5))
  l <- lapply(g, layout_with_mds)
  l

  lm <- merge_coords(g, l)
  expect_true(is.matrix(lm))
  expect_equal(ncol(lm), 2)
  expect_equal(nrow(lm), sum(sapply(g, vcount)))

  ##########

  ## Stress test
  for (i in 1:10) {
    g <- sample_gnp(100, 2 / 100)
    l <- layout_with_mds(g)
    expect_equal(dim(l), c(vcount(g), 2))
  }
})
