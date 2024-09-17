test_that("layout_with_fr() works", {
  skip_on_os("solaris")

  withr::with_seed(42, {
    g <- make_ring(10)
    l <- layout_with_fr(g, niter = 50, start.temp = sqrt(10) / 10)
  })
  expect_equal(sum(l), 4.57228, tolerance = 0.1)

  withr::with_seed(42, {
    g <- make_star(30)
    l <- layout_with_fr(g, niter = 500, dim = 3, start.temp = 20)
  })
  expect_equal(sum(l), -170.9312, tolerance = 0.1)
})

test_that("layout_with_fr() deprecated argument", {
  rlang::local_options(lifecycle_verbosity = "warning")
  g <- make_ring(10)
  expect_snapshot(
    l <- layout_with_fr(
      g,
      niter = 50,
      start.temp = sqrt(10) / 10,
      coolexp = 1,
      maxdelta = 1,
      area = 1,
      repulserad = 1
    )
  )

})

test_that("layout_nicely() works with negative weights", {
  g <- make_graph("petersen")
  E(g)$weight <- -5:9
  expect_warning(layout_nicely(g), regexp = "ignoring all weights")
})

test_that("layout_nicely() does not recurse into itself", {
  g <- make_graph("petersen")
  g$layout <- layout_nicely
  expect_silent(layout_nicely(g)) # should not recurse infinitely
})

test_that("layout algorithms work for null graphs", {
  g <- make_empty_graph()
  mat <- matrix(as.numeric(c()), ncol = 2)
  mat3 <- matrix(as.numeric(c()), ncol = 3)

  expect_silent(layout_as_tree(g))
  expect_equal(mat, layout_as_tree(g))

  expect_silent(layout_as_star(g))
  expect_equal(mat, layout_as_star(g))

  expect_silent(layout_in_circle(g))
  expect_equal(mat, layout_in_circle(g))

  expect_silent(layout_nicely(g))
  expect_equal(mat, layout_nicely(g))

  expect_silent(layout_on_grid(g))
  expect_equal(mat, layout_on_grid(g))

  expect_silent(layout_on_sphere(g))
  expect_equal(mat3, layout_on_sphere(g))

  expect_silent(layout_randomly(g))
  expect_equal(mat, layout_randomly(g))

  expect_silent(layout_with_dh(g))
  expect_equal(mat, layout_with_dh(g))

  expect_silent(layout_with_fr(g))
  expect_equal(mat, layout_with_fr(g))

  expect_silent(layout_with_gem(g))
  expect_equal(mat, layout_with_gem(g))

  expect_silent(layout_with_graphopt(g))
  expect_equal(mat, layout_with_graphopt(g))

  expect_silent(layout_with_kk(g))
  expect_equal(mat, layout_with_kk(g))

  expect_silent(layout_with_lgl(g))
  expect_equal(mat, layout_with_lgl(g))

  expect_silent(layout_with_mds(g))
  expect_equal(mat, layout_with_mds(g))

  expect_silent(layout_with_sugiyama(g))
  expect_equal(mat, layout_with_sugiyama(g)$layout)
  expect_equal(mat, layout_with_sugiyama(g)$layout.dummy)
})

test_that("layout algorithms work for singleton graphs", {
  g <- make_empty_graph(1)

  check_matrix <- function(mat, nrow = 1, ncol = 2) {
    expect_equal(dim(mat), c(nrow, ncol))
    if (nrow > 0) {
      expect_true(all(is.finite(mat)))
    }
  }

  expect_silent(layout_as_tree(g))
  check_matrix(layout_as_tree(g))

  expect_silent(layout_as_star(g))
  check_matrix(layout_as_star(g))

  expect_silent(layout_in_circle(g))
  check_matrix(layout_in_circle(g))

  expect_silent(layout_nicely(g))
  check_matrix(layout_nicely(g))

  expect_silent(layout_on_grid(g))
  check_matrix(layout_on_grid(g))

  expect_silent(layout_on_sphere(g))
  check_matrix(layout_on_sphere(g), ncol = 3)

  expect_silent(layout_randomly(g))
  check_matrix(layout_randomly(g))

  expect_silent(layout_with_dh(g))
  check_matrix(layout_with_dh(g))

  expect_silent(layout_with_fr(g))
  check_matrix(layout_with_fr(g))

  expect_silent(layout_with_gem(g))
  check_matrix(layout_with_gem(g))

  expect_silent(layout_with_graphopt(g))
  check_matrix(layout_with_graphopt(g))

  expect_silent(layout_with_kk(g))
  check_matrix(layout_with_kk(g))

  expect_silent(layout_with_lgl(g))
  check_matrix(layout_with_lgl(g))

  expect_silent(layout_with_sugiyama(g))
  check_matrix(layout_with_sugiyama(g)$layout)
  check_matrix(layout_with_sugiyama(g)$layout.dummy, nrow = 0)
})

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

test_that("layout_with_kk() deprecated arguments", {
  g <- make_ring(10)
  expect_snapshot(
    l <- layout_with_kk(
      g,
      maxiter = 50,
      coords = layout_in_circle(g),
      niter = 1,
      sigma = 1,
      initemp = 1,
      coolexp = 1
    )
  )

})

test_that("layout_with_sugiyama() does not demote matrices to vectors in res$layout.dummy", {
  ex <- graph_from_literal(A - +B:C, B - +C:D)
  layex <- layout_with_sugiyama(ex, layers = NULL)
  expect_equal(nrow(layex$layout.dummy), 1)
})

test_that("merge_coords() works", {
  withr::local_seed(42)

  g <- list(make_ring(10), make_ring(5))
  l <- lapply(g, layout_with_mds)

  lm <- merge_coords(g, l)
  expect_true(is.matrix(lm))
  expect_equal(ncol(lm), 2)
  expect_equal(nrow(lm), sum(sapply(g, vcount)))

  ## Stress test
  for (i in 1:10) {
    g <- sample_gnp(100, 2 / 100)
    l <- layout_with_mds(g)
    expect_equal(dim(l), c(vcount(g), 2))
  }
})

test_that("`layout_with_mds()` works", {
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

test_that("`layout_with_mds()` stress test, graph with multiple components", {
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


test_that("two step layouting works", {
  g <- make_ring(10)
  l1 <- layout_as_star(g)
  l2 <- layout_(g, as_star())
  expect_identical(l1, l2)
})

test_that("parameters go through", {
  g <- make_ring(10)
  l1 <- layout_as_star(g, center = 5)
  l2 <- layout_(g, as_star(center = 5))
  expect_identical(l1, l2)
})

test_that("parameters are evaluated early", {
  g <- make_ring(10)
  l1 <- layout_as_star(g, center = 5)

  cc <- 5
  spec <- as_star(center = cc)
  cc <- 10
  l2 <- layout_(g, spec)
  expect_identical(l1, l2)
})

test_that("piping form is OK, too", {
  g <- make_ring(10)
  l1 <- layout_as_star(g, center = 5)
  l2 <- g %>%
    layout_(as_star(center = 5))
  expect_identical(l1, l2)
})

test_that("add_layout_ works", {
  g <- make_ring(10)
  l1 <- layout_as_star(g, center = 5)
  l2 <- add_layout_(g, as_star(center = 5))$layout
  expect_identical(l1, l2)

  l3 <- g %>%
    add_layout_(as_star(center = 5)) %>%
    graph_attr("layout")
  expect_identical(l1, l3)
})
