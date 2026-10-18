# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 183. is_clique_impl

test_that("is_clique_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_clique_impl(
    graph = NULL,
    candidate = 1:2
  ))
})

# 184. cliques_impl

test_that("cliques_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(cliques_impl(
    graph = NULL
  ))
})

# 185. clique_size_hist_impl

test_that("clique_size_hist_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(clique_size_hist_impl(
    graph = NULL
  ))
})

# 186. largest_cliques_impl

test_that("largest_cliques_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(largest_cliques_impl(
    graph = NULL
  ))
})

# 187. maximal_cliques_hist_impl

test_that("maximal_cliques_hist_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(maximal_cliques_hist_impl(
    graph = NULL
  ))
})

# 188. clique_number_impl

test_that("clique_number_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(clique_number_impl(
    graph = NULL
  ))
})

# 189. weighted_cliques_impl

test_that("weighted_cliques_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(weighted_cliques_impl(
    graph = NULL
  ))
})

# 190. largest_weighted_cliques_impl

test_that("largest_weighted_cliques_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(largest_weighted_cliques_impl(
    graph = NULL
  ))
})

# 191. weighted_clique_number_impl

test_that("weighted_clique_number_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(weighted_clique_number_impl(
    graph = NULL
  ))
})

# 192. is_independent_vertex_set_impl

test_that("is_independent_vertex_set_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_independent_vertex_set_impl(
    graph = NULL,
    candidate = 1:2
  ))
})

# 319. is_complete_impl

test_that("is_complete_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_complete_impl(
    graph = NULL
  ))
})

# Maximal cliques

test_that("maximal_cliques_impl basic", {
  igraph_local_seed(20250909)
  g <- make_full_graph(4)
  expect_snapshot(maximal_cliques_impl(graph = g, min_size = 1, max_size = 0))
})

test_that("independent_vertex_sets_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(5)
  expect_snapshot(independent_vertex_sets_impl(
    graph = g,
    min_size = 1,
    max_size = 0
  ))
})

# cliques_callback_closure_impl

test_that("cliques_callback_closure_impl basic", {
  igraph_local_seed(20250909)

  g <- make_full_graph(4)

  # Collect clique information for snapshot
  clique_data <- list()
  result <- cliques_callback_closure_impl(
    graph = g,
    min_size = 3,
    max_size = 4,
    callback = function(clique) {
      clique_data[[length(clique_data) + 1]] <<- clique
      FALSE # Continue
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
  expect_type(clique_data[[1]], "integer")
  expect_true(length(clique_data[[1]]) >= 3)
  expect_true(length(clique_data[[1]]) <= 4)
})

test_that("cliques_callback_closure_impl errors", {
  igraph_local_seed(20250909)

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
  igraph_local_seed(20250909)

  g <- sample_gnp(10, 0.3)

  # Collect clique information for snapshot
  clique_data <- list()
  result <- maximal_cliques_callback_closure_impl(
    graph = g,
    min_size = 3,
    max_size = 0,
    callback = function(clique) {
      clique_data[[length(clique_data) + 1]] <<- clique
      if (length(clique_data) >= 3) {
        return(TRUE) # Stop after 3
      }
      FALSE # Continue
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
  expect_type(clique_data[[1]], "integer")
  expect_true(length(clique_data[[1]]) >= 3)
})

test_that("maximal_cliques_callback_closure_impl errors", {
  igraph_local_seed(20250909)

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
