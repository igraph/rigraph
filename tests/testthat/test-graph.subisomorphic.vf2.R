test_that("graph.subisomorphic.vf2 works", {
  withr::local_seed(42)

  g1 <- sample_gnp(20, 6 / 20)
  g2 <- sample_gnp(20, 6 / 20)
  g <- g1 %du% g2

  ig1 <- graph.subisomorphic.vf2(g, g1)
  ig2 <- graph.subisomorphic.vf2(g, g2)

  expect_true(ig1$iso)
  expect_equal(ig1$map12, c(1:vcount(g1), rep(0, vcount(g2))))
  expect_equal(ig1$map21, 1:vcount(g1))

  expect_true(ig2$iso)
  expect_equal(ig2$map12, c(rep(0, vcount(g1)), 1:vcount(g2)))
  expect_equal(ig2$map21, 1:vcount(g2) + vcount(g1))
})
