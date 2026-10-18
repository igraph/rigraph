# random_walk_impl basic

    Code
      random_walk_impl(graph = g, start = 1, steps = 2)
    Output
      $vertices
      + 3/3 vertices:
      [1] 1 2 3
      
      $edges
      + 2/2 edges:
      [1] 1--2 2--3
      

---

    Code
      random_walk_impl(graph = g, start = 1, steps = 2, mode = "in", stuck = "error")
    Output
      $vertices
      + 3/3 vertices:
      [1] 1 2 1
      
      $edges
      + 2/2 edges:
      [1] 1--2 1--2
      

# random_walk_impl errors

    Code
      random_walk_impl(graph = NULL, start = 1, steps = 2)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# bfs_simple_impl basic

    Code
      bfs_simple_impl(graph = g, root = 1)
    Output
      $order
      + 3/3 vertices:
      [1] 1 2 3
      
      $layers
      [1] 0 1 2 3
      
      $parents
      [1] -1  0  1
      

---

    Code
      bfs_simple_impl(graph = g, root = 1, mode = "in")
    Output
      $order
      + 3/3 vertices:
      [1] 1 2 3
      
      $layers
      [1] 0 1 2 3
      
      $parents
      [1] -1  0  1
      

# bfs_simple_impl errors

    Code
      bfs_simple_impl(graph = NULL, root = 1)
    Condition
      Error in `ensure_igraph()`:
      ! Must provide a graph object (provided `NULL`).

# bfs_closure_impl works

    Code
      cat("BFS result:\n")
    Output
      BFS result:
    Code
      print(result)
    Output
      $order
      + 10/10 vertices:
       [1]  1  2 10  3  9  4  8  5  7  6
      
      $rank
       [1] 0 1 3 5 7 9 8 6 4 2
      
      $parents
       [1] -1  0  1  2  3  4  7  8  9  0
      
      $pred
       [1] -1  0  9  8  7  6  4  3  2  1
      
      $succ
       [1]  1  9  8  7  6 -1  5  4  3  2
      
      $dist
       [1] 0 1 2 3 4 5 4 3 2 1
      
    Code
      cat("\nNumber of BFS visits:", length(bfs_visits), "\n")
    Output
      
      Number of BFS visits: 10 
    Code
      if (length(bfs_visits) > 0) {
        cat("First visit:\n")
        print(bfs_visits[[1]])
      }
    Output
      First visit:
       vid pred succ rank dist 
         1    0    2    1    0 

---

    Code
      bfs_closure_impl(graph = g, root = 1, mode = "out", unreachable = TRUE,
        restricted = NULL, callback = function(args) {
          NA
        })
    Condition
      Error in `bfs_closure_impl()`:
      ! Error in R callback function. Failed
      Source: <file>:<line>

---

    Code
      bfs_closure_impl(graph = g, root = 1, mode = "out", unreachable = TRUE,
        restricted = NULL, callback = function(args) {
          NA
        })
    Condition
      Error in `bfs_closure_impl()`:
      ! Error in R callback function. Failed
      Source: <file>:<line>

# dfs_closure_impl works

    Code
      cat("DFS result:\n")
    Output
      DFS result:
    Code
      print(result)
    Output
      $order
      + 10/10 vertices:
       [1]  1  2  3  4  5  6  7  8  9 10
      
      $order_out
      + 10/10 vertices:
       [1] 10  9  8  7  6  5  4  3  2  1
      
      $father
       [1] -1  0  1  2  3  4  5  6  7  8
      
      $dist
       [1] 0 1 2 3 4 5 6 7 8 9
      
    Code
      cat("\nNumber of DFS IN visits:", length(dfs_in_visits), "\n")
    Output
      
      Number of DFS IN visits: 10 
    Code
      cat("Number of DFS OUT visits:", length(dfs_out_visits), "\n")
    Output
      Number of DFS OUT visits: 10 
    Code
      if (length(dfs_in_visits) > 0) {
        cat("First IN visit:\n")
        print(dfs_in_visits[[1]])
      }
    Output
      First IN visit:
       vid dist 
         1    0 

