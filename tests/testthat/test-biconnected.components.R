test_that("biconnected_components works", {
  g <- make_full_graph(5) + make_full_graph(5)
  clu <- components(g)$membership
  g <- add_edges(g, c(match(1, clu), match(2, clu)))

  sortlist <- function(list) {
    list <- lapply(list, sort)
    list <- lapply(list, as.vector)
    list[order(sapply(list, paste, collapse = "x"))]
  }

  bc <- biconnected_components(g)
  expect_equal(bc$no, 3)
  expect_equal(sortlist(bc$tree_edges), list(c(11, 15, 18, 20), c(1, 5, 8, 10), 21))
  expect_equal(sortlist(bc$component_edges), list(11:20, 1:10, 21))
  expect_equal(sortlist(bc$components), list(1:5, c(1, 6), 6:10))
  expect_equal(sort(as.vector(bc$articulation_points)), c(1, 6))

  expect_equal(sort(names(bc)), c(
    "articulation_points",
    "component_edges",
    "components",
    "no",
    "tree_edges"
  ))
  expect_s3_class(bc$articulation_points, "igraph.vs")
  expect_s3_class(bc$components[[1]], "igraph.vs")
  expect_s3_class(bc$component_edges[[1]], "igraph.es")
})

test_that("biconnected_components works without igraph.vs.es", {
  local_igraph_options(return.vs.es = FALSE)

  g <- make_full_graph(5) + make_full_graph(5)
  clu <- components(g)$membership
  g <- add_edges(g, c(match(1, clu), match(2, clu)))

  sortlist <- function(list) {
    list <- lapply(list, sort)
    list[order(sapply(list, paste, collapse = "x"))]
  }

  bc <- biconnected_components(g)
  expect_equal(bc$no, 3)
  expect_equal(sortlist(bc$tree_edges), list(c(11, 15, 18, 20), c(1, 5, 8, 10), 21))
  expect_equal(sortlist(bc$component_edges), list(11:20, 1:10, 21))
  expect_equal(sortlist(bc$components), list(1:5, c(1, 6), 6:10))
  expect_equal(sort(bc$articulation_points), c(1, 6))

  expect_equal(sort(names(bc)), c(
    "articulation_points",
    "component_edges",
    "components",
    "no",
    "tree_edges"
  ))
})

test_that("is_biconnected works", {
  g <- make_full_graph(0)
  expect_false(is_biconnected(g))

  g <- make_full_graph(1)
  expect_false(is_biconnected(g))

  g <- make_full_graph(2)
  expect_true(is_biconnected(g))

  g <- make_full_graph(3)
  expect_true(is_biconnected(g))

  g <- make_graph(c(1, 2, 2, 3, 3, 1, 1, 4, 4, 4))
  expect_false(is_biconnected(g))
})
