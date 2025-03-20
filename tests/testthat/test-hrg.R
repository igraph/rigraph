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

test_that("sample_hrg() checks its argument", {
  expect_snapshot(error = TRUE, {
    sample_hrg(make_ring(10))
  })
})


test_that("hrg_tree() checks its argument", {
  expect_snapshot(error = TRUE, {
    hrg_tree(make_ring(10))
  })
})
