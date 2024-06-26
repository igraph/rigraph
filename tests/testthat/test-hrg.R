test_that("Starting from state works (#225)", {
  withr::local_seed(42)

  g <- sample_gnp(10, p = 1 / 2) + sample_gnp(10, p = 1 / 2)
  hrg <- fit_hrg(g)
  hrg2 <- fit_hrg(g, hrg = hrg, start = TRUE, steps = 1)
  expect_equal(hrg2, hrg, ignore_attr = TRUE)
})

test_that("as.hclust.igraphHRG() works", {
  withr::local_seed(42)

  g <- make_graph("zachary")
  hrg <- fit_hrg(g)
  expect_snapshot({
    summary(as.hclust(hrg))
  })
})
