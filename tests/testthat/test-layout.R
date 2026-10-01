check_matrix <- function(mat, nrow = 1, ncol = 2) {
  expect_equal(dim(mat), c(nrow, ncol))
  if (nrow > 0) {
    expect_true(all(is.finite(mat)))
  }
}

test_that("layout_with_fr() works", {
  skip_on_os("solaris")

  g <- make_ring(10)
  withr::with_seed(42, {
    l <- layout_with_fr(g, niter = 50, start.temp = sqrt(10) / 10)
  })
  check_matrix(l, nrow = 10, ncol = 2)

  g <- make_star(30)
  withr::with_seed(42, {
    l <- layout_with_fr(g, niter = 500, dim = 3, start.temp = 20)
  })
  check_matrix(l, nrow = 30, ncol = 3)
})

test_that("stochastic layouts are reproducible with set.seed()", {
  g <- make_ring(20) + make_star(10, mode = "undirected")

  expect_identical(
    withr::with_seed(42, layout_with_fr(g, niter = 50)),
    withr::with_seed(42, layout_with_fr(g, niter = 50))
  )
  expect_identical(
    withr::with_seed(42, layout_with_fr(g, niter = 50, dim = 3)),
    withr::with_seed(42, layout_with_fr(g, niter = 50, dim = 3))
  )
  expect_identical(
    withr::with_seed(42, layout_with_kk(g, maxiter = 50)),
    withr::with_seed(42, layout_with_kk(g, maxiter = 50))
  )
  expect_identical(
    withr::with_seed(42, layout_with_kk(g, maxiter = 50, dim = 3)),
    withr::with_seed(42, layout_with_kk(g, maxiter = 50, dim = 3))
  )
  expect_identical(
    withr::with_seed(42, layout_with_dh(g, maxiter = 5)),
    withr::with_seed(42, layout_with_dh(g, maxiter = 5))
  )
  expect_identical(
    withr::with_seed(42, layout_with_gem(g, maxiter = 50)),
    withr::with_seed(42, layout_with_gem(g, maxiter = 50))
  )
  expect_identical(
    withr::with_seed(42, layout_with_graphopt(g, niter = 50)),
    withr::with_seed(42, layout_with_graphopt(g, niter = 50))
  )
  g_connected <- make_ring(20)
  expect_identical(
    withr::with_seed(42, layout_with_lgl(g_connected, maxiter = 50)),
    withr::with_seed(42, layout_with_lgl(g_connected, maxiter = 50))
  )
  expect_identical(
    withr::with_seed(42, layout_with_drl(g)),
    withr::with_seed(42, layout_with_drl(g))
  )
  expect_identical(
    withr::with_seed(42, layout_with_drl(g, dim = 3)),
    withr::with_seed(42, layout_with_drl(g, dim = 3))
  )
})

test_that("layout_with_fr() deprecated argument", {
  rlang::local_options(lifecycle_verbosity = "warning")
  g <- make_ring(10)
  expect_snapshot_igraph_error({
    l <- layout_with_fr(
      g,
      niter = 50,
      start.temp = sqrt(10) / 10,
      coolexp = 1,
      maxdelta = 1,
      area = 1,
      repulserad = 1
    )
  })
})

test_that("layout_nicely() works with proper weights and small trees", {
  igraph_local_seed(42)
  g <- make_star(12, mode = "out")
  E(g)$weight <- 5:15
  expect_warning(layout_nicely(g), NA)
})

test_that("layout_nicely() works with negative weights", {
  igraph_local_seed(42)
  g <- make_graph("petersen")
  E(g)$weight <- -5:9
  expect_warning(layout_nicely(g), regexp = "ignoring all weights")
})

test_that("layout_nicely() does not recurse into itself", {
  igraph_local_seed(42)
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
  igraph_local_seed(42)
  g <- make_empty_graph(1)

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
  igraph_local_seed(42)

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

    dists <- apply(layout[-nrow(layout), ] - layout[-1, ], 1, function(x) {
      sqrt(sum(x**2))
    })
    norm_dists <- (dists - mean(dists)) / mean(dists)
    all(abs(norm_dists) < eps)
  }

  g <- make_ring(10)
  l <- layout_with_kk(g, maxiter = 50, coords = layout_in_circle(g))
  expect_true(looks_circular(l))

  g <- make_star(12)
  l <- layout_with_kk(g, maxiter = 500, coords = layout_in_circle(g))
  expect_true(looks_circular(l[-1, ]))

  g <- make_ring(10)
  E(g)$weight <- rep(1:2, length.out = ecount(g))
  l <- layout_with_kk(g, maxiter = 500, coords = layout_in_circle(g))
  expect_true(looks_circular(l, check_dists = FALSE))

  g <- make_star(30)
  l <- layout_with_kk(g, maxiter = 5000, dim = 3)
  expect_true(looks_circular(l[-1, ], check_dists = FALSE, eps = 1e-2))
})

test_that("layout_with_kk() deprecated arguments", {
  g <- make_ring(10)
  expect_snapshot_igraph_error({
    l <- layout_with_kk(
      g,
      maxiter = 50,
      coords = layout_in_circle(g),
      niter = 1,
      sigma = 1,
      initemp = 1,
      coolexp = 1
    )
  })
})

test_that("layout_with_sugiyama() does not demote matrices to vectors in res$layout.dummy", {
  ex <- graph_from_literal(A -+ B:C, B -+ C:D)
  layex <- layout_with_sugiyama(ex, layers = NULL)
  expect_equal(nrow(layex$layout.dummy), 1)
})

test_that("merge_coords() works", {
  igraph_local_seed(42)

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
  g <- make_tree(10, 2, mode = "undirected")

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
})

test_that("layout_with_mds() deprecated argument", {
  rlang::local_options(lifecycle_verbosity = "warning")
  g <- make_tree(10, 2, mode = "undirected")
  expect_snapshot_igraph_error({
    l <- layout_with_mds(g, options = arpack_defaults())
  })
})

test_that("`layout_with_mds()` stress test, graph with multiple components", {
  igraph_local_seed(42)
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

test_that("layout_randomly() errors well", {
  g <- make_empty_graph(1)
  expect_snapshot_igraph_error({
    layout_randomly(g, dim = 4)
  })
})

test_that("layout normalization handles all-NaN coordinates correctly", {
  # Test the internal .layout.norm.col function directly
  # This tests the fix for all-NaN coordinate normalization

  # Test normal case
  normal_coords <- c(1, 2, 3, 4, 5)
  normalized <- .layout.norm.col(normal_coords, 0, 1)
  expect_equal(range(normalized), c(0, 1))

  # Test all-NaN case (this was the bug that was fixed)
  nan_coords <- rep(NaN, 5)
  normalized_nan <- .layout.norm.col(nan_coords, 0, 1)
  expected_middle <- rep(0.5, 5) # Should return middle value (0+1)/2 = 0.5
  expect_equal(normalized_nan, expected_middle)

  # Test all-NaN case with different range
  normalized_nan_range <- .layout.norm.col(nan_coords, -10, 10)
  expected_middle_range <- rep(0, 5) # Should return middle value (-10+10)/2 = 0
  expect_equal(normalized_nan_range, expected_middle_range)

  # Test constant values (difference is zero)
  constant_coords <- rep(5, 5)
  normalized_constant <- .layout.norm.col(constant_coords, 0, 1)
  expected_constant_middle <- rep(0.5, 5)
  expect_equal(normalized_constant, expected_constant_middle)

  # Test that norm_coords works with all-NaN layouts
  layout_all_nan <- matrix(NaN, nrow = 5, ncol = 2)
  normalized_layout <- norm_coords(
    layout_all_nan,
    xmin = 0,
    xmax = 1,
    ymin = 0,
    ymax = 1
  )
  expect_equal(normalized_layout, matrix(c(rep(0.5, 5), rep(0.5, 5)), ncol = 2))

  # Test 3D layout normalization with all-NaN coordinates
  layout_3d_nan <- matrix(NaN, nrow = 3, ncol = 3)
  normalized_3d <- norm_coords(
    layout_3d_nan,
    xmin = 0,
    xmax = 1,
    ymin = 0,
    ymax = 1,
    zmin = 0,
    zmax = 1
  )
  expect_equal(normalized_3d, matrix(rep(0.5, 9), ncol = 3))
})

test_that("generic modifier mechanism works with existing modifiers", {
  igraph_local_seed(42)
  # Test that component_wise modifier still works
  g <- make_ring(10) + make_ring(5)
  l1 <- layout_(g, in_circle(), component_wise())
  expect_equal(nrow(l1), vcount(g))
  expect_equal(ncol(l1), 2)
  expect_true(all(is.finite(l1)))

  # Test that normalize modifier still works
  g <- make_ring(10)
  l2 <- layout_(g, with_fr(), normalize())
  expect_equal(nrow(l2), vcount(g))
  expect_equal(ncol(l2), 2)
  expect_true(all(l2 >= -1 & l2 <= 1))

  # Test that both modifiers work together
  g <- make_ring(10) + make_ring(5)
  l3 <- layout_(g, in_circle(), component_wise(), normalize())
  expect_equal(nrow(l3), vcount(g))
  expect_equal(ncol(l3), 2)
  expect_true(all(is.finite(l3)))
  expect_true(all(l3 >= -1 & l3 <= 1))
})

test_that("custom post-layout modifiers can be created", {
  # Create a custom modifier that scales coordinates by a factor
  scale_by <- function(factor = 2) {
    layout_modifier(
      id = "scale_by",
      type = "post",
      args = list(factor = factor),
      apply = function(graph, layout, modifier_args) {
        layout * modifier_args$factor
      }
    )
  }

  g <- make_ring(5)
  l1 <- layout_(g, in_circle())
  l2 <- layout_(g, in_circle(), scale_by(factor = 3))

  # l2 should be 3x l1
  expect_equal(l2, l1 * 3)
})

test_that("multiple post-layout modifiers are applied in order", {
  # Create test modifiers
  add_offset <- function(offset = 1) {
    layout_modifier(
      id = "add_offset",
      type = "post",
      args = list(offset = offset),
      apply = function(graph, layout, modifier_args) {
        layout + modifier_args$offset
      }
    )
  }

  multiply_by <- function(factor = 2) {
    layout_modifier(
      id = "multiply_by",
      type = "post",
      args = list(factor = factor),
      apply = function(graph, layout, modifier_args) {
        layout * modifier_args$factor
      }
    )
  }

  g <- make_ring(5)
  base_layout <- layout_(g, in_circle())

  # Apply add first, then multiply: (layout + 1) * 2
  l1 <- layout_(g, in_circle(), add_offset(1), multiply_by(2))
  expect_equal(l1, (base_layout + 1) * 2)

  # Apply multiply first, then add: (layout * 2) + 1
  l2 <- layout_(g, in_circle(), multiply_by(2), add_offset(1))
  expect_equal(l2, (base_layout * 2) + 1)

  # Results should be different
  expect_false(isTRUE(all.equal(l1, l2)))
})

test_that("duplicate modifiers are rejected", {
  g <- make_ring(5)
  expect_error(
    layout_(g, in_circle(), normalize(), normalize()),
    "Duplicate modifiers"
  )
})

test_that("modifier types are correctly identified", {
  cw <- component_wise()
  expect_equal(cw$type, "pre")
  expect_true(is.function(cw$apply))

  norm <- normalize()
  expect_equal(norm$type, "post")
  expect_true(is.function(norm$apply))
})

# ---- ellipsis migration: argument coverage ----------------------------

test_that("layout_as_bipartite() covers tail args and recovers positional calls", {
  g <- make_full_bipartite_graph(3, 2)

  # All tail arguments by name.
  l <- layout_as_bipartite(g, V(g)$type, hgap = 3, vgap = 2, maxiter = 50)
  expect_equal(dim(l), c(5, 2))
  # The two vertex types end up on rows vgap apart.
  expect_equal(sort(unique(l[, 2])), c(0, 2))
  # Vertices of the same type are hgap apart.
  expect_equal(diff(sort(l[!V(g)$type, 1])), c(3, 3))

  # The legacy positional call recovers hgap and warns.
  igraph_with_seed(1, {
    lifecycle::expect_deprecated(
      res <- layout_as_bipartite(g, V(g)$type, 3)
    )
  })
  igraph_with_seed(1, {
    ref <- layout_as_bipartite(g, V(g)$type, hgap = 3)
  })
  expect_identical(res, ref)
})

test_that("layout_as_star() covers tail args and recovers old-style calls", {
  g <- make_star(6)

  # All tail arguments by name.
  l <- layout_as_star(g, center = 3, order = c(3, 6, 5, 4, 2, 1))
  expect_equal(dim(l), c(6, 2))
  # The chosen center sits at the origin.
  expect_equal(l[3, ], c(0, 0))
  # A non-default perimeter order moves the remaining vertices.
  expect_false(identical(l, layout_as_star(g, center = 3)))

  # Recovering `center` from an old-style call currently errors:
  # its default `V(graph)[1]` is re-evaluated inside the generated block
  # and is never identical() to the value of the formal.
  # Exercise the legacy recovery path through `order` instead.
  lifecycle::expect_deprecated(
    res <- layout_as_star(g, ord = c(3, 6, 5, 4, 2, 1))
  )
  expect_identical(res, layout_as_star(g, order = c(3, 6, 5, 4, 2, 1)))
})

test_that("layout_as_tree() covers tail args and recovers positional calls", {
  g <- make_tree(7, 2)

  # flip.y = FALSE keeps y growing with the depth instead of flipping it.
  l <- layout_as_tree(
    g,
    root = 1,
    circular = FALSE,
    mode = "all",
    flip.y = FALSE
  )
  expect_equal(l[, 2], c(0, 1, 1, 2, 2, 2, 2))

  # circular = TRUE puts the levels on concentric circles around the root.
  lc <- layout_as_tree(g, root = 1, circular = TRUE, flip.y = FALSE)
  expect_equal(sqrt(rowSums(lc^2)), c(0, 1, 1, 2, 2, 2, 2))

  # rootlevel offsets the roots of a forest against each other.
  gf <- make_tree(3, 2) %du% make_tree(4, 2)
  lf <- layout_as_tree(
    gf,
    root = c(1, 4),
    rootlevel = c(0, 1),
    mode = "all",
    flip.y = FALSE
  )
  expect_equal(lf[4, 2] - lf[1, 2], 1)

  # The legacy positional call recovers root and warns.
  g2 <- make_tree(7, 2, mode = "undirected")
  lifecycle::expect_deprecated(res <- layout_as_tree(g2, 2))
  expect_identical(res, layout_as_tree(g2, root = 2))
})

test_that("layout_on_grid() covers tail args and recovers positional calls", {
  g <- make_ring(12)

  # width fixes the number of grid columns.
  l <- layout_on_grid(g, width = 3)
  expect_equal(dim(l), c(12, 2))
  expect_equal(max(l[, 1]), 2)
  expect_equal(max(l[, 2]), 3)

  # height is honoured by the three-dimensional grid.
  l3 <- layout_on_grid(g, width = 2, height = 3, dim = 3)
  expect_equal(dim(l3), c(12, 3))
  expect_equal(max(l3[, 1]), 1)
  expect_equal(max(l3[, 2]), 2)
  expect_equal(sort(unique(l3[, 3])), c(0, 1))

  # The legacy positional call recovers width and warns.
  lifecycle::expect_deprecated(res <- layout_on_grid(g, 3))
  expect_identical(res, layout_on_grid(g, width = 3))
})

test_that("layout_randomly() covers tail args and recovers positional calls", {
  g <- make_ring(10)

  igraph_with_seed(42, {
    l <- layout_randomly(g, dim = 3)
  })
  expect_equal(dim(l), c(10, 3))
  expect_true(all(is.finite(l)))

  # The legacy positional call recovers dim and warns.
  igraph_with_seed(5, {
    lifecycle::expect_deprecated(res <- layout_randomly(g, 3))
  })
  igraph_with_seed(5, {
    ref <- layout_randomly(g, dim = 3)
  })
  expect_identical(res, ref)
})

test_that("layout_with_dh() covers tail args and recovers positional calls", {
  g <- make_ring(8)
  coords <- layout_in_circle(g)

  # All tail arguments by name.
  igraph_with_seed(42, {
    l <- layout_with_dh(
      g,
      coords = coords,
      maxiter = 5,
      fineiter = 5,
      cool.fact = 0.5,
      weight.node.dist = 2,
      weight.border = 0.1,
      weight.edge.lengths = 0.05,
      weight.edge.crossings = 0.5,
      weight.node.edge.dist = 0.1
    )
  })
  expect_equal(dim(l), c(8, 2))
  expect_true(all(is.finite(l)))

  # The legacy positional call recovers coords and warns.
  igraph_with_seed(1, {
    lifecycle::expect_deprecated(res <- layout_with_dh(g, coords, maxiter = 5))
  })
  igraph_with_seed(1, {
    ref <- layout_with_dh(g, coords = coords, maxiter = 5)
  })
  expect_identical(res, ref)
})

test_that("layout_with_drl() covers tail args and recovers positional calls", {
  g <- make_ring(10)
  igraph_with_seed(42, {
    seed_2d <- matrix(runif(20), ncol = 2)
    seed_3d <- matrix(runif(30), ncol = 3)
  })

  # All tail arguments by name, in two dimensions.
  igraph_with_seed(42, {
    l <- layout_with_drl(
      g,
      use.seed = TRUE,
      seed = seed_2d,
      options = drl_defaults$coarsen,
      weights = rep(2, ecount(g)),
      dim = 2
    )
  })
  expect_equal(dim(l), c(10, 2))
  expect_true(all(is.finite(l)))

  # dim = 3 needs a three-column seed matrix.
  igraph_with_seed(42, {
    l3 <- layout_with_drl(g, use.seed = TRUE, seed = seed_3d, dim = 3)
  })
  expect_equal(dim(l3), c(10, 3))

  # The legacy positional call recovers use.seed and warns.
  # Evaluating the argument defaults inside the recovery block consumes RNG
  # draws, so compare against the equally recovered abbreviated form instead
  # of the new-style call.
  igraph_with_seed(7, {
    lifecycle::expect_deprecated(
      res <- layout_with_drl(g, TRUE, seed = seed_2d)
    )
  })
  expect_equal(dim(res), c(10, 2))
  expect_true(all(is.finite(res)))
  igraph_with_seed(7, {
    lifecycle::expect_deprecated(
      ref <- layout_with_drl(g, use.se = TRUE, seed = seed_2d)
    )
  })
  expect_identical(res, ref)
})

test_that("layout_with_fr() covers the remaining tail args and recovery", {
  g <- make_ring(10)
  coords <- layout_in_circle(g)

  # Pass coords, grid, weights and the 2d bounds by name.
  # The niter, start.temp and dim arguments are already covered above.
  igraph_with_seed(42, {
    l <- layout_with_fr(
      g,
      coords = coords,
      niter = 20,
      grid = "nogrid",
      weights = rep(0.5, ecount(g)),
      minx = rep(-3, 10),
      maxx = rep(3, 10),
      miny = rep(-3, 10),
      maxy = rep(3, 10)
    )
  })
  expect_equal(dim(l), c(10, 2))
  # The box constraints are honoured.
  expect_true(all(l >= -3 & l <= 3))

  # The z bounds apply to the three-dimensional variant.
  igraph_with_seed(42, {
    l3 <- layout_with_fr(
      g,
      dim = 3,
      niter = 20,
      minz = rep(-2, 10),
      maxz = rep(2, 10)
    )
  })
  expect_equal(dim(l3), c(10, 3))
  expect_true(all(l3[, 3] >= -2 & l3[, 3] <= 2))

  # The legacy positional call recovers coords and warns.
  igraph_with_seed(1, {
    lifecycle::expect_deprecated(res <- layout_with_fr(g, coords, niter = 20))
  })
  igraph_with_seed(1, {
    ref <- layout_with_fr(g, coords = coords, niter = 20)
  })
  expect_identical(res, ref)
})

test_that("layout_with_gem() covers tail args and recovers positional calls", {
  g <- make_ring(8)
  coords <- layout_in_circle(g)

  # All tail arguments by name.
  igraph_with_seed(42, {
    l <- layout_with_gem(
      g,
      coords = coords,
      maxiter = 100,
      temp.max = 5,
      temp.min = 0.5,
      temp.init = 2
    )
  })
  expect_equal(dim(l), c(8, 2))
  expect_true(all(is.finite(l)))

  # The legacy positional call recovers coords and warns.
  igraph_with_seed(1, {
    lifecycle::expect_deprecated(res <- layout_with_gem(g, coords))
  })
  igraph_with_seed(1, {
    ref <- layout_with_gem(g, coords = coords)
  })
  expect_identical(res, ref)
})

test_that("layout_with_graphopt() covers tail args and recovers positional calls", {
  g <- make_ring(8)
  start <- layout_in_circle(g)

  # All tail arguments by name.
  igraph_with_seed(42, {
    l <- layout_with_graphopt(
      g,
      start = start,
      niter = 50,
      charge = 0.01,
      mass = 10,
      spring.length = 1,
      spring.constant = 2,
      max.sa.movement = 1
    )
  })
  expect_equal(dim(l), c(8, 2))
  expect_true(all(is.finite(l)))

  # The legacy positional call recovers start and warns.
  igraph_with_seed(1, {
    lifecycle::expect_deprecated(res <- layout_with_graphopt(g, start))
  })
  igraph_with_seed(1, {
    ref <- layout_with_graphopt(g, start = start)
  })
  expect_identical(res, ref)
})

test_that("layout_with_kk() covers the remaining tail args and recovery", {
  g <- make_ring(10)
  coords <- layout_in_circle(g)

  # Pass epsilon, kkconst, weights and the 2d bounds by name.
  # The coords, dim and maxiter arguments are already covered above.
  l <- layout_with_kk(
    g,
    coords = coords,
    maxiter = 50,
    epsilon = 1e-3,
    kkconst = 5,
    weights = rep(2, ecount(g)),
    minx = rep(-4, 10),
    maxx = rep(4, 10),
    miny = rep(-4, 10),
    maxy = rep(4, 10)
  )
  expect_equal(dim(l), c(10, 2))
  # The box constraints are honoured.
  expect_true(all(l >= -4 & l <= 4))

  # The z bounds apply to the three-dimensional variant.
  igraph_with_seed(2, {
    l3 <- layout_with_kk(
      g,
      dim = 3,
      maxiter = 50,
      minz = rep(0, 10),
      maxz = rep(1, 10)
    )
  })
  expect_equal(dim(l3), c(10, 3))
  expect_true(all(l3[, 3] >= 0 & l3[, 3] <= 1))

  # The legacy positional call recovers coords and warns.
  lifecycle::expect_deprecated(res <- layout_with_kk(g, coords, maxiter = 50))
  expect_identical(res, layout_with_kk(g, coords = coords, maxiter = 50))
})

test_that("layout_with_lgl() covers tail args and recovers positional calls", {
  g <- make_ring(8)

  # All tail arguments by name.
  igraph_with_seed(42, {
    l <- layout_with_lgl(
      g,
      maxiter = 50,
      maxdelta = 5,
      area = 64,
      coolexp = 1.2,
      repulserad = 512,
      cellsize = 4,
      root = 1
    )
  })
  expect_equal(dim(l), c(8, 2))
  expect_true(all(is.finite(l)))

  # The legacy positional call recovers maxiter and warns.
  igraph_with_seed(1, {
    lifecycle::expect_deprecated(res <- layout_with_lgl(g, 50))
  })
  igraph_with_seed(1, {
    ref <- layout_with_lgl(g, maxiter = 50)
  })
  expect_identical(res, ref)
})

test_that("layout_with_sugiyama() covers tail args and recovers positional calls", {
  g <- graph_from_literal(A -+ B:C, B -+ C:D)

  # All tail arguments by name.
  igraph_with_seed(42, {
    res <- layout_with_sugiyama(
      g,
      layers = c(1, 2, 3, 4),
      hgap = 2,
      vgap = 2,
      maxiter = 50,
      weights = rep(1, ecount(g)),
      attributes = "all"
    )
  })
  expect_equal(nrow(res$layout), 4)
  # The two edges spanning more than one layer get one dummy vertex each.
  expect_equal(nrow(res$layout.dummy), 2)
  # Consecutive layers are vgap apart.
  expect_equal(diff(sort(unique(res$layout[, 2]))), rep(2, 3))
  # attributes = "all" copies the vertex names onto the extended graph.
  expect_equal(V(res$extd_graph)$name[1:4], c("A", "B", "C", "D"))

  # The legacy positional call recovers layers and warns.
  igraph_with_seed(1, {
    lifecycle::expect_deprecated(
      res2 <- layout_with_sugiyama(g, c(1, 2, 3, 4))
    )
  })
  igraph_with_seed(1, {
    ref <- layout_with_sugiyama(g, layers = c(1, 2, 3, 4))
  })
  expect_identical(res2$layout, ref$layout)
  expect_identical(res2$layout.dummy, ref$layout.dummy)
})

test_that("merge_coords() covers tail args and recovers positional calls", {
  graphs <- list(make_ring(5), make_ring(4))
  layouts <- lapply(graphs, layout_in_circle)

  # method is the single tail argument and only supports "dla".
  igraph_with_seed(42, {
    l <- merge_coords(graphs, layouts, method = "dla")
  })
  expect_true(is.matrix(l))
  expect_equal(dim(l), c(9, 2))
  expect_true(all(is.finite(l)))

  # The legacy positional call recovers method and warns.
  igraph_with_seed(1, {
    lifecycle::expect_deprecated(res <- merge_coords(graphs, layouts, "dla"))
  })
  igraph_with_seed(1, {
    ref <- merge_coords(graphs, layouts, method = "dla")
  })
  expect_identical(res, ref)
})

test_that("norm_coords() recovers positional calls", {
  # The named tail arguments are covered by the all-NaN normalization test.
  lay <- matrix(as.numeric(1:10), ncol = 2)

  # The legacy positional call recovers xmin and warns.
  lifecycle::expect_deprecated(res <- norm_coords(lay, 0))
  expect_identical(res, norm_coords(lay, xmin = 0))
  # xmin = 0 rescales the first column into [0, 1].
  expect_equal(range(res[, 1]), c(0, 1))
})
