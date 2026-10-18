# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 277. isoclass_impl

test_that("isoclass_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(isoclass_impl(
    graph = NULL
  ))
})

# 278. isomorphic_impl

test_that("isomorphic_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(isoclass_subgraph_impl(
    graph = NULL,
    vids = 1:2
  ))
})

# 280. isoclass_create_impl

test_that("isoclass_create_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(isoclass_create_impl(
    size = "a",
    number = 1
  ))
})

# 281. isomorphic_vf2_impl

test_that("isomorphic_vf2_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(canonical_permutation_impl(
    graph = NULL
  ))
})

# 290. permute_vertices_impl

test_that("permute_vertices_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(permute_vertices_impl(
    graph = NULL,
    permutation = 3:1
  ))
})

# 291. isomorphic_bliss_impl

test_that("isomorphic_bliss_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(count_automorphisms_impl(
    graph = NULL
  ))
})

# 293. automorphism_group_impl

test_that("automorphism_group_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(automorphism_group_impl(
    graph = NULL
  ))
})

# 294. simplify_and_colorize_impl

test_that("simplify_and_colorize_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(simplify_and_colorize_impl(
    graph = NULL
  ))
})

# 295. graph_count_impl

test_that("graph_count_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(graph_count_impl(
    n = "a"
  ))
})

# get_isomorphisms_vf2_callback_closure_impl

test_that("get_isomorphisms_vf2_callback_closure_impl basic", {
  igraph_local_seed(20250909)

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
      if (length(iso_data) >= 2) {
        return(TRUE) # Stop after 2
      }
      FALSE # Continue
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
  expect_type(iso_data[[1]]$map12, "integer")
  expect_type(iso_data[[1]]$map21, "integer")
  expect_length(iso_data[[1]]$map12, vcount(g1))
  expect_length(iso_data[[1]]$map21, vcount(g2))
})

test_that("get_isomorphisms_vf2_callback_closure_impl errors", {
  igraph_local_seed(20250909)

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
  igraph_local_seed(20250909)

  g1 <- make_full_graph(5)
  g2 <- make_ring(3) # triangle

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
      if (length(subiso_data) >= 2) {
        return(TRUE) # Stop after 2
      }
      FALSE # Continue
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
  expect_type(subiso_data[[1]]$map12, "integer")
  expect_type(subiso_data[[1]]$map21, "integer")
  expect_length(subiso_data[[1]]$map12, vcount(g1))
  expect_length(subiso_data[[1]]$map21, vcount(g2))
})

test_that("get_subisomorphisms_vf2_callback_closure_impl errors", {
  igraph_local_seed(20250909)

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
})

# subisomorphic_lad_impl
test_that("subisomorphic_lad_impl basic", {
  igraph_local_seed(20250909)

  # FIXME: Add functionality tests once we understand the expected behavior
  # The function requires complex setup with pattern/target graphs and domains
  # For now, just verify the function exists and has correct signature
  expect_true(is.function(subisomorphic_lad_impl))
  expect_named(
    formals(subisomorphic_lad_impl),
    c("pattern", "target", "domains", "induced", "time_limit")
  )
})

test_that("subisomorphic_lad_impl errors", {
  igraph_local_seed(20250909)
  g <- add_edges_impl(empty_impl(n = 3), c(0, 1, 1, 2) + 1)

  expect_snapshot_igraph_error(subisomorphic_lad_impl(
    pattern = NULL,
    target = g,
    domains = list(),
    induced = FALSE,
    time_limit = 0
  ))

  # Test that domains must be a list
  expect_snapshot_igraph_error(subisomorphic_lad_impl(
    pattern = g,
    target = g,
    domains = "not a list",
    induced = FALSE,
    time_limit = 0
  ))
})
