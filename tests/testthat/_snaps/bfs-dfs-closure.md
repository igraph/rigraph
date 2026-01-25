# bfs_closure_impl works

    Code
      cat("BFS result:\n")
    Output
      BFS result:
    Code
      print(result)
    Output
      $order
      + 0/10 vertices:
      
      $rank
       [1] -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
      
      $parents
       [1] -2 -2 -2 -2 -2 -2 -2 -2 -2 -2
      
      $pred
       [1] -2 -2 -2 -2 -2 -2 -2 -2 -2 -2
      
      $succ
       [1] -2 -2 -2 -2 -2 -2 -2 -2 -2 -2
      
      $dist
       [1] -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
      
    Code
      cat("\nNumber of BFS visits:", length(bfs_visits), "\n")
    Output
      
      Number of BFS visits: 0 
    Code
      if (length(bfs_visits) > 0) {
        cat("First visit:\n")
        print(bfs_visits[[1]])
      }

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

