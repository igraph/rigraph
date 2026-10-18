# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 112. feedback_arc_set_impl

test_that("feedback_arc_set_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(feedback_arc_set_impl(
    graph = NULL
  ))
})

# 113. feedback_vertex_set_impl

test_that("feedback_vertex_set_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(feedback_vertex_set_impl(
    graph = NULL
  ))
})

# 115. is_dag_impl

test_that("is_dag_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_dag_impl(
    graph = NULL
  ))
})

# 116. is_acyclic_impl

test_that("is_acyclic_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_acyclic_impl(
    graph = NULL
  ))
})

# 307. find_cycle_impl

test_that("find_cycle_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(find_cycle_impl(
    graph = NULL
  ))
})

# 308. simple_cycles_impl

test_that("simple_cycles_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(simple_cycles_impl(
    graph = NULL
  ))
})

# 309. is_eulerian_impl

test_that("is_eulerian_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(is_eulerian_impl(
    graph = NULL
  ))
})

# 310. eulerian_path_impl

test_that("eulerian_path_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(eulerian_path_impl(
    graph = NULL
  ))
})

# 311. eulerian_cycle_impl

test_that("eulerian_cycle_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(eulerian_cycle_impl(
    graph = NULL
  ))
})

# 312. fundamental_cycles_impl

test_that("fundamental_cycles_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(fundamental_cycles_impl(
    graph = NULL,
    start = 1
  ))
})

# 313. minimum_cycle_basis_impl

test_that("minimum_cycle_basis_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(minimum_cycle_basis_impl(
    graph = NULL
  ))
})

# simple_cycles_callback_closure_impl

test_that("simple_cycles_callback_closure_impl basic", {
  igraph_local_seed(20250909)

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
      FALSE # Continue
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
  expect_type(cycle_data[[1]]$vertices, "integer")
  expect_type(cycle_data[[1]]$edges, "integer")
  expect_equal(length(cycle_data[[1]]$vertices), length(cycle_data[[1]]$edges))
})

test_that("simple_cycles_callback_closure_impl errors", {
  igraph_local_seed(20250909)

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
