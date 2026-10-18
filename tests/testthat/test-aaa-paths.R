# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 58. get_shortest_path_impl

test_that("get_shortest_path_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_shortest_path_impl(
    graph = g,
    from = 1,
    to = 3
  ))

  # Structured tests
  result <- get_shortest_path_impl(
    graph = g,
    from = 1,
    to = 3
  )
  expect_type(result, "list")
})

test_that("get_shortest_path_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(get_shortest_path_impl(
    graph = NULL,
    from = 1,
    to = 3
  ))
})

# 59. get_shortest_path_bellman_ford_impl

test_that("get_shortest_path_bellman_ford_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_shortest_path_bellman_ford_impl(
    graph = g,
    from = 1,
    to = 3
  ))

  # Structured tests
  result <- get_shortest_path_bellman_ford_impl(
    graph = g,
    from = 1,
    to = 3
  )
  expect_type(result, "list")
})

test_that("get_shortest_path_bellman_ford_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(get_shortest_path_bellman_ford_impl(
    graph = NULL,
    from = 1,
    to = 3
  ))
})

# 60. get_shortest_path_dijkstra_impl

test_that("get_shortest_path_dijkstra_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_shortest_path_dijkstra_impl(
    graph = g,
    from = 1,
    to = 3
  ))

  # Structured tests
  result <- get_shortest_path_dijkstra_impl(
    graph = g,
    from = 1,
    to = 3
  )
  expect_type(result, "list")
})

test_that("get_shortest_path_dijkstra_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(get_shortest_path_dijkstra_impl(
    graph = NULL,
    from = 1,
    to = 3
  ))
})

# 61. get_all_shortest_paths_impl

test_that("get_all_shortest_paths_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_all_shortest_paths_impl(
    graph = g,
    from = 1,
    to = 3
  ))

  # Structured tests
  result <- get_all_shortest_paths_impl(
    graph = g,
    from = 1,
    to = 3
  )
  expect_type(result, "list")
})

test_that("get_all_shortest_paths_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(get_all_shortest_paths_impl(
    graph = NULL,
    from = 1,
    to = 3
  ))
})

# 62. get_all_shortest_paths_dijkstra_impl

test_that("get_all_shortest_paths_dijkstra_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_all_shortest_paths_dijkstra_impl(
    graph = g,
    from = 1,
    to = 3
  ))

  # Structured tests
  result <- get_all_shortest_paths_dijkstra_impl(
    graph = g,
    from = 1,
    to = 3
  )
  expect_type(result, "list")
})

test_that("get_all_shortest_paths_dijkstra_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    get_all_shortest_paths_dijkstra_impl(
      graph = NULL,
      from = 1,
      to = 3
    )
  )
})

# 63. voronoi_impl

test_that("voronoi_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(voronoi_impl(
    graph = g,
    generators = 1
  ))
  expect_snapshot(voronoi_impl(
    graph = g,
    generators = 1,
    mode = "in",
    tiebreaker = "first"
  ))

  # Structured tests
  result <- voronoi_impl(
    graph = g,
    generators = 1
  )
  expect_type(result, "list")
})

test_that("voronoi_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(voronoi_impl(
    graph = NULL,
    generators = 1
  ))
})

# 64. get_all_simple_paths_impl

test_that("get_all_simple_paths_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_all_simple_paths_impl(
    graph = g,
    from = 1,
    to = 3
  ))

  # Structured tests
  result <- get_all_simple_paths_impl(
    graph = g,
    from = 1,
    to = 3
  )
  expect_s3_class(result, "igraph.vs")
})

test_that("get_all_simple_paths_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(get_all_simple_paths_impl(
    graph = NULL,
    from = 1,
    to = 3
  ))
})

# 65. get_k_shortest_paths_impl

test_that("get_k_shortest_paths_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_k_shortest_paths_impl(
    graph = g,
    from = 1,
    to = 3,
    k = 2
  ))

  # Structured tests
  result <- get_k_shortest_paths_impl(
    graph = g,
    from = 1,
    to = 3,
    k = 2
  )
  expect_type(result, "list")
})

test_that("get_k_shortest_paths_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(get_k_shortest_paths_impl(
    graph = NULL,
    from = 1,
    to = 3,
    k = 2
  ))
})

# 66. get_widest_path_impl

test_that("get_widest_path_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_widest_path_impl(
    graph = g,
    from = 1,
    to = 3,
    weights = c(1, 2)
  ))

  # Structured tests
  result <- get_widest_path_impl(
    graph = g,
    from = 1,
    to = 3,
    weights = c(1, 2)
  )
  expect_type(result, "list")
})

test_that("get_widest_path_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(get_widest_path_impl(
    graph = NULL,
    from = 1,
    to = 3
  ))
})

# 67. get_widest_paths_impl

test_that("get_widest_paths_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_widest_paths_impl(
    graph = g,
    from = 1,
    to = 3,
    weights = c(1, 2)
  ))

  # Structured tests
  result <- get_widest_paths_impl(
    graph = g,
    from = 1,
    to = 3,
    weights = c(1, 2)
  )
  expect_type(result, "list")
})

test_that("get_widest_paths_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(get_widest_paths_impl(
    graph = NULL,
    from = 1,
    to = 3
  ))
})

# and much more halucination before...
# 91-96: halucination of get_shortest_path_*
# 97-100: halucination of get_widest_path_cutoff_impl,get_widest_paths_cutoff_impl, widest_path_widths_dijkstra_cutoff_impl, widest_path_widths_floyd_warshall_cutoff_impl

# 101. path_length_hist_impl

test_that("path_length_hist_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(path_length_hist_impl(
    graph = g
  ))
  expect_snapshot(path_length_hist_impl(
    graph = g,
    directed = FALSE
  ))

  # Structured tests
  result <- path_length_hist_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("path_length_hist_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(path_length_hist_impl(
    graph = NULL
  ))
})

# 150. eccentricity_dijkstra_impl

test_that("eccentricity_dijkstra_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(eccentricity_dijkstra_impl(
    graph = g
  ))
  expect_snapshot(eccentricity_dijkstra_impl(
    graph = g,
    mode = "in"
  ))

  # Structured tests
  result <- eccentricity_dijkstra_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("eccentricity_dijkstra_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(eccentricity_dijkstra_impl(
    graph = NULL
  ))
})

# 151. graph_center_dijkstra_impl

test_that("graph_center_dijkstra_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(graph_center_dijkstra_impl(
    graph = g
  ))
  expect_snapshot(graph_center_dijkstra_impl(
    graph = g,
    mode = "in"
  ))

  # Structured tests
  result <- graph_center_dijkstra_impl(
    graph = g
  )
  expect_s3_class(result, "igraph.vs")
})

test_that("graph_center_dijkstra_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(graph_center_dijkstra_impl(
    graph = NULL
  ))
})

# 152. radius_dijkstra_impl

test_that("radius_dijkstra_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(radius_dijkstra_impl(
    graph = g
  ))
  expect_snapshot(radius_dijkstra_impl(
    graph = g,
    mode = "in"
  ))

  # Structured tests
  result <- radius_dijkstra_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("radius_dijkstra_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(radius_dijkstra_impl(
    graph = NULL
  ))
})

# 153. pseudo_diameter_impl

test_that("pseudo_diameter_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(pseudo_diameter_impl(
    graph = g,
    start_vid = 1
  ))
  expect_snapshot(pseudo_diameter_impl(
    graph = g,
    start_vid = 1,
    directed = FALSE,
    unconnected = FALSE
  ))

  # Structured tests
  result <- pseudo_diameter_impl(
    graph = g,
    start_vid = 1
  )
  expect_type(result, "list")
})

test_that("pseudo_diameter_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(pseudo_diameter_impl(
    graph = NULL,
    start_vid = 1
  ))
})

# 154. pseudo_diameter_dijkstra_impl

test_that("pseudo_diameter_dijkstra_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(pseudo_diameter_dijkstra_impl(
    graph = g,
    start_vid = 1
  ))
  expect_snapshot(pseudo_diameter_dijkstra_impl(
    graph = g,
    start_vid = 1,
    directed = FALSE,
    unconnected = FALSE
  ))

  # Structured tests
  result <- pseudo_diameter_dijkstra_impl(
    graph = g,
    start_vid = 1
  )
  expect_type(result, "list")
})

test_that("pseudo_diameter_dijkstra_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    pseudo_diameter_dijkstra_impl(
      graph = NULL,
      start_vid = 1
    )
  )
})

# 332. vertex_path_from_edge_path_impl

test_that("vertex_path_from_edge_path_impl basic", {
  igraph_local_seed(12345)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(vertex_path_from_edge_path_impl(
    graph = g,
    start = 1,
    edge_path = c(1, 2)
  ))
  expect_snapshot(vertex_path_from_edge_path_impl(
    graph = g,
    start = 1,
    edge_path = c(1),
    mode = "in"
  ))

  # Structured tests
  result <- vertex_path_from_edge_path_impl(
    graph = g,
    start = 1,
    edge_path = c(1, 2)
  )
  expect_s3_class(result, "igraph.vs")
})

test_that("vertex_path_from_edge_path_impl errors", {
  igraph_local_seed(12345)
  expect_snapshot_igraph_error(
    vertex_path_from_edge_path_impl(
      graph = NULL,
      start = 1,
      edge_path = c(1, 2)
    )
  )
})

# 345. girth_impl

test_that("girth_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(5)
  result <- girth_impl(
    graph = g
  )
  expect_snapshot(result$girth)
})

test_that("girth_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(girth_impl(
    graph = NULL
  ))
})

# Distance and path functions

test_that("distances_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(5)
  expect_snapshot(distances_impl(
    graph = g,
    from = V(g),
    to = V(g),
    mode = c("out", "in", "all", "total")
  ))
})

test_that("diameter_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(10)
  expect_snapshot(diameter_impl(
    graph = g,
    directed = FALSE,
    unconnected = TRUE
  ))
})

test_that("get_shortest_paths_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(5)
  expect_snapshot(get_shortest_paths_impl(
    graph = g,
    from = 1,
    to = 3,
    mode = c("out", "in", "all", "total")
  ))
})

# Additional distance functions

test_that("eccentricity_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(5)
  expect_snapshot(eccentricity_impl(
    graph = g,
    vids = V(g),
    mode = c("out", "in", "all")
  ))
})

test_that("radius_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(5)
  expect_snapshot(radius_impl(graph = g, mode = c("out", "in", "all")))
})

test_that("graph_center_impl basic", {
  igraph_local_seed(20250909)
  g <- make_star(5, mode = "undirected")
  expect_snapshot(graph_center_impl(graph = g, mode = c("out", "in", "all")))
})

test_that("voronoi_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(10)
  expect_snapshot(voronoi_impl(
    graph = g,
    generators = c(1, 5),
    mode = c("out", "in", "all")
  ))
})
