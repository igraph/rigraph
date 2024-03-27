test_that("Kamada-Kawai layout generator works", {
  skip_on_cran()

  withr::local_seed(42)

  center_layout <- function(layout) {
    t(t(layout) - colMeans(layout))
  }

  get_radii <- function(layout) {
    apply(layout, 1, function(x) sqrt(sum(x**2)))
  }

  sort_by_angles <- function(layout) {
    angles <- apply(layout, 1, function(x) atan2(x[2], x[1]))
    layout[order(angles), ]
  }

  looks_circular <- function(layout, check_dists = TRUE, eps = 1e-5) {
    layout <- center_layout(layout)
    radii <- get_radii(layout)
    norm_radii <- (radii - mean(radii)) / mean(radii)
    layout <- sort_by_angles(layout)

    if (!all(abs(norm_radii) < eps)) {
      return(FALSE)
    }

    if (!check_dists) {
      return(TRUE)
    }

    dists <- apply(layout[-nrow(layout), ] - layout[-1, ], 1, function(x) sqrt(sum(x**2)))
    norm_dists <- (dists - mean(dists)) / mean(dists)
    all(abs(norm_dists) < eps)
  }

  g <- make_ring(10)
  l <- layout_with_kk(g, maxiter = 50, coords = layout_in_circle(g))
  expect_true(looks_circular(l))

  g <- make_star(12)
  l <- layout_with_kk(g, maxiter = 500, coords = layout_in_circle(g))
  expect_true(looks_circular(l[-1,]))

  g <- make_ring(10)
  E(g)$weight <- rep(1:2, length.out = ecount(g))
  l <- layout_with_kk(g, maxiter = 500, coords = layout_in_circle(g))
  expect_true(looks_circular(l, check_dists = FALSE))

  g <- make_star(30)
  l <- layout_with_kk(g, maxiter = 5000, dim = 3)
  expect_true(looks_circular(l[-1,], check_dists = FALSE, eps = 1e-2))
})
