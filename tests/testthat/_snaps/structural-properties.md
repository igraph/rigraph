# dfs() deprecated arguments

    Code
      d <- dfs(g, root = 2, unreachable = FALSE, neimode = "out", father = TRUE)
    Condition
      Error in `dfs()`:
      ! `...` must be empty.
      x Problematic arguments:
      * neimode = "out"
      * father = TRUE

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
      

# bfs() deprecated arguments

    Code
      b <- bfs(g, root = 2, neimode = "out", unreachable = FALSE, order = TRUE, rank = TRUE,
        father = TRUE, pred = TRUE, succ = TRUE, dist = TRUE)
    Condition
      Error in `bfs()`:
      ! `...` must be empty.
      x Problematic arguments:
      * neimode = "out"
      * father = TRUE

# laplacian_matrix() works

    Code
      laplacian_matrix(Ai, normalization = "unnormalized")
    Output
      3 x 3 sparse Matrix of class "dgCMatrix"
                         
      [1,]  410 -210 -200
      [2,] -210  590 -380
      [3,] -200 -380  580

# degree(v = ) is deprecated but still works

    Code
      res_legacy <- degree(g, v = 1:3)
    Condition
      Warning:
      The `v` argument of `degree()` is deprecated as of igraph 3.0.0.
      i Please use the `vertices` argument instead.

# degree() rejects `vertices` supplied both directly and as `v`

    Code
      degree(g, vertices = 1:3, v = 1:3)
    Condition
      Error in `degree()`:
      ! Argument `vertices` of `degree()` was supplied more than once.
      i It was also supplied via its legacy name `v`.

