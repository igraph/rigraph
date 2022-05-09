
context("Kamada-Kawai layouts")

test_that("Kamada-Kawai layout generator works", {

  set.seed(42)

  get_radii <- function(layout) {
    apply(l - colMeans(l), 1, function(x) sqrt(sum(x ** 2)))    
  }

  sort_by_angles <- function(layout) {
    angles <- apply(l - colMeans(l), 1, function(x) atan2(x[2], x[1]))
    layout[order(angles), ]
  }

  looks_circular <- function(layout, eps = 1e-04) {
    radii <- get_radii(layout)
    norm_radii <- (radii - mean(radii)) / mean(radii)
    layout <- sort_by_angles(layout)
    dists <- apply(layout[-nrow(layout), ] - layout[-1, ], 1, function(x) sqrt(sum(x ** 2)))
    norm_dists <- (dists - mean(dists)) / mean(dists)
    all(abs(norm_radii) < eps) && all(abs(norm_dists) < eps)
  }

  library(igraph)
  g <- make_ring(10)
  l <- layout_with_kk(g, maxiter=50, coords=layout_in_circle(g))
  expect_true(looks_circular(l))

  g <- make_star(30)
  l <- layout_with_kk(g, maxiter=500, coords=layout_in_circle(g))
  if (Sys.info()["sysname"] == "Darwin" &&
	  Sys.info()["machine"] == "arm64") {
    expect_that(sum(l), equals(-84.9114513293935))
  } else if (Sys.info()["sysname"] == "Darwin") {
    expect_that(sum(l), equals(-85.6883999492408))
  } else if (Sys.info()["sysname"] == "Linux" &&
             Sys.info()["machine"] == "x86_64") {
    expect_that(sum(l), equals(-86.1405864709501))
  } else if (Sys.info()["sysname"] == "Linux" &&
             Sys.info()["machine"] == "i686") {
    expect_that(sum(l), equals(-85.142223229617))
  }

  g <- make_ring(10)
  E(g)$weight <- rep(1:2, length.out=ecount(g))
  l <- layout_with_kk(g, maxiter=500, coords=layout_in_circle(g))
  if (Sys.info()["sysname"] == "Darwin") {
    expect_that(sum(l), equals(1.61069099387368))
  } else if (Sys.info()["sysname"] == "Linux" &&
             Sys.info()["machine"] == "x86_64") {
    expect_that(sum(l), equals(-1.83036635516248))
  } else if (Sys.info()["sysname"] == "Linux" &&
             Sys.info()["machine"] == "i686") {
    expect_that(sum(l), equals(0.0631144692360025))
  }

})

test_that("3D Kamada-Kawai layout generator works", {

  skip_on_cran()
  skip_on_ci()

  library(igraph)

  set.seed(42)

  g <- make_star(30)
  l <- layout_with_kk(g, maxiter=5000, dim=3)
  expect_that(sum(l), equals(-54.8841976017082))

})
