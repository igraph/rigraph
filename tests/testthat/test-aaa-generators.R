# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 8. wheel_impl

test_that("wheel_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(wheel_impl(
    n = -1
  ))
})

# 9. hypercube_impl

test_that("hypercube_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(hypercube_impl(
    n = 10000
  ))
})

# 10. square_lattice_impl

test_that("square_lattice_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(square_lattice_impl(
    dimvector = -1
  ))
})

# 11. triangular_lattice_impl

test_that("triangular_lattice_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(triangular_lattice_impl(
    dimvector = -1
  ))
})

# 12. path_graph_impl

test_that("path_graph_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(path_graph_impl(
    n = -1
  ))
})

# 13. cycle_graph_impl

test_that("cycle_graph_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(cycle_graph_impl(
    n = -1
  ))
})

# 14. symmetric_tree_impl

test_that("symmetric_tree_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(symmetric_tree_impl(
    branches = -1
  ))
})

# 15. regular_tree_impl

test_that("regular_tree_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(regular_tree_impl(
    h = -1
  ))
})

# 16. full_citation_impl

test_that("full_citation_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(full_citation_impl(
    n = -1
  ))
})

# 17. atlas_impl

test_that("atlas_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(atlas_impl(
    number = -1
  ))
})

# 18. extended_chordal_ring_impl

test_that("extended_chordal_ring_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(extended_chordal_ring_impl(
    nodes = -1,
    W = matrix(c(1, 2))
  ))
})

# 21. de_bruijn_impl
test_that("de_bruijn_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(de_bruijn_impl(
    m = -1,
    n = 3
  ))
})

# 22. kautz_impl
test_that("kautz_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(kautz_impl(
    m = -1,
    n = 3
  ))
})

# 23. lcf_vector_impl
test_that("lcf_vector_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(lcf_vector_impl(
    n = -1,
    shifts = c(3, -3, 4),
    repeats = 2
  ))
})

# 24. mycielski_graph_impl
test_that("mycielski_graph_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(mycielski_graph_impl(
    k = -1
  ))
})

# 25. adjlist_impl
test_that("adjlist_impl basic", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(adjlist_impl(
    adjlist = -1,
    mode = "out"
  ))
})

# 27. full_multipartite_impl
test_that("full_multipartite_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(full_multipartite_impl(
    n = -1
  ))
})

# 28. realize_degree_sequence_impl
test_that("realize_degree_sequence_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(realize_degree_sequence_impl(
    out_deg = -1
  ))
})

# 29. realize_bipartite_degree_sequence_impl
test_that("realize_bipartite_degree_sequence_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    realize_bipartite_degree_sequence_impl(
      degrees1 = -1,
      degrees2 = c(2, 2)
    )
  )
})

# 30. circulant_impl
test_that("circulant_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(circulant_impl(
    n = -1,
    shifts = c(1, 2)
  ))
})

# 31. generalized_petersen_impl
test_that("generalized_petersen_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(generalized_petersen_impl(
    n = -1,
    k = 2
  ))
})

# 32. turan_impl
test_that("turan_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(turan_impl(
    n = -1,
    r = 2
  ))
})

# 316. from_prufer_impl

test_that("from_prufer_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(from_prufer_impl(
    prufer = "a"
  ))
})

# 318. tree_from_parent_vector_impl

test_that("tree_from_parent_vector_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(tree_from_parent_vector_impl(
    parents = "a"
  ))
})

test_that("famous_impl basic", {
  igraph_local_seed(20250909)
  expect_snapshot(famous_impl(
    name = "Zachary"
  ))
})

test_that("famous_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(famous_impl(
    name = "NonexistentGraph"
  ))
})

# Tests for newly autogenerated _impl functions

# Graph constructors

test_that("star_impl basic", {
  igraph_local_seed(20250909)
  expect_snapshot(star_impl(n = 5, mode = "out", center = 0))
  expect_snapshot(star_impl(n = 6, mode = "in", center = 1))
  expect_snapshot(star_impl(n = 4, mode = "undirected", center = 0))
})

test_that("ring_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot(full_impl(n = 4, directed = FALSE, loops = FALSE))
  expect_snapshot(full_impl(n = 3, directed = TRUE, loops = FALSE))
})

test_that("kary_tree_impl basic", {
  igraph_local_seed(20250909)
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

# sparse_adjacency_impl

test_that("sparse_adjacency_impl basic", {
  skip_if_not_installed("Matrix")
  igraph_local_seed(20250909)

  # Create a simple sparse matrix
  M <- Matrix::sparseMatrix(
    i = c(1, 2, 3, 4),
    j = c(2, 3, 4, 1),
    x = 1,
    dims = c(4, 4)
  )

  expect_snapshot(sparse_adjacency_impl(adjmatrix = M))

  # Create a symmetric matrix for undirected graph
  M_sym <- Matrix::sparseMatrix(
    i = c(1, 1, 2, 2, 3, 3, 4, 4),
    j = c(2, 4, 1, 3, 2, 4, 1, 3),
    x = 1,
    dims = c(4, 4)
  )
  expect_snapshot(sparse_adjacency_impl(
    adjmatrix = M_sym,
    mode = "undirected",
    loops = "once"
  ))

  # Structured tests
  g1 <- sparse_adjacency_impl(adjmatrix = M)
  expect_s3_class(g1, "igraph")
  expect_equal(vcount(g1), 4)
  expect_equal(ecount(g1), 4)
  expect_true(is_directed(g1))

  g2 <- sparse_adjacency_impl(
    adjmatrix = M_sym,
    mode = "undirected",
    loops = "once"
  )
  expect_s3_class(g2, "igraph")
  expect_false(is_directed(g2))
})

test_that("sparse_adjacency_impl errors", {
  skip_if_not_installed("Matrix")
  skip_if_not(getRversion() >= "4.2")
  igraph_local_seed(20250909)

  # Regular matrices are converted to sparse matrices automatically
  # This should work, not error
  g <- sparse_adjacency_impl(adjmatrix = matrix(c(0,1,1,0), 2, 2))
  expect_s3_class(g, "igraph")
})

# sparse_weighted_adjacency_impl

test_that("sparse_weighted_adjacency_impl basic", {
  skip_if_not_installed("Matrix")
  igraph_local_seed(20250909)

  # Create a weighted sparse matrix
  M <- Matrix::sparseMatrix(
    i = c(1, 2, 3, 4),
    j = c(2, 3, 4, 1),
    x = c(2.5, 1.0, 3.0, 0.5),
    dims = c(4, 4)
  )

  expect_snapshot(sparse_weighted_adjacency_impl(adjmatrix = M))

  # Create a symmetric weighted matrix for undirected graph
  M_sym <- Matrix::sparseMatrix(
    i = c(1, 1, 2, 2, 3, 3, 4, 4),
    j = c(2, 4, 1, 3, 2, 4, 1, 3),
    x = c(2.5, 0.5, 2.5, 1.0, 1.0, 3.0, 0.5, 3.0),
    dims = c(4, 4)
  )
  expect_snapshot(sparse_weighted_adjacency_impl(
    adjmatrix = M_sym,
    mode = "undirected",
    loops = "once"
  ))

  # Structured tests
  result <- sparse_weighted_adjacency_impl(adjmatrix = M)
  g1 <- result$graph
  weights <- result$weights

  expect_s3_class(g1, "igraph")
  expect_equal(vcount(g1), 4)
  expect_equal(ecount(g1), 4)
  expect_true(is_directed(g1))
  expect_length(weights, 4)
})

test_that("sparse_weighted_adjacency_impl errors", {
  skip_if_not_installed("Matrix")
  skip_if_not(getRversion() >= "4.2")
  igraph_local_seed(20250909)

  # Regular matrices are converted to sparse matrices automatically
  # This should work, not error
  result <- sparse_weighted_adjacency_impl(adjmatrix = matrix(c(0,1,2,0), 2, 2))
  expect_s3_class(result$graph, "igraph")
  expect_type(result$weights, "double")
})

# weighted_sparsemat_impl

test_that("weighted_sparsemat_impl basic", {
  skip_if_not_installed("Matrix")
  igraph_local_seed(20250909)

  # Create a weighted sparse matrix
  M <- Matrix::sparseMatrix(
    i = c(1, 2, 3, 4),
    j = c(2, 3, 4, 1),
    x = c(2.5, 1.0, 3.0, 0.5),
    dims = c(4, 4)
  )

  expect_snapshot(weighted_sparsemat_impl(
    A = M,
    directed = TRUE,
    attr = "weight",
    loops = FALSE
  ))

  # Structured tests
  g1 <- weighted_sparsemat_impl(
    A = M,
    directed = TRUE,
    attr = "weight",
    loops = FALSE
  )

  expect_s3_class(g1, "igraph")
  expect_equal(vcount(g1), 4)
  expect_true(is_directed(g1))
  expect_true("weight" %in% edge_attr_names(g1))
})

test_that("weighted_sparsemat_impl errors", {
  skip_if_not_installed("Matrix")
  skip_if_not(getRversion() >= "4.2")
  igraph_local_seed(20250909)

  # Regular matrices are converted to sparse matrices automatically
  # This should work, not error
  g <- weighted_sparsemat_impl(
    A = matrix(c(0,1,2,0), 2, 2),
    directed = TRUE,
    attr = "weight",
    loops = FALSE
  )
  expect_s3_class(g, "igraph")
})
