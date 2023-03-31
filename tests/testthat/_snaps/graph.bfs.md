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
        a   b   c 
      NaN   1   2 
      
      $father
      + 3/3 vertices, named:
      [1] a b c
      
      $pred
      + 3/3 vertices, named:
      [1] a b c
      
      $succ
      + 3/3 vertices, named:
      [1] a b c
      
      $dist
        a   b   c 
      NaN   0   1 
      
      $neimode
      [1] "out"
      

