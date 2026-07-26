test_that("radius() works", {
  igraph_local_seed(42)
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
  igraph_local_seed(42)
  g <- make_tree(10, 2)

  expect_snapshot(radius(g, "out"))
})

test_that("eccentricity() works", {
  igraph_local_seed(42)
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
  igraph_local_seed(42)
  g <- make_tree(10, 2)

  expect_snapshot(eccentricity(g, vids = V(g), "out"))
})

test_that("graph_center() works", {
  igraph_local_seed(42)
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
  g <- make_ring(5)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  result <- widest_path_widths(g, from = 1)

  # The width of the widest path from a vertex to itself is Inf,
  # the other paths go the "wide way" around the ring,
  # e.g. from 1 to 2 via 5, 4 and 3 with bottleneck width 2.
  expect_equal(result[1, ], c(Inf, 2, 3, 4, 5))
  expect_identical(dim(result), c(1L, 5L))
})

test_that("widest_path_widths() works -- algorithm selection", {
  g <- make_ring(5)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  result_dijkstra <- widest_path_widths(
    g,
    from = 1,
    algorithm = "dijkstra"
  )
  result_floyd <- widest_path_widths(
    g,
    from = 1,
    algorithm = "floyd-warshall"
  )
  result_auto <- widest_path_widths(
    g,
    from = 1,
    algorithm = "automatic"
  )

  expect_equal(result_dijkstra, result_floyd)
  expect_equal(result_auto, result_dijkstra)
})

test_that("widest_path_widths() works -- mode parameter", {
  g <- make_ring(5, directed = TRUE)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  result_out <- widest_path_widths(g, from = 1, mode = "out")
  result_in <- widest_path_widths(g, from = 1, mode = "in")
  result_all <- widest_path_widths(g, from = 1, mode = "all")

  expect_false(identical(result_out, result_in))
  expect_true(is.matrix(result_all))
})

test_that("widest_path_widths() works -- weight attribute", {
  g <- make_ring(5)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  result_with_attr <- widest_path_widths(g, from = 1)
  result_with_explicit <- widest_path_widths(
    g,
    from = 1,
    weights = E(g)$weight
  )

  expect_equal(result_with_attr, result_with_explicit)
})

test_that("widest_path_widths() adds vertex names", {
  g <- make_ring(5)
  V(g)$name <- letters[1:5]
  E(g)$weight <- c(1, 2, 3, 4, 5)

  result <- widest_path_widths(g, from = c("a", "b"), to = c("d", "e"))

  expect_identical(rownames(result), c("a", "b"))
  expect_identical(colnames(result), c("d", "e"))
})

test_that("widest_path_widths() handles unreachable vertices", {
  g <- make_graph(~ 1 - 2 - 3, 4 - 5)
  E(g)$weight <- c(1, 2, 3)

  result <- widest_path_widths(g, from = 1)

  expect_equal(result[1, 4], -Inf)
  expect_equal(result[1, 5], -Inf)
})

test_that("widest path functions require edge weights", {
  g <- make_ring(5)

  expect_snapshot_igraph_error(widest_path_widths(g))
  expect_snapshot_igraph_error(widest_paths(g, from = 1))

  E(g)$weight <- c(1, 2, 3, 4, 5)
  expect_snapshot_igraph_error(widest_path_widths(g, weights = NA))
  expect_snapshot_igraph_error(widest_paths(g, from = 1, weights = NA))
})

test_that("widest path functions reject positional arguments after the ellipsis", {
  g <- make_ring(5)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  expect_snapshot_igraph_error(widest_path_widths(g, 1, 3, "all"))
  expect_snapshot_igraph_error(widest_paths(g, 1, 3, "out"))
})

test_that("widest_paths() works", {
  g <- make_ring(5)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  result <- widest_paths(g, from = 1, to = 3)

  expect_named(
    result,
    c("vpath", "epath", "predecessors", "inbound_edges")
  )

  # The widest path from 1 to 3 goes through 5 and 4 (bottleneck 3)
  # rather than through 2 (bottleneck 1).
  expect_equal(as.numeric(result$vpath[[1]]), c(1, 5, 4, 3))
  expect_null(result$epath)
  expect_null(result$predecessors)
  expect_null(result$inbound_edges)
})

test_that("widest_paths() works -- output modes", {
  g <- make_ring(5)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  result_epath <- widest_paths(g, from = 1, to = 3, output = "epath")
  expect_null(result_epath$vpath)
  expect_equal(as.numeric(result_epath$epath[[1]]), c(5, 4, 3))

  result_both <- widest_paths(g, from = 1, to = 3, output = "both")
  expect_equal(as.numeric(result_both$vpath[[1]]), c(1, 5, 4, 3))
  expect_equal(as.numeric(result_both$epath[[1]]), c(5, 4, 3))
})

test_that("widest_paths() works -- predecessors and inbound edges", {
  g <- make_ring(5)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  result <- widest_paths(
    g,
    from = 1,
    predecessors = TRUE,
    inbound_edges = TRUE
  )

  # In the widest path tree rooted at vertex 1, vertex 2 is reached
  # from vertex 3, vertex 3 from vertex 4, and so on.
  expect_s3_class(result$predecessors, "igraph.vs")
  expect_equal(as.numeric(result$predecessors), c(NA, 3, 4, 5, 1))
  expect_s3_class(result$inbound_edges, "igraph.es")
  expect_equal(as.numeric(result$inbound_edges), c(NA, 2, 3, 4, 5))
})

test_that("widest_paths() predecessors and inbound edges print", {
  local_igraph_options(print.style = "cli", print.id = FALSE)

  g <- make_ring(5)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  result <- widest_paths(
    g,
    from = 1,
    predecessors = TRUE,
    inbound_edges = TRUE
  )

  expect_snapshot({
    print(result$predecessors)
    print(result$inbound_edges)
  })
})

test_that("widest_paths() works -- multiple targets", {
  g <- make_ring(5)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  result <- widest_paths(g, from = 1, to = c(2, 3, 4))

  expect_length(result$vpath, 3)
})

test_that("widest_paths() handles unreachable vertices", {
  g <- make_graph(~ 1 - 2 - 3, 4 - 5)
  E(g)$weight <- c(1, 2, 3)

  expect_warning(
    result <- widest_paths(g, from = 1, to = 5),
    "Couldn't reach some vertices"
  )

  expect_length(result$vpath[[1]], 0)
})

test_that("widest_paths() works with directed graphs", {
  g <- make_ring(5, directed = TRUE)
  E(g)$weight <- c(1, 2, 3, 4, 5)

  result_out <- widest_paths(g, from = 1, to = 3, mode = "out")
  expect_equal(as.numeric(result_out$vpath[[1]]), c(1, 2, 3))

  result_in <- widest_paths(g, from = 1, to = 3, mode = "in")
  expect_equal(as.numeric(result_in$vpath[[1]]), c(1, 5, 4, 3))
})
