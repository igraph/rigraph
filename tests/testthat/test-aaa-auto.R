# 1. empty_impl
test_that("empty_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)

  expect_snapshot(empty_impl())
  expect_snapshot(empty_impl(5, directed = FALSE))
})

test_that("empty_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(empty_impl(-1))
})

# 2. add_edges_impl

test_that("add_edges_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- empty_impl(3)
  expect_snapshot(add_edges_impl(g, c(0, 1, 1, 2)))
})

test_that("add_edges_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(add_edges_impl(NULL, c(1, 2)))
})

# 3. copy_impl

test_that("copy_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- empty_impl(2)
  expect_snapshot(copy_impl(g))
})

test_that("copy_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(copy_impl(NULL))
})

# 4. delete_vertices_idx_impl

test_that("delete_vertices_idx_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- empty_impl(3)
  expect_snapshot(delete_vertices_idx_impl(g, 1))
})

test_that("delete_vertices_idx_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(delete_vertices_idx_impl(NULL, 1))
})

# 5. vcount_impl

test_that("vcount_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- empty_impl(4)
  expect_snapshot(vcount_impl(g))
})

test_that("vcount_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(vcount_impl(NULL))
})

# 6. degree_impl

test_that("degree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- empty_impl(3)
  expect_snapshot(degree_impl(g))
  expect_snapshot(degree_impl(g, mode = "in"))
})

test_that("degree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(degree_impl(NULL))
})

# 7. get_all_eids_between_impl

test_that("get_all_eids_between_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- empty_impl(2)
  expect_snapshot(get_all_eids_between_impl(g, 1, 2))
})

test_that("get_all_eids_between_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_all_eids_between_impl(NULL, 1, 2))
})

# 8. wheel_impl

test_that("wheel_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(wheel_impl(5))
  expect_snapshot(wheel_impl(5, mode = "in", center = 2))
})

test_that("wheel_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(wheel_impl(-1))
})

# 9. hypercube_impl

test_that("hypercube_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(hypercube_impl(3))
  expect_snapshot(hypercube_impl(3, directed = TRUE))
})

test_that("hypercube_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(hypercube_impl(10000))
})

# 10. square_lattice_impl

test_that("square_lattice_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(square_lattice_impl(c(2, 2)))
  expect_snapshot(square_lattice_impl(
    c(2, 2),
    nei = 2,
    directed = TRUE,
    mutual = TRUE,
    periodic = c(TRUE, TRUE)
  ))
})

test_that("square_lattice_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(square_lattice_impl(-1))
})

# 11. triangular_lattice_impl

test_that("triangular_lattice_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(triangular_lattice_impl(c(2, 2)))
  expect_snapshot(triangular_lattice_impl(
    c(2, 2),
    directed = TRUE,
    mutual = TRUE
  ))
})

test_that("triangular_lattice_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(triangular_lattice_impl(-1))
})

# 12. path_graph_impl

test_that("path_graph_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(path_graph_impl(5))
  expect_snapshot(path_graph_impl(5, directed = TRUE, mutual = TRUE))
})

test_that("path_graph_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(path_graph_impl(-1))
})

# 13. cycle_graph_impl

test_that("cycle_graph_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(cycle_graph_impl(5))
  expect_snapshot(cycle_graph_impl(5, directed = TRUE, mutual = TRUE))
})

test_that("cycle_graph_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(cycle_graph_impl(-1))
})

# 14. symmetric_tree_impl

test_that("symmetric_tree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(symmetric_tree_impl(3))
  expect_snapshot(symmetric_tree_impl(3, type = "in"))
})

test_that("symmetric_tree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(symmetric_tree_impl(-1))
})

# 15. regular_tree_impl

test_that("regular_tree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(regular_tree_impl(2))
  expect_snapshot(regular_tree_impl(2, k = 4, type = "in"))
})

test_that("regular_tree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(regular_tree_impl(-1))
})

# 16. full_citation_impl

test_that("full_citation_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(full_citation_impl(5))
  expect_snapshot(full_citation_impl(5, directed = FALSE))
})

test_that("full_citation_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(full_citation_impl(-1))
})

# 17. atlas_impl

test_that("atlas_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(atlas_impl(0))
  expect_snapshot(atlas_impl(5))
})

test_that("atlas_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(atlas_impl(-1))
})

# 18. extended_chordal_ring_impl

test_that("extended_chordal_ring_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(extended_chordal_ring_impl(5, matrix(c(1, 2))))
  expect_snapshot(extended_chordal_ring_impl(
    5,
    matrix(c(1, 2)),
    directed = TRUE
  ))
})

test_that("extended_chordal_ring_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(extended_chordal_ring_impl(-1, matrix(c(1, 2))))
})

# 19. graph_power_impl

test_that("graph_power_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(5)
  expect_snapshot(graph_power_impl(g, 2))
  expect_snapshot(graph_power_impl(g, 2, directed = TRUE))
})

test_that("graph_power_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(graph_power_impl(NULL, 2))
})

# 20. linegraph_impl

test_that("linegraph_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(5)
  expect_snapshot(linegraph_impl(g))
})

test_that("linegraph_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(linegraph_impl(NULL))
})

# 21. de_bruijn_impl
test_that("de_bruijn_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(de_bruijn_impl(2, 3))
})
test_that("de_bruijn_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(de_bruijn_impl(-1, 3))
})

# 22. kautz_impl
test_that("kautz_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(kautz_impl(2, 3))
})
test_that("kautz_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(kautz_impl(-1, 3))
})

# 23. lcf_vector_impl
test_that("lcf_vector_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(lcf_vector_impl(10, c(3, -3, 4), 2))
})
test_that("lcf_vector_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(lcf_vector_impl(-1, c(3, -3, 4), 2))
})

# 24. mycielski_graph_impl
test_that("mycielski_graph_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(mycielski_graph_impl(3))
})
test_that("mycielski_graph_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(mycielski_graph_impl(-1))
})

# 25. adjlist_impl
test_that("adjlist_impl basic", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(adjlist_impl(list(c(2, 3), c(1), c(1)), mode = "out"))
})
test_that("adjlist_impl errors", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(adjlist_impl(-1, mode = "out"))
})

# 26. full_bipartite_impl
test_that("full_bipartite_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(full_bipartite_impl(2, 3))
  expect_snapshot(full_bipartite_impl(2, 3, directed = TRUE, mode = "in"))
})
test_that("full_bipartite_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(full_bipartite_impl(-1, 3))
})

# 27. full_multipartite_impl
test_that("full_multipartite_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(full_multipartite_impl(c(2, 3, 4)))
  expect_snapshot(full_multipartite_impl(
    c(2, 3, 4),
    directed = TRUE,
    mode = "in"
  ))
})
test_that("full_multipartite_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(full_multipartite_impl(-1))
})

# 28. realize_degree_sequence_impl
test_that("realize_degree_sequence_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(realize_degree_sequence_impl(c(2, 2, 2)))
  expect_snapshot(realize_degree_sequence_impl(
    c(2, 2, 2),
    c(2, 2, 2),
    allowed.edge.types = "simple",
    method = "largest"
  ))
})
test_that("realize_degree_sequence_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(realize_degree_sequence_impl(-1))
})

# 29. realize_bipartite_degree_sequence_impl
test_that("realize_bipartite_degree_sequence_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(realize_bipartite_degree_sequence_impl(c(2, 2), c(2, 2)))
  expect_snapshot(realize_bipartite_degree_sequence_impl(
    c(2, 2),
    c(2, 2),
    allowed.edge.types = "loops",
    method = "largest"
  ))
})
test_that("realize_bipartite_degree_sequence_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    realize_bipartite_degree_sequence_impl(-1, c(2, 2))
  )
})

# 30. circulant_impl
test_that("circulant_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(circulant_impl(5, c(1, 2)))
  expect_snapshot(circulant_impl(5, c(1, 2), directed = TRUE))
})
test_that("circulant_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(circulant_impl(-1, c(1, 2)))
})

# 31. generalized_petersen_impl
test_that("generalized_petersen_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(generalized_petersen_impl(5, 2))
})
test_that("generalized_petersen_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(generalized_petersen_impl(-1, 2))
})

# 32. turan_impl
test_that("turan_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(turan_impl(5, 2))
})
test_that("turan_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(turan_impl(-1, 2))
})

# 33. erdos_renyi_game_gnp_impl
test_that("erdos_renyi_game_gnp_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(erdos_renyi_game_gnp_impl(5, 0.5))
  expect_snapshot(erdos_renyi_game_gnp_impl(
    5,
    0.5,
    directed = TRUE,
    loops = TRUE
  ))
})
test_that("erdos_renyi_game_gnp_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(erdos_renyi_game_gnp_impl(-1, 0.5))
})

# 34. erdos_renyi_game_gnm_impl
test_that("erdos_renyi_game_gnm_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(erdos_renyi_game_gnm_impl(5, 3))
  expect_snapshot(erdos_renyi_game_gnm_impl(
    5,
    3,
    directed = TRUE,
    loops = TRUE
  ))
})
test_that("erdos_renyi_game_gnm_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(erdos_renyi_game_gnm_impl(-1, 3))
})

# 35. growing_random_game_impl
test_that("growing_random_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(growing_random_game_impl(5, 2))
  expect_snapshot(growing_random_game_impl(
    5,
    2,
    directed = FALSE,
    citation = TRUE
  ))
})
test_that("growing_random_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(growing_random_game_impl(-1, 2))
})

# 36. preference_game_impl
test_that("preference_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(preference_game_impl(
    5,
    2,
    c(0.5, 0.5),
    FALSE,
    matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2)
  ))
})
test_that("preference_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    preference_game_impl(
      -1,
      2,
      c(0.5, 0.5),
      FALSE,
      matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2)
    )
  )
})

# 37. asymmetric_preference_game_impl
test_that("asymmetric_preference_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(asymmetric_preference_game_impl(
    5,
    2,
    2,
    matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2),
    matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2)
  ))
})
test_that("asymmetric_preference_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    asymmetric_preference_game_impl(
      -1,
      2,
      2,
      matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2),
      matrix(c(0.5, 0.5, 0.5, 0.5), 2, 2)
    )
  )
})

# 38. rewire_edges_impl
test_that("rewire_edges_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(5)
  expect_snapshot(rewire_edges_impl(g, 0.5))
})
test_that("rewire_edges_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(rewire_edges_impl(NULL, 0.5))
})

# 39. rewire_directed_edges_impl
test_that("rewire_directed_edges_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(5, directed = TRUE)
  expect_snapshot(rewire_directed_edges_impl(g, 0.5))
})
test_that("rewire_directed_edges_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(rewire_directed_edges_impl(NULL, 0.5))
})

# 40. forest_fire_game_impl
test_that("forest_fire_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(forest_fire_game_impl(5, 0.5))
  expect_snapshot(forest_fire_game_impl(
    5,
    0.5,
    bw.factor = 0.2,
    ambs = 2,
    directed = FALSE
  ))
})
test_that("forest_fire_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(forest_fire_game_impl(-1, 0.5))
})

# 41. simple_interconnected_islands_game_impl
test_that("simple_interconnected_islands_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(simple_interconnected_islands_game_impl(2, 3, 0.5, 1))
})
test_that("simple_interconnected_islands_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    simple_interconnected_islands_game_impl(-1, 3, 0.5, 1)
  )
})

# 42. chung_lu_game_impl
test_that("chung_lu_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(chung_lu_game_impl(c(2, 2, 2)))
  expect_snapshot(chung_lu_game_impl(
    c(1, 2, 3),
    c(1, 2, 3),
    loops = FALSE,
    variant = "maxent"
  ))
})
test_that("chung_lu_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(chung_lu_game_impl(-1))
})

# 43. static_fitness_game_impl
test_that("static_fitness_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(static_fitness_game_impl(3, c(1, 2, 3)))
  expect_snapshot(static_fitness_game_impl(
    3,
    c(1, 2, 3),
    c(1, 2, 3),
    loops = TRUE,
    multiple = TRUE
  ))
})
test_that("static_fitness_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(static_fitness_game_impl(-1, c(1, 2, 3)))
})

# 44. static_power_law_game_impl
test_that("static_power_law_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(static_power_law_game_impl(5, 4, 2.5))
  expect_snapshot(static_power_law_game_impl(
    5,
    4,
    2.5,
    exponent.in = 2,
    loops = TRUE,
    multiple = TRUE,
    finite.size.correction = FALSE
  ))
})
test_that("static_power_law_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(static_power_law_game_impl(-1, 4, 2.5))
})

# 45. k_regular_game_impl

test_that("k_regular_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(k_regular_game_impl(5, 2))
  expect_snapshot(k_regular_game_impl(5, 2, directed = TRUE, multiple = TRUE))
})

test_that("k_regular_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(k_regular_game_impl(-1, 2))
})

# 46. sbm_game_impl

test_that("sbm_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(sbm_game_impl(5, matrix(0.5, 2, 2), c(2, 3)))
  expect_snapshot(sbm_game_impl(
    5,
    matrix(0.5, 2, 2),
    c(2, 3),
    directed = TRUE,
    loops = TRUE
  ))
})

test_that("sbm_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(sbm_game_impl(-1, matrix(0.5, 2, 2), c(2, 3)))
})

# 47. hsbm_game_impl

test_that("hsbm_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(hsbm_game_impl(6, 2, c(0.5, 0.5), matrix(1, 2, 2), 0.5))
})

test_that("hsbm_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    hsbm_game_impl(-1, 2, 0.5, matrix(1, 2, 2), 0.5)
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
    100,
    list(50, 50),
    rho = list(c(3, 3, 4) / 10),
    C = list(C),
    p = 1 / 20
  ))
})

test_that("hsbm_list_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    hsbm_list_game_impl(
      -1,
      c(2, 3),
      list(0.5, 0.5),
      list(matrix(1, 2, 2), matrix(1, 2, 2)),
      0.5
    )
  )
})

# 49. correlated_game_impl

test_that("correlated_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(5)
  expect_snapshot(correlated_game_impl(g, 0.5))
})

test_that("correlated_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(correlated_game_impl(NULL, 0.5))
})

# 50. correlated_pair_game_impl

test_that("correlated_pair_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(correlated_pair_game_impl(5, 0.5, 0.5))
  expect_snapshot(correlated_pair_game_impl(5, 0.5, 0.5, directed = TRUE))
})

test_that("correlated_pair_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(correlated_pair_game_impl(-1, 0.5, 0.5))
})

# 51. dot_product_game_impl

test_that("dot_product_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(dot_product_game_impl(matrix(0.5, 5, 2)))
  expect_snapshot(dot_product_game_impl(matrix(0.5, 5, 2), directed = TRUE))
})

test_that("dot_product_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(dot_product_game_impl(NULL))
})

# 52. sample_sphere_surface_impl

test_that("sample_sphere_surface_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(sample_sphere_surface_impl(3, 5))
  expect_snapshot(sample_sphere_surface_impl(
    3,
    5,
    radius = 2,
    positive = FALSE
  ))
})

test_that("sample_sphere_surface_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(sample_sphere_surface_impl(-1, 5))
})

# 53. sample_sphere_volume_impl

test_that("sample_sphere_volume_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(sample_sphere_volume_impl(3, 5))
  expect_snapshot(sample_sphere_volume_impl(3, 5, radius = 2, positive = FALSE))
})

test_that("sample_sphere_volume_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(sample_sphere_volume_impl(-1, 5))
})

# 54. sample_dirichlet_impl

test_that("sample_dirichlet_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(sample_dirichlet_impl(5, c(1, 1, 1)))
})

test_that("sample_dirichlet_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(sample_dirichlet_impl(-1, c(1, 1, 1)))
})

# 55. are_adjacent_impl

test_that("are_adjacent_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(are_adjacent_impl(g, 1, 2))
})

test_that("are_adjacent_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(are_adjacent_impl(NULL, 1, 2))
})

# 56. closeness_impl

test_that("closeness_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(closeness_impl(g))
  expect_snapshot(closeness_impl(g, mode = "in", normalized = TRUE))
})

test_that("closeness_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(closeness_impl(NULL))
})

# 57. closeness_cutoff_impl

test_that("closeness_cutoff_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(closeness_cutoff_impl(g, cutoff = 2))
  expect_snapshot(closeness_cutoff_impl(
    g,
    mode = "in",
    normalized = TRUE,
    cutoff = 1
  ))
})

test_that("closeness_cutoff_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(closeness_cutoff_impl(NULL))
})

# 58. get_shortest_path_impl

test_that("get_shortest_path_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(get_shortest_path_impl(g, 1, 3))
})

test_that("get_shortest_path_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_shortest_path_impl(NULL, 1, 3))
})

# 59. get_shortest_path_bellman_ford_impl

test_that("get_shortest_path_bellman_ford_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(get_shortest_path_bellman_ford_impl(g, 1, 3))
})

test_that("get_shortest_path_bellman_ford_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_shortest_path_bellman_ford_impl(NULL, 1, 3))
})

# 60. get_shortest_path_dijkstra_impl

test_that("get_shortest_path_dijkstra_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(get_shortest_path_dijkstra_impl(g, 1, 3))
})

test_that("get_shortest_path_dijkstra_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_shortest_path_dijkstra_impl(NULL, 1, 3))
})

# 61. get_all_shortest_paths_impl

test_that("get_all_shortest_paths_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(get_all_shortest_paths_impl(g, 1, 3))
})

test_that("get_all_shortest_paths_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_all_shortest_paths_impl(NULL, 1, 3))
})

# 62. get_all_shortest_paths_dijkstra_impl

test_that("get_all_shortest_paths_dijkstra_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(get_all_shortest_paths_dijkstra_impl(g, 1, 3))
})

test_that("get_all_shortest_paths_dijkstra_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    get_all_shortest_paths_dijkstra_impl(NULL, 1, 3)
  )
})

# 63. voronoi_impl

test_that("voronoi_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(voronoi_impl(g, 1))
  expect_snapshot(voronoi_impl(g, 1, mode = "in", tiebreaker = "first"))
})

test_that("voronoi_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(voronoi_impl(NULL, 1))
})

# 64. get_all_simple_paths_impl

test_that("get_all_simple_paths_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(get_all_simple_paths_impl(g, 1, 3))
})

test_that("get_all_simple_paths_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_all_simple_paths_impl(NULL, 1, 3))
})

# 65. get_k_shortest_paths_impl

test_that("get_k_shortest_paths_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(get_k_shortest_paths_impl(g, 1, 3, k = 2))
})

test_that("get_k_shortest_paths_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_k_shortest_paths_impl(NULL, 1, 3, k = 2))
})

# 66. get_widest_path_impl

test_that("get_widest_path_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(get_widest_path_impl(g, 1, 3, weights = c(1, 2)))
})

test_that("get_widest_path_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_widest_path_impl(NULL, 1, 3))
})

# 67. get_widest_paths_impl

test_that("get_widest_paths_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(get_widest_paths_impl(g, 1, 3, weights = c(1, 2)))
})

test_that("get_widest_paths_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_widest_paths_impl(NULL, 1, 3))
})

# 70. spanner_impl

test_that("spanner_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(spanner_impl(g, 2))
})

test_that("spanner_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(spanner_impl(NULL, 2))
})

# 71. betweenness_cutoff_impl

test_that("betweenness_cutoff_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(betweenness_cutoff_impl(g, cutoff = 2))
})

test_that("betweenness_cutoff_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(betweenness_cutoff_impl(NULL, cutoff = 2))
})

# 72. betweenness_subset_impl

test_that("betweenness_subset_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(betweenness_subset_impl(g))
})

test_that("betweenness_subset_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(betweenness_subset_impl(NULL))
})

# 73. edge_betweenness_impl

test_that("edge_betweenness_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(edge_betweenness_impl(g))
})

test_that("edge_betweenness_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(edge_betweenness_impl(NULL))
})

# 74. edge_betweenness_cutoff_impl

test_that("edge_betweenness_cutoff_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(edge_betweenness_cutoff_impl(g, cutoff = 2))
})

test_that("edge_betweenness_cutoff_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(edge_betweenness_cutoff_impl(NULL, cutoff = 2))
})

# 75. edge_betweenness_subset_impl

test_that("edge_betweenness_subset_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(edge_betweenness_subset_impl(g))
})

test_that("edge_betweenness_subset_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(edge_betweenness_subset_impl(NULL))
})

# 76. harmonic_centrality_cutoff_impl

test_that("harmonic_centrality_cutoff_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(harmonic_centrality_cutoff_impl(g, cutoff = 2))
})

test_that("harmonic_centrality_cutoff_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    harmonic_centrality_cutoff_impl(NULL, cutoff = 2)
  )
})

# 77. personalized_pagerank_impl

test_that("personalized_pagerank_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(personalized_pagerank_impl(g))
  expect_snapshot(personalized_pagerank_impl(g, algo = "arpack", damping = 0.9))
})

test_that("personalized_pagerank_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(personalized_pagerank_impl(NULL))
})

# 78. personalized_pagerank_vs_impl

test_that("personalized_pagerank_vs_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(personalized_pagerank_vs_impl(g, reset.vids = 1))
  expect_snapshot(personalized_pagerank_vs_impl(
    g,
    algo = "arpack",
    reset.vids = 1,
    details = TRUE
  ))
})

test_that("personalized_pagerank_vs_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    personalized_pagerank_vs_impl(NULL, reset.vids = 1)
  )
})

# 79. induced_subgraph_impl

test_that("induced_subgraph_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(induced_subgraph_impl(g, 1:2))
})

test_that("induced_subgraph_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(induced_subgraph_impl(NULL, 1:2))
})

# 80. subgraph_from_edges_impl

test_that("subgraph_from_edges_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(subgraph_from_edges_impl(g, 1))
})

test_that("subgraph_from_edges_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(subgraph_from_edges_impl(NULL, 1))
})

# 81. reverse_edges_impl

test_that("reverse_edges_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(reverse_edges_impl(g))
})

test_that("reverse_edges_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(reverse_edges_impl(NULL))
})

# and much more halucination before...
# 91-96: halucination of get_shortest_path_*
# 97-100: halucination of get_widest_path_cutoff_impl,get_widest_paths_cutoff_impl, widest_path_widths_dijkstra_cutoff_impl, widest_path_widths_floyd_warshall_cutoff_impl

# 101. path_length_hist_impl

test_that("path_length_hist_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(path_length_hist_impl(g))
  expect_snapshot(path_length_hist_impl(g, directed = FALSE))
})

test_that("path_length_hist_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(path_length_hist_impl(NULL))
})

# 102. simplify_impl

test_that("simplify_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(simplify_impl(g))
  expect_snapshot(simplify_impl(
    g,
    remove.multiple = FALSE,
    remove.loops = FALSE
  ))
})

test_that("simplify_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(simplify_impl(NULL))
})

# 103. transitivity_undirected_impl

test_that("transitivity_undirected_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(transitivity_undirected_impl(g))
  expect_snapshot(transitivity_undirected_impl(g, mode = "zero"))
})

test_that("transitivity_undirected_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(transitivity_undirected_impl(NULL))
})

# 104. transitivity_local_undirected_impl

test_that("transitivity_local_undirected_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(transitivity_local_undirected_impl(g))
  expect_snapshot(transitivity_local_undirected_impl(g, mode = "zero"))
})

test_that("transitivity_local_undirected_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(transitivity_local_undirected_impl(NULL))
})

# 105. transitivity_avglocal_undirected_impl

test_that("transitivity_avglocal_undirected_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(transitivity_avglocal_undirected_impl(g))
  expect_snapshot(transitivity_avglocal_undirected_impl(g, mode = "zero"))
})

test_that("transitivity_avglocal_undirected_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(transitivity_avglocal_undirected_impl(NULL))
})

# 106. transitivity_barrat_impl

test_that("transitivity_barrat_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(transitivity_barrat_impl(g))
  expect_snapshot(transitivity_barrat_impl(g, mode = "zero"))
})

test_that("transitivity_barrat_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(transitivity_barrat_impl(NULL))
})

# 107. ecc_impl

test_that("ecc_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(4)
  expect_snapshot(ecc_impl(g))
  expect_snapshot(ecc_impl(g, k = 3, offset = TRUE, normalize = FALSE))
})

test_that("ecc_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(ecc_impl(NULL))
})

# 108. reciprocity_impl

test_that("reciprocity_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(reciprocity_impl(g))
  expect_snapshot(reciprocity_impl(g, ignore.loops = FALSE, mode = "ratio"))
})

test_that("reciprocity_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(reciprocity_impl(NULL))
})

# 109. maxdegree_impl

test_that("maxdegree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(maxdegree_impl(g))
  expect_snapshot(maxdegree_impl(g, mode = "in", loops = FALSE))
})

test_that("maxdegree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(maxdegree_impl(NULL))
})

# 110. density_impl

test_that("density_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(density_impl(g))
  expect_snapshot(density_impl(g, loops = TRUE))
})

test_that("density_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(density_impl(NULL))
})

# 111. mean_degree_impl

test_that("mean_degree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(mean_degree_impl(g))
  expect_snapshot(mean_degree_impl(g, loops = FALSE))
})

test_that("mean_degree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(mean_degree_impl(NULL))
})

# 112. feedback_arc_set_impl

test_that("feedback_arc_set_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(feedback_arc_set_impl(g))
  expect_snapshot(feedback_arc_set_impl(g, algo = "exact_ip"))
})

test_that("feedback_arc_set_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(feedback_arc_set_impl(NULL))
})

# 113. feedback_vertex_set_impl

test_that("feedback_vertex_set_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(feedback_vertex_set_impl(g))
})

test_that("feedback_vertex_set_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(feedback_vertex_set_impl(NULL))
})

# 114. is_loop_impl

test_that("is_loop_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_loop_impl(g))
})

test_that("is_loop_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_loop_impl(NULL))
})

# 115. is_dag_impl

test_that("is_dag_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_dag_impl(g))
})

test_that("is_dag_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_dag_impl(NULL))
})

# 116. is_acyclic_impl

test_that("is_acyclic_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_acyclic_impl(g))
})

test_that("is_acyclic_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_acyclic_impl(NULL))
})

# 117. is_simple_impl

test_that("is_simple_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_simple_impl(g))
})

test_that("is_simple_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_simple_impl(NULL))
})

# 118. is_multiple_impl

test_that("is_multiple_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_multiple_impl(g))
})

test_that("is_multiple_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_multiple_impl(NULL))
})

# 119. has_loop_impl

test_that("has_loop_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(has_loop_impl(g))
})

test_that("has_loop_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(has_loop_impl(NULL))
})

# 120. has_multiple_impl

test_that("has_multiple_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(has_multiple_impl(g))
})

test_that("has_multiple_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(has_multiple_impl(NULL))
})

# 121. count_loops_impl

test_that("count_loops_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(count_loops_impl(g))
})

test_that("count_loops_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(count_loops_impl(NULL))
})

# 122. count_multiple_impl

test_that("count_multiple_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(count_multiple_impl(g))
})

test_that("count_multiple_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(count_multiple_impl(NULL))
})

# 123. is_perfect_impl

test_that("is_perfect_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_perfect_impl(g))
})

test_that("is_perfect_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_perfect_impl(NULL))
})

# 124. eigenvector_centrality_impl

test_that("eigenvector_centrality_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(eigenvector_centrality_impl(g))
  expect_snapshot(eigenvector_centrality_impl(
    g,
    directed = TRUE,
    scale = FALSE
  ))
})

test_that("eigenvector_centrality_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(eigenvector_centrality_impl(NULL))
})

# 125. hub_and_authority_scores_impl

test_that("hub_and_authority_scores_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_full_graph(5)
  expect_snapshot(hub_and_authority_scores_impl(g))
  expect_snapshot(hub_and_authority_scores_impl(g, scale = FALSE))
})

test_that("hub_and_authority_scores_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(hub_and_authority_scores_impl(NULL))
})

# 126. unfold_tree_impl

test_that("unfold_tree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(unfold_tree_impl(g, roots = 1))
  expect_snapshot(unfold_tree_impl(g, mode = "in", roots = 1))
})

test_that("unfold_tree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(unfold_tree_impl(NULL, roots = 1))
})

# 127. is_mutual_impl

test_that("is_mutual_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_mutual_impl(g))
  expect_snapshot(is_mutual_impl(g, loops = FALSE))
})

test_that("is_mutual_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_mutual_impl(NULL))
})

# 128. has_mutual_impl

test_that("has_mutual_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(has_mutual_impl(g))
  expect_snapshot(has_mutual_impl(g, loops = FALSE))
})

test_that("has_mutual_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(has_mutual_impl(NULL))
})

# 129. maximum_cardinality_search_impl

test_that("maximum_cardinality_search_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(maximum_cardinality_search_impl(g))
})

test_that("maximum_cardinality_search_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(maximum_cardinality_search_impl(NULL))
})

# 130. avg_nearest_neighbor_degree_impl

test_that("avg_nearest_neighbor_degree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(avg_nearest_neighbor_degree_impl(g))
  expect_snapshot(avg_nearest_neighbor_degree_impl(
    g,
    mode = "in",
    neighbor.degree.mode = "out"
  ))
})

test_that("avg_nearest_neighbor_degree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(avg_nearest_neighbor_degree_impl(NULL))
})

# 131. degree_correlation_vector_impl

test_that("degree_correlation_vector_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(degree_correlation_vector_impl(g))
  expect_snapshot(degree_correlation_vector_impl(
    g,
    from.mode = "in",
    to.mode = "out",
    directed.neighbors = FALSE
  ))
})

test_that("degree_correlation_vector_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(degree_correlation_vector_impl(NULL))
})

# 132. rich_club_sequence_impl

test_that("rich_club_sequence_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(rich_club_sequence_impl(g, vertex.order = 1:3))
  expect_snapshot(rich_club_sequence_impl(
    g,
    vertex.order = 1:3,
    normalized = FALSE,
    loops = TRUE,
    directed = FALSE
  ))
})

test_that("rich_club_sequence_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    rich_club_sequence_impl(NULL, vertex.order = 1:3)
  )
})

# 133. strength_impl

test_that("strength_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(strength_impl(g))
  expect_snapshot(strength_impl(g, mode = "in", loops = FALSE))
})

test_that("strength_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(strength_impl(NULL))
})

# 134. centralization_impl

test_that("centralization_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(centralization_impl(c(1, 2, 3)))
  expect_snapshot(centralization_impl(
    c(1, 2, 3),
    theoretical.max = 2,
    normalized = FALSE
  ))
})

test_that("centralization_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(centralization_impl(package_version("1.2.3")))
})

# 135. centralization_degree_impl

test_that("centralization_degree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(centralization_degree_impl(g))
  expect_snapshot(centralization_degree_impl(
    g,
    mode = "in",
    loops = FALSE,
    normalized = FALSE
  ))
})

test_that("centralization_degree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(centralization_degree_impl(NULL))
})

# 136. centralization_degree_tmax_impl

test_that("centralization_degree_tmax_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(centralization_degree_tmax_impl(nodes = 3, loops = TRUE))
  expect_snapshot(centralization_degree_tmax_impl(
    nodes = 3,
    mode = "in",
    loops = FALSE
  ))
})

test_that("centralization_degree_tmax_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    centralization_degree_tmax_impl(nodes = -1, loops = TRUE)
  )
})

# 137. centralization_betweenness_impl

test_that("centralization_betweenness_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(centralization_betweenness_impl(g))
  expect_snapshot(centralization_betweenness_impl(
    g,
    directed = FALSE,
    normalized = FALSE
  ))
})

test_that("centralization_betweenness_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(centralization_betweenness_impl(NULL))
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
})

test_that("centralization_betweenness_tmax_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    centralization_betweenness_tmax_impl(nodes = -1, directed = TRUE)
  )
})

# 139. centralization_closeness_impl

test_that("centralization_closeness_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(centralization_closeness_impl(g))
  expect_snapshot(centralization_closeness_impl(
    g,
    mode = "in",
    normalized = FALSE
  ))
})

test_that("centralization_closeness_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(centralization_closeness_impl(NULL))
})

# 140. centralization_closeness_tmax_impl

test_that("centralization_closeness_tmax_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(centralization_closeness_tmax_impl(nodes = 3))
  expect_snapshot(centralization_closeness_tmax_impl(nodes = 3, mode = "in"))
})

test_that("centralization_closeness_tmax_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(centralization_closeness_tmax_impl(nodes = -1))
})

# 141. centralization_eigenvector_centrality_impl

test_that("centralization_eigenvector_centrality_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(centralization_eigenvector_centrality_impl(g))
  expect_snapshot(centralization_eigenvector_centrality_impl(
    g,
    directed = TRUE,
    normalized = FALSE
  ))
})

test_that("centralization_eigenvector_centrality_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    centralization_eigenvector_centrality_impl(NULL)
  )
})

# 142. centralization_eigenvector_centrality_tmax_impl

test_that("centralization_eigenvector_centrality_tmax_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(centralization_eigenvector_centrality_tmax_impl(nodes = 3))
  expect_snapshot(centralization_eigenvector_centrality_tmax_impl(
    nodes = 3,
    directed = TRUE
  ))
})

test_that("centralization_eigenvector_centrality_tmax_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    centralization_eigenvector_centrality_tmax_impl(nodes = -1)
  )
})

# 143. assortativity_nominal_impl

test_that("assortativity_nominal_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(assortativity_nominal_impl(g, c(1, 2, 1)))
  expect_snapshot(assortativity_nominal_impl(
    g,
    c(1, 2, 1),
    directed = FALSE,
    normalized = FALSE
  ))
})

test_that("assortativity_nominal_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(assortativity_nominal_impl(NULL, c(1, 2, 1)))
})

# 144. assortativity_impl

test_that("assortativity_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(assortativity_impl(g, c(1, 2, 1)))
  expect_snapshot(assortativity_impl(
    g,
    c(1, 2, 1),
    directed = FALSE,
    normalized = FALSE
  ))
})

test_that("assortativity_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(assortativity_impl(NULL, c(1, 2, 1)))
})

# 145. assortativity_degree_impl

test_that("assortativity_degree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(assortativity_degree_impl(g))
  expect_snapshot(assortativity_degree_impl(g, directed = FALSE))
})

test_that("assortativity_degree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(assortativity_degree_impl(NULL))
})

# 146. joint_degree_matrix_impl

test_that("joint_degree_matrix_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(joint_degree_matrix_impl(g))
  expect_snapshot(joint_degree_matrix_impl(
    g,
    max.out.degree = 2,
    max.in.degree = 2
  ))
})

test_that("joint_degree_matrix_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(joint_degree_matrix_impl(NULL))
})

# 147. joint_degree_distribution_impl

test_that("joint_degree_distribution_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(joint_degree_distribution_impl(g))
  expect_snapshot(joint_degree_distribution_impl(
    g,
    from.mode = "in",
    to.mode = "out",
    directed.neighbors = FALSE,
    normalized = FALSE,
    max.from.degree = 2,
    max.to.degree = 2
  ))
})

test_that("joint_degree_distribution_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(joint_degree_distribution_impl(NULL))
})

# 148. joint_type_distribution_impl

test_that("joint_type_distribution_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(joint_type_distribution_impl(g, from.types = c(1, 2, 1)))
  expect_snapshot(joint_type_distribution_impl(
    g,
    from.types = c(1, 2, 1),
    to.types = c(1, 2, 1),
    directed = FALSE,
    normalized = FALSE
  ))
})

test_that("joint_type_distribution_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    joint_type_distribution_impl(NULL, from.types = c(1, 2, 1))
  )
})

# 149. contract_vertices_impl

test_that("contract_vertices_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(contract_vertices_impl(g, c(1, 1, 2)))
})

test_that("contract_vertices_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(contract_vertices_impl(NULL, c(1, 1, 2)))
})

# 150. eccentricity_dijkstra_impl

test_that("eccentricity_dijkstra_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(eccentricity_dijkstra_impl(g))
  expect_snapshot(eccentricity_dijkstra_impl(g, mode = "in"))
})

test_that("eccentricity_dijkstra_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(eccentricity_dijkstra_impl(NULL))
})

# 151. graph_center_dijkstra_impl

test_that("graph_center_dijkstra_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(graph_center_dijkstra_impl(g))
  expect_snapshot(graph_center_dijkstra_impl(g, mode = "in"))
})

test_that("graph_center_dijkstra_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(graph_center_dijkstra_impl(NULL))
})

# 152. radius_dijkstra_impl

test_that("radius_dijkstra_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(radius_dijkstra_impl(g))
  expect_snapshot(radius_dijkstra_impl(g, mode = "in"))
})

test_that("radius_dijkstra_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(radius_dijkstra_impl(NULL))
})

# 153. pseudo_diameter_impl

test_that("pseudo_diameter_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(pseudo_diameter_impl(g, 1))
  expect_snapshot(pseudo_diameter_impl(
    g,
    1,
    directed = FALSE,
    unconnected = FALSE
  ))
})

test_that("pseudo_diameter_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(pseudo_diameter_impl(NULL, 1))
})

# 154. pseudo_diameter_dijkstra_impl

test_that("pseudo_diameter_dijkstra_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(pseudo_diameter_dijkstra_impl(g, start.vid = 1))
  expect_snapshot(pseudo_diameter_dijkstra_impl(
    g,
    start.vid = 1,
    directed = FALSE,
    unconnected = FALSE
  ))
})

test_that("pseudo_diameter_dijkstra_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    pseudo_diameter_dijkstra_impl(NULL, start.vid = 1)
  )
})

# 155. diversity_impl

test_that("diversity_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  E(g)$weight <- c(1, 2)
  expect_snapshot(diversity_impl(g))
})

test_that("diversity_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(diversity_impl(NULL))
})

# 156. random_walk_impl

test_that("random_walk_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(random_walk_impl(g, 1, 2))
  expect_snapshot(random_walk_impl(g, 1, 2, mode = "in", stuck = "error"))
})

test_that("random_walk_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(random_walk_impl(NULL, 1, 2))
})

# 157. global_efficiency_impl

test_that("global_efficiency_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(global_efficiency_impl(g))
  expect_snapshot(global_efficiency_impl(g, directed = FALSE))
})

test_that("global_efficiency_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(global_efficiency_impl(NULL))
})

# 158. local_efficiency_impl

test_that("local_efficiency_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(local_efficiency_impl(g))
  expect_snapshot(local_efficiency_impl(g, directed = FALSE, mode = "in"))
})

test_that("local_efficiency_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(local_efficiency_impl(NULL))
})

# 159. average_local_efficiency_impl

test_that("average_local_efficiency_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(average_local_efficiency_impl(g))
  expect_snapshot(average_local_efficiency_impl(
    g,
    directed = FALSE,
    mode = "in"
  ))
})

test_that("average_local_efficiency_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(average_local_efficiency_impl(NULL))
})

# 160. transitive_closure_dag_impl

test_that("transitive_closure_dag_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3, directed = TRUE)
  expect_snapshot(transitive_closure_dag_impl(g))
})

test_that("transitive_closure_dag_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(transitive_closure_dag_impl(NULL))
})

# 161. transitive_closure_impl

test_that("transitive_closure_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(transitive_closure_impl(g))
})

test_that("transitive_closure_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(transitive_closure_impl(NULL))
})

# 162. trussness_impl

test_that("trussness_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(trussness_impl(g))
})

test_that("trussness_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(trussness_impl(NULL))
})

# 163. is_graphical_impl

test_that("is_graphical_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(is_graphical_impl(c(2, 2, 2)))
  expect_snapshot(is_graphical_impl(
    c(2, 2, 2),
    c(1, 1, 1),
    allowed.edge.types = "all"
  ))
})

test_that("is_graphical_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_graphical_impl("a"))
})

# 164. bfs_simple_impl

test_that("bfs_simple_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(bfs_simple_impl(g, 1))
  expect_snapshot(bfs_simple_impl(g, 1, mode = "in"))
})

test_that("bfs_simple_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(bfs_simple_impl(NULL, 1))
})

# 165. bipartite_projection_size_impl

test_that("bipartite_projection_size_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(4)
  V(g)$type <- c(TRUE, FALSE, TRUE, FALSE)
  expect_snapshot(bipartite_projection_size_impl(g))
})

test_that("bipartite_projection_size_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(bipartite_projection_size_impl(NULL))
})

# 166. biadjacency_impl

test_that("biadjacency_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  m <- matrix(c(1, 0, 1, 0, 1, 1), nrow = 2)
  expect_snapshot(biadjacency_impl(m))
  expect_snapshot(biadjacency_impl(
    m,
    directed = TRUE,
    mode = "in",
    multiple = TRUE
  ))
})

test_that("biadjacency_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(biadjacency_impl("a"))
})

# 167. get_biadjacency_impl

test_that("get_biadjacency_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(get_biadjacency_impl(g, c(TRUE, FALSE, TRUE)))
})

test_that("get_biadjacency_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    get_biadjacency_impl(NULL, c(TRUE, FALSE, TRUE))
  )
})

# 168. is_bipartite_impl

test_that("is_bipartite_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_bipartite_impl(g))
})

test_that("is_bipartite_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_bipartite_impl(NULL))
})

# 169. bipartite_game_gnp_impl

test_that("bipartite_game_gnp_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(bipartite_game_gnp_impl(2, 2, 0.5))
  expect_snapshot(bipartite_game_gnp_impl(
    2,
    2,
    0.5,
    directed = TRUE,
    mode = "in"
  ))
})

test_that("bipartite_game_gnp_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(bipartite_game_gnp_impl(-1, 2, 0.5))
})

# 170. bipartite_game_gnm_impl

test_that("bipartite_game_gnm_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(bipartite_game_gnm_impl(2, 2, 1))
  expect_snapshot(bipartite_game_gnm_impl(
    2,
    2,
    1,
    directed = TRUE,
    mode = "in"
  ))
})

test_that("bipartite_game_gnm_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(bipartite_game_gnm_impl(-1, 2, 1))
})

# 171. get_laplacian_impl

test_that("get_laplacian_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(get_laplacian_impl(g))
  expect_snapshot(get_laplacian_impl(
    g,
    mode = "in",
    normalization = "symmetric",
    weights = c(1, 2)
  ))
})

test_that("get_laplacian_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_laplacian_impl(NULL))
})

# 172. get_laplacian_sparse_impl

test_that("get_laplacian_sparse_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(get_laplacian_sparse_impl(g))
  expect_snapshot(get_laplacian_sparse_impl(
    g,
    mode = "in",
    normalization = "symmetric",
    weights = c(1, 2)
  ))
})

test_that("get_laplacian_sparse_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_laplacian_sparse_impl(NULL))
})

# 173. connected_components_impl

test_that("connected_components_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(connected_components_impl(g))
  expect_snapshot(connected_components_impl(g, mode = "strong", details = TRUE))
})

test_that("connected_components_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(connected_components_impl(NULL))
})

# 174. is_connected_impl

test_that("is_connected_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_connected_impl(g))
  expect_snapshot(is_connected_impl(g, mode = "strong"))
})

test_that("is_connected_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_connected_impl(NULL))
})

# 175. articulation_points_impl

test_that("articulation_points_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(articulation_points_impl(g))
})

test_that("articulation_points_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(articulation_points_impl(NULL))
})

# 176. biconnected_components_impl

test_that("biconnected_components_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(biconnected_components_impl(g))
})

test_that("biconnected_components_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(biconnected_components_impl(NULL))
})

# 177. bridges_impl

test_that("bridges_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(bridges_impl(g))
})

test_that("bridges_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(bridges_impl(NULL))
})

# 178. is_biconnected_impl

test_that("is_biconnected_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_biconnected_impl(g))
})

test_that("is_biconnected_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_biconnected_impl(NULL))
})

# 179. count_reachable_impl

test_that("count_reachable_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(5)
  expect_snapshot(count_reachable_impl(g, mode = "out"))
  expect_snapshot(count_reachable_impl(g, mode = "in"))
})

test_that("count_reachable_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(count_reachable_impl(NULL, mode = "out"))
})

# 180. bond_percolation_impl

test_that("bond_percolation_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(bond_percolation_impl(g))
})

test_that("bond_percolation_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(bond_percolation_impl(NULL))
})

# 181. site_percolation_impl

test_that("site_percolation_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(site_percolation_impl(g))
})

test_that("site_percolation_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(site_percolation_impl(NULL))
})

# 182. edgelist_percolation_impl

test_that("edgelist_percolation_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(edgelist_percolation_impl(matrix(c(1, 2, 2, 3), ncol = 2)))
})

test_that("edgelist_percolation_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(edgelist_percolation_impl("a"))
})

# 183. is_clique_impl

test_that("is_clique_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_clique_impl(g, 1:2))
  expect_snapshot(is_clique_impl(g, 1:2, directed = TRUE))
})

test_that("is_clique_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_clique_impl(NULL, 1:2))
})

# 184. cliques_impl

test_that("cliques_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(cliques_impl(g))
  expect_snapshot(cliques_impl(g, min = 2, max = 2))
})

test_that("cliques_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(cliques_impl(NULL))
})

# 185. clique_size_hist_impl

test_that("clique_size_hist_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(clique_size_hist_impl(g))
  expect_snapshot(clique_size_hist_impl(g, min.size = 2, max.size = 2))
})

test_that("clique_size_hist_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(clique_size_hist_impl(NULL))
})

# 186. largest_cliques_impl

test_that("largest_cliques_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(largest_cliques_impl(g))
})

test_that("largest_cliques_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(largest_cliques_impl(NULL))
})

# 187. maximal_cliques_hist_impl

test_that("maximal_cliques_hist_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(maximal_cliques_hist_impl(g))
  expect_snapshot(maximal_cliques_hist_impl(g, min.size = 2, max.size = 2))
})

test_that("maximal_cliques_hist_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(maximal_cliques_hist_impl(NULL))
})

# 188. clique_number_impl

test_that("clique_number_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(clique_number_impl(g))
})

test_that("clique_number_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(clique_number_impl(NULL))
})

# 189. weighted_cliques_impl

test_that("weighted_cliques_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(weighted_cliques_impl(g))
  expect_snapshot(weighted_cliques_impl(
    g,
    vertex.weights = c(1, 2, 3),
    min.weight = 1,
    max.weight = 3,
    maximal = TRUE
  ))
})

test_that("weighted_cliques_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(weighted_cliques_impl(NULL))
})

# 190. largest_weighted_cliques_impl

test_that("largest_weighted_cliques_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(largest_weighted_cliques_impl(g))
  expect_snapshot(largest_weighted_cliques_impl(g, vertex.weights = c(1, 2, 3)))
})

test_that("largest_weighted_cliques_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(largest_weighted_cliques_impl(NULL))
})

# 191. weighted_clique_number_impl

test_that("weighted_clique_number_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(weighted_clique_number_impl(g))
  expect_snapshot(weighted_clique_number_impl(g, vertex.weights = c(1, 2, 3)))
})

test_that("weighted_clique_number_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(weighted_clique_number_impl(NULL))
})

# 192. is_independent_vertex_set_impl

test_that("is_independent_vertex_set_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_independent_vertex_set_impl(g, 1:2))
})

test_that("is_independent_vertex_set_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_independent_vertex_set_impl(NULL, 1:2))
})

# 193. layout_random_impl

test_that("layout_random_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(layout_random_impl(g))
})

test_that("layout_random_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(layout_random_impl(NULL))
})

# 194. layout_circle_impl

test_that("layout_circle_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(layout_circle_impl(g))
  expect_snapshot(layout_circle_impl(g, order = 1:3))
})

test_that("layout_circle_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(layout_circle_impl(NULL))
})

# 195. layout_star_impl

test_that("layout_star_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(round(layout_star_impl(g), 4))
  expect_snapshot(round(layout_star_impl(g, center = 1, order = 3:1), 4))
})

test_that("layout_star_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(layout_star_impl(NULL))
})

# 196. layout_grid_impl

test_that("layout_grid_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(layout_grid_impl(g))
  expect_snapshot(layout_grid_impl(g, width = 2))
})

test_that("layout_grid_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(layout_grid_impl(NULL))
})

# 197. layout_grid_3d_impl

test_that("layout_grid_3d_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(layout_grid_3d_impl(g))
  expect_snapshot(layout_grid_3d_impl(g, width = 2, height = 2))
})

test_that("layout_grid_3d_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(layout_grid_3d_impl(NULL))
})

# 198. roots_for_tree_layout_impl

test_that("roots_for_tree_layout_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(roots_for_tree_layout_impl(g, mode = "out", heuristic = 1))
})

test_that("roots_for_tree_layout_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    roots_for_tree_layout_impl(NULL, mode = "out", heuristic = 1)
  )
})

# 199. layout_random_3d_impl

test_that("layout_random_3d_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(layout_random_3d_impl(g))
})

test_that("layout_random_3d_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(layout_random_3d_impl(NULL))
})

# 200. layout_sphere_impl

test_that("layout_sphere_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(layout_sphere_impl(g))
})

test_that("layout_sphere_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(layout_sphere_impl(NULL))
})

# 201. layout_sugiyama_impl

test_that("layout_sugiyama_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(layout_sugiyama_impl(g))
  expect_snapshot(layout_sugiyama_impl(
    g,
    layers = 1:3,
    hgap = 2,
    vgap = 2,
    maxiter = 10,
    weights = c(1, 2)
  ))
})

test_that("layout_sugiyama_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(layout_sugiyama_impl(NULL))
})

# 202. layout_mds_impl

test_that("layout_mds_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(layout_mds_impl(g))
  expect_snapshot(layout_mds_impl(g, dist = matrix(1:9, nrow = 3), dim = 3))
})

test_that("layout_mds_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(layout_mds_impl(NULL))
})

# 203. layout_bipartite_impl

test_that("layout_bipartite_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(layout_bipartite_impl(g, types = c(TRUE, FALSE, TRUE)))
  expect_snapshot(layout_bipartite_impl(
    g,
    types = c(TRUE, FALSE, TRUE),
    hgap = 2,
    vgap = 2,
    maxiter = 10
  ))
})

test_that("layout_bipartite_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    layout_bipartite_impl(NULL, types = c(TRUE, FALSE, TRUE))
  )
})

# 204. layout_gem_impl

test_that("layout_gem_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(layout_gem_impl(g, res = matrix(0, nrow = 3, ncol = 2)))
  expect_snapshot(layout_gem_impl(
    g,
    res = matrix(0, nrow = 3, ncol = 2),
    use.seed = TRUE,
    maxiter = 10,
    temp.max = 2,
    temp.min = 0.1,
    temp.init = 1
  ))
})

test_that("layout_gem_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    layout_gem_impl(NULL, res = matrix(0, nrow = 3, ncol = 2))
  )
})

# 205. layout_davidson_harel_impl

test_that("layout_davidson_harel_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(layout_davidson_harel_impl(
    g,
    res = matrix(0, nrow = 3, ncol = 2)
  ))
  expect_snapshot(layout_davidson_harel_impl(
    g,
    res = matrix(0, nrow = 3, ncol = 2),
    use.seed = TRUE,
    maxiter = 10,
    fineiter = 5,
    cool.fact = 0.5,
    weight.node.dist = 2,
    weight.border = 1,
    weight.edge.lengths = 0.1,
    weight.edge.crossings = 0.2,
    weight.node.edge.dist = 0.3
  ))
})

test_that("layout_davidson_harel_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    layout_davidson_harel_impl(NULL, res = matrix(0, nrow = 3, ncol = 2))
  )
})

# 206. layout_umap_impl

test_that("layout_umap_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(layout_umap_impl(
    g,
    res = matrix(0, nrow = 3, ncol = 2),
    use.seed = TRUE
  ))
  expect_snapshot(layout_umap_impl(
    g,
    res = matrix(0, nrow = 3, ncol = 2),
    use.seed = TRUE,
    distances = 1:3,
    min.dist = 0.1,
    epochs = 10,
    distances.are.weights = TRUE
  ))
})

test_that("layout_umap_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    layout_umap_impl(NULL, res = matrix(0, nrow = 3, ncol = 2))
  )
})

# 207. layout_umap_3d_impl

test_that("layout_umap_3d_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(layout_umap_3d_impl(
    g,
    res = matrix(0, nrow = 3, ncol = 3),
    use.see = TRUE
  ))
  expect_snapshot(layout_umap_3d_impl(
    g,
    res = matrix(0, nrow = 3, ncol = 3),
    use.seed = TRUE,
    distances = 1:3,
    min.dist = 0.1,
    epochs = 10,
    distances.are.weights = TRUE
  ))
})

test_that("layout_umap_3d_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    layout_umap_3d_impl(NULL, res = matrix(0, nrow = 3, ncol = 3))
  )
})

# 208. layout_umap_compute_weights_impl

test_that("layout_umap_compute_weights_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(layout_umap_compute_weights_impl(
    g,
    distances = 1:2,
    weights = 1:3
  ))
})

test_that("layout_umap_compute_weights_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    layout_umap_compute_weights_impl(NULL, distances = 1:3, weights = 1:3)
  )
})

# 209. layout_align_impl

test_that("layout_align_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(layout_align_impl(g, layout = matrix(0, nrow = 3, ncol = 2)))
})

test_that("layout_align_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    layout_align_impl(NULL, layout = matrix(0, nrow = 3, ncol = 2))
  )
})

# 210. similarity_dice_impl

test_that("similarity_dice_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(similarity_dice_impl(g))
  expect_snapshot(similarity_dice_impl(
    g,
    vids = 1:2,
    mode = "in",
    loops = TRUE
  ))
})

test_that("similarity_dice_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(similarity_dice_impl(NULL))
})

# 211. similarity_dice_es_impl

test_that("similarity_dice_es_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(similarity_dice_es_impl(g))
  expect_snapshot(similarity_dice_es_impl(
    g,
    es = 1:2,
    mode = "in",
    loops = TRUE
  ))
})

test_that("similarity_dice_es_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(similarity_dice_es_impl(NULL))
})

# 212. similarity_dice_pairs_impl

test_that("similarity_dice_pairs_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(4)
  expect_snapshot(similarity_dice_pairs_impl(
    g,
    pairs = matrix(c(1, 2, 2, 3), ncol = 2)
  ))
  expect_snapshot(similarity_dice_pairs_impl(
    g,
    pairs = matrix(c(1, 2, 2, 3), ncol = 2),
    mode = "in",
    loops = TRUE
  ))
})

test_that("similarity_dice_pairs_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    similarity_dice_pairs_impl(NULL, pairs = matrix(c(1, 2, 2, 3), ncol = 2))
  )
})

# 213. similarity_inverse_log_weighted_impl

test_that("similarity_inverse_log_weighted_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(similarity_inverse_log_weighted_impl(g))
  expect_snapshot(similarity_inverse_log_weighted_impl(
    g,
    vids = 1:2,
    mode = "in"
  ))
})

test_that("similarity_inverse_log_weighted_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(similarity_inverse_log_weighted_impl(NULL))
})

# 214. similarity_jaccard_impl

test_that("similarity_jaccard_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(similarity_jaccard_impl(g))
  expect_snapshot(similarity_jaccard_impl(
    g,
    vids = 1:2,
    mode = "in",
    loops = TRUE
  ))
})

test_that("similarity_jaccard_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(similarity_jaccard_impl(NULL))
})

# 215. similarity_jaccard_es_impl

test_that("similarity_jaccard_es_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(similarity_jaccard_es_impl(g))
  expect_snapshot(similarity_jaccard_es_impl(
    g,
    es = 1:2,
    mode = "in",
    loops = TRUE
  ))
})

test_that("similarity_jaccard_es_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(similarity_jaccard_es_impl(NULL))
})

# 216. similarity_jaccard_pairs_impl

test_that("similarity_jaccard_pairs_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(4)
  expect_snapshot(similarity_jaccard_pairs_impl(
    g,
    pairs = matrix(c(1, 2, 2, 3), ncol = 2)
  ))
  expect_snapshot(similarity_jaccard_pairs_impl(
    g,
    pairs = matrix(c(1, 2, 2, 3), ncol = 2),
    mode = "in",
    loops = TRUE
  ))
})

test_that("similarity_jaccard_pairs_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    similarity_jaccard_pairs_impl(NULL, pairs = matrix(c(1, 2, 2, 3), ncol = 2))
  )
})

# 217. compare_communities_impl

test_that("compare_communities_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(compare_communities_impl(c(1, 2, 1), c(2, 1, 2)))
  expect_snapshot(compare_communities_impl(
    c(1, 2, 1),
    c(2, 1, 2),
    method = "nmi"
  ))
})

test_that("compare_communities_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(compare_communities_impl("a", c(2, 1, 2)))
})

# 218. modularity_impl

test_that("modularity_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(modularity_impl(g, membership = c(1, 2, 1)))
  expect_snapshot(modularity_impl(
    g,
    membership = c(1, 2, 1),
    weights = c(1, 2),
    resolution = 0.5,
    directed = FALSE
  ))
})

test_that("modularity_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(modularity_impl(NULL, membership = c(1, 2, 1)))
})

# 219. modularity_matrix_impl

test_that("modularity_matrix_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(modularity_matrix_impl(g))
  expect_snapshot(modularity_matrix_impl(
    g,
    weights = c(1, 2),
    resolution = 0.5,
    directed = FALSE
  ))
})

test_that("modularity_matrix_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(modularity_matrix_impl(NULL))
})

# 220. community_fluid_communities_impl

test_that("community_fluid_communities_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(community_fluid_communities_impl(g, no.of.communities = 2))
})

test_that("community_fluid_communities_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    community_fluid_communities_impl(NULL, no.of.communities = 2)
  )
})

# 221. community_label_propagation_impl

test_that("community_label_propagation_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(community_label_propagation_impl(g))
  expect_snapshot(community_label_propagation_impl(
    g,
    mode = "in",
    weights = c(1, 2),
    initial = 1:3,
    fixed = c(TRUE, FALSE, TRUE)
  ))
})

test_that("community_label_propagation_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(community_label_propagation_impl(NULL))
})

# 222. community_multilevel_impl

test_that("community_multilevel_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(community_multilevel_impl(g))
  expect_snapshot(community_multilevel_impl(
    g,
    weights = c(1, 2),
    resolution = 0.5
  ))
})

test_that("community_multilevel_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(community_multilevel_impl(NULL))
})

# 223. community_optimal_modularity_impl

test_that("community_optimal_modularity_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(community_optimal_modularity_impl(g))
  expect_snapshot(community_optimal_modularity_impl(g, weights = c(1, 2)))
})

test_that("community_optimal_modularity_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(community_optimal_modularity_impl(NULL))
})

# 224. community_leiden_impl

test_that("community_leiden_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(community_leiden_impl(
    g,
    weights = c(1, 2),
    vertex.weights = c(1, 2, 3),
    resolution = 0.5,
    beta = 0.1,
    start = TRUE,
    n.iterations = 1,
    membership = 1:3
  ))
})

test_that("community_leiden_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(community_leiden_impl(NULL, resolution = 1))
})

# 225. split_join_distance_impl

test_that("split_join_distance_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(split_join_distance_impl(c(1, 2, 1), c(2, 1, 2)))
})

test_that("split_join_distance_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(split_join_distance_impl("a", c(2, 1, 2)))
})

# 226. community_infomap_impl

test_that("community_infomap_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(community_infomap_impl(g))
  expect_snapshot(community_infomap_impl(
    g,
    e.weights = c(1, 2),
    v.weights = c(1, 2, 3),
    nb.trials = 2
  ))
})

test_that("community_infomap_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(community_infomap_impl(NULL))
})

# 227. graphlets_impl

test_that("graphlets_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  E(g)$weight <- 1:2
  expect_snapshot(graphlets_impl(g))
  expect_snapshot(graphlets_impl(g, weights = c(3, 4), niter = 10))
})

test_that("graphlets_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(graphlets_impl(NULL))
})

# 228. hrg_fit_impl

test_that("hrg_fit_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(3)
  expect_snapshot(hrg_fit_impl(g1))
})

test_that("hrg_fit_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(hrg_fit_impl(NULL))
})

# 229. hrg_sample_impl

test_that("hrg_sample_impl basic", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_full_graph(10)
  hrg_model <- fit_hrg(g, hrg = NULL, start = FALSE, steps = 0)
  expect_snapshot(hrg_sample_impl(hrg_model))
})

test_that("hrg_sample_impl errors", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(hrg_sample_impl(NULL))
})

# 230. hrg_sample_many_impl

test_that("hrg_sample_many_impl basic", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_full_graph(10)
  hrg_model <- fit_hrg(g, hrg = NULL, start = FALSE, steps = 0)
  expect_snapshot(hrg_sample_many_impl(hrg_model, num.samples = 2))
})

test_that("hrg_sample_many_impl errors", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(hrg_sample_many_impl(NULL, num.samples = 2))
})

# 231. hrg_game_impl

test_that("hrg_game_impl basic", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_full_graph(10)
  hrg_model <- fit_hrg(g, hrg = NULL, start = FALSE, steps = 0)
  expect_snapshot(hrg_game_impl(hrg_model))
})

test_that("hrg_game_impl errors", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(hrg_game_impl(NULL))
})

# 232. hrg_consensus_impl

# test_that("hrg_consensus_impl basic", {
# withr::local_seed(20250909)
# oldval <- igraph_opt("print.id")
# igraph_options(print.id = FALSE)
#   g <- path_graph_impl(3)
#   expect_snapshot(hrg_consensus_impl(g))
#   expect_snapshot(hrg_consensus_impl(g, hrg=list(left=1, right=2, prob=0.5, edges=1, vertices=1), start=TRUE, num.samples=2))
# })

test_that("hrg_consensus_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(hrg_consensus_impl(NULL))
})

# 233. hrg_predict_impl

# test_that("hrg_predict_impl basic", {
# withr::local_seed(20250909)
# oldval <- igraph_opt("print.id")
# igraph_options(print.id = FALSE)
#   g <- path_graph_impl(3)
#   expect_snapshot(hrg_predict_impl(g))
#   expect_snapshot(hrg_predict_impl(g, hrg=list(left=1, right=2, prob=0.5, edges=1, vertices=1), start=TRUE, num.samples=2, num.bins=2))
# })

test_that("hrg_predict_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(hrg_predict_impl(NULL))
})

# 234. hrg_create_impl

test_that("hrg_create_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_tree(5)
  expect_snapshot(hrg_create_impl(g, prob = rep(0.5, 2)))
})

test_that("hrg_create_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_full_graph(4, directed = TRUE)
  expect_snapshot_igraph_error(hrg_create_impl(g, prob = 0.5))
})

# 235. hrg_resize_impl

test_that("hrg_resize_impl basic", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_full_graph(10)
  hrg_model <- fit_hrg(g, hrg = NULL, start = FALSE, steps = 0)
  expect_snapshot(hrg_resize_impl(hrg_model, newsize = 5))
})

test_that("hrg_resize_impl errors", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(hrg_resize_impl(-1, newsize = 2))
})

# 236. hrg_size_impl

test_that("hrg_size_impl basic", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_full_graph(10)
  hrg_model <- fit_hrg(g, hrg = NULL, start = FALSE, steps = 0)
  expect_snapshot(hrg_size_impl(hrg_model))
})

test_that("hrg_size_impl errors", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(hrg_size_impl(-1))
})

# 237. from_hrg_dendrogram_impl

test_that("from_hrg_dendrogram_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- make_full_graph(10)
  hrg_model <- fit_hrg(g, hrg = NULL, start = FALSE, steps = 0)
  expect_snapshot(from_hrg_dendrogram_impl(hrg_model))
})

test_that("from_hrg_dendrogram_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(from_hrg_dendrogram_impl(-1))
})

# 238. get_adjacency_sparse_impl

test_that("get_adjacency_sparse_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(get_adjacency_sparse_impl(g))
  expect_snapshot(get_adjacency_sparse_impl(
    g,
    type = "upper",
    weights = c(1, 2),
    loops = "none"
  ))
})

test_that("get_adjacency_sparse_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_adjacency_sparse_impl(NULL))
})

# 239. get_stochastic_impl

test_that("get_stochastic_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(get_stochastic_impl(g))
  expect_snapshot(get_stochastic_impl(g, column.wise = TRUE, weights = c(1, 2)))
})

test_that("get_stochastic_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_stochastic_impl(NULL))
})

# 240. get_stochastic_sparse_impl

test_that("get_stochastic_sparse_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(get_stochastic_sparse_impl(g))
  expect_snapshot(get_stochastic_sparse_impl(
    g,
    column.wise = TRUE,
    weights = c(1, 2)
  ))
})

test_that("get_stochastic_sparse_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(get_stochastic_sparse_impl(NULL))
})

# 241. to_directed_impl

test_that("to_directed_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(to_directed_impl(g))
  expect_snapshot(to_directed_impl(g, mode = "acyclic"))
})

test_that("to_directed_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(to_directed_impl(NULL))
})

# 242. to_undirected_impl

test_that("to_undirected_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(to_undirected_impl(g))
  expect_snapshot(to_undirected_impl(
    g,
    mode = "mutual",
    edge.attr.comb = "sum"
  ))
})

test_that("to_undirected_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(to_undirected_impl(NULL))
})

# 243. motifs_randesu_impl

test_that("motifs_randesu_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(motifs_randesu_impl(g))
  expect_snapshot(motifs_randesu_impl(g, size = 4, cut.prob = rep(0.1, 4)))
})

test_that("motifs_randesu_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(motifs_randesu_impl(NULL))
})

# 244. motifs_randesu_estimate_impl

test_that("motifs_randesu_estimate_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(6)
  expect_snapshot(motifs_randesu_estimate_impl(g, size = 3, sample.size = 2))
  expect_snapshot(motifs_randesu_estimate_impl(
    g,
    size = 4,
    cut.prob = rep(0.1, 4),
    sample.size = 2,
    sample = 1:2
  ))
})

test_that("motifs_randesu_estimate_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    motifs_randesu_estimate_impl(NULL, size = 3, sample.size = 2)
  )
})

# 245. motifs_randesu_no_impl

test_that("motifs_randesu_no_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(motifs_randesu_no_impl(g))
  expect_snapshot(motifs_randesu_no_impl(
    g,
    size = 4,
    cut.prob = c(0.1, 0.1, 0.1, 0.1)
  ))
})

test_that("motifs_randesu_no_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot_igraph_error(
    motifs_randesu_no_impl(g, size = 3, cut.prob = c(0.1))
  )
})

# 246. dyad_census_impl

test_that("dyad_census_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(dyad_census_impl(g))
})

test_that("dyad_census_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(dyad_census_impl(NULL))
})

# 247. triad_census_impl

test_that("triad_census_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(triad_census_impl(g))
})

test_that("triad_census_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(triad_census_impl(NULL))
})

# 248. count_adjacent_triangles_impl

test_that("count_adjacent_triangles_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(count_adjacent_triangles_impl(g))
  expect_snapshot(count_adjacent_triangles_impl(g, vids = 1:2))
})

test_that("count_adjacent_triangles_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(count_adjacent_triangles_impl(NULL))
})

# 249. count_triangles_impl

test_that("count_triangles_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(count_triangles_impl(g))
})

test_that("count_triangles_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(count_triangles_impl(NULL))
})

# 250. local_scan_0_impl

test_that("local_scan_0_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(local_scan_0_impl(g))
  expect_snapshot(local_scan_0_impl(g, weights = c(1, 2), mode = "in"))
})

test_that("local_scan_0_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(local_scan_0_impl(NULL))
})

# 251. local_scan_0_them_impl

test_that("local_scan_0_them_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(3)
  g2 <- path_graph_impl(3)
  expect_snapshot(local_scan_0_them_impl(g1, g2))
  expect_snapshot(local_scan_0_them_impl(
    g1,
    g2,
    weights.them = c(1, 2),
    mode = "in"
  ))
})

test_that("local_scan_0_them_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    local_scan_0_them_impl(NULL, path_graph_impl(3))
  )
})

# 252. local_scan_1_ecount_impl

test_that("local_scan_1_ecount_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(local_scan_1_ecount_impl(g))
  expect_snapshot(local_scan_1_ecount_impl(g, weights = c(1, 2), mode = "in"))
})

test_that("local_scan_1_ecount_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(local_scan_1_ecount_impl(NULL))
})

# 253. local_scan_1_ecount_them_impl

test_that("local_scan_1_ecount_them_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(3)
  g2 <- path_graph_impl(3)
  expect_snapshot(local_scan_1_ecount_them_impl(g1, g2))
  expect_snapshot(local_scan_1_ecount_them_impl(
    g1,
    g2,
    weights.them = c(1, 2),
    mode = "in"
  ))
})

test_that("local_scan_1_ecount_them_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    local_scan_1_ecount_them_impl(NULL, path_graph_impl(3))
  )
})

# 254. local_scan_k_ecount_impl

test_that("local_scan_k_ecount_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(local_scan_k_ecount_impl(g, k = 1))
  expect_snapshot(local_scan_k_ecount_impl(
    g,
    k = 1,
    weights = c(1, 2),
    mode = "in"
  ))
})

test_that("local_scan_k_ecount_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(local_scan_k_ecount_impl(NULL, k = 1))
})

# 255. local_scan_k_ecount_them_impl

test_that("local_scan_k_ecount_them_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(3)
  g2 <- path_graph_impl(3)
  expect_snapshot(local_scan_k_ecount_them_impl(g1, g2, k = 1))
  expect_snapshot(local_scan_k_ecount_them_impl(
    g1,
    g2,
    k = 1,
    weights.them = c(1, 2),
    mode = "in"
  ))
})

test_that("local_scan_k_ecount_them_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    local_scan_k_ecount_them_impl(NULL, path_graph_impl(3), k = 1)
  )
})

# 256. local_scan_neighborhood_ecount_impl

test_that("local_scan_neighborhood_ecount_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(4)
  expect_snapshot(local_scan_neighborhood_ecount_impl(
    g,
    neighborhoods = list(1:2, 2:3, 2:4, 2)
  ))
  expect_snapshot(local_scan_neighborhood_ecount_impl(
    g,
    weights = c(1, 2, 3),
    neighborhoods = list(1:2, 1:3, 2:4, 1)
  ))
})

test_that("local_scan_neighborhood_ecount_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    local_scan_neighborhood_ecount_impl(NULL, neighborhoods = list(1:2, 2:3))
  )
})

# 257. local_scan_subset_ecount_impl

test_that("local_scan_subset_ecount_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(4)
  expect_snapshot(local_scan_subset_ecount_impl(
    g,
    subsets = list(c(1.0, 2.0), c(2.0, 3.0))
  ))
  expect_snapshot(local_scan_subset_ecount_impl(
    g,
    weights = c(1.0, 2.0, 3.0),
    subsets = list(c(1.0, 2.0), c(2.0, 3.0))
  ))
})

test_that("local_scan_subset_ecount_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(4)
  expect_snapshot_igraph_error(
    local_scan_subset_ecount_impl(g, subsets = list(1:2, letters[2:3]))
  )
})

# 258. list_triangles_impl

test_that("list_triangles_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(list_triangles_impl(g))
})

test_that("list_triangles_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(list_triangles_impl(NULL))
})

# 259. join_impl

test_that("join_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(3)
  g2 <- path_graph_impl(3)
  expect_snapshot(join_impl(g1, g2))
})

test_that("join_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(join_impl(NULL, path_graph_impl(3)))
})

# 260. induced_subgraph_map_impl

test_that("induced_subgraph_map_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(induced_subgraph_map_impl(g, 1:2, impl = "auto"))
  expect_snapshot(induced_subgraph_map_impl(g, 1:2, impl = "copy_and_delete"))
})

test_that("induced_subgraph_map_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    induced_subgraph_map_impl(NULL, 1:2, impl = "auto")
  )
})

# 261. mycielskian_impl

test_that("mycielskian_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(mycielskian_impl(g))
  expect_snapshot(mycielskian_impl(g, k = 2))
})

test_that("mycielskian_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(mycielskian_impl(NULL))
})

# 262. product_impl

test_that("product_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(3)
  g2 <- path_graph_impl(3)
  expect_snapshot(product_impl(g1, g2))
  expect_snapshot(product_impl(g1, g2, type = "tensor"))
})

test_that("product_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(product_impl(NULL, path_graph_impl(3)))
})

# 263. rooted_product_impl

test_that("rooted_product_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(3)
  g2 <- path_graph_impl(3)
  expect_snapshot(rooted_product_impl(g1, g2, root = 1))
})

test_that("rooted_product_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    rooted_product_impl(NULL, path_graph_impl(3), root = 1)
  )
})

# 264. gomory_hu_tree_impl

test_that("gomory_hu_tree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(gomory_hu_tree_impl(g))
  expect_snapshot(gomory_hu_tree_impl(g, capacity = c(1, 2)))
})

test_that("gomory_hu_tree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(gomory_hu_tree_impl(NULL))
})

# 265. maxflow_impl

test_that("maxflow_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(maxflow_impl(g, source = 1, target = 3))
  expect_snapshot(maxflow_impl(g, source = 1, target = 3, capacity = c(1, 2)))
})

test_that("maxflow_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(maxflow_impl(NULL, source = 1, target = 3))
})

# 266. residual_graph_impl

test_that("residual_graph_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(residual_graph_impl(g, capacity = c(1, 2), flow = c(1, 2)))
})

test_that("residual_graph_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    residual_graph_impl(NULL, capacity = c(1, 2), flow = c(1, 2))
  )
})

# 267. reverse_residual_graph_impl

test_that("reverse_residual_graph_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(reverse_residual_graph_impl(
    g,
    capacity = c(1, 2),
    flow = c(1, 2)
  ))
})

test_that("reverse_residual_graph_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    reverse_residual_graph_impl(NULL, capacity = c(1, 2), flow = c(1, 2))
  )
})

# 268. st_mincut_impl

test_that("st_mincut_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(st_mincut_impl(g, source = 1, target = 3))
  expect_snapshot(st_mincut_impl(g, source = 1, target = 3, capacity = c(1, 2)))
})

test_that("st_mincut_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(st_mincut_impl(NULL, source = 1, target = 3))
})

# 269. dominator_tree_impl

test_that("dominator_tree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3, directed = TRUE)
  expect_snapshot(dominator_tree_impl(g, root = 1))
  expect_snapshot(dominator_tree_impl(g, root = 1, mode = "in"))
})

test_that("dominator_tree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(dominator_tree_impl(NULL, root = 1))
})

# 270. all_st_cuts_impl

test_that("all_st_cuts_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3, directed = TRUE)
  expect_snapshot(all_st_cuts_impl(g, source = 1, target = 3))
})

test_that("all_st_cuts_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(all_st_cuts_impl(NULL, source = 1, target = 3))
})

# 271. all_st_mincuts_impl

test_that("all_st_mincuts_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3, directed = TRUE)
  expect_snapshot(all_st_mincuts_impl(g, source = 1, target = 3))
  expect_snapshot(all_st_mincuts_impl(
    g,
    source = 1,
    target = 3,
    capacity = c(1, 2)
  ))
})

test_that("all_st_mincuts_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    all_st_mincuts_impl(NULL, source = 1, target = 3)
  )
})

# 272. even_tarjan_reduction_impl

test_that("even_tarjan_reduction_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(even_tarjan_reduction_impl(g))
})

test_that("even_tarjan_reduction_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(even_tarjan_reduction_impl(NULL))
})

# 273. is_separator_impl

test_that("is_separator_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_separator_impl(g, 1:2))
})

test_that("is_separator_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_separator_impl(NULL, 1:2))
})

# 274. is_minimal_separator_impl

test_that("is_minimal_separator_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_minimal_separator_impl(g, 1:2))
})

test_that("is_minimal_separator_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_minimal_separator_impl(NULL, 1:2))
})

# 275. all_minimal_st_separators_impl

test_that("all_minimal_st_separators_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(all_minimal_st_separators_impl(g))
})

test_that("all_minimal_st_separators_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(all_minimal_st_separators_impl(NULL))
})

# 276. minimum_size_separators_impl

test_that("minimum_size_separators_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(minimum_size_separators_impl(g))
})

test_that("minimum_size_separators_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(minimum_size_separators_impl(NULL))
})

# 277. isoclass_impl

test_that("isoclass_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(isoclass_impl(g))
})

test_that("isoclass_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(isoclass_impl(NULL))
})

# 278. isomorphic_impl

test_that("isomorphic_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(3)
  g2 <- path_graph_impl(3)
  expect_snapshot(isomorphic_impl(g1, g2))
})

test_that("isomorphic_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(isomorphic_impl(NULL, path_graph_impl(3)))
})

# 279. isoclass_subgraph_impl

test_that("isoclass_subgraph_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(5)
  expect_snapshot(isoclass_subgraph_impl(g, c(1, 2, 3)))
})

test_that("isoclass_subgraph_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(isoclass_subgraph_impl(NULL, 1:2))
})

# 280. isoclass_create_impl

test_that("isoclass_create_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(isoclass_create_impl(size = 3, number = 1))
  expect_snapshot(isoclass_create_impl(size = 3, number = 1, directed = FALSE))
})

test_that("isoclass_create_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(isoclass_create_impl("a", 1))
})

# 281. isomorphic_vf2_impl

test_that("isomorphic_vf2_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(3)
  g2 <- path_graph_impl(3)
  expect_snapshot(isomorphic_vf2_impl(g1, g2))
  expect_snapshot(isomorphic_vf2_impl(
    g1,
    g2,
    vertex.color1 = c(1, 2, 3),
    vertex.color2 = c(1, 2, 3),
    edge.color1 = c(1, 2),
    edge.color2 = c(1, 2)
  ))
})

test_that("isomorphic_vf2_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(isomorphic_vf2_impl(NULL, path_graph_impl(3)))
})

# 282. get_isomorphisms_vf2_callback_impl
# Skipped: requires callback function, not suitable for snapshot test

# 283. count_isomorphisms_vf2_impl

test_that("count_isomorphisms_vf2_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(3)
  g2 <- path_graph_impl(3)
  expect_snapshot(count_isomorphisms_vf2_impl(g1, g2))
  expect_snapshot(count_isomorphisms_vf2_impl(
    g1,
    g2,
    vertex.color1 = c(1, 2, 3),
    vertex.color2 = c(1, 2, 3),
    edge.color1 = c(1, 2),
    edge.color2 = c(1, 2)
  ))
})

test_that("count_isomorphisms_vf2_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    count_isomorphisms_vf2_impl(NULL, path_graph_impl(3))
  )
})

# 284. get_isomorphisms_vf2_impl

test_that("get_isomorphisms_vf2_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(3)
  g2 <- path_graph_impl(3)
  expect_snapshot(get_isomorphisms_vf2_impl(g1, g2))
  expect_snapshot(get_isomorphisms_vf2_impl(
    g1,
    g2,
    vertex.color1 = c(1, 2, 3),
    vertex.color2 = c(1, 2, 3),
    edge.color1 = c(1, 2),
    edge.color2 = c(1, 2)
  ))
})

test_that("get_isomorphisms_vf2_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    get_isomorphisms_vf2_impl(NULL, path_graph_impl(3))
  )
})

# 285. subisomorphic_impl

test_that("subisomorphic_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(3)
  g2 <- path_graph_impl(3)
  expect_snapshot(subisomorphic_impl(g1, g2))
})

test_that("subisomorphic_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(subisomorphic_impl(NULL, path_graph_impl(3)))
})

# 286. subisomorphic_vf2_impl

test_that("subisomorphic_vf2_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(3)
  g2 <- path_graph_impl(3)
  expect_snapshot(subisomorphic_vf2_impl(g1, g2))
  expect_snapshot(subisomorphic_vf2_impl(
    g1,
    g2,
    vertex.color1 = c(1, 2, 3),
    vertex.color2 = c(1, 2, 3),
    edge.color1 = c(1, 2),
    edge.color2 = c(1, 2)
  ))
})

test_that("subisomorphic_vf2_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    subisomorphic_vf2_impl(NULL, path_graph_impl(3))
  )
})

# 287. count_subisomorphisms_vf2_impl

test_that("count_subisomorphisms_vf2_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(3)
  g2 <- path_graph_impl(3)
  expect_snapshot(count_subisomorphisms_vf2_impl(g1, g2))
  expect_snapshot(count_subisomorphisms_vf2_impl(
    g1,
    g2,
    vertex.color1 = c(1, 2, 3),
    vertex.color2 = c(1, 2, 3),
    edge.color1 = c(1, 2),
    edge.color2 = c(1, 2)
  ))
})

test_that("count_subisomorphisms_vf2_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    count_subisomorphisms_vf2_impl(NULL, path_graph_impl(3))
  )
})

# 288. get_subisomorphisms_vf2_impl

test_that("get_subisomorphisms_vf2_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(3)
  g2 <- path_graph_impl(3)
  expect_snapshot(get_subisomorphisms_vf2_impl(g1, g2))
  expect_snapshot(get_subisomorphisms_vf2_impl(
    g1,
    g2,
    vertex.color1 = c(1, 2, 3),
    vertex.color2 = c(1, 2, 3),
    edge.color1 = c(1, 2),
    edge.color2 = c(1, 2)
  ))
})

test_that("get_subisomorphisms_vf2_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    get_subisomorphisms_vf2_impl(NULL, path_graph_impl(3))
  )
})

# 289. canonical_permutation_impl

test_that("canonical_permutation_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(canonical_permutation_impl(g))
  expect_snapshot(canonical_permutation_impl(g, colors = c(1, 2, 3), sh = "fl"))
})

test_that("canonical_permutation_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(canonical_permutation_impl(NULL))
})

# 290. permute_vertices_impl

test_that("permute_vertices_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(permute_vertices_impl(g, permutation = 3:1))
})

test_that("permute_vertices_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(permute_vertices_impl(NULL, permutation = 3:1))
})

# 291. isomorphic_bliss_impl

test_that("isomorphic_bliss_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(3)
  g2 <- path_graph_impl(3)
  expect_snapshot(isomorphic_bliss_impl(g1, g2))
  expect_snapshot(isomorphic_bliss_impl(
    g1,
    g2,
    colors1 = c(1, 2, 3),
    colors2 = c(1, 2, 3),
    sh = "fl"
  ))
})

test_that("isomorphic_bliss_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(isomorphic_bliss_impl(NULL, path_graph_impl(3)))
})

# 292. count_automorphisms_impl

test_that("count_automorphisms_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(count_automorphisms_impl(g))
  expect_snapshot(count_automorphisms_impl(g, colors = c(1, 2, 3), sh = "fl"))
})

test_that("count_automorphisms_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(count_automorphisms_impl(NULL))
})

# 293. automorphism_group_impl

test_that("automorphism_group_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(automorphism_group_impl(g))
  expect_snapshot(automorphism_group_impl(
    g,
    colors = c(1, 2, 3),
    sh = "fl",
    details = TRUE
  ))
})

test_that("automorphism_group_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(automorphism_group_impl(NULL))
})

# 294. simplify_and_colorize_impl

test_that("simplify_and_colorize_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(simplify_and_colorize_impl(g))
})

test_that("simplify_and_colorize_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(simplify_and_colorize_impl(NULL))
})

# 295. graph_count_impl

test_that("graph_count_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(graph_count_impl(3))
  expect_snapshot(graph_count_impl(3, directed = TRUE))
})

test_that("graph_count_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(graph_count_impl("a"))
})

# 296. is_matching_impl

test_that("is_matching_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_matching_impl(g, matching = 1:2))
  expect_snapshot(is_matching_impl(
    g,
    types = c(TRUE, FALSE, TRUE),
    matching = 1:2
  ))
})

test_that("is_matching_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_matching_impl(NULL, matching = 1:2))
})

# 297. is_maximal_matching_impl

test_that("is_maximal_matching_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_maximal_matching_impl(g, matching = 1:2))
  expect_snapshot(is_maximal_matching_impl(
    g,
    types = c(TRUE, FALSE, TRUE),
    matching = 1:2
  ))
})

test_that("is_maximal_matching_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_maximal_matching_impl(NULL, matching = 1:2))
})

# 298. maximum_bipartite_matching_impl

test_that("maximum_bipartite_matching_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(maximum_bipartite_matching_impl(
    g,
    types = c(TRUE, FALSE, TRUE)
  ))
  expect_snapshot(maximum_bipartite_matching_impl(
    g,
    types = c(TRUE, FALSE, TRUE),
    weights = c(1, 2),
    eps = 1e-5
  ))
})

test_that("maximum_bipartite_matching_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    maximum_bipartite_matching_impl(NULL, types = c(TRUE, FALSE, TRUE))
  )
})

# 299. adjacency_spectral_embedding_impl

test_that("adjacency_spectral_embedding_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(adjacency_spectral_embedding_impl(g, no = 2))
  expect_snapshot(adjacency_spectral_embedding_impl(
    g,
    no = 2,
    weights = c(1, 2),
    which = "la",
    scaled = FALSE,
    cvec = c(1, 2, 3),
    options = list(maxiter = 10)
  ))
})

test_that("adjacency_spectral_embedding_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(adjacency_spectral_embedding_impl(NULL, no = 2))
})

# 300. laplacian_spectral_embedding_impl

test_that("laplacian_spectral_embedding_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(laplacian_spectral_embedding_impl(g, no = 2))
})

test_that("laplacian_spectral_embedding_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(laplacian_spectral_embedding_impl(NULL, no = 2))
})

# 301. eigen_adjacency_impl

test_that("eigen_adjacency_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(eigen_adjacency_impl(g))
  expect_snapshot_igraph_error(
    eigen_adjacency_impl(
      g,
      algorithm = "lapack",
      which = list(which = "LA"),
      options = list(maxiter = 10)
    )
  )
})

test_that("eigen_adjacency_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(eigen_adjacency_impl(NULL))
})

# 302. power_law_fit_impl

test_that("power_law_fit_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(power_law_fit_impl(c(1, 2, 3)))
  expect_snapshot(power_law_fit_impl(
    c(1, 2, 3),
    xmin = 1,
    force.continuous = TRUE
  ))
})

test_that("power_law_fit_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(power_law_fit_impl("a"))
})

# 303. sir_impl

test_that("sir_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(sir_impl(g, beta = 0.1, gamma = 0.1))
  expect_snapshot(sir_impl(g, beta = 0.1, gamma = 0.1, no.sim = 2))
})

test_that("sir_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(sir_impl(NULL, beta = 0.1, gamma = 0.1))
})

# 304. convex_hull_2d_impl

test_that("convex_hull_2d_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(convex_hull_2d_impl(matrix(1:6, ncol = 2)))
})

test_that("convex_hull_2d_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(convex_hull_2d_impl("a"))
})

# 305. dim_select_impl

test_that("dim_select_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(dim_select_impl(c(1, 2, 3)))
})

test_that("dim_select_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(dim_select_impl(NULL))
})

# 306. solve_lsap_impl

test_that("solve_lsap_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(solve_lsap_impl(matrix(1:4, ncol = 2), n = 2))
})

test_that("solve_lsap_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(solve_lsap_impl("a", n = 2))
})

# 307. find_cycle_impl

test_that("find_cycle_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(find_cycle_impl(g))
  expect_snapshot(find_cycle_impl(g, mode = "in"))
})

test_that("find_cycle_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(find_cycle_impl(NULL))
})

# 308. simple_cycles_impl

test_that("simple_cycles_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(simple_cycles_impl(g))
  expect_snapshot(simple_cycles_impl(
    g,
    mode = "in",
    min.cycle.length = 2,
    max.cycle.length = 3
  ))
})

test_that("simple_cycles_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(simple_cycles_impl(NULL))
})

# 309. is_eulerian_impl

test_that("is_eulerian_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_eulerian_impl(g))
})

test_that("is_eulerian_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_eulerian_impl(NULL))
})

# 310. eulerian_path_impl

test_that("eulerian_path_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(eulerian_path_impl(g))
})

test_that("eulerian_path_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(eulerian_path_impl(NULL))
})

# 311. eulerian_cycle_impl

test_that("eulerian_cycle_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g1 <- path_graph_impl(3)
  expect_snapshot_igraph_error(eulerian_cycle_impl(g1))
  g2 <- cycle_graph_impl(4)
  expect_snapshot(eulerian_cycle_impl(g2))
})

test_that("eulerian_cycle_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(eulerian_cycle_impl(NULL))
})

# 312. fundamental_cycles_impl

test_that("fundamental_cycles_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(fundamental_cycles_impl(g, start = 1))
  expect_snapshot(fundamental_cycles_impl(
    g,
    start = 1,
    bfs.cutoff = 2,
    weights = c(1, 2)
  ))
})

test_that("fundamental_cycles_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(fundamental_cycles_impl(NULL, start = 1))
})

# 313. minimum_cycle_basis_impl

test_that("minimum_cycle_basis_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(minimum_cycle_basis_impl(g))
  expect_snapshot(minimum_cycle_basis_impl(
    g,
    bfs.cutoff = 2,
    complete = FALSE,
    use.cycle.order = FALSE,
    weights = c(1, 2)
  ))
})

test_that("minimum_cycle_basis_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(minimum_cycle_basis_impl(NULL))
})

# 314. is_tree_impl

test_that("is_tree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_tree_impl(g))
  expect_snapshot(is_tree_impl(g, mode = "in", details = TRUE))
})

test_that("is_tree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_tree_impl(NULL))
})

# 315. is_forest_impl

test_that("is_forest_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_forest_impl(g))
  expect_snapshot(is_forest_impl(g, mode = "in", details = TRUE))
})

test_that("is_forest_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_forest_impl(NULL))
})

# 316. from_prufer_impl

test_that("from_prufer_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(from_prufer_impl(1:2))
})

test_that("from_prufer_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(from_prufer_impl("a"))
})

# 317. to_prufer_impl

test_that("to_prufer_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(to_prufer_impl(g))
})

test_that("to_prufer_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(to_prufer_impl(NULL))
})

# 318. tree_from_parent_vector_impl

test_that("tree_from_parent_vector_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(tree_from_parent_vector_impl(c(-1, 1, 2, 3)))
  expect_snapshot(tree_from_parent_vector_impl(c(-1, 1, 2, 3), type = "in"))
})

test_that("tree_from_parent_vector_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(tree_from_parent_vector_impl("a"))
})

# 319. is_complete_impl

test_that("is_complete_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_complete_impl(g))
})

test_that("is_complete_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_complete_impl(NULL))
})

# 320. random_spanning_tree_impl

test_that("random_spanning_tree_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(random_spanning_tree_impl(g, vid = 1))
})

test_that("random_spanning_tree_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(random_spanning_tree_impl(NULL, vid = 1))
})

# 321. tree_game_impl

test_that("tree_game_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot(tree_game_impl(3))
  expect_snapshot(tree_game_impl(3, directed = TRUE, method = "lerw"))
})

test_that("tree_game_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(tree_game_impl("a"))
})

# 322. vertex_coloring_greedy_impl

test_that("vertex_coloring_greedy_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(vertex_coloring_greedy_impl(g))
  expect_snapshot(vertex_coloring_greedy_impl(g, heuristic = "dsatur"))
})

test_that("vertex_coloring_greedy_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(vertex_coloring_greedy_impl(NULL))
})

# 323. is_vertex_coloring_impl

test_that("is_vertex_coloring_impl basic", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(is_vertex_coloring_impl(g, types = c(1, 2, 3)))
})

test_that("is_vertex_coloring_impl errors", {
  withr::local_seed(20250909)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    is_vertex_coloring_impl(NULL, types = c(1, 2, 3))
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
  g <- path_graph_impl(3)
  expect_snapshot(is_bipartite_coloring_impl(g, types = c(TRUE, FALSE, TRUE)))
})

test_that("is_bipartite_coloring_impl errors", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    is_bipartite_coloring_impl(NULL, types = c(TRUE, FALSE, TRUE))
  )
})

# 326. is_edge_coloring_impl

test_that("is_edge_coloring_impl basic", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  E(g)$color <- c(1, 2)
  expect_snapshot(is_edge_coloring_impl(g, types = c(1, 2)))
  expect_snapshot(is_edge_coloring_impl(g))
})

test_that("is_edge_coloring_impl errors", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(is_edge_coloring_impl(NULL, types = c(1, 2)))
})

# 327. deterministic_optimal_imitation_impl

test_that("deterministic_optimal_imitation_impl basic", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(deterministic_optimal_imitation_impl(
    g,
    1,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3)
  ))
  expect_snapshot(deterministic_optimal_imitation_impl(
    g,
    1,
    optimality = "minimum",
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3),
    mode = "in"
  ))
})

test_that("deterministic_optimal_imitation_impl errors", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    deterministic_optimal_imitation_impl(
      NULL,
      1,
      quantities = c(1, 2, 3),
      strategies = c(1, 2, 3)
    )
  )
})

# 328. moran_process_impl

test_that("moran_process_impl basic", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(moran_process_impl(
    g,
    weights = c(1, 1),
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3),
    mode = "in"
  ))
})

test_that("moran_process_impl errors", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    moran_process_impl(NULL, quantities = c(1, 2, 3), strategies = c(1, 2, 3))
  )
})

# 329. roulette_wheel_imitation_impl

test_that("roulette_wheel_imitation_impl basic", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(roulette_wheel_imitation_impl(
    g,
    1,
    TRUE,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3)
  ))
  expect_snapshot(roulette_wheel_imitation_impl(
    g,
    1,
    FALSE,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3),
    mode = "in"
  ))
})

test_that("roulette_wheel_imitation_impl errors", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    roulette_wheel_imitation_impl(
      NULL,
      1,
      TRUE,
      quantities = c(1, 2, 3),
      strategies = c(1, 2, 3)
    )
  )
})

# 330. stochastic_imitation_impl

test_that("stochastic_imitation_impl basic", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(stochastic_imitation_impl(
    g,
    1,
    algo = 1,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3)
  ))
  expect_snapshot(stochastic_imitation_impl(
    g,
    1,
    algo = 2,
    quantities = c(1, 2, 3),
    strategies = c(1, 2, 3),
    mode = "in"
  ))
})

test_that("stochastic_imitation_impl errors", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    stochastic_imitation_impl(
      NULL,
      1,
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
  g <- path_graph_impl(3)
  expect_snapshot(invalidate_cache_impl(g))
})

test_that("invalidate_cache_impl errors", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(invalidate_cache_impl(NULL))
})

# 332. vertex_path_from_edge_path_impl

test_that("vertex_path_from_edge_path_impl basic", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  g <- path_graph_impl(3)
  expect_snapshot(vertex_path_from_edge_path_impl(
    g,
    start = 1,
    edge.path = c(1, 2)
  ))
  expect_snapshot(vertex_path_from_edge_path_impl(
    g,
    start = 1,
    edge.path = c(1),
    mode = "in"
  ))
})

test_that("vertex_path_from_edge_path_impl errors", {
  withr::local_seed(12345)
  local_igraph_options(print.id = FALSE)
  expect_snapshot_igraph_error(
    vertex_path_from_edge_path_impl(NULL, start = 1, edge.path = c(1, 2))
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
})

test_that("version_impl errors", {
  withr::local_seed(12345)
  # version_impl() has no parameters, so testing with invalid arguments
  expect_snapshot_igraph_error(version_impl("invalid"))
})
