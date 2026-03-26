test_that("radius() works", {
  withr::local_seed(42)
  g <- make_tree(10, 2)

  expect_equal(radius(g), 3)
  expect_equal(radius(g, mode = "in"), 0)
  expect_equal(radius(g, mode = "out"), 0)
})

test_that("radius() works -- weights", {
  g <- make_ring(10)
  expect_equal(radius(g), 5)

  E(g)$weight <- seq_len(ecount(g))
  expect_equal(radius(g), 24)
})

test_that("radius() works -- lifecycle", {
  withr::local_seed(42)
  g <- make_tree(10, 2)

  expect_snapshot(radius(g, "out"))
})

test_that("eccentricity() works", {
  withr::local_seed(42)
  g <- make_tree(10, 2)

  expect_equal(eccentricity(g), c(3, 3, 4, 4, 4, 5, 5, 5, 5, 5))
  expect_equal(eccentricity(g, mode = "in"), c(0, 1, 1, 2, 2, 2, 2, 3, 3, 3))
  expect_equal(eccentricity(g, mode = "out"), c(3, 2, 1, 1, 1, 0, 0, 0, 0, 0))
})

test_that("eccentricity() works -- weights", {
  g <- make_ring(10)
  expect_equal(eccentricity(g), rep(5, 10))

  E(g)$weight <- seq_len(ecount(g))
  expect_equal(eccentricity(g), c(27, 27, 25, 25, 26, 25, 24, 27, 26, 25))
})

test_that("eccentricity() works -- lifecycle", {
  withr::local_seed(42)
  g <- make_tree(10, 2)

  expect_snapshot(eccentricity(g, vids = V(g), "out"))
})

test_that("graph_center() works", {
  withr::local_seed(42)
  g <- make_tree(100, 7)
  expect_equal(as.numeric(graph_center(g)), c(1, 2))
  expect_equal(as.numeric(graph_center(g, mode = "in")), 1)
  expect_equal(as.numeric(graph_center(g, mode = "out")), 16:100)
})

test_that("graph_center() works -- weights", {
  g <- make_ring(10)
  expect_equal(as.numeric(graph_center(g)), 1:10)

  E(g)$weight <- seq_len(ecount(g))
  expect_equal(as.numeric(graph_center(g)), 7)
})

test_that("all_simple_paths() passes on cutoff argument", {
  g <- make_ring(7)
  expect_equal(lengths(all_simple_paths(g, 1, cutoff = 1)), c(2, 2))
  expect_equal(lengths(all_simple_paths(g, 1, cutoff = 2)), c(2, 3, 2, 3))
  expect_equal(
    lengths(all_simple_paths(g, 1)),
    c(2, 3, 4, 5, 6, 7, 2, 3, 4, 5, 6, 7)
  )
})

test_that("widest_path_widths() works", {
  # Simple ring graph with weights
  g <- make_ring(5)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  # Widest path from vertex 1 to all vertices
  result <- widest_path_widths(g, v = 1, to = V(g))

  # Width to itself is Inf
  expect_equal(result[1, 1], Inf)

  # Width from 1 to 2: direct edge has weight 1, but going the other way
  # 1->5->4->3->2 has bottleneck min(5,4,3,2) = 2, which is wider
  expect_equal(result[1, 2], 2)

  # Width from 1 to 3: 1->2->3 has bottleneck min(1,2) = 1, or
  # 1->5->4->3 has bottleneck min(5,4,3) = 3, so choose 3
  expect_equal(result[1, 3], 3)
})

test_that("widest_path_widths() works -- algorithm selection", {
  g <- make_ring(5)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  # Test Dijkstra
  result_dijkstra <- widest_path_widths(
    g,
    v = 1,
    to = V(g),
    algorithm = "dijkstra"
  )

  # Test Floyd-Warshall
  result_floyd <- widest_path_widths(
    g,
    v = 1,
    to = V(g),
    algorithm = "floyd-warshall"
  )

  # Both should give the same result
  expect_equal(result_dijkstra, result_floyd)

  # Test automatic selection
  result_auto <- widest_path_widths(
    g,
    v = 1,
    to = V(g),
    algorithm = "automatic"
  )
  expect_equal(result_auto, result_dijkstra)
})

test_that("widest_path_widths() works -- mode parameter", {
  # Create a directed graph
  g <- make_ring(5, directed = TRUE)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  # Test out mode (default)
  result_out <- widest_path_widths(g, v = 1, to = V(g), mode = "out")

  # Test in mode
  result_in <- widest_path_widths(g, v = 1, to = V(g), mode = "in")

  # Results should be different for directed graph
  expect_false(identical(result_out, result_in))

  # Test all mode (treats as undirected)
  result_all <- widest_path_widths(g, v = 1, to = V(g), mode = "all")
  expect_true(is.matrix(result_all))
})

test_that("widest_path_widths() works -- weight attribute", {
  g <- make_ring(5)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  # Use weight attribute
  result_with_attr <- widest_path_widths(g, v = 1, to = V(g))

  # Explicitly pass weights
  result_with_explicit <- widest_path_widths(
    g,
    v = 1,
    to = V(g),
    weights = E(g)$weight
  )

  expect_equal(result_with_attr, result_with_explicit)
})

test_that("widest_path_widths() requires weights", {
  # Graph without weight attribute
  g <- make_ring(5)

  # Should error when no weights provided
  expect_error(
    widest_path_widths(g, v = 1, to = V(g)),
    "Widest path functions require edge weights"
  )

  # Should error when weights = NA
  E(g)$weight <- c(1, 2, 3, 4, 5)
  expect_error(
    widest_path_widths(g, v = 1, to = V(g), weights = NA),
    "weights = NA"
  )
})

test_that("widest_paths() works", {
  g <- make_ring(5)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  # Test vpath output
  result <- widest_paths(g, from = 1, to = 3, output = "vpath")
  expect_true("vpath" %in% names(result))
  expect_false("epath" %in% names(result))
  expect_true(length(result$vpath) == 1)

  # The widest path from 1 to 3 should go through 5->4->3 (bottleneck 3)
  # rather than 1->2->3 (bottleneck 1)
  path <- as.numeric(result$vpath[[1]])
  expect_true(1 %in% path)
  expect_true(3 %in% path)
})

test_that("widest_paths() works -- output modes", {
  g <- make_ring(5)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  # Test epath output
  result_epath <- widest_paths(g, from = 1, to = 3, output = "epath")
  expect_false("vpath" %in% names(result_epath))
  expect_true("epath" %in% names(result_epath))

  # Test both output
  result_both <- widest_paths(g, from = 1, to = 3, output = "both")
  expect_true("vpath" %in% names(result_both))
  expect_true("epath" %in% names(result_both))
})

test_that("widest_paths() works -- predecessors and inbound_edges", {
  g <- make_ring(5)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  # Test with predecessors
  result <- widest_paths(g, from = 1, to = V(g), predecessors = TRUE)
  expect_true("predecessors" %in% names(result))

  # Test with inbound_edges
  result2 <- widest_paths(g, from = 1, to = V(g), inbound.edges = TRUE)
  expect_true("inbound_edges" %in% names(result2))

  # Test with both
  result3 <- widest_paths(
    g,
    from = 1,
    to = V(g),
    predecessors = TRUE,
    inbound.edges = TRUE
  )
  expect_true("predecessors" %in% names(result3))
  expect_true("inbound_edges" %in% names(result3))
})

test_that("widest_paths() works -- multiple targets", {
  g <- make_ring(5)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  # Test with multiple targets
  result <- widest_paths(g, from = 1, to = c(2, 3, 4))
  expect_equal(length(result$vpath), 3)
})

test_that("widest_path_widths() handles unreachable vertices", {
  # Create a disconnected graph
  g <- make_graph(~ 1-2-3, 4-5)
  E(g)$weight <- c(1, 2, 3)

  result <- widest_path_widths(g, v = 1, to = V(g))

  # Vertex 4 and 5 are unreachable from vertex 1
  expect_equal(result[1, 4], -Inf)
  expect_equal(result[1, 5], -Inf)
})

test_that("widest_paths() works with directed graphs", {
  # Create a directed graph
  g <- make_ring(5, directed = TRUE)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  # Test out mode
  result_out <- widest_paths(g, from = 1, to = 3, mode = "out")
  expect_true(length(result_out$vpath) == 1)

  # Test in mode
  result_in <- widest_paths(g, from = 1, to = 3, mode = "in")
  expect_true(length(result_in$vpath) == 1)
})
