test_that("centr_eigen_tmax() works", {
  withr::local_seed(42)
  g <- sample_pa(1000, m = 4)
  expect_equal(centr_eigen_tmax(g), 998)
})

test_that("centr_eigen_tmax() deprecated argument", {
  g <- sample_pa(1000, m = 4)
  expect_snapshot(c <- centr_eigen_tmax(g, scale = FALSE))
})

test_that("centr_eigen() works", {
  withr::local_seed(42)
  g <- sample_pa(1000, m = 4)
  centr_eigen <- centr_eigen(g)
  expect_setequal(
    names(centr_eigen),
    c("vector", "value", "options", "centralization", "theoretical_max")
  )
  expect_equal(centr_eigen$centralization, 0.9432924, tolerance = 1e-06)
})

test_that("centr_eigen() deprecated argument", {
  g <- sample_pa(1000, m = 4)
  expect_snapshot(c <- centr_eigen(g, scale = FALSE))
})

test_that("centr_degree_tmax() works", {
  withr::local_seed(42)
  g <- sample_pa(1000, m = 4)
  expect_gt(centr_degree_tmax(g, loops = TRUE), 1990000)
})

test_that("centr_degree_tmax() deprecated argument", {
  g <- sample_pa(1000, m = 4)
  expect_snapshot(c <- centr_degree_tmax(g))
})

test_that("centr_betw() works", {
  withr::local_seed(42)
  g <- sample_pa(1000, m = 4)
  expect_setequal(
    names(centr_betw(g)),
    c("res", "centralization", "theoretical_max")
  )
  expect_equal(centr_betw(g)$theoretical_max, 996004998)
})
