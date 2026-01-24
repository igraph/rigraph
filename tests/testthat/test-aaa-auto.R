# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# NOTE: This file tests all auto-generated _impl functions.
# According to the issue, each function should have:
# 1. Snapshot tests (using expect_snapshot) - captures the full output
# 2. Structured tests (using regular expectations) - tests specific aspects
#
# The first several functions demonstrate this pattern with comprehensive
# structured tests. For remaining functions, structured tests should be added
# as they are enhanced or when bugs are found.

# 1. empty_impl
test_that("empty_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)

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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(empty_impl(
    n = -1
  ))
})

# 2. add_edges_impl

test_that("add_edges_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- empty_impl(
    n = 3
  )

  expect_snapshot(add_edges_impl(
    graph = g,
    edges = c(0, 1, 1, 2)
  ))

  # Structured tests
  result <- add_edges_impl(
    graph = g,
    edges = c(0, 1, 1, 2)
  )
  expect_s3_class(result, "igraph")
  expect_equal(vcount(result), 3)
  expect_equal(ecount(result), 2)
})

test_that("add_edges_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(add_edges_impl(
    graph = NULL,
    edges = c(1, 2)
  ))
})

# 3. copy_impl

test_that("copy_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(copy_impl(
    from = NULL
  ))
})

# 4. delete_vertices_idx_impl

test_that("delete_vertices_idx_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(delete_vertices_idx_impl(
    graph = NULL,
    vertices = 1
  ))
})

# 5. vcount_impl

test_that("vcount_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(vcount_impl(
    graph = NULL
  ))
})

# 6. degree_impl

test_that("degree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(degree_impl(
    graph = NULL
  ))
})

# 7. get_all_eids_between_impl

test_that("get_all_eids_between_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_all_eids_between_impl(
    graph = NULL,
    from = 1,
    to = 2
  ))
})

# 8. wheel_impl

test_that("wheel_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(wheel_impl(
    n = 5
  ))
  expect_snapshot(wheel_impl(
    n = 5,
    mode = "in",
    center = 2
  ))

  # Structured tests
  result <- wheel_impl(
    n = 5
  )
  expect_s3_class(result, "igraph")
})

test_that("wheel_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(wheel_impl(
    n = -1
  ))
})

# 9. hypercube_impl

test_that("hypercube_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(hypercube_impl(
    n = 3
  ))
  expect_snapshot(hypercube_impl(
    n = 3,
    directed = TRUE
  ))

  # Structured tests
  result <- hypercube_impl(
    n = 3
  )
  expect_s3_class(result, "igraph")
})

test_that("hypercube_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(hypercube_impl(
    n = 10000
  ))
})

# 10. square_lattice_impl

test_that("square_lattice_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(square_lattice_impl(
    dimvector = c(2, 2)
  ))
  expect_snapshot(square_lattice_impl(
    dimvector = c(2, 2),
    nei = 2,
    directed = TRUE,
    mutual = TRUE,
    periodic = c(TRUE, TRUE)
  ))

  # Structured tests
  result <- square_lattice_impl(
    dimvector = c(2, 2)
  )
  expect_s3_class(result, "igraph")
})

test_that("square_lattice_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(square_lattice_impl(
    dimvector = -1
  ))
})

# 11. triangular_lattice_impl

test_that("triangular_lattice_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(triangular_lattice_impl(
    dimvector = c(2, 2)
  ))
  expect_snapshot(triangular_lattice_impl(
    dimvector = c(2, 2),
    directed = TRUE,
    mutual = TRUE
  ))

  # Structured tests
  result <- triangular_lattice_impl(
    dimvector = c(2, 2)
  )
  expect_s3_class(result, "igraph")
})

test_that("triangular_lattice_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(triangular_lattice_impl(
    dimvector = -1
  ))
})

# 12. path_graph_impl

test_that("path_graph_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(path_graph_impl(
    n = 5
  ))
  expect_snapshot(path_graph_impl(
    n = 5,
    directed = TRUE,
    mutual = TRUE
  ))

  # Structured tests
  result <- path_graph_impl(
    n = 5
  )
  expect_s3_class(result, "igraph")
})

test_that("path_graph_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(path_graph_impl(
    n = -1
  ))
})

# 13. cycle_graph_impl

test_that("cycle_graph_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(cycle_graph_impl(
    n = 5
  ))
  expect_snapshot(cycle_graph_impl(
    n = 5,
    directed = TRUE,
    mutual = TRUE
  ))

  # Structured tests
  result <- cycle_graph_impl(
    n = 5
  )
  expect_s3_class(result, "igraph")
})

test_that("cycle_graph_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(cycle_graph_impl(
    n = -1
  ))
})

# 14. symmetric_tree_impl

test_that("symmetric_tree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(symmetric_tree_impl(
    branches = 3
  ))
  expect_snapshot(symmetric_tree_impl(
    branches = 3,
    type = "in"
  ))

  # Structured tests
  result <- symmetric_tree_impl(
    branches = 3
  )
  expect_s3_class(result, "igraph")
})

test_that("symmetric_tree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(symmetric_tree_impl(
    branches = -1
  ))
})

# 15. regular_tree_impl

test_that("regular_tree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(regular_tree_impl(
    h = 2
  ))
  expect_snapshot(regular_tree_impl(
    h = 2,
    k = 4,
    type = "in"
  ))

  # Structured tests
  result <- regular_tree_impl(
    h = 2
  )
  expect_s3_class(result, "igraph")
})

test_that("regular_tree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(regular_tree_impl(
    h = -1
  ))
})

# 16. full_citation_impl

test_that("full_citation_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(full_citation_impl(
    n = 5
  ))
  expect_snapshot(full_citation_impl(
    n = 5,
    directed = FALSE
  ))

  # Structured tests
  result <- full_citation_impl(
    n = 5
  )
  expect_s3_class(result, "igraph")
})

test_that("full_citation_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(full_citation_impl(
    n = -1
  ))
})

# 17. atlas_impl

test_that("atlas_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(atlas_impl(
    number = 0
  ))
  expect_snapshot(atlas_impl(
    number = 5
  ))

  # Structured tests
  result <- atlas_impl(
    number = 0
  )
  expect_s3_class(result, "igraph")
})

test_that("atlas_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(atlas_impl(
    number = -1
  ))
})

# 18. extended_chordal_ring_impl

test_that("extended_chordal_ring_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(extended_chordal_ring_impl(
    nodes = 5,
    W = matrix(c(1, 2))
  ))
  expect_snapshot(extended_chordal_ring_impl(
    nodes = 5,
    W = matrix(c(1, 2)),
    directed = TRUE
  ))

  # Structured tests
  result <- extended_chordal_ring_impl(
    nodes = 5,
    W = matrix(c(1, 2))
  )
  expect_s3_class(result, "igraph")
})

test_that("extended_chordal_ring_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(extended_chordal_ring_impl(
    nodes = -1,
    W = matrix(c(1, 2))
  ))
})

# 19. graph_power_impl

test_that("graph_power_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 5
  )

  expect_snapshot(graph_power_impl(
    graph = g,
    order = 2
  ))
  expect_snapshot(graph_power_impl(
    graph = g,
    order = 2,
    directed = TRUE
  ))

  # Structured tests
  result <- graph_power_impl(
    graph = g,
    order = 2
  )
  expect_s3_class(result, "igraph")
})

test_that("graph_power_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(graph_power_impl(
    graph = NULL,
    order = 2
  ))
})

# 20. linegraph_impl

test_that("linegraph_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 5
  )

  expect_snapshot(linegraph_impl(
    graph = g
  ))

  # Structured tests
  result <- linegraph_impl(
    graph = g
  )
  expect_s3_class(result, "igraph")
})

test_that("linegraph_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(linegraph_impl(
    graph = NULL
  ))
})

# 21. de_bruijn_impl
test_that("de_bruijn_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(de_bruijn_impl(
    m = 2,
    n = 3
  ))

  # Structured tests
  result <- de_bruijn_impl(
    m = 2,
    n = 3
  )
  expect_s3_class(result, "igraph")
})
test_that("de_bruijn_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(de_bruijn_impl(
    m = -1,
    n = 3
  ))
})

# 22. kautz_impl
test_that("kautz_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(kautz_impl(
    m = 2,
    n = 3
  ))

  # Structured tests
  result <- kautz_impl(
    m = 2,
    n = 3
  )
  expect_s3_class(result, "igraph")
})
test_that("kautz_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(kautz_impl(
    m = -1,
    n = 3
  ))
})

# 23. lcf_vector_impl
test_that("lcf_vector_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(lcf_vector_impl(
    n = 10,
    shifts = c(3, -3, 4),
    repeats = 2
  ))

  # Structured tests
  result <- lcf_vector_impl(
    n = 10,
    shifts = c(3, -3, 4),
    repeats = 2
  )
  expect_s3_class(result, "igraph")
})
test_that("lcf_vector_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(lcf_vector_impl(
    n = -1,
    shifts = c(3, -3, 4),
    repeats = 2
  ))
})

# 24. mycielski_graph_impl
test_that("mycielski_graph_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(mycielski_graph_impl(
    k = 3
  ))

  # Structured tests
  result <- mycielski_graph_impl(
    k = 3
  )
  expect_s3_class(result, "igraph")
})
test_that("mycielski_graph_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(mycielski_graph_impl(
    k = -1
  ))
})

# 25. adjlist_impl
test_that("adjlist_impl basic", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(adjlist_impl(
    adjlist = list(c(2, 3), c(1), c(1)),
    mode = "out"
  ))

  # Structured tests
  result <- adjlist_impl(
    adjlist = list(c(2, 3), c(1), c(1)),
    mode = "out"
  )
  expect_s3_class(result, "igraph")
})
test_that("adjlist_impl errors", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(adjlist_impl(
    adjlist = -1,
    mode = "out"
  ))
})

# 26. full_bipartite_impl
test_that("full_bipartite_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(full_bipartite_impl(
    n1 = 2,
    n2 = 3
  ))
  expect_snapshot(full_bipartite_impl(
    n1 = 2,
    n2 = 3,
    directed = TRUE,
    mode = "in"
  ))

  # Structured tests
  result <- full_bipartite_impl(
    n1 = 2,
    n2 = 3
  )
  expect_type(result, "list")
})
test_that("full_bipartite_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(full_bipartite_impl(
    n1 = -1,
    n2 = 3
  ))
})

# 27. full_multipartite_impl
test_that("full_multipartite_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(full_multipartite_impl(
    n = c(2, 3, 4)
  ))
  expect_snapshot(full_multipartite_impl(
    n = c(2, 3, 4),
    directed = TRUE,
    mode = "in"
  ))

  # Structured tests
  result <- full_multipartite_impl(
    n = c(2, 3, 4)
  )
  expect_type(result, "list")
})
test_that("full_multipartite_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(full_multipartite_impl(
    n = -1
  ))
})

# 28. realize_degree_sequence_impl
test_that("realize_degree_sequence_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(realize_degree_sequence_impl(
    out_deg = c(2, 2, 2)
  ))
  expect_snapshot(realize_degree_sequence_impl(
    out_deg = c(2, 2, 2),
    in_deg = c(2, 2, 2),
    allowed_edge_types = "simple",
    method = "largest"
  ))

  # Structured tests
  result <- realize_degree_sequence_impl(
    out_deg = c(2, 2, 2)
  )
  expect_s3_class(result, "igraph")
})
test_that("realize_degree_sequence_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(realize_degree_sequence_impl(
    out_deg = -1
  ))
})

# 29. realize_bipartite_degree_sequence_impl
test_that("realize_bipartite_degree_sequence_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(realize_bipartite_degree_sequence_impl(
    degrees1 = c(2, 2),
    degrees2 = c(2, 2)
  ))
  expect_snapshot(realize_bipartite_degree_sequence_impl(
    degrees1 = c(2, 2),
    degrees2 = c(2, 2),
    allowed_edge_types = "loops",
    method = "largest"
  ))

  # Structured tests
  result <- realize_bipartite_degree_sequence_impl(
    degrees1 = c(2, 2),
    degrees2 = c(2, 2)
  )
  expect_s3_class(result, "igraph")
})
test_that("realize_bipartite_degree_sequence_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    realize_bipartite_degree_sequence_impl(
      degrees1 = -1,
      degrees2 = c(2, 2)
    )
  )
})

# 30. circulant_impl
test_that("circulant_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(circulant_impl(
    n = 5,
    shifts = c(1, 2)
  ))
  expect_snapshot(circulant_impl(
    n = 5,
    shifts = c(1, 2),
    directed = TRUE
  ))

  # Structured tests
  result <- circulant_impl(
    n = 5,
    shifts = c(1, 2)
  )
  expect_s3_class(result, "igraph")
})
test_that("circulant_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(circulant_impl(
    n = -1,
    shifts = c(1, 2)
  ))
})

# 31. generalized_petersen_impl
test_that("generalized_petersen_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(generalized_petersen_impl(
    n = 5,
    k = 2
  ))

  # Structured tests
  result <- generalized_petersen_impl(
    n = 5,
    k = 2
  )
  expect_s3_class(result, "igraph")
})
test_that("generalized_petersen_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(generalized_petersen_impl(
    n = -1,
    k = 2
  ))
})

# 32. turan_impl
test_that("turan_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(turan_impl(
    n = 5,
    r = 2
  ))

  # Structured tests
  result <- turan_impl(
    n = 5,
    r = 2
  )
  expect_type(result, "list")
})
test_that("turan_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(turan_impl(
    n = -1,
    r = 2
  ))
})

# 33. erdos_renyi_game_gnp_impl
test_that("erdos_renyi_game_gnp_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(erdos_renyi_game_gnp_impl(
    n = 5,
    p = 0.5
  ))
  expect_snapshot(erdos_renyi_game_gnp_impl(
    n = 5,
    p = 0.5,
    directed = TRUE,
    loops = TRUE
  ))

  # Structured tests
  result <- erdos_renyi_game_gnp_impl(
    n = 5,
    p = 0.5
  )
  expect_s3_class(result, "igraph")
})
test_that("erdos_renyi_game_gnp_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(erdos_renyi_game_gnp_impl(
    n = -1,
    p = 0.5
  ))
})

# 34. erdos_renyi_game_gnm_impl
test_that("erdos_renyi_game_gnm_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(erdos_renyi_game_gnm_impl(
    n = 5,
    m = 3
  ))
  expect_snapshot(erdos_renyi_game_gnm_impl(
    n = 5,
    m = 3,
    directed = TRUE,
    loops = TRUE
  ))

  # Structured tests
  result <- erdos_renyi_game_gnm_impl(
    n = 5,
    m = 3
  )
  expect_s3_class(result, "igraph")
})
test_that("erdos_renyi_game_gnm_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(erdos_renyi_game_gnm_impl(
    n = -1,
    m = 3
  ))
})

# 35. growing_random_game_impl
test_that("growing_random_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(growing_random_game_impl(
    n = 5,
    m = 2
  ))
  expect_snapshot(growing_random_game_impl(
    n = 5,
    m = 2,
    directed = FALSE,
    citation = TRUE
  ))

  # Structured tests
  result <- growing_random_game_impl(
    n = 5,
    m = 2
  )
  expect_s3_class(result, "igraph")
})
test_that("growing_random_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(growing_random_game_impl(
    n = -1,
    m = 2
  ))
})

# 36. preference_game_impl
test_that("preference_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(preference_game_impl(
    nodes = 5,
    types = 2,
    type_dist = c(0.5, 0.5),
    fixed_sizes = FALSE,
    pref_matrix = matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2)
  ))

  # Structured tests
  result <- preference_game_impl(
    nodes = 5,
    types = 2,
    type_dist = c(0.5, 0.5),
    fixed_sizes = FALSE,
    pref_matrix = matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2)
  )
  expect_type(result, "list")
})
test_that("preference_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    preference_game_impl(
      nodes = -1,
      types = 2,
      type_dist = c(0.5, 0.5),
      fixed_sizes = FALSE,
      pref_matrix = matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2)
    )
  )
})

# 37. asymmetric_preference_game_impl
test_that("asymmetric_preference_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(asymmetric_preference_game_impl(
    nodes = 5,
    out_types = 2,
    in_types = 2,
    type_dist_matrix = matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2),
    pref_matrix = matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2)
  ))

  # Structured tests
  result <- asymmetric_preference_game_impl(
    nodes = 5,
    out_types = 2,
    in_types = 2,
    type_dist_matrix = matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2),
    pref_matrix = matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2)
  )
  expect_type(result, "list")
})
test_that("asymmetric_preference_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    asymmetric_preference_game_impl(
      nodes = -1,
      out_types = 2,
      in_types = 2,
      type_dist_matrix = matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2),
      pref_matrix = matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2)
    )
  )
})

# 38. rewire_edges_impl
test_that("rewire_edges_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 5
  )

  expect_snapshot(rewire_edges_impl(
    graph = g,
    prob = 0.5
  ))

  # Structured tests
  result <- rewire_edges_impl(
    graph = g,
    prob = 0.5
  )
  expect_s3_class(result, "igraph")
})
test_that("rewire_edges_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(rewire_edges_impl(
    graph = NULL,
    prob = 0.5
  ))
})

# 39. rewire_directed_edges_impl
test_that("rewire_directed_edges_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 5,
    directed = TRUE
  )

  expect_snapshot(rewire_directed_edges_impl(
    graph = g,
    prob = 0.5
  ))

  # Structured tests
  result <- rewire_directed_edges_impl(
    graph = g,
    prob = 0.5
  )
  expect_s3_class(result, "igraph")
})
test_that("rewire_directed_edges_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(rewire_directed_edges_impl(
    graph = NULL,
    prob = 0.5
  ))
})

# 40. forest_fire_game_impl
test_that("forest_fire_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(forest_fire_game_impl(
    nodes = 5,
    fw_prob = 0.5
  ))
  expect_snapshot(forest_fire_game_impl(
    nodes = 5,
    fw_prob = 0.5,
    bw_factor = 0.2,
    ambs = 2,
    directed = FALSE
  ))

  # Structured tests
  result <- forest_fire_game_impl(
    nodes = 5,
    fw_prob = 0.5
  )
  expect_s3_class(result, "igraph")
})
test_that("forest_fire_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(forest_fire_game_impl(
    nodes = -1,
    fw_prob = 0.5
  ))
})

# 41. simple_interconnected_islands_game_impl
test_that("simple_interconnected_islands_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(simple_interconnected_islands_game_impl(
    islands_n = 2,
    islands_size = 3,
    islands_pin = 0.5,
    n_inter = 1
  ))

  # Structured tests
  result <- simple_interconnected_islands_game_impl(
    islands_n = 2,
    islands_size = 3,
    islands_pin = 0.5,
    n_inter = 1
  )
  expect_s3_class(result, "igraph")
})
test_that("simple_interconnected_islands_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    simple_interconnected_islands_game_impl(
      islands_n = -1,
      islands_size = 3,
      islands_pin = 0.5,
      n_inter = 1
    )
  )
})

# 42. chung_lu_game_impl
test_that("chung_lu_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(chung_lu_game_impl(
    out_weights = c(2, 2, 2)
  ))
  expect_snapshot(chung_lu_game_impl(
    out_weights = c(1, 2, 3),
    in_weights = c(1, 2, 3),
    loops = FALSE,
    variant = "maxent"
  ))

  # Structured tests
  result <- chung_lu_game_impl(
    out_weights = c(2, 2, 2)
  )
  expect_s3_class(result, "igraph")
})
test_that("chung_lu_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(chung_lu_game_impl(
    out_weights = -1
  ))
})

# 43. static_fitness_game_impl
test_that("static_fitness_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(static_fitness_game_impl(
    no_of_edges = 3,
    fitness_out = c(1, 2, 3)
  ))
  expect_snapshot(static_fitness_game_impl(
    no_of_edges = 3,
    fitness_out = c(1, 2, 3),
    fitness_in = c(1, 2, 3),
    loops = TRUE,
    multiple = TRUE
  ))

  # Structured tests
  result <- static_fitness_game_impl(
    no_of_edges = 3,
    fitness_out = c(1, 2, 3)
  )
  expect_s3_class(result, "igraph")
})
test_that("static_fitness_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(static_fitness_game_impl(
    no_of_edges = -1,
    fitness_out = c(1, 2, 3)
  ))
})

# 44. static_power_law_game_impl
test_that("static_power_law_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(static_power_law_game_impl(
    no_of_nodes = 5,
    no_of_edges = 4,
    exponent_out = 2.5
  ))
  expect_snapshot(static_power_law_game_impl(
    no_of_nodes = 5,
    no_of_edges = 4,
    exponent_out = 2.5,
    exponent_in = 2,
    loops = TRUE,
    multiple = TRUE,
    finite_size_correction = FALSE
  ))

  # Structured tests
  result <- static_power_law_game_impl(
    no_of_nodes = 5,
    no_of_edges = 4,
    exponent_out = 2.5
  )
  expect_s3_class(result, "igraph")
})
test_that("static_power_law_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(static_power_law_game_impl(
    no_of_nodes = -1,
    no_of_edges = 4,
    exponent_out = 2.5
  ))
})

# 45. k_regular_game_impl

test_that("k_regular_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(k_regular_game_impl(
    no_of_nodes = 5,
    k = 2
  ))
  expect_snapshot(k_regular_game_impl(
    no_of_nodes = 5,
    k = 2,
    directed = TRUE,
    multiple = TRUE
  ))

  # Structured tests
  result <- k_regular_game_impl(
    no_of_nodes = 5,
    k = 2
  )
  expect_s3_class(result, "igraph")
})

test_that("k_regular_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(k_regular_game_impl(
    no_of_nodes = -1,
    k = 2
  ))
})

# 46. sbm_game_impl

test_that("sbm_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(sbm_game_impl(
    n = 5,
    pref_matrix = matrix(0.5, 2, 2),
    block_sizes = c(2, 3)
  ))
  expect_snapshot(sbm_game_impl(
    n = 5,
    pref_matrix = matrix(0.5, 2, 2),
    block_sizes = c(2, 3),
    directed = TRUE,
    loops = TRUE
  ))

  # Structured tests
  result <- sbm_game_impl(
    n = 5,
    pref_matrix = matrix(0.5, 2, 2),
    block_sizes = c(2, 3)
  )
  expect_s3_class(result, "igraph")
})

test_that("sbm_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(sbm_game_impl(
    n = -1,
    pref_matrix = matrix(0.5, 2, 2),
    block_sizes = c(2, 3)
  ))
})

# 47. hsbm_game_impl

test_that("hsbm_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(hsbm_game_impl(
    n = 6,
    m = 2,
    rho = c(0.5, 0.5),
    C = matrix(1, 2, 2),
    p = 0.5
  ))

  # Structured tests
  result <- hsbm_game_impl(
    n = 6,
    m = 2,
    rho = c(0.5, 0.5),
    C = matrix(1, 2, 2),
    p = 0.5
  )
  expect_s3_class(result, "igraph")
})

test_that("hsbm_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    hsbm_game_impl(
      n = -1,
      m = 2,
      rho = 0.5,
      C = matrix(1, 2, 2),
      p = 0.5
    )
  )
})

# 48. hsbm_list_game_impl

test_that("hsbm_list_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  C <- matrix(
    c(
      1,
      3 / 4,
      0,
      3 / 4,
      0,
      3 / 4,
      0,
      3 / 4,
      3 / 4
    ),
    nrow = 3
  )
  expect_snapshot(hsbm_list_game_impl(
    n = 100,
    mlist = list(50, 50),
    rholist = list(c(3, 3, 4) / 10),
    Clist = list(C),
    p = 1 / 20
  ))

  # Structured tests
  result <- hsbm_list_game_impl(
    n = 100,
    mlist = list(50, 50),
    rholist = list(c(3, 3, 4) / 10),
    Clist = list(C),
    p = 1 / 20
  )
  expect_s3_class(result, "igraph")
})

test_that("hsbm_list_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    hsbm_list_game_impl(
      n = -1,
      mlist = c(2, 3),
      rholist = list(0.5, 0.5),
      Clist = list(matrix(1, 2, 2), matrix(1, 2, 2)),
      p = 0.5
    )
  )
})

# 49. correlated_game_impl

test_that("correlated_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 5
  )

  expect_snapshot(correlated_game_impl(
    old_graph = g,
    corr = 0.5
  ))

  # Structured tests
  result <- correlated_game_impl(
    old_graph = g,
    corr = 0.5
  )
  expect_s3_class(result, "igraph")
})

test_that("correlated_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(correlated_game_impl(
    old_graph = NULL,
    corr = 0.5
  ))
})

# 50. correlated_pair_game_impl

test_that("correlated_pair_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(correlated_pair_game_impl(
    n = 5,
    corr = 0.5,
    p = 0.5
  ))
  expect_snapshot(correlated_pair_game_impl(
    n = 5,
    corr = 0.5,
    p = 0.5,
    directed = TRUE
  ))

  # Structured tests
  result <- correlated_pair_game_impl(
    n = 5,
    corr = 0.5,
    p = 0.5
  )
  expect_type(result, "list")
})

test_that("correlated_pair_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(correlated_pair_game_impl(
    n = -1,
    corr = 0.5,
    p = 0.5
  ))
})

# 51. dot_product_game_impl

test_that("dot_product_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(dot_product_game_impl(
    vecs = matrix(0.5, 5, 2)
  ))
  expect_snapshot(dot_product_game_impl(
    vecs = matrix(0.5, 5, 2),
    directed = TRUE
  ))

  # Structured tests
  result <- dot_product_game_impl(
    vecs = matrix(0.5, 0.2, 1)
  )
  expect_s3_class(result, "igraph")
})

test_that("dot_product_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(dot_product_game_impl(
    vecs = NULL
  ))
})

# 52. sample_sphere_surface_impl

test_that("sample_sphere_surface_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(sample_sphere_surface_impl(
    dim = 3,
    n = 5
  ))
  expect_snapshot(sample_sphere_surface_impl(
    dim = 3,
    n = 5,
    radius = 2,
    positive = FALSE
  ))

  # Structured tests
  result <- sample_sphere_surface_impl(
    dim = 3,
    n = 5
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("sample_sphere_surface_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(sample_sphere_surface_impl(
    dim = -1,
    n = 5
  ))
})

# 53. sample_sphere_volume_impl

test_that("sample_sphere_volume_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(sample_sphere_volume_impl(
    dim = 3,
    n = 5
  ))
  expect_snapshot(sample_sphere_volume_impl(
    dim = 3,
    n = 5,
    radius = 2,
    positive = FALSE
  ))

  # Structured tests
  result <- sample_sphere_volume_impl(
    dim = 3,
    n = 5
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("sample_sphere_volume_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(sample_sphere_volume_impl(
    dim = -1,
    n = 5
  ))
})

# 54. sample_dirichlet_impl

test_that("sample_dirichlet_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(sample_dirichlet_impl(
    n = 5,
    alpha = c(1, 1, 1)
  ))

  # Structured tests
  result <- sample_dirichlet_impl(
    n = 5,
    alpha = c(1, 1, 1)
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("sample_dirichlet_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(sample_dirichlet_impl(
    n = -1,
    alpha = c(1, 1, 1)
  ))
})

# 55. are_adjacent_impl

test_that("are_adjacent_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(are_adjacent_impl(
    graph = g,
    v1 = 1,
    v2 = 2
  ))

  # Structured tests
  result <- are_adjacent_impl(
    graph = g,
    v1 = 1,
    v2 = 2
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("are_adjacent_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(are_adjacent_impl(
    graph = NULL,
    v1 = 1,
    v2 = 2
  ))
})

# 56. closeness_impl

test_that("closeness_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(closeness_impl(
    graph = g
  ))
  expect_snapshot(closeness_impl(
    graph = g,
    mode = "in",
    normalized = TRUE
  ))

  # Structured tests
  result <- closeness_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("closeness_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(closeness_impl(
    graph = NULL
  ))
})

# 57. closeness_cutoff_impl

test_that("closeness_cutoff_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(closeness_cutoff_impl(
    graph = g,
    cutoff = 2
  ))
  expect_snapshot(closeness_cutoff_impl(
    graph = g,
    mode = "in",
    normalized = TRUE,
    cutoff = 1
  ))

  # Structured tests
  result <- closeness_cutoff_impl(
    graph = g,
    cutoff = 2
  )
  expect_type(result, "list")
})

test_that("closeness_cutoff_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(closeness_cutoff_impl(
    graph = NULL
  ))
})

# 58. get_shortest_path_impl

test_that("get_shortest_path_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_shortest_path_impl(
    graph = NULL,
    from = 1,
    to = 3
  ))
})

# 59. get_shortest_path_bellman_ford_impl

test_that("get_shortest_path_bellman_ford_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_shortest_path_bellman_ford_impl(
    graph = NULL,
    from = 1,
    to = 3
  ))
})

# 60. get_shortest_path_dijkstra_impl

test_that("get_shortest_path_dijkstra_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_shortest_path_dijkstra_impl(
    graph = NULL,
    from = 1,
    to = 3
  ))
})

# 61. get_all_shortest_paths_impl

test_that("get_all_shortest_paths_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_all_shortest_paths_impl(
    graph = NULL,
    from = 1,
    to = 3
  ))
})

# 62. get_all_shortest_paths_dijkstra_impl

test_that("get_all_shortest_paths_dijkstra_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(voronoi_impl(
    graph = NULL,
    generators = 1
  ))
})

# 64. get_all_simple_paths_impl

test_that("get_all_simple_paths_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_all_simple_paths_impl(
    graph = NULL,
    from = 1,
    to = 3
  ))
})

# 65. get_k_shortest_paths_impl

test_that("get_k_shortest_paths_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_k_shortest_paths_impl(
    graph = NULL,
    from = 1,
    to = 3,
    k = 2
  ))
})

# 66. get_widest_path_impl

test_that("get_widest_path_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_widest_path_impl(
    graph = NULL,
    from = 1,
    to = 3
  ))
})

# 67. get_widest_paths_impl

test_that("get_widest_paths_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_widest_paths_impl(
    graph = NULL,
    from = 1,
    to = 3
  ))
})

# 70. spanner_impl

test_that("spanner_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(spanner_impl(
    graph = g,
    stretch = 2
  ))

  # Structured tests
  result <- spanner_impl(
    graph = g,
    stretch = 2
  )
  expect_s3_class(result, "igraph.es")
})

test_that("spanner_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(spanner_impl(
    graph = NULL,
    stretch = 2
  ))
})

# 71. betweenness_cutoff_impl

test_that("betweenness_cutoff_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(betweenness_cutoff_impl(
    graph = g,
    cutoff = 2
  ))

  # Structured tests
  result <- betweenness_cutoff_impl(
    graph = g,
    cutoff = 2
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("betweenness_cutoff_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(betweenness_cutoff_impl(
    graph = NULL,
    cutoff = 2
  ))
})

# 72. betweenness_subset_impl

test_that("betweenness_subset_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(betweenness_subset_impl(
    graph = g
  ))

  # Structured tests
  result <- betweenness_subset_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("betweenness_subset_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(betweenness_subset_impl(
    graph = NULL
  ))
})

# 73. edge_betweenness_impl

test_that("edge_betweenness_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(edge_betweenness_impl(
    graph = g
  ))

  # Structured tests
  result <- edge_betweenness_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("edge_betweenness_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(edge_betweenness_impl(
    graph = NULL
  ))
})

# 74. edge_betweenness_cutoff_impl

test_that("edge_betweenness_cutoff_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(edge_betweenness_cutoff_impl(
    graph = g,
    cutoff = 2
  ))

  # Structured tests
  result <- edge_betweenness_cutoff_impl(
    graph = g,
    cutoff = 2
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("edge_betweenness_cutoff_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(edge_betweenness_cutoff_impl(
    graph = NULL,
    cutoff = 2
  ))
})

# 75. edge_betweenness_subset_impl

test_that("edge_betweenness_subset_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(edge_betweenness_subset_impl(
    graph = g
  ))

  # Structured tests
  result <- edge_betweenness_subset_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("edge_betweenness_subset_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(edge_betweenness_subset_impl(
    graph = NULL
  ))
})

# 76. harmonic_centrality_cutoff_impl

test_that("harmonic_centrality_cutoff_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(harmonic_centrality_cutoff_impl(
    graph = g,
    cutoff = 2
  ))

  # Structured tests
  result <- harmonic_centrality_cutoff_impl(
    graph = g,
    cutoff = 2
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("harmonic_centrality_cutoff_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    harmonic_centrality_cutoff_impl(
      graph = NULL,
      cutoff = 2
    )
  )
})

# 77. personalized_pagerank_impl

test_that("personalized_pagerank_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(personalized_pagerank_impl(
    graph = g
  ))
  expect_snapshot(personalized_pagerank_impl(
    graph = g,
    algo = "arpack",
    damping = 0.9
  ))

  # Structured tests
  result <- personalized_pagerank_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("personalized_pagerank_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(personalized_pagerank_impl(
    graph = NULL
  ))
})

# 78. personalized_pagerank_vs_impl

test_that("personalized_pagerank_vs_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(personalized_pagerank_vs_impl(
    graph = g,
    reset_vids = 1
  ))
  expect_snapshot(personalized_pagerank_vs_impl(
    graph = g,
    algo = "arpack",
    reset_vids = 1,
    details = TRUE
  ))

  # Structured tests
  result <- personalized_pagerank_vs_impl(
    graph = g,
    reset_vids = 1
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("personalized_pagerank_vs_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    personalized_pagerank_vs_impl(
      graph = NULL,
      reset_vids = 1
    )
  )
})

# 79. induced_subgraph_impl

test_that("induced_subgraph_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(induced_subgraph_impl(
    graph = g,
    vids = 1:2
  ))

  # Structured tests
  result <- induced_subgraph_impl(
    graph = g,
    vids = 1:2
  )
  expect_s3_class(result, "igraph")
})

test_that("induced_subgraph_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(induced_subgraph_impl(
    graph = NULL,
    vids = 1:2
  ))
})

# 80. subgraph_from_edges_impl

test_that("subgraph_from_edges_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(subgraph_from_edges_impl(
    graph = g,
    eids = 1
  ))

  # Structured tests
  result <- subgraph_from_edges_impl(
    graph = g,
    eids = 1
  )
  expect_s3_class(result, "igraph")
})

test_that("subgraph_from_edges_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(subgraph_from_edges_impl(
    graph = NULL,
    eids = 1
  ))
})

# 81. reverse_edges_impl

test_that("reverse_edges_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(reverse_edges_impl(
    graph = g
  ))

  # Structured tests
  result <- reverse_edges_impl(
    graph = g
  )
  expect_s3_class(result, "igraph")
})

test_that("reverse_edges_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(reverse_edges_impl(
    graph = NULL
  ))
})

# and much more halucination before...
# 91-96: halucination of get_shortest_path_*
# 97-100: halucination of get_widest_path_cutoff_impl,get_widest_paths_cutoff_impl, widest_path_widths_dijkstra_cutoff_impl, widest_path_widths_floyd_warshall_cutoff_impl

# 101. path_length_hist_impl

test_that("path_length_hist_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(path_length_hist_impl(
    graph = NULL
  ))
})

# 102. simplify_impl

test_that("simplify_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(simplify_impl(
    graph = g
  ))
  expect_snapshot(simplify_impl(
    graph = g,
    remove_multiple = FALSE,
    remove_loops = FALSE
  ))

  # Structured tests
  result <- simplify_impl(
    graph = g
  )
  expect_s3_class(result, "igraph")
})

test_that("simplify_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(simplify_impl(
    graph = NULL
  ))
})

# 103. transitivity_undirected_impl

test_that("transitivity_undirected_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(transitivity_undirected_impl(
    graph = g
  ))
  expect_snapshot(transitivity_undirected_impl(
    graph = g,
    mode = "zero"
  ))

  # Structured tests
  result <- transitivity_undirected_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("transitivity_undirected_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(transitivity_undirected_impl(
    graph = NULL
  ))
})

# 104. transitivity_local_undirected_impl

test_that("transitivity_local_undirected_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(transitivity_local_undirected_impl(
    graph = g
  ))
  expect_snapshot(transitivity_local_undirected_impl(
    graph = g,
    mode = "zero"
  ))

  # Structured tests
  result <- transitivity_local_undirected_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("transitivity_local_undirected_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(transitivity_local_undirected_impl(
    graph = NULL
  ))
})

# 105. transitivity_avglocal_undirected_impl

test_that("transitivity_avglocal_undirected_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(transitivity_avglocal_undirected_impl(
    graph = g
  ))
  expect_snapshot(transitivity_avglocal_undirected_impl(
    graph = g,
    mode = "zero"
  ))

  # Structured tests
  result <- transitivity_avglocal_undirected_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("transitivity_avglocal_undirected_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(transitivity_avglocal_undirected_impl(
    graph = NULL
  ))
})

# 106. transitivity_barrat_impl

test_that("transitivity_barrat_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(transitivity_barrat_impl(
    graph = g
  ))
  expect_snapshot(transitivity_barrat_impl(
    graph = g,
    mode = "zero"
  ))

  # Structured tests
  expect_warning(
    result <- transitivity_barrat_impl(
      graph = g
    )
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("transitivity_barrat_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(transitivity_barrat_impl(
    graph = NULL
  ))
})

# 107. ecc_impl

test_that("ecc_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 4
  )

  expect_snapshot(ecc_impl(
    graph = g
  ))
  expect_snapshot(ecc_impl(
    graph = g,
    k = 3,
    offset = TRUE,
    normalize = FALSE
  ))

  # Structured tests
  result <- ecc_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("ecc_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(ecc_impl(
    graph = NULL
  ))
})

# 108. reciprocity_impl

test_that("reciprocity_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(reciprocity_impl(
    graph = g
  ))
  expect_snapshot(reciprocity_impl(
    graph = g,
    ignore_loops = FALSE,
    mode = "ratio"
  ))

  # Structured tests
  result <- reciprocity_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("reciprocity_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(reciprocity_impl(
    graph = NULL
  ))
})

# 109. maxdegree_impl

test_that("maxdegree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(maxdegree_impl(
    graph = g
  ))
  expect_snapshot(maxdegree_impl(
    graph = g,
    mode = "in",
    loops = FALSE
  ))

  # Structured tests
  result <- maxdegree_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("maxdegree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(maxdegree_impl(
    graph = NULL
  ))
})

# 110. density_impl

test_that("density_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(density_impl(
    graph = g
  ))
  expect_snapshot(density_impl(
    graph = g,
    loops = TRUE
  ))

  # Structured tests
  result <- density_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("density_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(density_impl(
    graph = NULL
  ))
})

# 111. mean_degree_impl

test_that("mean_degree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(mean_degree_impl(
    graph = g
  ))
  expect_snapshot(mean_degree_impl(
    graph = g,
    loops = FALSE
  ))

  # Structured tests
  result <- mean_degree_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("mean_degree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(mean_degree_impl(
    graph = NULL
  ))
})

# 112. feedback_arc_set_impl

test_that("feedback_arc_set_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(feedback_arc_set_impl(
    graph = g
  ))
  expect_snapshot(feedback_arc_set_impl(
    graph = g,
    algo = "exact_ip"
  ))

  # Structured tests
  result <- feedback_arc_set_impl(
    graph = g
  )
  expect_s3_class(result, "igraph.es")
})

test_that("feedback_arc_set_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(feedback_arc_set_impl(
    graph = NULL
  ))
})

# 113. feedback_vertex_set_impl

test_that("feedback_vertex_set_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(feedback_vertex_set_impl(
    graph = g
  ))

  # Structured tests
  result <- feedback_vertex_set_impl(
    graph = g
  )
  expect_s3_class(result, "igraph.vs")
})

test_that("feedback_vertex_set_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(feedback_vertex_set_impl(
    graph = NULL
  ))
})

# 114. is_loop_impl

test_that("is_loop_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_loop_impl(
    graph = g
  ))

  # Structured tests
  result <- is_loop_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_loop_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_loop_impl(
    graph = NULL
  ))
})

# 115. is_dag_impl

test_that("is_dag_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_dag_impl(
    graph = g
  ))

  # Structured tests
  result <- is_dag_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_dag_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_dag_impl(
    graph = NULL
  ))
})

# 116. is_acyclic_impl

test_that("is_acyclic_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_acyclic_impl(
    graph = g
  ))

  # Structured tests
  result <- is_acyclic_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_acyclic_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_acyclic_impl(
    graph = NULL
  ))
})

# 117. is_simple_impl

test_that("is_simple_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_simple_impl(
    graph = g
  ))

  # Structured tests
  result <- is_simple_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_simple_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_simple_impl(
    graph = NULL
  ))
})

# 118. is_multiple_impl

test_that("is_multiple_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_multiple_impl(
    graph = g
  ))

  # Structured tests
  result <- is_multiple_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_multiple_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_multiple_impl(
    graph = NULL
  ))
})

# 119. has_loop_impl

test_that("has_loop_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(has_loop_impl(
    graph = g
  ))

  # Structured tests
  result <- has_loop_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("has_loop_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(has_loop_impl(
    graph = NULL
  ))
})

# 120. has_multiple_impl

test_that("has_multiple_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(has_multiple_impl(
    graph = g
  ))

  # Structured tests
  result <- has_multiple_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("has_multiple_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(has_multiple_impl(
    graph = NULL
  ))
})

# 121. count_loops_impl

test_that("count_loops_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(count_loops_impl(
    graph = g
  ))

  # Structured tests
  result <- count_loops_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("count_loops_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(count_loops_impl(
    graph = NULL
  ))
})

# 122. count_multiple_impl

test_that("count_multiple_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(count_multiple_impl(
    graph = g
  ))

  # Structured tests
  result <- count_multiple_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("count_multiple_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(count_multiple_impl(
    graph = NULL
  ))
})

# 123. is_perfect_impl

test_that("is_perfect_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_perfect_impl(
    graph = g
  ))

  # Structured tests
  result <- is_perfect_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_perfect_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_perfect_impl(
    graph = NULL
  ))
})

# 124. eigenvector_centrality_impl

test_that("eigenvector_centrality_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(eigenvector_centrality_impl(
    graph = g
  ))
  expect_snapshot(eigenvector_centrality_impl(
    graph = g,
    directed = TRUE,
    scale = FALSE
  ))

  # Structured tests
  result <- eigenvector_centrality_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("eigenvector_centrality_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(eigenvector_centrality_impl(
    graph = NULL
  ))
})

# 125. hub_and_authority_scores_impl

test_that("hub_and_authority_scores_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_full_graph(5)
  expect_snapshot(hub_and_authority_scores_impl(
    graph = g
  ))
  expect_snapshot(hub_and_authority_scores_impl(
    graph = g,
    scale = FALSE
  ))

  # Structured tests
  result <- hub_and_authority_scores_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("hub_and_authority_scores_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(hub_and_authority_scores_impl(
    graph = NULL
  ))
})

# 126. unfold_tree_impl

test_that("unfold_tree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(unfold_tree_impl(
    graph = g,
    roots = 1
  ))
  expect_snapshot(unfold_tree_impl(
    graph = g,
    mode = "in",
    roots = 1
  ))

  # Structured tests
  result <- unfold_tree_impl(
    graph = g,
    roots = 1
  )
  expect_type(result, "list")
})

test_that("unfold_tree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(unfold_tree_impl(
    graph = NULL,
    roots = 1
  ))
})

# 127. is_mutual_impl

test_that("is_mutual_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_mutual_impl(
    graph = g
  ))
  expect_snapshot(is_mutual_impl(
    graph = g,
    loops = FALSE
  ))

  # Structured tests
  result <- is_mutual_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_mutual_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_mutual_impl(
    graph = NULL
  ))
})

# 128. has_mutual_impl

test_that("has_mutual_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(has_mutual_impl(
    graph = g
  ))
  expect_snapshot(has_mutual_impl(
    graph = g,
    loops = FALSE
  ))

  # Structured tests
  result <- has_mutual_impl(
    graph = g
  )
  expect_type(result, "logical")
})

test_that("has_mutual_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(has_mutual_impl(
    graph = NULL
  ))
})

# 129. maximum_cardinality_search_impl

test_that("maximum_cardinality_search_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(maximum_cardinality_search_impl(
    graph = g
  ))

  # Structured tests
  result <- maximum_cardinality_search_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("maximum_cardinality_search_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(maximum_cardinality_search_impl(
    graph = NULL
  ))
})

# 130. avg_nearest_neighbor_degree_impl

test_that("avg_nearest_neighbor_degree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(avg_nearest_neighbor_degree_impl(
    graph = g
  ))
  expect_snapshot(avg_nearest_neighbor_degree_impl(
    graph = g,
    mode = "in",
    neighbor_degree_mode = "out"
  ))

  # Structured tests
  result <- avg_nearest_neighbor_degree_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("avg_nearest_neighbor_degree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(avg_nearest_neighbor_degree_impl(
    graph = NULL
  ))
})

# 131. degree_correlation_vector_impl

test_that("degree_correlation_vector_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(degree_correlation_vector_impl(
    graph = g
  ))
  expect_snapshot(degree_correlation_vector_impl(
    graph = g,
    from_mode = "in",
    to_mode = "out",
    directed_neighbors = FALSE
  ))

  # Structured tests
  result <- degree_correlation_vector_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("degree_correlation_vector_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(degree_correlation_vector_impl(
    graph = NULL
  ))
})

# 132. rich_club_sequence_impl

test_that("rich_club_sequence_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(rich_club_sequence_impl(
    graph = g,
    vertex_order = 1:3
  ))
  expect_snapshot(rich_club_sequence_impl(
    graph = g,
    vertex_order = 1:3,
    normalized = FALSE,
    loops = TRUE,
    directed = FALSE
  ))

  # Structured tests
  result <- rich_club_sequence_impl(
    graph = g,
    vertex_order = 1:3
  )
  expect_true(is.numeric(result))
})

test_that("rich_club_sequence_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    rich_club_sequence_impl(
      graph = NULL,
      vertex_order = 1:3
    )
  )
})

# 133. strength_impl

test_that("strength_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(strength_impl(
    graph = g
  ))
  expect_snapshot(strength_impl(
    graph = g,
    mode = "in",
    loops = FALSE
  ))

  # Structured tests
  result <- strength_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("strength_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(strength_impl(
    graph = NULL
  ))
})

# 134. centralization_impl

test_that("centralization_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(centralization_impl(
    scores = c(1, 2, 3)
  ))
  expect_snapshot(centralization_impl(
    scores = c(1, 2, 3),
    theoretical_max = 2,
    normalized = FALSE
  ))

  # Structured tests
  result <- centralization_impl(
    scores = c(1, 2, 3)
  )
  expect_true(is.numeric(result))
})

test_that("centralization_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(centralization_impl(
    scores = package_version("1.2.3")
  ))
})

# 135. centralization_degree_impl

test_that("centralization_degree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(centralization_degree_impl(
    graph = g
  ))
  expect_snapshot(centralization_degree_impl(
    graph = g,
    mode = "in",
    loops = FALSE,
    normalized = FALSE
  ))

  # Structured tests
  result <- centralization_degree_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("centralization_degree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(centralization_degree_impl(
    graph = NULL
  ))
})

# 136. centralization_degree_tmax_impl

test_that("centralization_degree_tmax_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(centralization_degree_tmax_impl(
    nodes = 3,
    loops = TRUE
  ))
  expect_snapshot(centralization_degree_tmax_impl(
    nodes = 3,
    mode = "in",
    loops = FALSE
  ))

  # Structured tests
  result <- centralization_degree_tmax_impl(
    nodes = 3,
    loops = TRUE
  )
  expect_true(is.numeric(result))
})

test_that("centralization_degree_tmax_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    centralization_degree_tmax_impl(
      nodes = -1,
      loops = TRUE
    )
  )
})

# 137. centralization_betweenness_impl

test_that("centralization_betweenness_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(centralization_betweenness_impl(
    graph = g
  ))
  expect_snapshot(centralization_betweenness_impl(
    graph = g,
    directed = FALSE,
    normalized = FALSE
  ))

  # Structured tests
  result <- centralization_betweenness_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("centralization_betweenness_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(centralization_betweenness_impl(
    graph = NULL
  ))
})

# 138. centralization_betweenness_tmax_impl

test_that("centralization_betweenness_tmax_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(centralization_betweenness_tmax_impl(
    nodes = 3,
    directed = TRUE
  ))
  expect_snapshot(centralization_betweenness_tmax_impl(
    nodes = 3,
    directed = FALSE
  ))

  # Structured tests
  result <- centralization_betweenness_tmax_impl(
    nodes = 3,
    directed = TRUE
  )
  expect_true(is.numeric(result))
})

test_that("centralization_betweenness_tmax_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    centralization_betweenness_tmax_impl(
      nodes = -1,
      directed = TRUE
    )
  )
})

# 139. centralization_closeness_impl

test_that("centralization_closeness_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(centralization_closeness_impl(
    graph = g
  ))
  expect_snapshot(centralization_closeness_impl(
    graph = g,
    mode = "in",
    normalized = FALSE
  ))

  # Structured tests
  result <- centralization_closeness_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("centralization_closeness_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(centralization_closeness_impl(
    graph = NULL
  ))
})

# 140. centralization_closeness_tmax_impl

test_that("centralization_closeness_tmax_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(centralization_closeness_tmax_impl(
    nodes = 3
  ))
  expect_snapshot(centralization_closeness_tmax_impl(
    nodes = 3,
    mode = "in"
  ))

  # Structured tests
  result <- centralization_closeness_tmax_impl(
    nodes = 3
  )
  expect_true(is.numeric(result))
})

test_that("centralization_closeness_tmax_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(centralization_closeness_tmax_impl(
    nodes = -1
  ))
})

# 141. centralization_eigenvector_centrality_impl

test_that("centralization_eigenvector_centrality_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(centralization_eigenvector_centrality_impl(
    graph = g
  ))
  expect_snapshot(centralization_eigenvector_centrality_impl(
    graph = g,
    directed = TRUE,
    normalized = FALSE
  ))

  # Structured tests
  result <- centralization_eigenvector_centrality_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("centralization_eigenvector_centrality_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    centralization_eigenvector_centrality_impl(
      graph = NULL
    )
  )
})

# 142. centralization_eigenvector_centrality_tmax_impl

test_that("centralization_eigenvector_centrality_tmax_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(centralization_eigenvector_centrality_tmax_impl(
    nodes = 3
  ))
  expect_snapshot(centralization_eigenvector_centrality_tmax_impl(
    nodes = 3,
    directed = TRUE
  ))

  # Structured tests
  result <- centralization_eigenvector_centrality_tmax_impl(
    nodes = 3
  )
  expect_true(is.numeric(result))
})

test_that("centralization_eigenvector_centrality_tmax_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    centralization_eigenvector_centrality_tmax_impl(
      nodes = -1
    )
  )
})

# 143. assortativity_nominal_impl

test_that("assortativity_nominal_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(assortativity_nominal_impl(
    graph = g,
    types = c(1, 2, 1)
  ))
  expect_snapshot(assortativity_nominal_impl(
    graph = g,
    types = c(1, 2, 1),
    directed = FALSE,
    normalized = FALSE
  ))

  # Structured tests
  result <- assortativity_nominal_impl(
    graph = g,
    types = c(1, 2, 1)
  )
  expect_true(is.numeric(result))
})

test_that("assortativity_nominal_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(assortativity_nominal_impl(
    graph = NULL,
    types = c(1, 2, 1)
  ))
})

# 144. assortativity_impl

test_that("assortativity_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(assortativity_impl(
    graph = g,
    values = c(1, 2, 1)
  ))
  expect_snapshot(assortativity_impl(
    graph = g,
    values = c(1, 2, 1),
    directed = FALSE,
    normalized = FALSE
  ))

  # Structured tests
  result <- assortativity_impl(
    graph = g,
    values = c(1, 2, 1)
  )
  expect_true(is.numeric(result))
})

test_that("assortativity_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(assortativity_impl(
    graph = NULL,
    values = c(1, 2, 1)
  ))
})

# 145. assortativity_degree_impl

test_that("assortativity_degree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(assortativity_degree_impl(
    graph = g
  ))
  expect_snapshot(assortativity_degree_impl(
    graph = g,
    directed = FALSE
  ))

  # Structured tests
  result <- assortativity_degree_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("assortativity_degree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(assortativity_degree_impl(
    graph = NULL
  ))
})

# 146. joint_degree_matrix_impl

test_that("joint_degree_matrix_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(joint_degree_matrix_impl(
    graph = g
  ))
  expect_snapshot(joint_degree_matrix_impl(
    graph = g,
    max_out_degree = 2,
    max_in_degree = 2
  ))

  # Structured tests
  result <- joint_degree_matrix_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("joint_degree_matrix_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(joint_degree_matrix_impl(
    graph = NULL
  ))
})

# 147. joint_degree_distribution_impl

test_that("joint_degree_distribution_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(joint_degree_distribution_impl(
    graph = g
  ))
  expect_snapshot(joint_degree_distribution_impl(
    graph = g,
    from_mode = "in",
    to_mode = "out",
    directed_neighbors = FALSE,
    normalized = FALSE,
    max_from_degree = 2,
    max_to_degree = 2
  ))

  # Structured tests
  result <- joint_degree_distribution_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("joint_degree_distribution_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(joint_degree_distribution_impl(
    graph = NULL
  ))
})

# 148. joint_type_distribution_impl

test_that("joint_type_distribution_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(joint_type_distribution_impl(
    graph = g,
    from_types = c(1, 2, 1)
  ))
  expect_snapshot(joint_type_distribution_impl(
    graph = g,
    from_types = c(1, 2, 1),
    to_types = c(1, 2, 1),
    directed = FALSE,
    normalized = FALSE
  ))

  # Structured tests
  result <- joint_type_distribution_impl(
    graph = g,
    from_types = c(1, 2, 1)
  )
  expect_true(is.numeric(result))
})

test_that("joint_type_distribution_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    joint_type_distribution_impl(
      graph = NULL,
      from_types = c(1, 2, 1)
    )
  )
})

# 149. contract_vertices_impl

test_that("contract_vertices_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(contract_vertices_impl(
    graph = g,
    mapping = c(1, 1, 2)
  ))

  # Structured tests
  result <- contract_vertices_impl(
    graph = g,
    mapping = c(1, 1, 2)
  )
  expect_s3_class(result, "igraph")
})

test_that("contract_vertices_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(contract_vertices_impl(
    graph = NULL,
    mapping = c(1, 1, 2)
  ))
})

# 150. eccentricity_dijkstra_impl

test_that("eccentricity_dijkstra_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(eccentricity_dijkstra_impl(
    graph = NULL
  ))
})

# 151. graph_center_dijkstra_impl

test_that("graph_center_dijkstra_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(graph_center_dijkstra_impl(
    graph = NULL
  ))
})

# 152. radius_dijkstra_impl

test_that("radius_dijkstra_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(radius_dijkstra_impl(
    graph = NULL
  ))
})

# 153. pseudo_diameter_impl

test_that("pseudo_diameter_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(pseudo_diameter_impl(
    graph = NULL,
    start_vid = 1
  ))
})

# 154. pseudo_diameter_dijkstra_impl

test_that("pseudo_diameter_dijkstra_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    pseudo_diameter_dijkstra_impl(
      graph = NULL,
      start_vid = 1
    )
  )
})

# 155. diversity_impl

test_that("diversity_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  E(g)$weight <- c(1, 2)
  expect_snapshot(diversity_impl(
    graph = g
  ))

  # Structured tests
  result <- diversity_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("diversity_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(diversity_impl(
    graph = NULL
  ))
})

# 156. random_walk_impl

test_that("random_walk_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(random_walk_impl(
    graph = g,
    start = 1,
    steps = 2
  ))
  expect_snapshot(random_walk_impl(
    graph = g,
    start = 1,
    steps = 2,
    mode = "in",
    stuck = "error"
  ))

  # Structured tests
  result <- random_walk_impl(
    graph = g,
    start = 1,
    steps = 2
  )
  expect_type(result, "list")
})

test_that("random_walk_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(random_walk_impl(
    graph = NULL,
    start = 1,
    steps = 2
  ))
})

# 157. global_efficiency_impl

test_that("global_efficiency_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(global_efficiency_impl(
    graph = g
  ))
  expect_snapshot(global_efficiency_impl(
    graph = g,
    directed = FALSE
  ))

  # Structured tests
  result <- global_efficiency_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("global_efficiency_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(global_efficiency_impl(
    graph = NULL
  ))
})

# 158. local_efficiency_impl

test_that("local_efficiency_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(local_efficiency_impl(
    graph = g
  ))
  expect_snapshot(local_efficiency_impl(
    graph = g,
    directed = FALSE,
    mode = "in"
  ))

  # Structured tests
  result <- local_efficiency_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("local_efficiency_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(local_efficiency_impl(
    graph = NULL
  ))
})

# 159. average_local_efficiency_impl

test_that("average_local_efficiency_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(average_local_efficiency_impl(
    graph = g
  ))
  expect_snapshot(average_local_efficiency_impl(
    graph = g,
    directed = FALSE,
    mode = "in"
  ))

  # Structured tests
  result <- average_local_efficiency_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("average_local_efficiency_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(average_local_efficiency_impl(
    graph = NULL
  ))
})

# 160. transitive_closure_dag_impl

test_that("transitive_closure_dag_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3,
    directed = TRUE
  )

  expect_snapshot(transitive_closure_dag_impl(
    graph = g
  ))

  # Structured tests
  result <- transitive_closure_dag_impl(
    graph = g
  )
  expect_s3_class(result, "igraph")
})

test_that("transitive_closure_dag_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(transitive_closure_dag_impl(
    graph = NULL
  ))
})

# 161. transitive_closure_impl

test_that("transitive_closure_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(transitive_closure_impl(
    graph = g
  ))

  # Structured tests
  result <- transitive_closure_impl(
    graph = g
  )
  expect_s3_class(result, "igraph")
})

test_that("transitive_closure_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(transitive_closure_impl(
    graph = NULL
  ))
})

# 162. trussness_impl

test_that("trussness_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(trussness_impl(
    graph = g
  ))

  # Structured tests
  result <- trussness_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("trussness_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(trussness_impl(
    graph = NULL
  ))
})

# 163. is_graphical_impl

test_that("is_graphical_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(is_graphical_impl(
    out_deg = c(2, 2, 2)
  ))
  expect_snapshot(is_graphical_impl(
    out_deg = c(2, 2, 2),
    in_deg = c(1, 1, 1),
    allowed_edge_types = "all"
  ))

  # Structured tests
  result <- is_graphical_impl(
    out_deg = c(2, 2, 2)
  )
  expect_type(result, "logical")
})

test_that("is_graphical_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_graphical_impl(
    out_deg = "a"
  ))
})

# 164. bfs_simple_impl

test_that("bfs_simple_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(bfs_simple_impl(
    graph = g,
    root = 1
  ))
  expect_snapshot(bfs_simple_impl(
    graph = g,
    root = 1,
    mode = "in"
  ))

  # Structured tests
  result <- bfs_simple_impl(
    graph = g,
    root = 1
  )
  expect_type(result, "list")
})

test_that("bfs_simple_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(bfs_simple_impl(
    graph = NULL,
    root = 1
  ))
})

# 165. bipartite_projection_size_impl

test_that("bipartite_projection_size_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 4
  )

  V(g)$type <- c(TRUE, FALSE, TRUE, FALSE)
  expect_snapshot(bipartite_projection_size_impl(
    graph = g
  ))

  # Structured tests
  result <- bipartite_projection_size_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("bipartite_projection_size_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(bipartite_projection_size_impl(
    graph = NULL
  ))
})

# 166. biadjacency_impl

test_that("biadjacency_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  m <- matrix(c(1, 0, 1, 0, 1, 1), nrow = 2)
  expect_snapshot(biadjacency_impl(
    incidence = m
  ))
  expect_snapshot(biadjacency_impl(
    incidence = m,
    directed = TRUE,
    mode = "in",
    multiple = TRUE
  ))

  # Structured tests
  result <- biadjacency_impl(
    incidence = m
  )
  expect_type(result, "list")
})

test_that("biadjacency_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(biadjacency_impl(
    incidence = "a"
  ))
})

# 167. get_biadjacency_impl

test_that("get_biadjacency_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_biadjacency_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE)
  ))

  # Structured tests
  result <- get_biadjacency_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE)
  )
  expect_type(result, "list")
})

test_that("get_biadjacency_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    get_biadjacency_impl(
      graph = NULL,
      types = c(TRUE, FALSE, TRUE)
    )
  )
})

# 168. is_bipartite_impl

test_that("is_bipartite_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_bipartite_impl(
    graph = g
  ))

  # Structured tests
  result <- is_bipartite_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("is_bipartite_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_bipartite_impl(
    graph = NULL
  ))
})

# 169. bipartite_game_gnp_impl

test_that("bipartite_game_gnp_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(bipartite_game_gnp_impl(
    n1 = 2,
    n2 = 2,
    p = 0.5
  ))
  expect_snapshot(bipartite_game_gnp_impl(
    n1 = 2,
    n2 = 2,
    p = 0.5,
    directed = TRUE,
    mode = "in"
  ))

  # Structured tests
  result <- bipartite_game_gnp_impl(
    n1 = 2,
    n2 = 2,
    p = 0.5
  )
  expect_type(result, "list")
})

test_that("bipartite_game_gnp_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(bipartite_game_gnp_impl(
    n1 = -1,
    n2 = 2,
    p = 0.5
  ))
})

# 170. bipartite_game_gnm_impl

test_that("bipartite_game_gnm_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(bipartite_game_gnm_impl(
    n1 = 2,
    n2 = 2,
    m = 1
  ))
  expect_snapshot(bipartite_game_gnm_impl(
    n1 = 2,
    n2 = 2,
    m = 1,
    directed = TRUE,
    mode = "in"
  ))

  # Structured tests
  result <- bipartite_game_gnm_impl(
    n1 = 2,
    n2 = 2,
    m = 1
  )
  expect_type(result, "list")
})

test_that("bipartite_game_gnm_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(bipartite_game_gnm_impl(
    n1 = -1,
    n2 = 2,
    m = 1
  ))
})

# 171. get_laplacian_impl

test_that("get_laplacian_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_laplacian_impl(
    graph = g
  ))
  expect_snapshot(get_laplacian_impl(
    graph = g,
    mode = "in",
    normalization = "symmetric",
    weights = c(1, 2)
  ))

  # Structured tests
  result <- get_laplacian_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.matrix(result))
})

test_that("get_laplacian_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_laplacian_impl(
    graph = NULL
  ))
})

# 172. get_laplacian_sparse_impl

test_that("get_laplacian_sparse_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_laplacian_sparse_impl(
    graph = g
  ))
  expect_snapshot(get_laplacian_sparse_impl(
    graph = g,
    mode = "in",
    normalization = "symmetric",
    weights = c(1, 2)
  ))

  # Structured tests
  result <- get_laplacian_sparse_impl(
    graph = g
  )
  expect_s3_class(result, "igraph.tmp.sparse")
})

test_that("get_laplacian_sparse_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_laplacian_sparse_impl(
    graph = NULL
  ))
})

# 173. connected_components_impl

test_that("connected_components_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(connected_components_impl(
    graph = g
  ))
  expect_snapshot(connected_components_impl(
    graph = g,
    mode = "strong",
    details = TRUE
  ))

  # Structured tests
  result <- connected_components_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("connected_components_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(connected_components_impl(
    graph = NULL
  ))
})

# 174. is_connected_impl

test_that("is_connected_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_connected_impl(
    graph = g
  ))
  expect_snapshot(is_connected_impl(
    graph = g,
    mode = "strong"
  ))

  # Structured tests
  result <- is_connected_impl(
    graph = g
  )
  expect_type(result, "logical")
})

test_that("is_connected_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_connected_impl(
    graph = NULL
  ))
})

# 175. articulation_points_impl

test_that("articulation_points_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(articulation_points_impl(
    graph = g
  ))

  # Structured tests
  result <- articulation_points_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("articulation_points_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(articulation_points_impl(
    graph = NULL
  ))
})

# 176. biconnected_components_impl

test_that("biconnected_components_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(biconnected_components_impl(
    graph = g
  ))

  # Structured tests
  result <- biconnected_components_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("biconnected_components_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(biconnected_components_impl(
    graph = NULL
  ))
})

# 177. bridges_impl

test_that("bridges_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(bridges_impl(
    graph = g
  ))

  # Structured tests
  result <- bridges_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("bridges_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(bridges_impl(
    graph = NULL
  ))
})

# 178. is_biconnected_impl

test_that("is_biconnected_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_biconnected_impl(
    graph = g
  ))

  # Structured tests
  result <- is_biconnected_impl(
    graph = g
  )
  expect_type(result, "logical")
})

test_that("is_biconnected_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_biconnected_impl(
    graph = NULL
  ))
})

# 179. count_reachable_impl

test_that("count_reachable_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 5
  )

  expect_snapshot(count_reachable_impl(
    graph = g,
    mode = "out"
  ))
  expect_snapshot(count_reachable_impl(
    graph = g,
    mode = "in"
  ))

  # Structured tests
  result <- count_reachable_impl(
    graph = g,
    mode = "out"
  )
  expect_true(is.numeric(result))
})

test_that("count_reachable_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(count_reachable_impl(
    graph = NULL,
    mode = "out"
  ))
})

# 180. bond_percolation_impl

test_that("bond_percolation_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(bond_percolation_impl(
    graph = g
  ))

  # Structured tests
  result <- bond_percolation_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("bond_percolation_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(bond_percolation_impl(
    graph = NULL
  ))
})

# 181. site_percolation_impl

test_that("site_percolation_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(site_percolation_impl(
    graph = g
  ))

  # Structured tests
  result <- site_percolation_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("site_percolation_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(site_percolation_impl(
    graph = NULL
  ))
})

# 182. edgelist_percolation_impl

test_that("edgelist_percolation_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(edgelist_percolation_impl(
    edges = matrix(c(1, 2, 2, 3), ncol = 2)
  ))

  # Structured tests
  result <- edgelist_percolation_impl(
    edges = matrix(c(1, 2, 2, 3), ncol = 2)
  )
  expect_type(result, "list")
})

test_that("edgelist_percolation_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(edgelist_percolation_impl(
    edges = "a"
  ))
})

# 183. is_clique_impl

test_that("is_clique_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_clique_impl(
    graph = g,
    candidate = 1:2
  ))
  expect_snapshot(is_clique_impl(
    graph = g,
    candidate = 1:2,
    directed = TRUE
  ))

  # Structured tests
  result <- is_clique_impl(
    graph = g,
    candidate = 1:2
  )
  expect_type(result, "logical")
})

test_that("is_clique_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_clique_impl(
    graph = NULL,
    candidate = 1:2
  ))
})

# 184. cliques_impl

test_that("cliques_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(cliques_impl(
    graph = g
  ))
  expect_snapshot(cliques_impl(
    graph = g,
    min = 2,
    max = 2
  ))

  # Structured tests
  result <- cliques_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("cliques_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(cliques_impl(
    graph = NULL
  ))
})

# 185. clique_size_hist_impl

test_that("clique_size_hist_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(clique_size_hist_impl(
    graph = g
  ))
  expect_snapshot(clique_size_hist_impl(
    graph = g,
    min_size = 2,
    max_size = 2
  ))

  # Structured tests
  result <- clique_size_hist_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("clique_size_hist_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(clique_size_hist_impl(
    graph = NULL
  ))
})

# 186. largest_cliques_impl

test_that("largest_cliques_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(largest_cliques_impl(
    graph = g
  ))

  # Structured tests
  result <- largest_cliques_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("largest_cliques_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(largest_cliques_impl(
    graph = NULL
  ))
})

# 187. maximal_cliques_hist_impl

test_that("maximal_cliques_hist_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(maximal_cliques_hist_impl(
    graph = g
  ))
  expect_snapshot(maximal_cliques_hist_impl(
    graph = g,
    min_size = 2,
    max_size = 2
  ))

  # Structured tests
  result <- maximal_cliques_hist_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("maximal_cliques_hist_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(maximal_cliques_hist_impl(
    graph = NULL
  ))
})

# 188. clique_number_impl

test_that("clique_number_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(clique_number_impl(
    graph = g
  ))

  # Structured tests
  result <- clique_number_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("clique_number_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(clique_number_impl(
    graph = NULL
  ))
})

# 189. weighted_cliques_impl

test_that("weighted_cliques_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(weighted_cliques_impl(
    graph = g
  ))
  expect_snapshot(weighted_cliques_impl(
    graph = g,
    vertex_weights = c(1, 2, 3),
    min_weight = 1,
    max_weight = 3,
    maximal = TRUE
  ))

  # Structured tests
  result <- weighted_cliques_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("weighted_cliques_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(weighted_cliques_impl(
    graph = NULL
  ))
})

# 190. largest_weighted_cliques_impl

test_that("largest_weighted_cliques_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(largest_weighted_cliques_impl(
    graph = g
  ))
  expect_snapshot(largest_weighted_cliques_impl(
    graph = g,
    vertex_weights = c(1, 2, 3)
  ))

  # Structured tests
  result <- largest_weighted_cliques_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("largest_weighted_cliques_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(largest_weighted_cliques_impl(
    graph = NULL
  ))
})

# 191. weighted_clique_number_impl

test_that("weighted_clique_number_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(weighted_clique_number_impl(
    graph = g
  ))
  expect_snapshot(weighted_clique_number_impl(
    graph = g,
    vertex_weights = c(1, 2, 3)
  ))

  # Structured tests
  result <- weighted_clique_number_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("weighted_clique_number_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(weighted_clique_number_impl(
    graph = NULL
  ))
})

# 192. is_independent_vertex_set_impl

test_that("is_independent_vertex_set_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_independent_vertex_set_impl(
    graph = g,
    candidate = 1:2
  ))

  # Structured tests
  result <- is_independent_vertex_set_impl(
    graph = g,
    candidate = 1:2
  )
  expect_type(result, "logical")
})

test_that("is_independent_vertex_set_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_independent_vertex_set_impl(
    graph = NULL,
    candidate = 1:2
  ))
})

# 193. layout_random_impl

test_that("layout_random_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(layout_random_impl(
    graph = g
  ))

  # Structured tests
  result <- layout_random_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("layout_random_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(layout_random_impl(
    graph = NULL
  ))
})

# 194. layout_circle_impl

test_that("layout_circle_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(layout_circle_impl(
    graph = g
  ))
  expect_snapshot(layout_circle_impl(
    graph = g,
    order = 1:3
  ))

  # Structured tests
  result <- layout_circle_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("layout_circle_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(layout_circle_impl(
    graph = NULL
  ))
})

# 195. layout_star_impl

test_that("layout_star_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(round(
    layout_star_impl(
      graph = g
    ),
    4
  ))
  expect_snapshot(round(
    layout_star_impl(
      graph = g,
      center = 1,
      order = 3:1
    ),
    4
  ))

  # Structured tests
  result <- round(
    layout_star_impl(
      graph = g
    ),
    4
  )
  expect_true(is.numeric(result))
})

test_that("layout_star_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(layout_star_impl(
    graph = NULL
  ))
})

# 196. layout_grid_impl

test_that("layout_grid_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(layout_grid_impl(
    graph = g
  ))
  expect_snapshot(layout_grid_impl(
    graph = g,
    width = 2
  ))

  # Structured tests
  result <- layout_grid_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("layout_grid_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(layout_grid_impl(
    graph = NULL
  ))
})

# 197. layout_grid_3d_impl

test_that("layout_grid_3d_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(layout_grid_3d_impl(
    graph = g
  ))
  expect_snapshot(layout_grid_3d_impl(
    graph = g,
    width = 2,
    height = 2
  ))

  # Structured tests
  result <- layout_grid_3d_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("layout_grid_3d_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(layout_grid_3d_impl(
    graph = NULL
  ))
})

# 198. roots_for_tree_layout_impl

test_that("roots_for_tree_layout_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(roots_for_tree_layout_impl(
    graph = g,
    mode = "out",
    heuristic = 1
  ))

  # Structured tests
  result <- roots_for_tree_layout_impl(
    graph = g,
    mode = "out",
    heuristic = 1
  )
  expect_s3_class(result, "igraph.vs")
})

test_that("roots_for_tree_layout_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    roots_for_tree_layout_impl(
      graph = NULL,
      mode = "out",
      heuristic = 1
    )
  )
})

# 199. layout_random_3d_impl

test_that("layout_random_3d_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(layout_random_3d_impl(
    graph = g
  ))

  # Structured tests
  result <- layout_random_3d_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("layout_random_3d_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(layout_random_3d_impl(
    graph = NULL
  ))
})

# 200. layout_sphere_impl

test_that("layout_sphere_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(layout_sphere_impl(
    graph = g
  ))

  # Structured tests
  result <- layout_sphere_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("layout_sphere_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(layout_sphere_impl(
    graph = NULL
  ))
})

# 201. layout_sugiyama_impl

test_that("layout_sugiyama_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(layout_sugiyama_impl(
    graph = g
  ))
  expect_snapshot(layout_sugiyama_impl(
    graph = g,
    layers = 1:3,
    hgap = 2,
    vgap = 2,
    maxiter = 10,
    weights = c(1, 2)
  ))

  # Structured tests
  result <- layout_sugiyama_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("layout_sugiyama_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(layout_sugiyama_impl(
    graph = NULL
  ))
})

# 202. layout_mds_impl

test_that("layout_mds_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(layout_mds_impl(
    graph = g
  ))
  expect_snapshot(layout_mds_impl(
    graph = g,
    dist = matrix(1:9, nrow = 3),
    dim = 3
  ))

  # Structured tests
  result <- layout_mds_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("layout_mds_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(layout_mds_impl(
    graph = NULL
  ))
})

# 203. layout_bipartite_impl

test_that("layout_bipartite_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(layout_bipartite_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE)
  ))
  expect_snapshot(layout_bipartite_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE),
    hgap = 2,
    vgap = 2,
    maxiter = 10
  ))

  # Structured tests
  result <- layout_bipartite_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE)
  )
  expect_true(is.numeric(result))
})

test_that("layout_bipartite_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    layout_bipartite_impl(
      graph = NULL,
      types = c(TRUE, FALSE, TRUE)
    )
  )
})

# 204. layout_gem_impl

test_that("layout_gem_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(layout_gem_impl(
    graph = g,
    res = matrix(0, nrow = 3, ncol = 2)
  ))
  expect_snapshot(layout_gem_impl(
    graph = g,
    res = matrix(0, nrow = 3, ncol = 2),
    use_seed = TRUE,
    maxiter = 10,
    temp_max = 2,
    temp_min = 0.1,
    temp_init = 1
  ))

  # Structured tests
  result <- layout_gem_impl(
    graph = g,
    res = matrix(0, nrow = 3, ncol = 2)
  )
  expect_true(is.numeric(result))
})

test_that("layout_gem_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    layout_gem_impl(
      graph = NULL,
      res = matrix(0, nrow = 3, ncol = 2)
    )
  )
})

# 205. layout_davidson_harel_impl

test_that("layout_davidson_harel_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(layout_davidson_harel_impl(
    graph = g,
    res = matrix(0, nrow = 3, ncol = 2)
  ))
  expect_snapshot(layout_davidson_harel_impl(
    graph = g,
    res = matrix(0, nrow = 3, ncol = 2),
    use_seed = TRUE,
    maxiter = 10,
    fineiter = 5,
    cool_fact = 0.5,
    weight_node_dist = 2,
    weight_border = 1,
    weight_edge_lengths = 0.1,
    weight_edge_crossings = 0.2,
    weight_node_edge_dist = 0.3
  ))

  # Structured tests
  result <- layout_davidson_harel_impl(
    graph = g,
    res = matrix(0, nrow = 3, ncol = 2)
  )
  expect_true(is.numeric(result))
})

test_that("layout_davidson_harel_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    layout_davidson_harel_impl(
      graph = NULL,
      res = matrix(0, nrow = 3, ncol = 2)
    )
  )
})

# 206. layout_umap_impl

test_that("layout_umap_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(layout_umap_impl(
    graph = g,
    res = matrix(0, nrow = 3, ncol = 2),
    use_seed = TRUE
  ))
  expect_snapshot(layout_umap_impl(
    graph = g,
    res = matrix(0, nrow = 3, ncol = 2),
    use_seed = TRUE,
    distances = 1:3,
    min_dist = 0.1,
    epochs = 10,
    distances_are_weights = TRUE
  ))

  # Structured tests
  result <- layout_umap_impl(
    graph = g,
    res = matrix(0, nrow = 3, ncol = 2),
    use_seed = TRUE
  )
  expect_true(is.numeric(result))
})

test_that("layout_umap_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    layout_umap_impl(
      graph = NULL,
      res = matrix(0, nrow = 3, ncol = 2)
    )
  )
})

# 207. layout_umap_3d_impl

test_that("layout_umap_3d_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(layout_umap_3d_impl(
    graph = g,
    res = matrix(0, nrow = 3, ncol = 3),
    use_seed = TRUE
  ))
  expect_snapshot(layout_umap_3d_impl(
    graph = g,
    res = matrix(0, nrow = 3, ncol = 3),
    use_seed = TRUE,
    distances = 1:3,
    min_dist = 0.1,
    epochs = 10,
    distances_are_weights = TRUE
  ))

  # Structured tests
  result <- layout_umap_3d_impl(
    graph = g,
    res = matrix(0, nrow = 3, ncol = 3),
    use_seed = TRUE
  )
  expect_true(is.numeric(result))
})

test_that("layout_umap_3d_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    layout_umap_3d_impl(
      graph = NULL,
      res = matrix(0, nrow = 3, ncol = 3)
    )
  )
})

# 208. layout_umap_compute_weights_impl

test_that("layout_umap_compute_weights_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(layout_umap_compute_weights_impl(
    graph = g,
    distances = 1:2,
    weights = 1:3
  ))

  # Structured tests
  result <- layout_umap_compute_weights_impl(
    graph = g,
    distances = 1:2,
    weights = 1:3
  )
  expect_true(is.numeric(result))
})

test_that("layout_umap_compute_weights_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    layout_umap_compute_weights_impl(
      graph = NULL,
      distances = 1:3,
      weights = 1:3
    )
  )
})

# 209. layout_align_impl

test_that("layout_align_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(layout_align_impl(
    graph = g,
    layout = matrix(0, nrow = 3, ncol = 2)
  ))

  # Structured tests
  result <- layout_align_impl(
    graph = g,
    layout = matrix(0, nrow = 3, ncol = 2)
  )
  expect_true(is.numeric(result))
})

test_that("layout_align_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    layout_align_impl(
      graph = NULL,
      layout = matrix(0, nrow = 3, ncol = 2)
    )
  )
})

# 210. similarity_dice_impl

test_that("similarity_dice_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(similarity_dice_impl(
    graph = g
  ))
  expect_snapshot(similarity_dice_impl(
    graph = g,
    vids = 1:2,
    mode = "in",
    loops = TRUE
  ))

  # Structured tests
  result <- similarity_dice_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("similarity_dice_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(similarity_dice_impl(
    graph = NULL
  ))
})

# 211. similarity_dice_es_impl

test_that("similarity_dice_es_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(similarity_dice_es_impl(
    graph = g
  ))
  expect_snapshot(similarity_dice_es_impl(
    graph = g,
    es = 1:2,
    mode = "in",
    loops = TRUE
  ))

  # Structured tests
  result <- similarity_dice_es_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("similarity_dice_es_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(similarity_dice_es_impl(
    graph = NULL
  ))
})

# 212. similarity_dice_pairs_impl

test_that("similarity_dice_pairs_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 4
  )

  expect_snapshot(similarity_dice_pairs_impl(
    graph = g,
    pairs = matrix(c(1, 2, 2, 3), ncol = 2)
  ))
  expect_snapshot(similarity_dice_pairs_impl(
    graph = g,
    pairs = matrix(c(1, 2, 2, 3), ncol = 2),
    mode = "in",
    loops = TRUE
  ))

  # Structured tests
  result <- similarity_dice_pairs_impl(
    graph = g,
    pairs = matrix(c(1, 2, 2, 3), ncol = 2)
  )
  expect_true(is.numeric(result))
})

test_that("similarity_dice_pairs_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    similarity_dice_pairs_impl(
      graph = NULL,
      pairs = matrix(c(1, 2, 2, 3), ncol = 2)
    )
  )
})

# 213. similarity_inverse_log_weighted_impl

test_that("similarity_inverse_log_weighted_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(similarity_inverse_log_weighted_impl(
    graph = g
  ))
  expect_snapshot(similarity_inverse_log_weighted_impl(
    graph = g,
    vids = 1:2,
    mode = "in"
  ))

  # Structured tests
  result <- similarity_inverse_log_weighted_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("similarity_inverse_log_weighted_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(similarity_inverse_log_weighted_impl(
    graph = NULL
  ))
})

# 214. similarity_jaccard_impl

test_that("similarity_jaccard_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(similarity_jaccard_impl(
    graph = g
  ))
  expect_snapshot(similarity_jaccard_impl(
    graph = g,
    vids = 1:2,
    mode = "in",
    loops = TRUE
  ))

  # Structured tests
  result <- similarity_jaccard_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("similarity_jaccard_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(similarity_jaccard_impl(
    graph = NULL
  ))
})

# 215. similarity_jaccard_es_impl

test_that("similarity_jaccard_es_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(similarity_jaccard_es_impl(
    graph = g
  ))
  expect_snapshot(similarity_jaccard_es_impl(
    graph = g,
    es = 1:2,
    mode = "in",
    loops = TRUE
  ))

  # Structured tests
  result <- similarity_jaccard_es_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("similarity_jaccard_es_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(similarity_jaccard_es_impl(
    graph = NULL
  ))
})

# 216. similarity_jaccard_pairs_impl

test_that("similarity_jaccard_pairs_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 4
  )

  expect_snapshot(similarity_jaccard_pairs_impl(
    graph = g,
    pairs = matrix(c(1, 2, 2, 3), ncol = 2)
  ))
  expect_snapshot(similarity_jaccard_pairs_impl(
    graph = g,
    pairs = matrix(c(1, 2, 2, 3), ncol = 2),
    mode = "in",
    loops = TRUE
  ))

  # Structured tests
  result <- similarity_jaccard_pairs_impl(
    graph = g,
    pairs = matrix(c(1, 2, 2, 3), ncol = 2)
  )
  expect_true(is.numeric(result))
})

test_that("similarity_jaccard_pairs_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    similarity_jaccard_pairs_impl(
      graph = NULL,
      pairs = matrix(c(1, 2, 2, 3), ncol = 2)
    )
  )
})

# 217. compare_communities_impl

test_that("compare_communities_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(compare_communities_impl(
    comm1 = c(1, 2, 1),
    comm2 = c(2, 1, 2)
  ))
  expect_snapshot(compare_communities_impl(
    comm1 = c(1, 2, 1),
    comm2 = c(2, 1, 2),
    method = "nmi"
  ))

  # Structured tests
  result <- compare_communities_impl(
    comm1 = c(1, 2, 1),
    comm2 = c(2, 1, 2)
  )
  expect_true(is.numeric(result))
})

test_that("compare_communities_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(compare_communities_impl(
    comm1 = "a",
    comm2 = c(2, 1, 2)
  ))
})

# 218. modularity_impl

test_that("modularity_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(modularity_impl(
    graph = g,
    membership = c(1, 2, 1)
  ))
  expect_snapshot(modularity_impl(
    graph = g,
    membership = c(1, 2, 1),
    weights = c(1, 2),
    resolution = 0.5,
    directed = FALSE
  ))

  # Structured tests
  result <- modularity_impl(
    graph = g,
    membership = c(1, 2, 1)
  )
  expect_true(is.numeric(result))
})

test_that("modularity_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(modularity_impl(
    graph = NULL,
    membership = c(1, 2, 1)
  ))
})

# 219. modularity_matrix_impl

test_that("modularity_matrix_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(modularity_matrix_impl(
    graph = g
  ))
  expect_snapshot(modularity_matrix_impl(
    graph = g,
    weights = c(1, 2),
    resolution = 0.5,
    directed = FALSE
  ))

  # Structured tests
  result <- modularity_matrix_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("modularity_matrix_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(modularity_matrix_impl(
    graph = NULL
  ))
})

# 220. community_fluid_communities_impl

test_that("community_fluid_communities_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(community_fluid_communities_impl(
    graph = g,
    no_of_communities = 2
  ))

  # Structured tests
  result <- community_fluid_communities_impl(
    graph = g,
    no_of_communities = 2
  )
  expect_true(is.numeric(result))
})

test_that("community_fluid_communities_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    community_fluid_communities_impl(
      graph = NULL,
      no_of_communities = 2
    )
  )
})

# 221. community_label_propagation_impl

test_that("community_label_propagation_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(community_label_propagation_impl(
    graph = g
  ))
  expect_snapshot(community_label_propagation_impl(
    graph = g,
    mode = "in",
    weights = c(1, 2),
    initial = 1:3,
    fixed = c(TRUE, FALSE, TRUE)
  ))

  # Structured tests
  result <- community_label_propagation_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("community_label_propagation_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(community_label_propagation_impl(
    graph = NULL
  ))
})

# 222. community_multilevel_impl

test_that("community_multilevel_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(community_multilevel_impl(
    graph = g
  ))
  expect_snapshot(community_multilevel_impl(
    graph = g,
    weights = c(1, 2),
    resolution = 0.5
  ))

  # Structured tests
  result <- community_multilevel_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("community_multilevel_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(community_multilevel_impl(
    graph = NULL
  ))
})

# 223. community_optimal_modularity_impl

test_that("community_optimal_modularity_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(community_optimal_modularity_impl(
    graph = g
  ))
  expect_snapshot(community_optimal_modularity_impl(
    graph = g,
    weights = c(1, 2)
  ))

  # Structured tests
  result <- community_optimal_modularity_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("community_optimal_modularity_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(community_optimal_modularity_impl(
    graph = NULL
  ))
})

# 224. community_leiden_impl

test_that("community_leiden_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(community_leiden_impl(
    graph = g,
    weights = c(1, 2),
    vertex_weights = c(1, 2, 3),
    resolution = 0.5,
    beta = 0.1,
    start = TRUE,
    n_iterations = 1,
    membership = 1:3
  ))

  # Structured tests
  result <- community_leiden_impl(
    graph = g,
    weights = c(1, 2),
    vertex_weights = c(1, 2, 3),
    resolution = 0.5,
    beta = 0.1,
    start = TRUE,
    n_iterations = 1,
    membership = 1:3
  )
  expect_type(result, "list")
})

test_that("community_leiden_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(community_leiden_impl(
    graph = NULL,
    resolution = 1
  ))
})

# 225. split_join_distance_impl

test_that("split_join_distance_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(split_join_distance_impl(
    comm1 = c(1, 2, 1),
    comm2 = c(2, 1, 2)
  ))

  # Structured tests
  result <- split_join_distance_impl(
    comm1 = c(1, 2, 1),
    comm2 = c(2, 1, 2)
  )
  expect_type(result, "list")
})

test_that("split_join_distance_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(split_join_distance_impl(
    comm1 = "a",
    comm2 = c(2, 1, 2)
  ))
})

# 226. community_infomap_impl

test_that("community_infomap_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(community_infomap_impl(
    graph = g
  ))
  expect_snapshot(community_infomap_impl(
    graph = g,
    e_weights = c(1, 2),
    v_weights = c(1, 2, 3),
    nb_trials = 2
  ))

  # Structured tests
  result <- community_infomap_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("community_infomap_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(community_infomap_impl(
    graph = NULL
  ))
})

# 227. graphlets_impl

test_that("graphlets_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  E(g)$weight <- 1:2
  expect_snapshot(graphlets_impl(
    graph = g
  ))
  expect_snapshot(graphlets_impl(
    graph = g,
    weights = c(3, 4),
    niter = 10
  ))

  # Structured tests
  result <- graphlets_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("graphlets_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(graphlets_impl(
    graph = NULL
  ))
})

# 228. hrg_fit_impl

test_that("hrg_fit_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(hrg_fit_impl(
    graph = g1
  ))

  # Structured tests
  result <- hrg_fit_impl(
    graph = g1
  )
  expect_type(result, "list")
})

test_that("hrg_fit_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(hrg_fit_impl(
    graph = NULL
  ))
})

# 229. hrg_sample_impl

test_that("hrg_sample_impl basic", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_full_graph(10)
  hrg_model <- fit_hrg(g, hrg = NULL, start = FALSE, steps = 0)
  expect_snapshot(hrg_sample_impl(
    hrg = hrg_model
  ))

  # Structured tests
  result <- hrg_sample_impl(
    hrg = hrg_model
  )
  expect_type(result, "list")
})

test_that("hrg_sample_impl errors", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  # FIXME: This test triggers an assertion failure in the C code when passing
  # NULL/empty HRG. The C code should validate input and return a proper error
  # message instead of an assertion failure.
  expect_snapshot_igraph_error(hrg_sample_impl(
    hrg = NULL
  ))
})

# 230. hrg_sample_many_impl

test_that("hrg_sample_many_impl basic", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_full_graph(10)
  hrg_model <- fit_hrg(g, hrg = NULL, start = FALSE, steps = 0)
  expect_snapshot(hrg_sample_many_impl(
    hrg = hrg_model,
    num_samples = 2
  ))

  # Structured tests
  result <- hrg_sample_many_impl(
    hrg = hrg_model,
    num_samples = 2
  )
  expect_type(result, "list")
})

test_that("hrg_sample_many_impl errors", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  # FIXME: This test triggers an assertion failure in the C code when passing
  # NULL/empty HRG. The C code should validate input and return a proper error
  # message instead of an assertion failure.
  expect_snapshot_igraph_error(hrg_sample_many_impl(
    hrg = NULL,
    num_samples = 2
  ))
})

# 231. hrg_game_impl

test_that("hrg_game_impl basic", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_full_graph(10)
  hrg_model <- fit_hrg(g, hrg = NULL, start = FALSE, steps = 0)
  expect_snapshot(hrg_game_impl(
    hrg = hrg_model
  ))

  # Structured tests
  result <- hrg_game_impl(
    hrg = hrg_model
  )
  expect_s3_class(result, "igraph")
})

test_that("hrg_game_impl errors", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  # FIXME: This test triggers an assertion failure in the C code when passing
  # NULL/empty HRG. The C code should validate input and return a proper error
  # message instead of an assertion failure.
  expect_snapshot_igraph_error(hrg_game_impl(
    hrg = NULL
  ))
})

# 232. hrg_consensus_impl

# test_that("hrg_consensus_impl basic", {
# withr::local_seed(20250909)
# oldval <- igraph_opt("print.id")
# igraph_options(print.id = FALSE)
#   g <- path_graph_impl(3)
#   expect_snapshot(hrg_consensus_impl(g))
#   expect_snapshot(hrg_consensus_impl(g, hrg=list(left=1, right=2, prob=0.5, edges=1, vertices=1), start=TRUE, num_samples=2))
# })

test_that("hrg_consensus_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(hrg_consensus_impl(
    graph = NULL
  ))
})

# 233. hrg_predict_impl

# test_that("hrg_predict_impl basic", {
# withr::local_seed(20250909)
# oldval <- igraph_opt("print.id")
# igraph_options(print.id = FALSE)
#   g <- path_graph_impl(3)
#   expect_snapshot(hrg_predict_impl(g))
#   expect_snapshot(hrg_predict_impl(g, hrg=list(left=1, right=2, prob=0.5, edges=1, vertices=1), start=TRUE, num_samples=2, num_bins=2))
# })

test_that("hrg_predict_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(hrg_predict_impl(
    graph = NULL
  ))
})

# 234. hrg_create_impl

test_that("hrg_create_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_tree(5)
  expect_snapshot(hrg_create_impl(
    graph = g,
    prob = rep(0.5, 2)
  ))

  # Structured tests
  result <- hrg_create_impl(
    graph = g,
    prob = rep(0.5, 2)
  )
  expect_type(result, "list")
})

test_that("hrg_create_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_full_graph(4, directed = TRUE)
  expect_snapshot_igraph_error(hrg_create_impl(
    graph = g,
    prob = 0.5
  ))
})

# 235. hrg_resize_impl

test_that("hrg_resize_impl basic", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_full_graph(10)
  hrg_model <- fit_hrg(g, hrg = NULL, start = FALSE, steps = 0)
  expect_snapshot(hrg_resize_impl(
    hrg = hrg_model,
    newsize = 5
  ))

  # Structured tests
  result <- hrg_resize_impl(
    hrg = hrg_model,
    newsize = 5
  )
  expect_type(result, "list")
})

test_that("hrg_resize_impl errors", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(hrg_resize_impl(
    hrg = -1,
    newsize = 2
  ))
})

# 236. hrg_size_impl

test_that("hrg_size_impl basic", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_full_graph(10)
  hrg_model <- fit_hrg(g, hrg = NULL, start = FALSE, steps = 0)
  expect_snapshot(hrg_size_impl(
    hrg = hrg_model
  ))

  # Structured tests
  result <- hrg_size_impl(
    hrg = hrg_model
  )
  expect_true(is.numeric(result))
})

test_that("hrg_size_impl errors", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(hrg_size_impl(
    hrg = -1
  ))
})

# 237. from_hrg_dendrogram_impl

test_that("from_hrg_dendrogram_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_full_graph(10)
  hrg_model <- fit_hrg(g, hrg = NULL, start = FALSE, steps = 0)
  expect_snapshot(from_hrg_dendrogram_impl(
    hrg = hrg_model
  ))

  # Structured tests
  result <- from_hrg_dendrogram_impl(
    hrg = hrg_model
  )
  expect_type(result, "list")
})

test_that("from_hrg_dendrogram_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(from_hrg_dendrogram_impl(
    hrg = -1
  ))
})

# 238. get_adjacency_sparse_impl

test_that("get_adjacency_sparse_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_adjacency_sparse_impl(
    graph = g
  ))
  expect_snapshot(get_adjacency_sparse_impl(
    graph = g,
    type = "upper",
    weights = c(1, 2),
    loops = "none"
  ))

  # Structured tests
  result <- get_adjacency_sparse_impl(
    graph = g
  )
  expect_s3_class(result, "igraph.tmp.sparse")
})

test_that("get_adjacency_sparse_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_adjacency_sparse_impl(
    graph = NULL
  ))
})

# 239. get_stochastic_impl

test_that("get_stochastic_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_stochastic_impl(
    graph = g
  ))
  expect_snapshot(get_stochastic_impl(
    graph = g,
    column_wise = TRUE,
    weights = c(1, 2)
  ))

  # Structured tests
  result <- get_stochastic_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("get_stochastic_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_stochastic_impl(
    graph = NULL
  ))
})

# 240. get_stochastic_sparse_impl

test_that("get_stochastic_sparse_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_stochastic_sparse_impl(
    graph = g
  ))
  expect_snapshot(get_stochastic_sparse_impl(
    graph = g,
    column_wise = TRUE,
    weights = c(1, 2)
  ))

  # Structured tests
  result <- get_stochastic_sparse_impl(
    graph = g
  )
  expect_s3_class(result, "igraph.tmp.sparse")
})

test_that("get_stochastic_sparse_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_stochastic_sparse_impl(
    graph = NULL
  ))
})

# 241. to_directed_impl

test_that("to_directed_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(to_directed_impl(
    graph = g
  ))
  expect_snapshot(to_directed_impl(
    graph = g,
    mode = "acyclic"
  ))

  # Structured tests
  result <- to_directed_impl(
    graph = g
  )
  expect_s3_class(result, "igraph")
})

test_that("to_directed_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(to_directed_impl(
    graph = NULL
  ))
})

# 242. to_undirected_impl

test_that("to_undirected_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(to_undirected_impl(
    graph = g
  ))
  expect_snapshot(to_undirected_impl(
    graph = g,
    mode = "mutual",
    edge_attr_comb = "sum"
  ))

  # Structured tests
  result <- to_undirected_impl(
    graph = g
  )
  expect_s3_class(result, "igraph")
})

test_that("to_undirected_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(to_undirected_impl(
    graph = NULL
  ))
})

# 243. motifs_randesu_impl

test_that("motifs_randesu_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(motifs_randesu_impl(
    graph = g
  ))
  expect_snapshot(motifs_randesu_impl(
    graph = g,
    size = 4,
    cut_prob = rep(0.1, 4)
  ))

  # Structured tests
  result <- motifs_randesu_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("motifs_randesu_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(motifs_randesu_impl(
    graph = NULL
  ))
})

# 244. motifs_randesu_estimate_impl

test_that("motifs_randesu_estimate_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 6
  )

  expect_snapshot(motifs_randesu_estimate_impl(
    graph = g,
    size = 3,
    sample_size = 2
  ))
  expect_snapshot(motifs_randesu_estimate_impl(
    graph = g,
    size = 4,
    cut_prob = rep(0.1, 4),
    sample_size = 2,
    sample = 1:2
  ))

  # Structured tests
  result <- motifs_randesu_estimate_impl(
    graph = g,
    size = 3,
    sample_size = 2
  )
  expect_true(is.numeric(result))
})

test_that("motifs_randesu_estimate_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    motifs_randesu_estimate_impl(
      graph = NULL,
      size = 3,
      sample_size = 2
    )
  )
})

# 245. motifs_randesu_no_impl

test_that("motifs_randesu_no_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(motifs_randesu_no_impl(
    graph = g
  ))
  expect_snapshot(motifs_randesu_no_impl(
    graph = g,
    size = 4,
    cut_prob = c(0.1, 0.1, 0.1, 0.1)
  ))

  # Structured tests
  result <- motifs_randesu_no_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("motifs_randesu_no_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot_igraph_error(
    motifs_randesu_no_impl(
      graph = g,
      size = 3,
      cut_prob = c(0.1)
    )
  )
})

# 246. dyad_census_impl

test_that("dyad_census_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(dyad_census_impl(
    graph = g
  ))

  # Structured tests
  result <- dyad_census_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("dyad_census_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(dyad_census_impl(
    graph = NULL
  ))
})

# 247. triad_census_impl

test_that("triad_census_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(triad_census_impl(
    graph = g
  ))

  # Structured tests
  expect_warning(
    result <- triad_census_impl(
      graph = g
    )
  )
  expect_true(is.numeric(result))
})

test_that("triad_census_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(triad_census_impl(
    graph = NULL
  ))
})

# 248. count_adjacent_triangles_impl

test_that("count_adjacent_triangles_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(count_adjacent_triangles_impl(
    graph = g
  ))
  expect_snapshot(count_adjacent_triangles_impl(
    graph = g,
    vids = 1:2
  ))

  # Structured tests
  result <- count_adjacent_triangles_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("count_adjacent_triangles_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(count_adjacent_triangles_impl(
    graph = NULL
  ))
})

# 249. count_triangles_impl

test_that("count_triangles_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(count_triangles_impl(
    graph = g
  ))

  # Structured tests
  result <- count_triangles_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("count_triangles_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(count_triangles_impl(
    graph = NULL
  ))
})

# 250. local_scan_0_impl

test_that("local_scan_0_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(local_scan_0_impl(
    graph = g
  ))
  expect_snapshot(local_scan_0_impl(
    graph = g,
    weights = c(1, 2),
    mode = "in"
  ))

  # Structured tests
  result <- local_scan_0_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("local_scan_0_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(local_scan_0_impl(
    graph = NULL
  ))
})

# 251. local_scan_0_them_impl

test_that("local_scan_0_them_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(local_scan_0_them_impl(
    us = g1,
    them = g2
  ))
  expect_snapshot(local_scan_0_them_impl(
    us = g1,
    them = g2,
    weights_them = c(1, 2),
    mode = "in"
  ))

  # Structured tests
  result <- local_scan_0_them_impl(
    us = g1,
    them = g2
  )
  expect_true(is.numeric(result))
})

test_that("local_scan_0_them_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  them <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(
    local_scan_0_them_impl(
      us = NULL,
      them = them
    )
  )
})

# 252. local_scan_1_ecount_impl

test_that("local_scan_1_ecount_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(local_scan_1_ecount_impl(
    graph = g
  ))
  expect_snapshot(local_scan_1_ecount_impl(
    graph = g,
    weights = c(1, 2),
    mode = "in"
  ))

  # Structured tests
  result <- local_scan_1_ecount_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("local_scan_1_ecount_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(local_scan_1_ecount_impl(
    graph = NULL
  ))
})

# 253. local_scan_1_ecount_them_impl

test_that("local_scan_1_ecount_them_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(local_scan_1_ecount_them_impl(
    us = g1,
    them = g2
  ))
  expect_snapshot(local_scan_1_ecount_them_impl(
    us = g1,
    them = g2,
    weights_them = c(1, 2),
    mode = "in"
  ))

  # Structured tests
  result <- local_scan_1_ecount_them_impl(
    us = g1,
    them = g2
  )
  expect_true(is.numeric(result))
})

test_that("local_scan_1_ecount_them_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  them <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(
    local_scan_1_ecount_them_impl(
      us = NULL,
      them = them
    )
  )
})

# 254. local_scan_k_ecount_impl

test_that("local_scan_k_ecount_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(local_scan_k_ecount_impl(
    graph = g,
    k = 1
  ))
  expect_snapshot(local_scan_k_ecount_impl(
    graph = g,
    k = 1,
    weights = c(1, 2),
    mode = "in"
  ))

  # Structured tests
  result <- local_scan_k_ecount_impl(
    graph = g,
    k = 1
  )
  expect_true(is.numeric(result))
})

test_that("local_scan_k_ecount_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(local_scan_k_ecount_impl(
    graph = NULL,
    k = 1
  ))
})

# 255. local_scan_k_ecount_them_impl

test_that("local_scan_k_ecount_them_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(local_scan_k_ecount_them_impl(
    us = g1,
    them = g2,
    k = 1
  ))
  expect_snapshot(local_scan_k_ecount_them_impl(
    us = g1,
    them = g2,
    k = 1,
    weights_them = c(1, 2),
    mode = "in"
  ))

  # Structured tests
  result <- local_scan_k_ecount_them_impl(
    us = g1,
    them = g2,
    k = 1
  )
  expect_true(is.numeric(result))
})

test_that("local_scan_k_ecount_them_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  them <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(
    local_scan_k_ecount_them_impl(
      us = NULL,
      them = them,
      k = 1
    )
  )
})

# 256. local_scan_neighborhood_ecount_impl

test_that("local_scan_neighborhood_ecount_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 4
  )

  expect_snapshot(local_scan_neighborhood_ecount_impl(
    graph = g,
    neighborhoods = list(1:2, 2:3, 2:4, 2)
  ))
  expect_snapshot(local_scan_neighborhood_ecount_impl(
    graph = g,
    weights = c(1, 2, 3),
    neighborhoods = list(1:2, 1:3, 2:4, 1)
  ))

  # Structured tests
  result <- local_scan_neighborhood_ecount_impl(
    graph = g,
    neighborhoods = list(1:2, 2:3, 2:4, 2)
  )
  expect_true(is.numeric(result))
})

test_that("local_scan_neighborhood_ecount_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    local_scan_neighborhood_ecount_impl(
      graph = NULL,
      neighborhoods = list(1:2, 2:3)
    )
  )
})

# 257. local_scan_subset_ecount_impl

test_that("local_scan_subset_ecount_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 4
  )

  expect_snapshot(local_scan_subset_ecount_impl(
    graph = g,
    subsets = list(c(1, 2), c(2, 3))
  ))
  expect_snapshot(local_scan_subset_ecount_impl(
    graph = g,
    weights = c(1, 2, 3),
    subsets = list(c(1, 2), c(2, 3))
  ))

  # Structured tests
  result <- local_scan_subset_ecount_impl(
    graph = g,
    subsets = list(c(1, 2), c(2, 3))
  )
  expect_true(is.numeric(result))
})

test_that("local_scan_subset_ecount_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 4
  )

  expect_snapshot_igraph_error(
    local_scan_subset_ecount_impl(
      graph = g,
      subsets = list(1:2, letters[2:3])
    )
  )
})

# 258. list_triangles_impl

test_that("list_triangles_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(list_triangles_impl(
    graph = g
  ))

  # Structured tests
  result <- list_triangles_impl(
    graph = g
  )
  expect_s3_class(result, "igraph.vs")
})

test_that("list_triangles_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(list_triangles_impl(
    graph = NULL
  ))
})

# 259. join_impl

test_that("join_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(join_impl(
    left = g1,
    right = g2
  ))

  # Structured tests
  result <- join_impl(
    left = g1,
    right = g2
  )
  expect_s3_class(result, "igraph")
})

test_that("join_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  right <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(join_impl(
    left = NULL,
    right = right
  ))
})

# 260. induced_subgraph_map_impl

test_that("induced_subgraph_map_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(induced_subgraph_map_impl(
    graph = g,
    vids = 1:2,
    impl = "auto"
  ))
  expect_snapshot(induced_subgraph_map_impl(
    graph = g,
    vids = 1:2,
    impl = "copy_and_delete"
  ))

  # Structured tests
  result <- induced_subgraph_map_impl(
    graph = g,
    vids = 1:2,
    impl = "auto"
  )
  expect_type(result, "list")
})

test_that("induced_subgraph_map_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    induced_subgraph_map_impl(
      graph = NULL,
      vids = 1:2,
      impl = "auto"
    )
  )
})

# 261. mycielskian_impl

test_that("mycielskian_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(mycielskian_impl(
    graph = g
  ))
  expect_snapshot(mycielskian_impl(
    graph = g,
    k = 2
  ))

  # Structured tests
  result <- mycielskian_impl(
    graph = g
  )
  expect_s3_class(result, "igraph")
})

test_that("mycielskian_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(mycielskian_impl(
    graph = NULL
  ))
})

# 262. product_impl

test_that("product_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(product_impl(
    g1 = g1,
    g2 = g2
  ))
  expect_snapshot(product_impl(
    g1 = g1,
    g2 = g2,
    type = "tensor"
  ))

  # Structured tests
  result <- product_impl(
    g1 = g1,
    g2 = g2
  )
  expect_s3_class(result, "igraph")
})

test_that("product_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g2 <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(product_impl(
    g1 = NULL,
    g2 = g2
  ))
})

# 263. rooted_product_impl

test_that("rooted_product_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(rooted_product_impl(
    g1 = g1,
    g2 = g2,
    root = 1
  ))

  # Structured tests
  result <- rooted_product_impl(
    g1 = g1,
    g2 = g2,
    root = 1
  )
  expect_s3_class(result, "igraph")
})

test_that("rooted_product_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g2 <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(
    rooted_product_impl(
      g1 = NULL,
      g2 = g2,
      root = 1
    )
  )
})

# 264. gomory_hu_tree_impl

test_that("gomory_hu_tree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(gomory_hu_tree_impl(
    graph = g
  ))
  expect_snapshot(gomory_hu_tree_impl(
    graph = g,
    capacity = c(1, 2)
  ))

  # Structured tests
  result <- gomory_hu_tree_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("gomory_hu_tree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(gomory_hu_tree_impl(
    graph = NULL
  ))
})

# 265. maxflow_impl

test_that("maxflow_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(maxflow_impl(
    graph = g,
    source = 1,
    target = 3
  ))
  expect_snapshot(maxflow_impl(
    graph = g,
    source = 1,
    target = 3,
    capacity = c(1, 2)
  ))

  # Structured tests
  result <- maxflow_impl(
    graph = g,
    source = 1,
    target = 3
  )
  expect_type(result, "list")
})

test_that("maxflow_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(maxflow_impl(
    graph = NULL,
    source = 1,
    target = 3
  ))
})

# 266. residual_graph_impl

test_that("residual_graph_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(residual_graph_impl(
    graph = g,
    capacity = c(1, 2),
    flow = c(1, 2)
  ))

  # Structured tests
  result <- residual_graph_impl(
    graph = g,
    capacity = c(1, 2),
    flow = c(1, 2)
  )
  expect_type(result, "list")
})

test_that("residual_graph_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    residual_graph_impl(
      graph = NULL,
      capacity = c(1, 2),
      flow = c(1, 2)
    )
  )
})

# 267. reverse_residual_graph_impl

test_that("reverse_residual_graph_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(reverse_residual_graph_impl(
    graph = g,
    capacity = c(1, 2),
    flow = c(1, 2)
  ))

  # Structured tests
  result <- reverse_residual_graph_impl(
    graph = g,
    capacity = c(1, 2),
    flow = c(1, 2)
  )
  expect_s3_class(result, "igraph")
})

test_that("reverse_residual_graph_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    reverse_residual_graph_impl(
      graph = NULL,
      capacity = c(1, 2),
      flow = c(1, 2)
    )
  )
})

# 268. st_mincut_impl

test_that("st_mincut_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(st_mincut_impl(
    graph = g,
    source = 1,
    target = 3
  ))
  expect_snapshot(st_mincut_impl(
    graph = g,
    source = 1,
    target = 3,
    capacity = c(1, 2)
  ))

  # Structured tests
  result <- st_mincut_impl(
    graph = g,
    source = 1,
    target = 3
  )
  expect_type(result, "list")
})

test_that("st_mincut_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(st_mincut_impl(
    graph = NULL,
    source = 1,
    target = 3
  ))
})

# 269. dominator_tree_impl

test_that("dominator_tree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3,
    directed = TRUE
  )

  expect_snapshot(dominator_tree_impl(
    graph = g,
    root = 1
  ))
  expect_snapshot(dominator_tree_impl(
    graph = g,
    root = 1,
    mode = "in"
  ))

  # Structured tests
  result <- dominator_tree_impl(
    graph = g,
    root = 1
  )
  expect_type(result, "list")
})

test_that("dominator_tree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(dominator_tree_impl(
    graph = NULL,
    root = 1
  ))
})

# 270. all_st_cuts_impl

test_that("all_st_cuts_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3,
    directed = TRUE
  )

  expect_snapshot(all_st_cuts_impl(
    graph = g,
    source = 1,
    target = 3
  ))

  # Structured tests
  result <- all_st_cuts_impl(
    graph = g,
    source = 1,
    target = 3
  )
  expect_type(result, "list")
})

test_that("all_st_cuts_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(all_st_cuts_impl(
    graph = NULL,
    source = 1,
    target = 3
  ))
})

# 271. all_st_mincuts_impl

test_that("all_st_mincuts_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3,
    directed = TRUE
  )

  expect_snapshot(all_st_mincuts_impl(
    graph = g,
    source = 1,
    target = 3
  ))
  expect_snapshot(all_st_mincuts_impl(
    graph = g,
    source = 1,
    target = 3,
    capacity = c(1, 2)
  ))

  # Structured tests
  result <- all_st_mincuts_impl(
    graph = g,
    source = 1,
    target = 3
  )
  expect_type(result, "list")
})

test_that("all_st_mincuts_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    all_st_mincuts_impl(
      graph = NULL,
      source = 1,
      target = 3
    )
  )
})

# 272. even_tarjan_reduction_impl

test_that("even_tarjan_reduction_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(even_tarjan_reduction_impl(
    graph = g
  ))

  # Structured tests
  result <- even_tarjan_reduction_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("even_tarjan_reduction_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(even_tarjan_reduction_impl(
    graph = NULL
  ))
})

# 273. is_separator_impl

test_that("is_separator_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_separator_impl(
    graph = g,
    candidate = 1:2
  ))

  # Structured tests
  result <- is_separator_impl(
    graph = g,
    candidate = 1:2
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_separator_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_separator_impl(
    graph = NULL,
    candidate = 1:2
  ))
})

# 274. is_minimal_separator_impl

test_that("is_minimal_separator_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_minimal_separator_impl(
    graph = g,
    candidate = 1:2
  ))

  # Structured tests
  result <- is_minimal_separator_impl(
    graph = g,
    candidate = 1:2
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_minimal_separator_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_minimal_separator_impl(
    graph = NULL,
    candidate = 1:2
  ))
})

# 275. all_minimal_st_separators_impl

test_that("all_minimal_st_separators_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(all_minimal_st_separators_impl(
    graph = g
  ))

  # Structured tests
  result <- all_minimal_st_separators_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("all_minimal_st_separators_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(all_minimal_st_separators_impl(
    graph = NULL
  ))
})

# 276. minimum_size_separators_impl

test_that("minimum_size_separators_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(minimum_size_separators_impl(
    graph = g
  ))

  # Structured tests
  result <- minimum_size_separators_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("minimum_size_separators_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(minimum_size_separators_impl(
    graph = NULL
  ))
})

# 277. isoclass_impl

test_that("isoclass_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(isoclass_impl(
    graph = g
  ))

  # Structured tests
  result <- isoclass_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("isoclass_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(isoclass_impl(
    graph = NULL
  ))
})

# 278. isomorphic_impl

test_that("isomorphic_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(isomorphic_impl(
    graph1 = g1,
    graph2 = g2
  ))

  # Structured tests
  result <- isomorphic_impl(
    graph1 = g1,
    graph2 = g2
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("isomorphic_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  graph2 <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(isomorphic_impl(
    graph1 = NULL,
    graph2 = graph2
  ))
})

# 279. isoclass_subgraph_impl

test_that("isoclass_subgraph_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 5
  )

  expect_snapshot(isoclass_subgraph_impl(
    graph = g,
    vids = c(1, 2, 3)
  ))

  # Structured tests
  result <- isoclass_subgraph_impl(
    graph = g,
    vids = c(1, 2, 3)
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("isoclass_subgraph_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(isoclass_subgraph_impl(
    graph = NULL,
    vids = 1:2
  ))
})

# 280. isoclass_create_impl

test_that("isoclass_create_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(isoclass_create_impl(
    size = 3,
    number = 1
  ))
  expect_snapshot(isoclass_create_impl(
    size = 3,
    number = 1,
    directed = FALSE
  ))

  # Structured tests
  result <- isoclass_create_impl(
    size = 3,
    number = 1
  )
  expect_s3_class(result, "igraph")
})

test_that("isoclass_create_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(isoclass_create_impl(
    size = "a",
    number = 1
  ))
})

# 281. isomorphic_vf2_impl

test_that("isomorphic_vf2_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(isomorphic_vf2_impl(
    graph1 = g1,
    graph2 = g2
  ))
  expect_snapshot(isomorphic_vf2_impl(
    graph1 = g1,
    graph2 = g2,
    vertex_color1 = c(1, 2, 3),
    vertex_color2 = c(1, 2, 3),
    edge_color1 = c(1, 2),
    edge_color2 = c(1, 2)
  ))

  # Structured tests
  result <- isomorphic_vf2_impl(
    graph1 = g1,
    graph2 = g2
  )
  expect_type(result, "list")
})

test_that("isomorphic_vf2_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  graph2 <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(isomorphic_vf2_impl(
    graph1 = NULL,
    graph2 = graph2
  ))
})

# 282. get_isomorphisms_vf2_callback_impl
# Skipped: requires callback function, not suitable for snapshot test

# 283. count_isomorphisms_vf2_impl

test_that("count_isomorphisms_vf2_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(count_isomorphisms_vf2_impl(
    graph1 = g1,
    graph2 = g2
  ))
  expect_snapshot(count_isomorphisms_vf2_impl(
    graph1 = g1,
    graph2 = g2,
    vertex_color1 = c(1, 2, 3),
    vertex_color2 = c(1, 2, 3),
    edge_color1 = c(1, 2),
    edge_color2 = c(1, 2)
  ))

  # Structured tests
  result <- count_isomorphisms_vf2_impl(
    graph1 = g1,
    graph2 = g2
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("count_isomorphisms_vf2_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  graph2 <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(
    count_isomorphisms_vf2_impl(
      graph1 = NULL,
      graph2 = graph2
    )
  )
})

# 284. get_isomorphisms_vf2_impl

test_that("get_isomorphisms_vf2_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_isomorphisms_vf2_impl(
    graph1 = g1,
    graph2 = g2
  ))
  expect_snapshot(get_isomorphisms_vf2_impl(
    graph1 = g1,
    graph2 = g2,
    vertex_color1 = c(1, 2, 3),
    vertex_color2 = c(1, 2, 3),
    edge_color1 = c(1, 2),
    edge_color2 = c(1, 2)
  ))

  # Structured tests
  result <- get_isomorphisms_vf2_impl(
    graph1 = g1,
    graph2 = g2
  )
  expect_type(result, "list")
})

test_that("get_isomorphisms_vf2_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  graph2 <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(
    get_isomorphisms_vf2_impl(
      graph1 = NULL,
      graph2 = graph2
    )
  )
})

# 285. subisomorphic_impl

test_that("subisomorphic_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(subisomorphic_impl(
    graph1 = g1,
    graph2 = g2
  ))

  # Structured tests
  result <- subisomorphic_impl(
    graph1 = g1,
    graph2 = g2
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("subisomorphic_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  graph2 <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(subisomorphic_impl(
    graph1 = NULL,
    graph2 = graph2
  ))
})

# 286. subisomorphic_vf2_impl

test_that("subisomorphic_vf2_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(subisomorphic_vf2_impl(
    graph1 = g1,
    graph2 = g2
  ))
  expect_snapshot(subisomorphic_vf2_impl(
    graph1 = g1,
    graph2 = g2,
    vertex_color1 = c(1, 2, 3),
    vertex_color2 = c(1, 2, 3),
    edge_color1 = c(1, 2),
    edge_color2 = c(1, 2)
  ))

  # Structured tests
  result <- subisomorphic_vf2_impl(
    graph1 = g1,
    graph2 = g2
  )
  expect_type(result, "list")
})

test_that("subisomorphic_vf2_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  graph2 <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(
    subisomorphic_vf2_impl(
      graph1 = NULL,
      graph2 = graph2
    )
  )
})

# 287. count_subisomorphisms_vf2_impl

test_that("count_subisomorphisms_vf2_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(count_subisomorphisms_vf2_impl(
    graph1 = g1,
    graph2 = g2
  ))
  expect_snapshot(count_subisomorphisms_vf2_impl(
    graph1 = g1,
    graph2 = g2,
    vertex_color1 = c(1, 2, 3),
    vertex_color2 = c(1, 2, 3),
    edge_color1 = c(1, 2),
    edge_color2 = c(1, 2)
  ))

  # Structured tests
  result <- count_subisomorphisms_vf2_impl(
    graph1 = g1,
    graph2 = g2
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("count_subisomorphisms_vf2_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  graph2 <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(
    count_subisomorphisms_vf2_impl(
      graph1 = NULL,
      graph2 = graph2
    )
  )
})

# 288. get_subisomorphisms_vf2_impl

test_that("get_subisomorphisms_vf2_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(get_subisomorphisms_vf2_impl(
    graph1 = g1,
    graph2 = g2
  ))
  expect_snapshot(get_subisomorphisms_vf2_impl(
    graph1 = g1,
    graph2 = g2,
    vertex_color1 = c(1, 2, 3),
    vertex_color2 = c(1, 2, 3),
    edge_color1 = c(1, 2),
    edge_color2 = c(1, 2)
  ))

  # Structured tests
  result <- get_subisomorphisms_vf2_impl(
    graph1 = g1,
    graph2 = g2
  )
  expect_type(result, "list")
})

test_that("get_subisomorphisms_vf2_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  graph2 <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(
    get_subisomorphisms_vf2_impl(
      graph1 = NULL,
      graph2 = graph2
    )
  )
})

# 289. canonical_permutation_impl

test_that("canonical_permutation_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(canonical_permutation_impl(
    graph = g
  ))
  expect_snapshot(canonical_permutation_impl(
    graph = g,
    colors = c(1, 2, 3),
    sh = "fl"
  ))

  # Structured tests
  result <- canonical_permutation_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("canonical_permutation_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(canonical_permutation_impl(
    graph = NULL
  ))
})

# 290. permute_vertices_impl

test_that("permute_vertices_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(permute_vertices_impl(
    graph = g,
    permutation = 3:1
  ))

  # Structured tests
  result <- permute_vertices_impl(
    graph = g,
    permutation = 3:1
  )
  expect_s3_class(result, "igraph")
})

test_that("permute_vertices_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(permute_vertices_impl(
    graph = NULL,
    permutation = 3:1
  ))
})

# 291. isomorphic_bliss_impl

test_that("isomorphic_bliss_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(
    n = 3
  )

  g2 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(isomorphic_bliss_impl(
    graph1 = g1,
    graph2 = g2
  ))
  expect_snapshot(isomorphic_bliss_impl(
    graph1 = g1,
    graph2 = g2,
    colors1 = c(1, 2, 3),
    colors2 = c(1, 2, 3),
    sh = "fl"
  ))

  # Structured tests
  result <- isomorphic_bliss_impl(
    graph1 = g1,
    graph2 = g2
  )
  expect_type(result, "list")
})

test_that("isomorphic_bliss_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  graph2 <- path_graph_impl(
    n = 3
  )
  expect_snapshot_igraph_error(isomorphic_bliss_impl(
    graph1 = NULL,
    graph2 = graph2
  ))
})

# 292. count_automorphisms_impl

test_that("count_automorphisms_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(count_automorphisms_impl(
    graph = g
  ))
  expect_snapshot(count_automorphisms_impl(
    graph = g,
    colors = c(1, 2, 3),
    sh = "fl"
  ))

  # Structured tests
  result <- count_automorphisms_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("count_automorphisms_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(count_automorphisms_impl(
    graph = NULL
  ))
})

# 293. automorphism_group_impl

test_that("automorphism_group_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(automorphism_group_impl(
    graph = g
  ))
  expect_snapshot(automorphism_group_impl(
    graph = g,
    colors = c(1, 2, 3),
    sh = "fl",
    details = TRUE
  ))

  # Structured tests
  result <- automorphism_group_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("automorphism_group_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(automorphism_group_impl(
    graph = NULL
  ))
})

# 294. simplify_and_colorize_impl

test_that("simplify_and_colorize_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(simplify_and_colorize_impl(
    graph = g
  ))

  # Structured tests
  result <- simplify_and_colorize_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("simplify_and_colorize_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(simplify_and_colorize_impl(
    graph = NULL
  ))
})

# 295. graph_count_impl

test_that("graph_count_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(graph_count_impl(
    n = 3
  ))
  expect_snapshot(graph_count_impl(
    n = 3,
    directed = TRUE
  ))

  # Structured tests
  result <- graph_count_impl(
    n = 3
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("graph_count_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(graph_count_impl(
    n = "a"
  ))
})

# 296. is_matching_impl

test_that("is_matching_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_matching_impl(
    graph = g,
    matching = 1:2
  ))
  expect_snapshot(is_matching_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE),
    matching = 1:2
  ))

  # Structured tests
  result <- is_matching_impl(
    graph = g,
    matching = 1:2
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_matching_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_matching_impl(
    graph = NULL,
    matching = 1:2
  ))
})

# 297. is_maximal_matching_impl

test_that("is_maximal_matching_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_maximal_matching_impl(
    graph = g,
    matching = 1:2
  ))
  expect_snapshot(is_maximal_matching_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE),
    matching = 1:2
  ))

  # Structured tests
  result <- is_maximal_matching_impl(
    graph = g,
    matching = 1:2
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_maximal_matching_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_maximal_matching_impl(
    graph = NULL,
    matching = 1:2
  ))
})

# 298. maximum_bipartite_matching_impl

test_that("maximum_bipartite_matching_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(maximum_bipartite_matching_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE)
  ))
  expect_snapshot(maximum_bipartite_matching_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE),
    weights = c(1, 2),
    eps = 1e-05
  ))

  # Structured tests
  result <- maximum_bipartite_matching_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE)
  )
  expect_type(result, "list")
})

test_that("maximum_bipartite_matching_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    maximum_bipartite_matching_impl(
      graph = NULL,
      types = c(TRUE, FALSE, TRUE)
    )
  )
})

# 299. adjacency_spectral_embedding_impl

test_that("adjacency_spectral_embedding_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(adjacency_spectral_embedding_impl(
    graph = g,
    no = 2
  ))
  expect_snapshot(adjacency_spectral_embedding_impl(
    graph = g,
    no = 2,
    weights = c(1, 2),
    which = "la",
    scaled = FALSE,
    cvec = c(1, 2, 3),
    options = list(maxiter = 10)
  ))

  # Structured tests
  result <- adjacency_spectral_embedding_impl(
    graph = g,
    no = 2
  )
  expect_type(result, "list")
})

test_that("adjacency_spectral_embedding_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(adjacency_spectral_embedding_impl(
    graph = NULL,
    no = 2
  ))
})

# 300. laplacian_spectral_embedding_impl

test_that("laplacian_spectral_embedding_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(laplacian_spectral_embedding_impl(
    graph = g,
    no = 2
  ))

  # Structured tests
  result <- laplacian_spectral_embedding_impl(
    graph = g,
    no = 2
  )
  expect_type(result, "list")
})

test_that("laplacian_spectral_embedding_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(laplacian_spectral_embedding_impl(
    graph = NULL,
    no = 2
  ))
})

# 301. eigen_adjacency_impl

test_that("eigen_adjacency_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(eigen_adjacency_impl(
    graph = g
  ))
  expect_snapshot_igraph_error(
    eigen_adjacency_impl(
      graph = g,
      algorithm = "lapack",
      which = list(which = "LA"),
      options = list(maxiter = 10)
    )
  )

  # Structured tests
  result <- eigen_adjacency_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("eigen_adjacency_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(eigen_adjacency_impl(
    graph = NULL
  ))
})

# 302. power_law_fit_impl

test_that("power_law_fit_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(power_law_fit_impl(
    data = c(1, 2, 3)
  ))
  expect_snapshot(power_law_fit_impl(
    data = c(1, 2, 3),
    xmin = 1,
    force_continuous = TRUE
  ))

  # Structured tests
  result <- power_law_fit_impl(
    data = c(1, 2, 3)
  )
  expect_type(result, "list")
})

test_that("power_law_fit_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(power_law_fit_impl(
    data = "a"
  ))
})

# 303. sir_impl

test_that("sir_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(sir_impl(
    graph = g,
    beta = 0.1,
    gamma = 0.1
  ))
  expect_snapshot(sir_impl(
    graph = g,
    beta = 0.1,
    gamma = 0.1,
    no_sim = 2
  ))

  # Structured tests
  result <- sir_impl(
    graph = g,
    beta = 0.1,
    gamma = 0.1
  )
  expect_s3_class(result, "sir")
})

test_that("sir_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(sir_impl(
    graph = NULL,
    beta = 0.1,
    gamma = 0.1
  ))
})

# 304. convex_hull_2d_impl

test_that("convex_hull_2d_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(convex_hull_2d_impl(
    data = matrix(1:6, ncol = 2)
  ))

  # Structured tests
  result <- convex_hull_2d_impl(
    data = matrix(1:6, ncol = 2)
  )
  expect_type(result, "list")
})

test_that("convex_hull_2d_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(convex_hull_2d_impl(
    data = "a"
  ))
})

# 305. dim_select_impl

test_that("dim_select_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(dim_select_impl(
    sv = c(1, 2, 3)
  ))

  # Structured tests
  result <- dim_select_impl(
    sv = c(1, 2, 3)
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("dim_select_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(dim_select_impl(
    sv = NULL
  ))
})

# 306. solve_lsap_impl

test_that("solve_lsap_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(solve_lsap_impl(
    c = matrix(1:4, ncol = 2),
    n = 2
  ))

  # Structured tests
  result <- solve_lsap_impl(
    c = matrix(1:4, ncol = 2),
    n = 2
  )
  expect_true(is.numeric(result))
})

test_that("solve_lsap_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(solve_lsap_impl(
    c = "a",
    n = 2
  ))
})

# 307. find_cycle_impl

test_that("find_cycle_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(find_cycle_impl(
    graph = g
  ))
  expect_snapshot(find_cycle_impl(
    graph = g,
    mode = "in"
  ))

  # Structured tests
  result <- find_cycle_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("find_cycle_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(find_cycle_impl(
    graph = NULL
  ))
})

# 308. simple_cycles_impl

test_that("simple_cycles_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(simple_cycles_impl(
    graph = g
  ))
  expect_snapshot(simple_cycles_impl(
    graph = g,
    mode = "in",
    min_cycle_length = 2,
    max_cycle_length = 3
  ))

  # Structured tests
  result <- simple_cycles_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("simple_cycles_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(simple_cycles_impl(
    graph = NULL
  ))
})

# 309. is_eulerian_impl

test_that("is_eulerian_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_eulerian_impl(
    graph = g
  ))

  # Structured tests
  result <- is_eulerian_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("is_eulerian_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_eulerian_impl(
    graph = NULL
  ))
})

# 310. eulerian_path_impl

test_that("eulerian_path_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(eulerian_path_impl(
    graph = g
  ))

  # Structured tests
  result <- eulerian_path_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("eulerian_path_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(eulerian_path_impl(
    graph = NULL
  ))
})

# 311. eulerian_cycle_impl

test_that("eulerian_cycle_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(
    n = 3
  )

  expect_snapshot_igraph_error(eulerian_cycle_impl(
    graph = g1
  ))
  g2 <- cycle_graph_impl(
    n = 4
  )

  expect_snapshot(eulerian_cycle_impl(
    graph = g2
  ))

  # Structured tests
  result <- eulerian_cycle_impl(
    graph = g2
  )
  expect_type(result, "list")
})

test_that("eulerian_cycle_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(eulerian_cycle_impl(
    graph = NULL
  ))
})

# 312. fundamental_cycles_impl

test_that("fundamental_cycles_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(fundamental_cycles_impl(
    graph = g,
    start = 1
  ))
  expect_snapshot(fundamental_cycles_impl(
    graph = g,
    start = 1,
    bfs_cutoff = 2,
    weights = c(1, 2)
  ))

  # Structured tests
  result <- fundamental_cycles_impl(
    graph = g,
    start = 1
  )
  expect_type(result, "list")
})

test_that("fundamental_cycles_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(fundamental_cycles_impl(
    graph = NULL,
    start = 1
  ))
})

# 313. minimum_cycle_basis_impl

test_that("minimum_cycle_basis_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(minimum_cycle_basis_impl(
    graph = g
  ))
  expect_snapshot(minimum_cycle_basis_impl(
    graph = g,
    bfs_cutoff = 2,
    complete = FALSE,
    use_cycle_order = FALSE,
    weights = c(1, 2)
  ))

  # Structured tests
  result <- minimum_cycle_basis_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("minimum_cycle_basis_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(minimum_cycle_basis_impl(
    graph = NULL
  ))
})

# 314. is_tree_impl

test_that("is_tree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_tree_impl(
    graph = g
  ))
  expect_snapshot(is_tree_impl(
    graph = g,
    mode = "in",
    details = TRUE
  ))

  # Structured tests
  result <- is_tree_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_tree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_tree_impl(
    graph = NULL
  ))
})

# 315. is_forest_impl

test_that("is_forest_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_forest_impl(
    graph = g
  ))
  expect_snapshot(is_forest_impl(
    graph = g,
    mode = "in",
    details = TRUE
  ))

  # Structured tests
  result <- is_forest_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_forest_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_forest_impl(
    graph = NULL
  ))
})

# 316. from_prufer_impl

test_that("from_prufer_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(from_prufer_impl(
    prufer = 1:2
  ))

  # Structured tests
  result <- from_prufer_impl(
    prufer = 1:2
  )
  expect_s3_class(result, "igraph")
})

test_that("from_prufer_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(from_prufer_impl(
    prufer = "a"
  ))
})

# 317. to_prufer_impl

test_that("to_prufer_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(to_prufer_impl(
    graph = g
  ))

  # Structured tests
  result <- to_prufer_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("to_prufer_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(to_prufer_impl(
    graph = NULL
  ))
})

# 318. tree_from_parent_vector_impl

test_that("tree_from_parent_vector_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(tree_from_parent_vector_impl(
    parents = c(-1, 1, 2, 3)
  ))
  expect_snapshot(tree_from_parent_vector_impl(
    parents = c(-1, 1, 2, 3),
    type = "in"
  ))

  # Structured tests
  result <- tree_from_parent_vector_impl(
    parents = c(-1, 1, 2, 3)
  )
  expect_s3_class(result, "igraph")
})

test_that("tree_from_parent_vector_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(tree_from_parent_vector_impl(
    parents = "a"
  ))
})

# 319. is_complete_impl

test_that("is_complete_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_complete_impl(
    graph = g
  ))

  # Structured tests
  result <- is_complete_impl(
    graph = g
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_complete_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_complete_impl(
    graph = NULL
  ))
})

# 320. random_spanning_tree_impl

test_that("random_spanning_tree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(random_spanning_tree_impl(
    graph = g,
    vid = 1
  ))

  # Structured tests
  result <- random_spanning_tree_impl(
    graph = g,
    vid = 1
  )
  expect_s3_class(result, "igraph.es")
})

test_that("random_spanning_tree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(random_spanning_tree_impl(
    graph = NULL,
    vid = 1
  ))
})

# 321. tree_game_impl

test_that("tree_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(tree_game_impl(
    n = 3
  ))
  expect_snapshot(tree_game_impl(
    n = 3,
    directed = TRUE,
    method = "lerw"
  ))

  # Structured tests
  result <- tree_game_impl(
    n = 3
  )
  expect_s3_class(result, "igraph")
})

test_that("tree_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(tree_game_impl(
    n = "a"
  ))
})

# 322. vertex_coloring_greedy_impl

test_that("vertex_coloring_greedy_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(vertex_coloring_greedy_impl(
    graph = g
  ))
  expect_snapshot(vertex_coloring_greedy_impl(
    graph = g,
    heuristic = "dsatur"
  ))

  # Structured tests
  result <- vertex_coloring_greedy_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("vertex_coloring_greedy_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(vertex_coloring_greedy_impl(
    graph = NULL
  ))
})

# 323. is_vertex_coloring_impl

test_that("is_vertex_coloring_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_vertex_coloring_impl(
    graph = g,
    types = c(1, 2, 3)
  ))

  # Structured tests
  result <- is_vertex_coloring_impl(
    graph = g,
    types = c(1, 2, 3)
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_vertex_coloring_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    is_vertex_coloring_impl(
      graph = NULL,
      types = c(1, 2, 3)
    )
  )
})

# 324. is_bipartite_coloring_impl

# test_that("is_bipartite_coloring_impl basic", {
#   withr::local_seed(20250909)
#   oldval <- igraph_opt("print.id")
# igraph_options(print.id = FALSE)
#   g <- path_graph_impl(3)
#   expect_snapshot(is_bipartite_coloring_impl(g, types = c(TRUE, FALSE, TRUE)))
#})

# 325. is_bipartite_coloring_impl

test_that("is_bipartite_coloring_impl basic", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(is_bipartite_coloring_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE)
  ))

  # Structured tests
  result <- is_bipartite_coloring_impl(
    graph = g,
    types = c(TRUE, FALSE, TRUE)
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_bipartite_coloring_impl errors", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    is_bipartite_coloring_impl(
      graph = NULL,
      types = c(TRUE, FALSE, TRUE)
    )
  )
})

# 326. is_edge_coloring_impl

test_that("is_edge_coloring_impl basic", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  E(g)$color <- c(1, 2)
  expect_snapshot(is_edge_coloring_impl(
    graph = g,
    types = c(1, 2)
  ))
  expect_snapshot(is_edge_coloring_impl(
    graph = g
  ))

  # Structured tests
  result <- is_edge_coloring_impl(
    graph = g,
    types = c(1, 2)
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("is_edge_coloring_impl errors", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_edge_coloring_impl(
    graph = NULL,
    types = c(1, 2)
  ))
})

# 327. deterministic_optimal_imitation_impl

test_that("deterministic_optimal_imitation_impl basic", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(deterministic_optimal_imitation_impl(
    graph = g,
    vid = 1,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3)
  ))
  expect_snapshot(deterministic_optimal_imitation_impl(
    graph = g,
    vid = 1,
    optimality = "minimum",
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3),
    mode = "in"
  ))

  # Structured tests
  result <- deterministic_optimal_imitation_impl(
    graph = g,
    vid = 1,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3)
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("deterministic_optimal_imitation_impl errors", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    deterministic_optimal_imitation_impl(
      graph = NULL,
      vid = 1,
      quantities = c(1, 2, 3),
      strategies = c(1, 2, 3)
    )
  )
})

# 328. moran_process_impl

test_that("moran_process_impl basic", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(moran_process_impl(
    graph = g,
    weights = c(1, 1),
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3),
    mode = "in"
  ))

  # Structured tests
  result <- moran_process_impl(
    graph = g,
    weights = c(1, 1),
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3),
    mode = "in"
  )
  expect_type(result, "list")
})

test_that("moran_process_impl errors", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    moran_process_impl(
      graph = NULL,
      quantities = c(1, 2, 3),
      strategies = c(1, 2, 3)
    )
  )
})

# 329. roulette_wheel_imitation_impl

test_that("roulette_wheel_imitation_impl basic", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(roulette_wheel_imitation_impl(
    graph = g,
    vid = 1,
    is_local = TRUE,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3)
  ))
  expect_snapshot(roulette_wheel_imitation_impl(
    graph = g,
    vid = 1,
    is_local = FALSE,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3),
    mode = "in"
  ))

  # Structured tests
  result <- roulette_wheel_imitation_impl(
    graph = g,
    vid = 1,
    is_local = TRUE,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3)
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("roulette_wheel_imitation_impl errors", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    roulette_wheel_imitation_impl(
      graph = NULL,
      vid = 1,
      is_local = TRUE,
      quantities = c(1, 2, 3),
      strategies = c(1, 2, 3)
    )
  )
})

# 330. stochastic_imitation_impl

test_that("stochastic_imitation_impl basic", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(stochastic_imitation_impl(
    graph = g,
    vid = 1,
    algo = 1,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3)
  ))
  expect_snapshot(stochastic_imitation_impl(
    graph = g,
    vid = 1,
    algo = 2,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3),
    mode = "in"
  ))

  # Structured tests
  result <- stochastic_imitation_impl(
    graph = g,
    vid = 1,
    algo = 1,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3)
  )
  expect_true(is.numeric(result) || is.logical(result))
})

test_that("stochastic_imitation_impl errors", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    stochastic_imitation_impl(
      graph = NULL,
      vid = 1,
      algo = 1,
      quantities = c(1, 2, 3),
      strategies = c(1, 2, 3)
    )
  )
})

# 331. invalidate_cache_impl

test_that("invalidate_cache_impl basic", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(invalidate_cache_impl(
    graph = NULL
  ))
})

# 332. vertex_path_from_edge_path_impl

test_that("vertex_path_from_edge_path_impl basic", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    vertex_path_from_edge_path_impl(
      graph = NULL,
      start = 1,
      edge_path = c(1, 2)
    )
  )
})

# 333. version_impl

test_that("version_impl basic", {
  withr::local_seed(12345)
  version_impl_clean <- function() {
    v <- version_impl()

    paste(v$major, v$minor, v$subminor, sep = ".")
  }
  expect_snapshot(version_impl_clean())

  # Structured tests
  result <- version_impl_clean()
  expect_type(result, "character")
})

test_that("version_impl errors", {
  withr::local_seed(12345)
  # version_impl() has no parameters, so testing with invalid arguments
  expect_snapshot_igraph_error(version_impl(
    "invalid"
  ))
})

# 334. ecount_impl

test_that("ecount_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(ecount_impl(
    graph = NULL
  ))
})

# 335. is_directed_impl

test_that("is_directed_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_directed_impl(
    graph = NULL
  ))
})

# 336. edges_impl

test_that("edges_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(edges_impl(
    graph = NULL,
    eids = 1
  ))
})

# 337. add_vertices_impl

test_that("add_vertices_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_empty_graph(3)

  g_new <- add_vertices_impl(
    graph = g,
    nv = 2
  )
  expect_snapshot(vcount(g_new))
})

test_that("add_vertices_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(add_vertices_impl(
    graph = NULL,
    nv = 1
  ))
})

# 338. delete_edges_impl

test_that("delete_edges_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_graph(c(1, 2, 2, 3, 3, 4), n = 4, directed = TRUE)

  g_new <- delete_edges_impl(
    graph = g,
    edges = c(1, 2)
  )
  expect_snapshot(ecount(g_new))
})

test_that("delete_edges_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(delete_edges_impl(
    graph = NULL,
    edges = 1
  ))
})

# 339. delete_vertices_impl

test_that("delete_vertices_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_graph(c(1, 2, 2, 3, 3, 4), n = 4, directed = TRUE)

  g_new <- delete_vertices_impl(
    graph = g,
    vertices = c(1, 3)
  )
  expect_snapshot(vcount(g_new))
})

test_that("delete_vertices_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(delete_vertices_impl(
    graph = NULL,
    vertices = 1
  ))
})

# 340. incident_impl

test_that("incident_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE, return.vs_es = FALSE)
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
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(incident_impl(
    graph = NULL,
    vid = 1
  ))
})

test_that("famous_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(famous_impl(
    name = "Zachary"
  ))
})

test_that("famous_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(famous_impl(
    name = "NonexistentGraph"
  ))
})

# 342. constraint_impl

test_that("constraint_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_graph(c(1, 2, 2, 3, 3, 1), n = 3, directed = FALSE)
  result <- constraint_impl(
    graph = g
  )
  expect_length(result, 3)
})

test_that("constraint_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(constraint_impl(
    graph = NULL
  ))
})

# 343. cocitation_impl

test_that("cocitation_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_graph(c(1, 2, 1, 3, 2, 4, 3, 4), n = 4, directed = TRUE)
  result <- cocitation_impl(
    graph = g
  )
  expect_true(is.matrix(result))
})

test_that("cocitation_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(cocitation_impl(
    graph = NULL
  ))
})

# 344. bibcoupling_impl

test_that("bibcoupling_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_graph(c(1, 2, 1, 3, 2, 4, 3, 4), n = 4, directed = TRUE)
  result <- bibcoupling_impl(
    graph = g
  )
  expect_true(is.matrix(result))
})

test_that("bibcoupling_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(bibcoupling_impl(
    graph = NULL
  ))
})

# 345. girth_impl

test_that("girth_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(5)
  result <- girth_impl(
    graph = g
  )
  expect_snapshot(result$girth)
})

test_that("girth_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(girth_impl(
    graph = NULL
  ))
})

# 346. coreness_impl

test_that("coreness_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_graph(c(1, 2, 2, 3, 3, 1, 3, 4), n = 4, directed = FALSE)
  expect_snapshot(coreness_impl(
    graph = g
  ))
})

test_that("coreness_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(coreness_impl(
    graph = NULL
  ))
})

# 347. union_impl

test_that("union_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- make_graph(c(1, 2, 2, 3), n = 3)
  g2 <- make_graph(c(1, 3, 3, 4), n = 4)
  expect_snapshot(union_impl(
    left = g1,
    right = g2
  ))
})

test_that("union_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(union_impl(
    left = NULL,
    right = NULL
  ))
})

# 348. intersection_impl

test_that("intersection_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- make_graph(c(1, 2, 2, 3, 1, 3), n = 3)
  g2 <- make_graph(c(1, 2, 2, 3), n = 3)
  expect_snapshot(intersection_impl(
    left = g1,
    right = g2
  ))
})

test_that("intersection_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(intersection_impl(
    left = NULL,
    right = NULL
  ))
})


# Tests for newly autogenerated _impl functions

# Graph constructors

test_that("star_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(star_impl(n = 5, mode = "out", center = 0))
  expect_snapshot(star_impl(n = 6, mode = "in", center = 1))
  expect_snapshot(star_impl(n = 4, mode = "undirected", center = 0))
})

test_that("ring_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(ring_impl(
    n = 5,
    directed = FALSE,
    mutual = FALSE,
    circular = TRUE
  ))
  expect_snapshot(ring_impl(
    n = 4,
    directed = TRUE,
    mutual = FALSE,
    circular = FALSE
  ))
})

test_that("full_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(full_impl(n = 4, directed = FALSE, loops = FALSE))
  expect_snapshot(full_impl(n = 3, directed = TRUE, loops = FALSE))
})

test_that("kary_tree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(kary_tree_impl(
    n = 7,
    children = 2,
    type = c("out", "in", "undirected")
  ))
  expect_snapshot(kary_tree_impl(
    n = 10,
    children = 3,
    type = c("in", "out", "undirected")
  ))
})

# Random graph generators

test_that("barabasi_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(barabasi_game_impl(
    n = 10,
    power = 1,
    m = 2,
    directed = FALSE,
    algo = "bag"
  ))
  expect_snapshot(barabasi_game_impl(
    n = 10,
    power = 1,
    m = 2,
    directed = FALSE,
    algo = "psumtree"
  ))
})

test_that("growing_random_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(growing_random_game_impl(
    n = 10,
    m = 1,
    directed = TRUE,
    citation = FALSE
  ))
})

test_that("grg_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(grg_game_impl(nodes = 10, radius = 0.3, torus = FALSE))
})

test_that("watts_strogatz_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(watts_strogatz_game_impl(
    dim = 1,
    size = 10,
    nei = 2,
    p = 0.1
  ))
})

# Distance and path functions

test_that("distances_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(5)
  expect_snapshot(distances_impl(
    graph = g,
    from = V(g),
    to = V(g),
    mode = c("out", "in", "all", "total")
  ))
})

test_that("diameter_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(10)
  expect_snapshot(diameter_impl(
    graph = g,
    directed = FALSE,
    unconnected = TRUE
  ))
})

test_that("get_shortest_paths_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(5)
  expect_snapshot(get_shortest_paths_impl(
    graph = g,
    from = 1,
    to = 3,
    mode = c("out", "in", "all", "total")
  ))
})

test_that("subcomponent_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_graph(~ A-B-C, D-E-F)
  expect_snapshot(subcomponent_impl(
    graph = g,
    v = 1,
    mode = c("all", "out", "in")
  ))
})

# Centrality measures

test_that("betweenness_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_star(5, mode = "undirected")
  expect_snapshot(betweenness_impl(graph = g, vids = V(g), directed = FALSE))
})

test_that("closeness_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(5)
  expect_snapshot(closeness_impl(
    graph = g,
    vids = V(g),
    mode = c("out", "in", "all", "total")
  ))
})

test_that("harmonic_centrality_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_star(5, mode = "undirected")
  expect_snapshot(harmonic_centrality_impl(
    graph = g,
    vids = V(g),
    mode = c("out", "in", "all", "total")
  ))
})

test_that("pagerank_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(5, directed = TRUE)
  expect_snapshot(pagerank_impl(
    graph = g,
    vids = V(g),
    directed = TRUE,
    damping = 0.85
  ))
})

test_that("hub_score_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_star(5, mode = "undirected")
  out <- hub_score_impl(graph = g, scale = TRUE, weights = NULL)
  # FIXME: out$vector unstable despite random seed
  expect_length(out$vector, 5)
  expect_type(out$vector, "double")
  out$vector <- NULL
  expect_snapshot(out)
})

test_that("authority_score_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_star(5, mode = "undirected")
  out <- authority_score_impl(graph = g, scale = TRUE, weights = NULL)
  # FIXME: out$vector unstable despite random seed
  expect_length(out$vector, 5)
  expect_type(out$vector, "double")
  out$vector <- NULL
  expect_snapshot(out)
})

# Community detection

test_that("community_walktrap_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_graph(~ A-B-C-A, D-E-F-D, A-D)
  expect_snapshot(community_walktrap_impl(graph = g, steps = 4))
})

test_that("community_fastgreedy_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_graph(~ A-B-C-A, D-E-F-D, A-D)
  expect_snapshot(community_fastgreedy_impl(graph = g))
})

test_that("community_edge_betweenness_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_graph(~ A-B-C-A, D-E-F-D, A-D)
  expect_snapshot(community_edge_betweenness_impl(graph = g, directed = FALSE))
})

# Connectivity

test_that("edge_connectivity_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(5)
  expect_snapshot(edge_connectivity_impl(graph = g))
})

test_that("vertex_connectivity_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(5)
  expect_snapshot(vertex_connectivity_impl(graph = g))
})

# Layout functions

test_that("layout_sphere_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(5)
  expect_snapshot(layout_sphere_impl(graph = g))
})

# Bipartite functions

test_that("create_bipartite_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(create_bipartite_impl(
    types = c(FALSE, FALSE, TRUE, TRUE),
    edges = c(0, 2, 0, 3, 1, 2, 1, 3),
    directed = FALSE
  ))
})

test_that("bipartite_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(bipartite_game_impl(
    type = "gnp",
    n1 = 5,
    n2 = 5,
    p = 0.3,
    directed = FALSE
  ))
  expect_snapshot(bipartite_game_impl(
    type = "gnm",
    n1 = 5,
    n2 = 5,
    m = 10,
    directed = FALSE
  ))
})

# Other structural functions

test_that("decompose_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_graph(~ A-B-C, D-E)
  expect_snapshot(decompose_impl(graph = g, mode = c("weak", "strong")))
})

test_that("neighborhood_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(5)
  expect_snapshot(neighborhood_impl(
    graph = g,
    order = 1,
    vids = V(g),
    mode = c("all", "out", "in")
  ))
})

test_that("neighborhood_size_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(5)
  expect_snapshot(neighborhood_size_impl(
    graph = g,
    order = 1,
    vids = V(g),
    mode = c("all", "out", "in")
  ))
})

# Graph properties

test_that("is_chordal_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  # Test with a chordal graph (complete graph is chordal)
  g <- make_full_graph(4)
  # alpha and alpham1 parameters must be provided as vectors matching vertex count
  # alpha is a permutation vector, alpham1 is its inverse
  alpha_vec <- seq_len(vcount(g))
  alpham1_vec <- seq_len(vcount(g))
  expect_snapshot(is_chordal_impl(
    graph = g,
    alpha = alpha_vec,
    alpham1 = alpham1_vec
  ))

  # Test with a non-chordal graph (4-cycle is not chordal)
  g2 <- make_ring(4)
  alpha_vec2 <- seq_len(vcount(g2))
  alpham1_vec2 <- seq_len(vcount(g2))
  expect_snapshot(is_chordal_impl(
    graph = g2,
    alpha = alpha_vec2,
    alpham1 = alpham1_vec2
  ))
})

test_that("get_adjacency_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(3)
  expect_snapshot(get_adjacency_impl(
    graph = g,
    type = c("both", "upper", "lower")
  ))
})

# IO functions

test_that("write_graph_edgelist_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(3)
  tmp <- tempfile()
  write_graph_edgelist_impl(graph = g, outstream = tmp)
  content <- readLines(tmp)
  unlink(tmp)
  expect_snapshot(content)
})

test_that("read_graph_edgelist_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  tmp <- tempfile()
  writeLines(c("0 1", "1 2", "2 0"), tmp)
  expect_snapshot(read_graph_edgelist_impl(
    instream = tmp,
    n = 3,
    directed = FALSE
  ))
  unlink(tmp)
})

# Utility functions

test_that("compare_communities_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  comm1 <- c(1, 1, 2, 2, 3, 3)
  comm2 <- c(1, 1, 2, 2, 2, 3)
  expect_snapshot(compare_communities_impl(
    comm1 = comm1,
    comm2 = comm2,
    method = "vi"
  ))
})

# Additional game functions

test_that("degree_sequence_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(degree_sequence_game_impl(
    out_deg = c(2, 2, 2, 2),
    method = "configuration"
  ))
  expect_snapshot(degree_sequence_game_impl(
    out_deg = c(2, 2, 2, 2),
    method = "vl"
  ))
})

test_that("connect_neighborhood_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(5)
  expect_snapshot_igraph(connect_neighborhood_impl(
    graph = g,
    order = 1,
    mode = c("all", "out", "in")
  ))
})

# Additional distance functions

test_that("eccentricity_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(5)
  expect_snapshot(eccentricity_impl(
    graph = g,
    vids = V(g),
    mode = c("out", "in", "all")
  ))
})

test_that("radius_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(5)
  expect_snapshot(radius_impl(graph = g, mode = c("out", "in", "all")))
})

test_that("graph_center_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_star(5, mode = "undirected")
  expect_snapshot(graph_center_impl(graph = g, mode = c("out", "in", "all")))
})

test_that("voronoi_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(10)
  expect_snapshot(voronoi_impl(
    graph = g,
    generators = c(1, 5),
    mode = c("out", "in", "all")
  ))
})

# Spanner

test_that("spanner_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(5)
  expect_snapshot(spanner_impl(graph = g, stretch = 2))
})

# Additional centrality

test_that("edge_betweenness_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_star(5, mode = "undirected")
  expect_snapshot(edge_betweenness_impl(graph = g, directed = FALSE))
})

# Maximal cliques

test_that("maximal_cliques_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_full_graph(4)
  expect_snapshot(maximal_cliques_impl(graph = g, min_size = 1, max_size = 0))
})

test_that("independent_vertex_sets_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_ring(5)
  expect_snapshot(independent_vertex_sets_impl(
    graph = g,
    min_size = 1,
    max_size = 0
  ))
})

# Callback functions

# motifs_randesu_callback_closure_impl

test_that("motifs_randesu_callback_closure_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  
  g <- make_graph(~ A - B - C - A)
  
  # Collect motif information for snapshot
  motif_data <- list()
  result <- motifs_randesu_callback_closure_impl(
    graph = g,
    size = 3,
    cut_prob = NULL,
    callback = function(vids, isoclass) {
      motif_data[[length(motif_data) + 1]] <<- list(
        vids = vids,
        isoclass = isoclass
      )
      TRUE
    }
  )
  
  expect_snapshot({
    cat("Result:\n")
    print(result)
    cat("\nNumber of motifs found:", length(motif_data), "\n")
    cat("First motif:\n")
    print(motif_data[[1]])
  })
  
  # Structured tests
  expect_null(result)
  expect_true(length(motif_data) > 0)
  expect_true(is.integer(motif_data[[1]]$vids))
  expect_equal(length(motif_data[[1]]$vids), 3)
  expect_true(is.integer(motif_data[[1]]$isoclass))
  expect_equal(length(motif_data[[1]]$isoclass), 1)
})

test_that("motifs_randesu_callback_closure_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  
  g <- make_graph(~ A - B - C)
  
  # Should error if callback is not a function
  expect_snapshot_igraph_error(
    motifs_randesu_callback_closure_impl(
      graph = g,
      size = 3,
      cut_prob = NULL,
      callback = "not a function"
    )
  )
})

# cliques_callback_closure_impl

test_that("cliques_callback_closure_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  
  g <- make_full_graph(4)
  
  # Collect clique information for snapshot
  clique_data <- list()
  result <- cliques_callback_closure_impl(
    graph = g,
    min_size = 3,
    max_size = 4,
    callback = function(clique) {
      clique_data[[length(clique_data) + 1]] <<- clique
      TRUE
    }
  )
  
  expect_snapshot({
    cat("Result:\n")
    print(result)
    cat("\nNumber of cliques found:", length(clique_data), "\n")
    cat("First clique:\n")
    print(clique_data[[1]])
  })
  
  # Structured tests
  expect_null(result)
  expect_true(length(clique_data) > 0)
  expect_true(is.integer(clique_data[[1]]))
  expect_true(length(clique_data[[1]]) >= 3)
  expect_true(length(clique_data[[1]]) <= 4)
})

test_that("cliques_callback_closure_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  
  g <- make_full_graph(4)
  
  # Should error if callback is not a function
  expect_snapshot_igraph_error(
    cliques_callback_closure_impl(
      graph = g,
      min_size = 3,
      max_size = 4,
      callback = "not a function"
    )
  )
})

# maximal_cliques_callback_closure_impl

test_that("maximal_cliques_callback_closure_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  
  g <- sample_gnp(10, 0.3)
  
  # Collect clique information for snapshot
  clique_data <- list()
  result <- maximal_cliques_callback_closure_impl(
    graph = g,
    min_size = 3,
    max_size = 0,
    callback = function(clique) {
      clique_data[[length(clique_data) + 1]] <<- clique
      if (length(clique_data) >= 3) return(FALSE)  # Stop after 3
      TRUE
    }
  )
  
  expect_snapshot({
    cat("Result:\n")
    print(result)
    cat("\nNumber of maximal cliques found:", length(clique_data), "\n")
    if (length(clique_data) > 0) {
      cat("First maximal clique:\n")
      print(clique_data[[1]])
    }
  })
  
  # Structured tests
  expect_null(result)
  expect_true(is.integer(clique_data[[1]]))
  expect_true(length(clique_data[[1]]) >= 3)
})

test_that("maximal_cliques_callback_closure_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  
  g <- make_full_graph(4)
  
  # Should error if callback is not a function
  expect_snapshot_igraph_error(
    maximal_cliques_callback_closure_impl(
      graph = g,
      min_size = 3,
      max_size = 0,
      callback = "not a function"
    )
  )
})

# simple_cycles_callback_closure_impl

test_that("simple_cycles_callback_closure_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  
  g <- make_ring(4, directed = TRUE)
  
  # Collect cycle information for snapshot
  cycle_data <- list()
  result <- simple_cycles_callback_closure_impl(
    graph = g,
    mode = "out",
    min_cycle_length = -1,
    max_cycle_length = -1,
    callback = function(vertices, edges) {
      cycle_data[[length(cycle_data) + 1]] <<- list(
        vertices = vertices,
        edges = edges
      )
      TRUE
    }
  )
  
  expect_snapshot({
    cat("Result:\n")
    print(result)
    cat("\nNumber of cycles found:", length(cycle_data), "\n")
    cat("First cycle:\n")
    print(cycle_data[[1]])
  })
  
  # Structured tests
  expect_null(result)
  expect_true(length(cycle_data) > 0)
  expect_true(is.integer(cycle_data[[1]]$vertices))
  expect_true(is.integer(cycle_data[[1]]$edges))
  expect_equal(length(cycle_data[[1]]$vertices), length(cycle_data[[1]]$edges))
})

test_that("simple_cycles_callback_closure_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  
  g <- make_ring(4, directed = TRUE)
  
  # Should error if callback is not a function
  expect_snapshot_igraph_error(
    simple_cycles_callback_closure_impl(
      graph = g,
      mode = "out",
      min_cycle_length = -1,
      max_cycle_length = -1,
      callback = "not a function"
    )
  )
})

# get_isomorphisms_vf2_callback_closure_impl

test_that("get_isomorphisms_vf2_callback_closure_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  
  g1 <- make_ring(5)
  g2 <- make_ring(5)
  
  # Collect isomorphism information for snapshot
  iso_data <- list()
  result <- get_isomorphisms_vf2_callback_closure_impl(
    graph1 = g1,
    graph2 = g2,
    vertex_color1 = NULL,
    vertex_color2 = NULL,
    edge_color1 = NULL,
    edge_color2 = NULL,
    callback = function(map12, map21) {
      iso_data[[length(iso_data) + 1]] <<- list(
        map12 = map12,
        map21 = map21
      )
      if (length(iso_data) >= 2) return(FALSE)  # Stop after 2
      TRUE
    }
  )
  
  expect_snapshot({
    cat("Result:\n")
    print(result)
    cat("\nNumber of isomorphisms found:", length(iso_data), "\n")
    cat("First isomorphism:\n")
    print(iso_data[[1]])
  })
  
  # Structured tests
  expect_null(result)
  expect_true(length(iso_data) > 0)
  expect_true(is.integer(iso_data[[1]]$map12))
  expect_true(is.integer(iso_data[[1]]$map21))
  expect_equal(length(iso_data[[1]]$map12), vcount(g1))
  expect_equal(length(iso_data[[1]]$map21), vcount(g2))
})

test_that("get_isomorphisms_vf2_callback_closure_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  
  g1 <- make_ring(5)
  g2 <- make_ring(5)
  
  # Should error if callback is not a function
  expect_snapshot_igraph_error(
    get_isomorphisms_vf2_callback_closure_impl(
      graph1 = g1,
      graph2 = g2,
      vertex_color1 = NULL,
      vertex_color2 = NULL,
      edge_color1 = NULL,
      edge_color2 = NULL,
      callback = "not a function"
    )
  )
})

# get_subisomorphisms_vf2_callback_closure_impl

test_that("get_subisomorphisms_vf2_callback_closure_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  
  g1 <- make_ring(3)  # triangle
  g2 <- make_full_graph(5)
  
  # Collect subisomorphism information for snapshot
  subiso_data <- list()
  result <- get_subisomorphisms_vf2_callback_closure_impl(
    graph1 = g1,
    graph2 = g2,
    vertex_color1 = NULL,
    vertex_color2 = NULL,
    edge_color1 = NULL,
    edge_color2 = NULL,
    callback = function(map12, map21) {
      subiso_data[[length(subiso_data) + 1]] <<- list(
        map12 = map12,
        map21 = map21
      )
      if (length(subiso_data) >= 2) return(FALSE)  # Stop after 2
      TRUE
    }
  )
  
  expect_snapshot({
    cat("Result:\n")
    print(result)
    cat("\nNumber of subisomorphisms found:", length(subiso_data), "\n")
    cat("First subisomorphism:\n")
    print(subiso_data[[1]])
  })
  
  # Structured tests
  expect_null(result)
  expect_true(length(subiso_data) > 0)
  expect_true(is.integer(subiso_data[[1]]$map12))
  expect_true(is.integer(subiso_data[[1]]$map21))
  expect_equal(length(subiso_data[[1]]$map12), vcount(g1))
  expect_equal(length(subiso_data[[1]]$map21), vcount(g2))
})

test_that("get_subisomorphisms_vf2_callback_closure_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  
  g1 <- make_ring(3)
  g2 <- make_full_graph(5)
  
  # Should error if callback is not a function
  expect_snapshot_igraph_error(
    get_subisomorphisms_vf2_callback_closure_impl(
      graph1 = g1,
      graph2 = g2,
      vertex_color1 = NULL,
      vertex_color2 = NULL,
      edge_color1 = NULL,
      edge_color2 = NULL,
      callback = "not a function"
    )
  )
# Tests for newly autogenerated *_many functions

test_that("disjoint_union_many_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- empty_impl(n = 2)
  g2 <- empty_impl(n = 3)
  g3 <- empty_impl(n = 1)

  expect_snapshot(disjoint_union_many_impl(
    graphs = list(g1, g2, g3)
  ))

  # Structured tests
  result <- disjoint_union_many_impl(
    graphs = list(g1, g2, g3)
  )
  expect_s3_class(result, "igraph")
  expect_equal(vcount(result), 6)
})

test_that("union_many_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- empty_impl(n = 3)
  g2 <- add_edges_impl(g1, c(0, 1, 1, 2))
  g3 <- add_edges_impl(g1, c(0, 2))

  expect_snapshot(union_many_impl(
    graphs = list(g1, g2, g3)
  ))

  # Structured tests
  result <- union_many_impl(
    graphs = list(g1, g2, g3)
  )
  expect_type(result, "list")
  expect_s3_class(result$res, "igraph")
})

test_that("intersection_many_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- add_edges_impl(empty_impl(n = 3), c(0, 1, 1, 2, 0, 2))
  g2 <- add_edges_impl(empty_impl(n = 3), c(0, 1, 1, 2))
  g3 <- add_edges_impl(empty_impl(n = 3), c(0, 1))

  expect_snapshot(intersection_many_impl(
    graphs = list(g1, g2, g3)
  ))

  # Structured tests
  result <- intersection_many_impl(
    graphs = list(g1, g2, g3)
  )
  expect_type(result, "list")
  expect_s3_class(result$res, "igraph")
})

test_that("layout_merge_dla_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(n = 3)
  g2 <- path_graph_impl(n = 3)
  coords1 <- matrix(c(0, 0, 1, 0, 2, 0), ncol = 2, byrow = TRUE)
  coords2 <- matrix(c(0, 1, 1, 1, 2, 1), ncol = 2, byrow = TRUE)

  expect_snapshot(layout_merge_dla_impl(
    graphs = list(g1, g2),
    coords = list(coords1, coords2)
  ))

  # Structured tests
  result <- layout_merge_dla_impl(
    graphs = list(g1, g2),
    coords = list(coords1, coords2)
  )
  expect_true(is.matrix(result))
  expect_equal(nrow(result), 6)
  expect_equal(ncol(result), 2)
})
