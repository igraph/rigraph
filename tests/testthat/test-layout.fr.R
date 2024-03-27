test_that("", {
  skip_on_os("solaris")

  withr::local_seed(42)
  g <- make_ring(10)
  l <- layout_with_fr(g, niter = 50, start.temp = sqrt(10) / 10)
  expect_true(
    isTRUE(all.equal(sum(l), 4.57228, tolerance = 0.1))
  )

  withr::local_seed(42)
  g <- make_star(30)
  l <- layout_with_fr(g, niter = 500, dim = 3, start.temp = 20)
  expect_true(
    isTRUE(all.equal(sum(l), -170.9312, tolerance = 0.1))
  )
})
