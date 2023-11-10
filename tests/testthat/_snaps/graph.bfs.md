# snapshot test

    Code
      g <- graph_from_literal(a - +b - +c, z - +a, d)
      bfs(g, root = 2, mode = "out", unreachable = FALSE, order = TRUE, rank = TRUE,
        father = TRUE, pred = TRUE, succ = TRUE, dist = TRUE)
    Output
      $root
      [1] 2
      
      $mode
      [1] "out"
      
      $order
      + 5/5 vertices, named:
      [1] b    c    <NA> <NA> <NA>
      
      $rank
      a b c z d 
      0 1 2 0 0 
      
      $father
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
      -3  0  1 -3 -3 
      
      $neimode
      [1] "out"
      

