test_that("global_efficiency works", {
  g <- graph_from_literal(A - B - C - D - A)
  expect_equal(global_efficiency(g), 5 / 6)

  g <- graph_from_literal(A -+ B -+ C -+ D -+ A)
  expect_equal(global_efficiency(g), 11 / 18)
  expect_equal(global_efficiency(g, directed = F), 5 / 6)
})

test_that("local_efficiency works", {
  g <- graph_from_literal(A - B - C - D - A)
  expect_equal(as.vector(local_efficiency(g)), rep(0.5, vcount(g)))
  expect_equal(average_local_efficiency(g), mean(local_efficiency(g)))

  g <- graph_from_literal(A -+ B -+ C -+ D -+ A)
  expect_equal(as.vector(local_efficiency(g)), rep(0.25, vcount(g)))
  expect_equal(average_local_efficiency(g), mean(local_efficiency(g)))

  g <- graph_from_literal(A -+ B -+ C -+ D -+ A)
  expect_equal(
    as.vector(local_efficiency(g, directed = F)),
    rep(0.5, vcount(g))
  )
  expect_equal(
    average_local_efficiency(g, directed = F),
    mean(local_efficiency(g, directed = F))
  )
  expect_equal(as.vector(local_efficiency(g, mode = "in")), rep(0, vcount(g)))
  expect_equal(as.vector(local_efficiency(g, mode = "out")), rep(0, vcount(g)))
})

# ---- ellipsis migration: argument coverage ----------------------------

test_that("global_efficiency() covers weights and directed", {
  g <- make_ring(3, directed = TRUE)

  # As an undirected weighted triangle, the pairwise distances are 1, 2 and 3.
  expect_equal(
    global_efficiency(g, weights = c(1, 2, 4), directed = FALSE),
    11 / 18
  )
})

test_that("global_efficiency() recovers legacy positional arguments", {
  g <- make_ring(3, directed = TRUE)

  lifecycle::expect_deprecated(
    res <- global_efficiency(g, c(1, 2, 4))
  )
  expect_identical(res, global_efficiency(g, weights = c(1, 2, 4)))
})

test_that("local_efficiency() covers vids, weights and directed", {
  g <- make_ring(4, directed = TRUE)

  # As an undirected weighted square with weights 1:4,
  # the neighbors of vertex 2 reconnect at distance 7
  # and those of vertex 4 at distance 3.
  expect_equal(
    local_efficiency(g, vids = c(2, 4), weights = 1:4, directed = FALSE),
    c(1 / 7, 1 / 3)
  )
})

test_that("local_efficiency() recovers legacy positional arguments", {
  g <- make_ring(4, directed = TRUE)

  lifecycle::expect_deprecated(
    res <- local_efficiency(g, V(g), 1:4)
  )
  expect_identical(res, local_efficiency(g, V(g), weights = 1:4))
})

test_that("average_local_efficiency() covers weights, directed and mode", {
  g <- make_ring(4, directed = TRUE)

  # Mean of the undirected weighted local efficiencies 1/5, 1/7, 1/5 and 1/3.
  expect_equal(
    average_local_efficiency(g, weights = 1:4, directed = FALSE),
    23 / 105
  )
  # Each vertex has a single out-neighbor, so all local efficiencies are zero.
  expect_equal(average_local_efficiency(g, mode = "out"), 0)
})

test_that("average_local_efficiency() recovers legacy positional arguments", {
  g <- make_ring(4, directed = TRUE)

  lifecycle::expect_deprecated(
    res <- average_local_efficiency(g, 1:4)
  )
  expect_identical(res, average_local_efficiency(g, weights = 1:4))
})
