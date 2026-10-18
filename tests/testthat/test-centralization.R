test_that("centr_degree works", {
  g <- make_star(5, mode = "undirected")
  g_centr <- centr_degree(g, normalized = FALSE)
  g_centr_tmax <- centr_degree_tmax(g, loops = FALSE)
  expect_equal(g_centr$centralization, g_centr_tmax)
})

test_that("centr_betw works", {
  g <- make_star(5, mode = "undirected")
  g_centr <- centr_betw(g, normalized = FALSE)
  g_centr_tmax <- centr_betw_tmax(g)
  expect_equal(g_centr$centralization, g_centr_tmax)
})

test_that("centr_clo works", {
  g <- make_star(5, mode = "undirected")
  g_centr <- centr_clo(g, normalized = FALSE)
  g_centr_tmax <- centr_clo_tmax(g)
  expect_equal(g_centr$centralization, g_centr_tmax)
})


test_that("centr_eigen works", {
  # centr_eigen() runs the ARPACK eigensolver, which draws from the RNG to seed
  # its starting vector; pin the seed so the global RNG state isn't disturbed.
  igraph_local_seed(42)
  g <- make_star(2, mode = "undirected")
  g_centr <- centr_eigen(g, normalized = FALSE)
  g_centr_tmax <- centr_eigen_tmax(g)
  expect_equal(g_centr$centralization, g_centr_tmax)
})

# ---- ellipsis migration: argument coverage ----------------------------

test_that("centr_degree() covers migrated tail args and positional recovery", {
  rlang::local_options(lifecycle_verbosity = "warning")
  g <- make_star(5, mode = "in")

  res <- centr_degree(g, mode = "in", loops = FALSE, normalized = FALSE)
  # Only the centre receives edges, so the centralization is (n - 1)^2.
  expect_equal(res$res, c(4, 0, 0, 0, 0))
  expect_equal(res$centralization, 16)
  expect_equal(res$theoretical_max, 16)

  lifecycle::expect_deprecated(
    res_legacy <- centr_degree(g, "in")
  )
  expect_identical(res_legacy, centr_degree(g, mode = "in"))
})

test_that("centr_betw() covers migrated tail args and positional recovery", {
  rlang::local_options(lifecycle_verbosity = "warning")
  g <- make_star(5, mode = "undirected")

  res <- centr_betw(g, directed = FALSE, normalized = FALSE)
  # The centre lies on the geodesics of all 6 leaf pairs.
  expect_equal(res$res, c(6, 0, 0, 0, 0))
  expect_equal(res$centralization, 24)
  expect_equal(res$theoretical_max, 24)

  lifecycle::expect_deprecated(
    res_legacy <- centr_betw(g, FALSE)
  )
  expect_identical(res_legacy, centr_betw(g, directed = FALSE))
})

test_that("centr_betw_tmax() covers migrated tail args and positional recovery", {
  rlang::local_options(lifecycle_verbosity = "warning")
  g <- make_star(5, mode = "undirected")

  # The graph form and the vertex-count form must agree.
  expect_equal(centr_betw_tmax(g, directed = FALSE), 24)
  expect_equal(centr_betw_tmax(n = 5, directed = FALSE), 24)
  # And they match what centr_betw() reports.
  expect_equal(
    centr_betw(g, directed = FALSE, normalized = FALSE)$theoretical_max,
    centr_betw_tmax(g, directed = FALSE)
  )

  lifecycle::expect_deprecated(
    res_legacy <- centr_betw_tmax(g, 0, FALSE)
  )
  expect_identical(res_legacy, centr_betw_tmax(g, directed = FALSE))
})

test_that("centr_clo() covers migrated tail args and positional recovery", {
  rlang::local_options(lifecycle_verbosity = "warning")
  g <- make_ring(5, directed = TRUE)

  res <- centr_clo(g, mode = "in", normalized = FALSE)
  # On a directed ring every vertex has the same in-closeness 4 / 10.
  expect_equal(res$res, rep(0.4, 5))
  expect_equal(res$centralization, 0)
  expect_equal(res$theoretical_max, 3.2)
  # Ignoring edge directions shortens the paths to 4 / 6.
  expect_equal(
    centr_clo(g, mode = "all", normalized = FALSE)$res,
    rep(2 / 3, 5)
  )

  lifecycle::expect_deprecated(
    res_legacy <- centr_clo(g, "in")
  )
  expect_identical(res_legacy, centr_clo(g, mode = "in"))
})

test_that("centr_clo_tmax() covers migrated tail args and positional recovery", {
  rlang::local_options(lifecycle_verbosity = "warning")
  g <- make_ring(5, directed = TRUE)

  # The graph form and the vertex-count form must agree.
  expect_equal(centr_clo_tmax(g, mode = "in"), 3.2)
  expect_equal(centr_clo_tmax(n = 5, mode = "in"), 3.2)
  # And they match what centr_clo() reports.
  expect_equal(
    centr_clo(g, mode = "in", normalized = FALSE)$theoretical_max,
    centr_clo_tmax(g, mode = "in")
  )

  lifecycle::expect_deprecated(
    res_legacy <- centr_clo_tmax(g, 0, "in")
  )
  expect_identical(res_legacy, centr_clo_tmax(g, mode = "in"))
})

test_that("centralize() covers migrated tail args and positional recovery", {
  rlang::local_options(lifecycle_verbosity = "warning")
  scores <- degree(make_star(5, mode = "undirected"))

  # The star's degree sequence gives sum(max - x) = 12.
  expect_equal(centralize(scores, theoretical.max = 12, normalized = TRUE), 1)
  expect_equal(centralize(scores, normalized = FALSE), 12)

  lifecycle::expect_deprecated(
    res_legacy <- centralize(scores, 12)
  )
  expect_identical(res_legacy, centralize(scores, theoretical.max = 12))
})

# ---- nodes -> n rename ------------------------------------------------

test_that("centr_*_tmax(nodes = ) is deprecated but still works", {
  lifecycle::expect_deprecated(
    res_betw <- centr_betw_tmax(nodes = 5, directed = FALSE)
  )
  expect_identical(res_betw, centr_betw_tmax(n = 5, directed = FALSE))

  lifecycle::expect_deprecated(
    res_degree <- centr_degree_tmax(nodes = 5, mode = "all", loops = TRUE)
  )
  expect_identical(
    res_degree,
    centr_degree_tmax(n = 5, mode = "all", loops = TRUE)
  )
})
