# dfs() deprecated arguments

    Code
      d <- dfs(g, root = 2, unreachable = FALSE, neimode = "out", father = TRUE)
    Condition
      Warning:
      The `neimode` argument of `dfs()` is deprecated as of igraph 1.3.0.
      i Please use the `mode` argument instead.
      Warning:
      The `father` argument of `dfs()` is deprecated as of igraph 2.1.2.
      i Please use the `parent` argument instead.

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
      Warning:
      The `neimode` argument of `bfs()` is deprecated as of igraph 1.3.0.
      i Please use the `mode` argument instead.
      Warning:
      The `father` argument of `bfs()` is deprecated as of igraph 2.1.2.
      i Please use the `parent` argument instead.

