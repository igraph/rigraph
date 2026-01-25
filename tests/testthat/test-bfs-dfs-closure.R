test_that("bfs_closure_impl works", {
  withr::local_seed(20250125)
  local_igraph_options(print.id = FALSE)
  
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
      FALSE  # Continue
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
})

test_that("dfs_closure_impl works", {
  withr::local_seed(20250125)
  local_igraph_options(print.id = FALSE)
  
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
      FALSE  # Continue
    },
    out_callback = function(args) {
      dfs_out_visits[[length(dfs_out_visits) + 1]] <<- args
      FALSE  # Continue
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
  expect_equal(length(dfs_in_visits), 10)
  expect_equal(length(dfs_out_visits), 10)
})
