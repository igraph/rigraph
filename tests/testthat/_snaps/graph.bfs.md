# snapshot test

    Code
      g <- graph_from_literal(a - +b - +c)
      bfs(g, root = 2, mode = "out", unreachable = FALSE, order = TRUE, rank = TRUE,
        father = TRUE, pred = TRUE, succ = TRUE, dist = TRUE)
    Output
      $root
      [1] 2
      
      $mode
      [1] "out"
      
      $order
      + 3/3 vertices, named:
      [1] b    c    <NA>
      
      $rank
      a b c 
      0 1 2 
      
      $father
      + 3/3 vertices, named:
         a    b    c 
      <NA> <NA>    b 
      
      $pred
      + 3/3 vertices, named:
         a    b    c 
      <NA> <NA>    b 
      
      $succ
      + 3/3 vertices, named:
         a    b    c 
      <NA>    c <NA> 
      
      $dist
       a  b  c 
      -1  0  1 
      
      $neimode
      [1] "out"
      

