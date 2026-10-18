# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 193. layout_random_impl

test_that("layout_random_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(layout_random_impl(
    graph = NULL
  ))
})

# 194. layout_circle_impl

test_that("layout_circle_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(layout_circle_impl(
    graph = NULL
  ))
})

# 195. layout_star_impl

test_that("layout_star_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(layout_star_impl(
    graph = NULL
  ))
})

# 196. layout_grid_impl

test_that("layout_grid_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(layout_grid_impl(
    graph = NULL
  ))
})

# 197. layout_grid_3d_impl

test_that("layout_grid_3d_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(layout_grid_3d_impl(
    graph = NULL
  ))
})

# 198. roots_for_tree_layout_impl

test_that("roots_for_tree_layout_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(layout_random_3d_impl(
    graph = NULL
  ))
})

# 200. layout_sphere_impl

test_that("layout_sphere_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(layout_sphere_impl(
    graph = NULL
  ))
})

# 201. layout_sugiyama_impl

test_that("layout_sugiyama_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(layout_sugiyama_impl(
    graph = NULL
  ))
})

# 202. layout_mds_impl

test_that("layout_mds_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(layout_mds_impl(
    graph = NULL
  ))
})

# 203. layout_bipartite_impl

test_that("layout_bipartite_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    layout_bipartite_impl(
      graph = NULL,
      types = c(TRUE, FALSE, TRUE)
    )
  )
})

# 204. layout_gem_impl

test_that("layout_gem_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    layout_gem_impl(
      graph = NULL,
      res = matrix(0, nrow = 3, ncol = 2)
    )
  )
})

# 205. layout_davidson_harel_impl

test_that("layout_davidson_harel_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    layout_davidson_harel_impl(
      graph = NULL,
      res = matrix(0, nrow = 3, ncol = 2)
    )
  )
})

# 206. layout_umap_impl

test_that("layout_umap_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    layout_umap_impl(
      graph = NULL,
      res = matrix(0, nrow = 3, ncol = 2)
    )
  )
})

# 207. layout_umap_3d_impl

test_that("layout_umap_3d_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    layout_umap_3d_impl(
      graph = NULL,
      res = matrix(0, nrow = 3, ncol = 3)
    )
  )
})

# 208. layout_umap_compute_weights_impl

test_that("layout_umap_compute_weights_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    layout_align_impl(
      graph = NULL,
      layout = matrix(0, nrow = 3, ncol = 2)
    )
  )
})

# Layout functions

test_that("layout_sphere_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(5)
  expect_snapshot(layout_sphere_impl(graph = g))
})

test_that("layout_merge_dla_impl basic", {
  igraph_local_seed(20250909)
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
