# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 156. random_walk_impl

test_that("random_walk_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(random_walk_impl(
    graph = NULL,
    start = 1,
    steps = 2
  ))
})

# 164. bfs_simple_impl

test_that("bfs_simple_impl basic", {
  igraph_local_seed(20250909)
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
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(bfs_simple_impl(
    graph = NULL,
    root = 1
  ))
})

# Callback functions

# bfs_closure_impl

test_that("bfs_closure_impl works", {
  igraph_local_seed(20250125)

  g <- make_ring(10)

  # Collect BFS visit data
  bfs_visits <- list()
  result <- bfs_closure_impl(
    graph = g,
    root = 1,
    mode = "out",
    unreachable = TRUE,
    restricted = NULL,
    callback = function(args) {
      bfs_visits[[length(bfs_visits) + 1]] <<- args
      FALSE # Continue
    }
  )

  expect_snapshot({
    cat("BFS result:\n")
    print(result)
    cat("\nNumber of BFS visits:", length(bfs_visits), "\n")
    if (length(bfs_visits) > 0) {
      cat("First visit:\n")
      print(bfs_visits[[1]])
    }
  })

  # Test error handling
  expect_snapshot_igraph_error({
    bfs_closure_impl(
      graph = g,
      root = 1,
      mode = "out",
      unreachable = TRUE,
      restricted = NULL,
      callback = function(args) {
        NA
      }
    )
  })

  expect_snapshot_igraph_error({
    bfs_closure_impl(
      graph = g,
      root = 1,
      mode = "out",
      unreachable = TRUE,
      restricted = NULL,
      callback = function(args) {
        NA
      }
    )
  })

  calls <- 0
  bfs_closure_impl(
    graph = g,
    root = 1,
    mode = "out",
    unreachable = TRUE,
    restricted = NULL,
    callback = function(args) {
      calls <<- calls + 1
      calls > 3 # Stop after 3 calls
    }
  )
  expect_equal(calls, 4) # Called 4 times: 3 continue (FALSE), 1 stop (TRUE)
})

# dfs_closure_impl

test_that("dfs_closure_impl works", {
  igraph_local_seed(20250125)

  g <- make_ring(10)

  # Collect DFS visit data
  dfs_in_visits <- list()
  dfs_out_visits <- list()
  result <- dfs_closure_impl(
    graph = g,
    root = 1,
    mode = "out",
    unreachable = TRUE,
    in_callback = function(args) {
      dfs_in_visits[[length(dfs_in_visits) + 1]] <<- args
      FALSE # Continue
    },
    out_callback = function(args) {
      dfs_out_visits[[length(dfs_out_visits) + 1]] <<- args
      FALSE # Continue
    }
  )

  expect_snapshot({
    cat("DFS result:\n")
    print(result)
    cat("\nNumber of DFS IN visits:", length(dfs_in_visits), "\n")
    cat("Number of DFS OUT visits:", length(dfs_out_visits), "\n")
    if (length(dfs_in_visits) > 0) {
      cat("First IN visit:\n")
      print(dfs_in_visits[[1]])
    }
  })

  # Structured tests
  expect_length(dfs_in_visits, 10)
  expect_length(dfs_out_visits, 10)
})
