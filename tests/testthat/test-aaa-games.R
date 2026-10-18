# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 33. erdos_renyi_game_gnp_impl
test_that("erdos_renyi_game_gnp_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(erdos_renyi_game_gnp_impl(
    n = -1,
    p = 0.5
  ))
})

# 34. erdos_renyi_game_gnm_impl
test_that("erdos_renyi_game_gnm_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(erdos_renyi_game_gnm_impl(
    n = -1,
    m = 3
  ))
})

# 35. growing_random_game_impl
test_that("growing_random_game_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(growing_random_game_impl(
    n = -1,
    m = 2
  ))
})

# 36. preference_game_impl
test_that("preference_game_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(rewire_edges_impl(
    graph = NULL,
    prob = 0.5
  ))
})

# 39. rewire_directed_edges_impl
test_that("rewire_directed_edges_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(rewire_directed_edges_impl(
    graph = NULL,
    prob = 0.5
  ))
})

# 40. forest_fire_game_impl
test_that("forest_fire_game_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(forest_fire_game_impl(
    nodes = -1,
    fw_prob = 0.5
  ))
})

# 41. simple_interconnected_islands_game_impl
test_that("simple_interconnected_islands_game_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(chung_lu_game_impl(
    out_weights = -1
  ))
})

# 43. static_fitness_game_impl
test_that("static_fitness_game_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(static_fitness_game_impl(
    no_of_edges = -1,
    fitness_out = c(1, 2, 3)
  ))
})

# 44. static_power_law_game_impl
test_that("static_power_law_game_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(static_power_law_game_impl(
    no_of_nodes = -1,
    no_of_edges = 4,
    exponent_out = 2.5
  ))
})

# 45. k_regular_game_impl

test_that("k_regular_game_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(k_regular_game_impl(
    no_of_nodes = -1,
    k = 2
  ))
})

# 46. sbm_game_impl

test_that("sbm_game_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(sbm_game_impl(
    n = -1,
    pref_matrix = matrix(0.5, 2, 2),
    block_sizes = c(2, 3)
  ))
})

# 47. hsbm_game_impl

test_that("hsbm_game_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(correlated_game_impl(
    old_graph = NULL,
    corr = 0.5
  ))
})

# 50. correlated_pair_game_impl

test_that("correlated_pair_game_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(correlated_pair_game_impl(
    n = -1,
    corr = 0.5,
    p = 0.5
  ))
})

# 51. dot_product_game_impl

test_that("dot_product_game_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(dot_product_game_impl(
    vecs = NULL
  ))
})

# 52. sample_sphere_surface_impl

test_that("sample_sphere_surface_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(sample_sphere_surface_impl(
    dim = -1,
    n = 5
  ))
})

# 53. sample_sphere_volume_impl

test_that("sample_sphere_volume_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(sample_sphere_volume_impl(
    dim = -1,
    n = 5
  ))
})

# 54. sample_dirichlet_impl

test_that("sample_dirichlet_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(sample_dirichlet_impl(
    n = -1,
    alpha = c(1, 1, 1)
  ))
})

# 321. tree_game_impl

test_that("tree_game_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(tree_game_impl(
    n = "a"
  ))
})

# Random graph generators

test_that("barabasi_game_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot(growing_random_game_impl(
    n = 10,
    m = 1,
    directed = TRUE,
    citation = FALSE
  ))
})

test_that("grg_game_impl basic", {
  igraph_local_seed(20250909)
  expect_snapshot(grg_game_impl(nodes = 10, radius = 0.3, torus = FALSE))
})

test_that("watts_strogatz_game_impl basic", {
  igraph_local_seed(20250909)
  expect_snapshot(watts_strogatz_game_impl(
    dim = 1,
    size = 10,
    nei = 2,
    p = 0.1
  ))
})

# Additional game functions

test_that("degree_sequence_game_impl basic", {
  igraph_local_seed(20250909)
  expect_snapshot(degree_sequence_game_impl(
    out_deg = c(2, 2, 2, 2),
    method = "configuration"
  ))
  expect_snapshot(degree_sequence_game_impl(
    out_deg = c(2, 2, 2, 2),
    method = "vl"
  ))
})
