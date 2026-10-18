# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 56. closeness_impl

test_that("closeness_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(closeness_impl(
    graph = NULL
  ))
})

# 57. closeness_cutoff_impl

test_that("closeness_cutoff_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(closeness_cutoff_impl(
    graph = NULL
  ))
})

# 71. betweenness_cutoff_impl

test_that("betweenness_cutoff_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(betweenness_cutoff_impl(
    graph = NULL,
    cutoff = 2
  ))
})

# 72. betweenness_subset_impl

test_that("betweenness_subset_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(betweenness_subset_impl(
    graph = NULL
  ))
})

# 73. edge_betweenness_impl

test_that("edge_betweenness_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(edge_betweenness_impl(
    graph = NULL
  ))
})

# 74. edge_betweenness_cutoff_impl

test_that("edge_betweenness_cutoff_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(edge_betweenness_cutoff_impl(
    graph = NULL,
    cutoff = 2
  ))
})

# 75. edge_betweenness_subset_impl

test_that("edge_betweenness_subset_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(edge_betweenness_subset_impl(
    graph = NULL
  ))
})

# 76. harmonic_centrality_cutoff_impl

test_that("harmonic_centrality_cutoff_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    harmonic_centrality_cutoff_impl(
      graph = NULL,
      cutoff = 2
    )
  )
})

# 77. personalized_pagerank_impl

test_that("personalized_pagerank_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(personalized_pagerank_impl(
    graph = NULL
  ))
})

# 78. personalized_pagerank_vs_impl

test_that("personalized_pagerank_vs_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    personalized_pagerank_vs_impl(
      graph = NULL,
      reset_vids = 1
    )
  )
})

# 109. maxdegree_impl

test_that("maxdegree_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(maxdegree_impl(
    graph = NULL
  ))
})

# 124. eigenvector_centrality_impl

test_that("eigenvector_centrality_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(eigenvector_centrality_impl(
    graph = NULL
  ))
})

# 125. hub_and_authority_scores_impl

test_that("hub_and_authority_scores_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(hub_and_authority_scores_impl(
    graph = NULL
  ))
})

# 133. strength_impl

test_that("strength_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(strength_impl(
    graph = NULL
  ))
})

# 134. centralization_impl

test_that("centralization_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(centralization_impl(
    scores = package_version("1.2.3")
  ))
})

# 135. centralization_degree_impl

test_that("centralization_degree_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(centralization_degree_impl(
    graph = NULL
  ))
})

# 136. centralization_degree_tmax_impl

test_that("centralization_degree_tmax_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    centralization_degree_tmax_impl(
      nodes = -1,
      loops = TRUE
    )
  )
})

# 137. centralization_betweenness_impl

test_that("centralization_betweenness_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(centralization_betweenness_impl(
    graph = NULL
  ))
})

# 138. centralization_betweenness_tmax_impl

test_that("centralization_betweenness_tmax_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    centralization_betweenness_tmax_impl(
      nodes = -1,
      directed = TRUE
    )
  )
})

# 139. centralization_closeness_impl

test_that("centralization_closeness_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(centralization_closeness_impl(
    graph = NULL
  ))
})

# 140. centralization_closeness_tmax_impl

test_that("centralization_closeness_tmax_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(centralization_closeness_tmax_impl(
    nodes = -1
  ))
})

# 141. centralization_eigenvector_centrality_impl

test_that("centralization_eigenvector_centrality_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    centralization_eigenvector_centrality_impl(
      graph = NULL
    )
  )
})

# 142. centralization_eigenvector_centrality_tmax_impl

test_that("centralization_eigenvector_centrality_tmax_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    centralization_eigenvector_centrality_tmax_impl(
      nodes = -1
    )
  )
})

# 342. constraint_impl

test_that("constraint_impl basic", {
  igraph_local_seed(20250909)
  g <- make_graph(c(1, 2, 2, 3, 3, 1), n = 3, directed = FALSE)
  result <- constraint_impl(
    graph = g
  )
  expect_length(result, 3)
})

test_that("constraint_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(constraint_impl(
    graph = NULL
  ))
})

# Centrality measures

test_that("betweenness_impl basic", {
  igraph_local_seed(20250909)
  g <- make_star(5, mode = "undirected")
  expect_snapshot(betweenness_impl(graph = g, vids = V(g), directed = FALSE))
})

test_that("closeness_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(5)
  expect_snapshot(closeness_impl(
    graph = g,
    vids = V(g),
    mode = c("out", "in", "all", "total")
  ))
})

test_that("harmonic_centrality_impl basic", {
  igraph_local_seed(20250909)
  g <- make_star(5, mode = "undirected")
  expect_snapshot(harmonic_centrality_impl(
    graph = g,
    vids = V(g),
    mode = c("out", "in", "all", "total")
  ))
})

test_that("pagerank_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(5, directed = TRUE)
  expect_snapshot(pagerank_impl(
    graph = g,
    vids = V(g),
    directed = TRUE,
    damping = 0.85
  ))
})

test_that("hub_score_impl basic", {
  igraph_local_seed(20250909)
  g <- make_star(5, mode = "undirected")
  out <- hub_score_impl(graph = g, scale = TRUE, weights = NULL)
  # FIXME: out$vector unstable despite random seed
  expect_length(out$vector, 5)
  expect_type(out$vector, "double")
  out$vector <- NULL
  expect_snapshot(out)
})

test_that("authority_score_impl basic", {
  igraph_local_seed(20250909)
  g <- make_star(5, mode = "undirected")
  out <- authority_score_impl(graph = g, scale = TRUE, weights = NULL)
  # FIXME: out$vector unstable despite random seed
  expect_length(out$vector, 5)
  expect_type(out$vector, "double")
  out$vector <- NULL
  expect_snapshot(out)
})

# Additional centrality

test_that("edge_betweenness_impl basic", {
  igraph_local_seed(20250909)
  g <- make_star(5, mode = "undirected")
  expect_snapshot(edge_betweenness_impl(graph = g, directed = FALSE))
})
