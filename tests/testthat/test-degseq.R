test_that("realize_degseq works", {
  igraph_local_seed(42)
  g <- largest_component(sample_gnp(1000, 2 / 1000))

  nG <- realize_degseq(degree(g))
  expect_equal(degree(nG), degree(g))
  expect_true(is_connected(nG))
  expect_true(is_simple(nG))

  nG <- realize_degseq(degree(g), method = "smallest")
  expect_equal(degree(nG), degree(g))
  expect_true(is_simple(nG))

  nG <- realize_degseq(degree(g), method = "index", allowed.edge.types = "all")
  expect_equal(degree(nG), degree(g))

  #####

  g2 <- sample_gnp(1000, 2 / 1000, directed = TRUE)

  nG <- realize_degseq(degree(g2, mode = "out"), degree(g2, mode = "in"))
  expect_equal(degree(nG, mode = "out"), degree(g2, mode = "out"))
  expect_equal(degree(nG, mode = "in"), degree(g2, mode = "in"))
  expect_true(is_simple(nG))
})

test_that("realize_degseq supports the make_(...) syntax", {
  degs <- rep(4, 20)
  g1 <- make_(degseq(degs, deterministic = T))
  g2 <- make_(degseq(degs, deterministic = T))

  expect_equal(degree(g1), degs)
  expect_equal(degree(g2), degs)

  expect_identical_graphs(g1, g2)
})

test_that("is_degseq works", {
  g <- make_full_graph(10)
  expect_true(is_degseq(degree(g)))
  expect_true(is_graphical(degree(g)))
})

# ---- ellipsis migration: argument coverage ----------------------------------

test_that("is_graphical() takes `allowed.edge.types` by name", {
  # Two vertices of degree 3 need multi-edges, so the verdict flips.
  expect_false(is_graphical(c(3, 3)))
  expect_true(is_graphical(c(3, 3), allowed.edge.types = "multi"))
  # Directed sequences pass the in-degrees as the second head argument.
  expect_true(is_graphical(c(2, 0, 1), c(1, 1, 1)))
})

test_that("is_graphical() recovers legacy positional arguments", {
  rlang::local_options(lifecycle_verbosity = "warning")
  lifecycle::expect_deprecated(
    res <- is_graphical(c(3, 3), NULL, "multi")
  )
  expect_identical(res, is_graphical(c(3, 3), allowed.edge.types = "multi"))
  expect_true(res)
})
