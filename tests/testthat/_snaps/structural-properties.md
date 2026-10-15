# dfs() deprecated arguments

    Code
      d <- dfs(g, root = 2, unreachable = FALSE, neimode = "out", father = TRUE)
    Condition
      Error:
      ! The `neimode` argument of `dfs()` was deprecated in igraph 1.3.0 and is now defunct.
      i Please use the `mode` argument instead.

# bfs() works

    Code
      g <- graph_from_literal(a - +b - +c, z - +a, d)
      bfs(g, root = 2, mode = "out", unreachable = FALSE, order = TRUE, rank = TRUE,
        parent = TRUE, pred = TRUE, succ = TRUE, dist = TRUE)
    Output
      $root
      [1] 2
      
      $mode
      [1] "out"
      
      $order
      + 2/5 vertices, named:
      [1] b c
      
      $rank
      a b c z d 
      0 1 2 0 0 
      
      $parent
      + 5/5 vertices, named:
         a    b    c    z    d 
      <NA> <NA>    b <NA> <NA> 
      
      $pred
      + 5/5 vertices, named:
         a    b    c    z    d 
      <NA> <NA>    b <NA> <NA> 
      
      $succ
      + 5/5 vertices, named:
         a    b    c    z    d 
      <NA>    c <NA> <NA> <NA> 
      
      $dist
       a  b  c  z  d 
      -1  0  1 -1 -1 
      
      $neimode
      [1] "out"
      
      $father
      + 5/5 vertices, named:
         a    b    c    z    d 
      <NA> <NA>    b <NA> <NA> 
      

# bfs() deprecated arguments

    Code
      b <- bfs(g, root = 2, neimode = "out", unreachable = FALSE, order = TRUE, rank = TRUE,
        father = TRUE, pred = TRUE, succ = TRUE, dist = TRUE)
    Condition
      Error:
      ! The `neimode` argument of `bfs()` was deprecated in igraph 1.3.0 and is now defunct.
      i Please use the `mode` argument instead.

# laplacian_matrix() works

    Code
      laplacian_matrix(Ai, normalization = "unnormalized")
    Output
      3 x 3 sparse Matrix of class "dgCMatrix"
                         
      [1,]  410 -210 -200
      [2,] -210  590 -380
      [3,] -200 -380  580

