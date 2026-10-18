# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 1. empty_impl
test_that("empty_impl basic", {
  igraph_local_seed(20250909)

  expect_snapshot(empty_impl())
  expect_snapshot(empty_impl(
    n = 5,
    directed = FALSE
  ))

  # Structured tests
  g1 <- empty_impl()
  expect_s3_class(g1, "igraph")
  expect_equal(vcount(g1), 0)
  expect_equal(ecount(g1), 0)
  expect_true(is_directed(g1))

  g2 <- empty_impl(
    n = 5,
    directed = FALSE
  )
  expect_s3_class(g2, "igraph")
  expect_equal(vcount(g2), 5)
  expect_equal(ecount(g2), 0)
  expect_false(is_directed(g2))
})

test_that("empty_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(empty_impl(
    n = -1
  ))
})

# 2. add_edges_impl

test_that("add_edges_impl basic", {
  igraph_local_seed(20250909)
  g <- empty_impl(
    n = 3
  )

  expect_snapshot(add_edges_impl(
    graph = g,
    edges = c(1, 2, 2, 3)
  ))

  # Structured tests
  result <- add_edges_impl(
    graph = g,
    edges = c(1, 2, 2, 3)
  )
  expect_s3_class(result, "igraph")
  expect_equal(vcount(result), 3)
  expect_equal(ecount(result), 2)
})

test_that("add_edges_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(add_edges_impl(
    graph = NULL,
    edges = c(1, 2)
  ))
})

# 3. copy_impl

test_that("copy_impl basic", {
  igraph_local_seed(20250909)
  g <- empty_impl(
    n = 2
  )

  expect_snapshot(copy_impl(
    from = g
  ))

  # Structured tests
  result <- copy_impl(
    from = g
  )
  expect_s3_class(result, "igraph")
  expect_equal(vcount(result), vcount(g))
  expect_equal(ecount(result), ecount(g))
  expect_equal(is_directed(result), is_directed(g))
})

test_that("copy_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(copy_impl(
    from = NULL
  ))
})

# 4. delete_vertices_idx_impl

test_that("delete_vertices_idx_impl basic", {
  igraph_local_seed(20250909)
  g <- empty_impl(
    n = 3
  )

  expect_snapshot(delete_vertices_idx_impl(
    graph = g,
    vertices = 1
  ))

  # Structured tests
  result <- delete_vertices_idx_impl(
    graph = g,
    vertices = 1
  )
  expect_type(result, "list")
  expect_named(result, c("graph", "idx", "invidx"))
  expect_s3_class(result$graph, "igraph")
  expect_equal(vcount(result$graph), 2)
})

test_that("delete_vertices_idx_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(delete_vertices_idx_impl(
    graph = NULL,
    vertices = 1
  ))
})

# 5. vcount_impl

test_that("vcount_impl basic", {
  igraph_local_seed(20250909)
  g <- empty_impl(
    n = 4
  )

  expect_snapshot(vcount_impl(
    graph = g
  ))

  # Structured tests
  result <- vcount_impl(
    graph = g
  )
  expect_type(result, "double")
  expect_length(result, 1)
  expect_equal(result, 4)
})

test_that("vcount_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(vcount_impl(
    graph = NULL
  ))
})

# 6. degree_impl

test_that("degree_impl basic", {
  igraph_local_seed(20250909)
  g <- empty_impl(
    n = 3
  )

  expect_snapshot(degree_impl(
    graph = g
  ))
  expect_snapshot(degree_impl(
    graph = g,
    mode = "in"
  ))

  # Structured tests
  result <- degree_impl(
    graph = g
  )
  expect_type(result, "double")
  expect_length(result, 3)
  expect_equal(result, c(0, 0, 0))
})

test_that("degree_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(degree_impl(
    graph = NULL
  ))
})

# 7. get_all_eids_between_impl

test_that("get_all_eids_between_impl basic", {
  igraph_local_seed(20250909)
  g <- empty_impl(
    n = 2
  )

  expect_snapshot(get_all_eids_between_impl(
    graph = g,
    from = 1,
    to = 2
  ))

  # Structured tests
  result <- get_all_eids_between_impl(
    graph = g,
    from = 1,
    to = 2
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("get_all_eids_between_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(get_all_eids_between_impl(
    graph = NULL,
    from = 1,
    to = 2
  ))
})

# 331. invalidate_cache_impl

test_that("invalidate_cache_impl basic", {
  igraph_local_seed(12345)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(invalidate_cache_impl(
    graph = g
  ))

  # Structured tests
  result <- invalidate_cache_impl(
    graph = g
  )
  expect_s3_class(result, "igraph")
})

test_that("invalidate_cache_impl errors", {
  igraph_local_seed(12345)
  expect_snapshot_igraph_error(invalidate_cache_impl(
    graph = NULL
  ))
})

# 334. ecount_impl

test_that("ecount_impl basic", {
  igraph_local_seed(20250909)
  g <- make_empty_graph(5)
  expect_snapshot(ecount_impl(
    graph = g
  ))

  g <- make_graph(c(1, 2, 2, 3, 3, 4), n = 4, directed = TRUE)
  expect_snapshot(ecount_impl(
    graph = g
  ))
})

test_that("ecount_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(ecount_impl(
    graph = NULL
  ))
})

# 335. is_directed_impl

test_that("is_directed_impl basic", {
  igraph_local_seed(20250909)
  g <- make_empty_graph(5, directed = TRUE)
  expect_snapshot(is_directed_impl(
    graph = g
  ))

  g <- make_empty_graph(5, directed = FALSE)
  expect_snapshot(is_directed_impl(
    graph = g
  ))
})

test_that("is_directed_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_directed_impl(
    graph = NULL
  ))
})

# 336. edges_impl

test_that("edges_impl basic", {
  igraph_local_seed(20250909)
  g <- make_graph(c(1, 2, 2, 3, 3, 4), n = 4, directed = TRUE)

  # Get all edges
  expect_snapshot(edges_impl(
    graph = g,
    eids = E(g)
  ))

  # Get specific edges
  expect_snapshot(edges_impl(
    graph = g,
    eids = c(1, 3)
  ))
})

test_that("edges_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(edges_impl(
    graph = NULL,
    eids = 1
  ))
})

# 337. add_vertices_impl

test_that("add_vertices_impl basic", {
  igraph_local_seed(20250909)
  g <- make_empty_graph(3)

  g_new <- add_vertices_impl(
    graph = g,
    nv = 2
  )
  expect_snapshot(vcount(g_new))
})

test_that("add_vertices_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(add_vertices_impl(
    graph = NULL,
    nv = 1
  ))
})

# 338. delete_edges_impl

test_that("delete_edges_impl basic", {
  igraph_local_seed(20250909)
  g <- make_graph(c(1, 2, 2, 3, 3, 4), n = 4, directed = TRUE)

  g_new <- delete_edges_impl(
    graph = g,
    edges = c(1, 2)
  )
  expect_snapshot(ecount(g_new))
})

test_that("delete_edges_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(delete_edges_impl(
    graph = NULL,
    edges = 1
  ))
})

# 339. delete_vertices_impl

test_that("delete_vertices_impl basic", {
  igraph_local_seed(20250909)
  g <- make_graph(c(1, 2, 2, 3, 3, 4), n = 4, directed = TRUE)

  g_new <- delete_vertices_impl(
    graph = g,
    vertices = c(1, 3)
  )
  expect_snapshot(vcount(g_new))
})

test_that("delete_vertices_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(delete_vertices_impl(
    graph = NULL,
    vertices = 1
  ))
})

# 340. incident_impl

test_that("incident_impl basic", {
  igraph_local_seed(20250909)
  local_igraph_options(return.vs_es = FALSE)
  g <- make_graph(c(1, 2, 2, 3, 3, 1), n = 3, directed = TRUE)

  expect_snapshot(incident_impl(
    graph = g,
    vid = 2,
    mode = "out"
  ))
  expect_snapshot(incident_impl(
    graph = g,
    vid = 2,
    mode = "in"
  ))
  expect_snapshot(incident_impl(
    graph = g,
    vid = 2,
    mode = "all"
  ))
})

test_that("incident_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(incident_impl(
    graph = NULL,
    vid = 1
  ))
})

# get_eid_impl
test_that("get_eid_impl basic", {
  igraph_local_seed(20250909)
  g <- add_edges_impl(empty_impl(n = 5), c(0, 1, 1, 2, 2, 3, 3, 4) + 1)

  expect_snapshot(get_eid_impl(
    graph = g,
    from = 1,
    to = 2
  ))

  # Structured tests
  result <- get_eid_impl(
    graph = g,
    from = 1,
    to = 2
  )
  expect_s3_class(result, "igraph.es")
  expect_length(result, 1)

  # Test that it finds the correct edge
  result_int <- as.integer(result)
  expect_equal(result_int, 1L) # First edge is 0->1

  # Test directed vs undirected
  result_directed <- get_eid_impl(
    graph = g,
    from = 2,
    to = 1,
    directed = TRUE,
    error = FALSE
  )
  # No edge from 2 to 1 in directed graph, returns empty edge sequence
  expect_length(result_directed, 0)
})

test_that("get_eid_impl errors", {
  igraph_local_seed(20250909)
  g <- add_edges_impl(empty_impl(n = 3), c(0, 1, 1, 2) + 1)

  expect_snapshot_igraph_error(get_eid_impl(
    graph = NULL,
    from = 1,
    to = 2
  ))

  # Test error when from or to is not exactly one vertex
  expect_snapshot_igraph_error(get_eid_impl(
    graph = g,
    from = c(1, 2),
    to = 2
  ))

  expect_snapshot_igraph_error(get_eid_impl(
    graph = g,
    from = 1,
    to = integer(0)
  ))
})
