test_that("complementer works", {
  g <- sample_gnp(50, 3 / 50)
  g2 <- complementer(g)
  g3 <- complementer(g2)
  expect_isomorphic(g, g3)
})
