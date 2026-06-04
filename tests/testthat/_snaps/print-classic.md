# print.igraph.es() uses vertex names

    Code
      E(g)
    Output
      + 1/1 edge (vertex names):
      [1] A->B

# vs printing

    Code
      V(g)[[1]]
    Output
      + 1/3 vertex, named:
        name color weight
      1    A   red     10
    Code
      V(g)[[2]]
    Output
      + 1/3 vertex, named:
        name color weight
      2    B   red      9
    Code
      V(g)[1:2]
    Output
      + 2/3 vertices, named:
      [1] A B
    Code
      V(g)[2:3]
    Output
      + 2/3 vertices, named:
      [1] B C

# vs printing, complex attributes

    Code
      V(g)[[1]]
    Output
      + 1/3 vertex, named:
      $name
      [1] "A"
      
      $color
      [1] "red"
      
      $weight
      [1] 10
      
      $cplx
      $cplx[[1]]
      [1] 1 2 3 4
      
      
    Code
      V(g)[[2:3]]
    Output
      + 2/3 vertices, named:
      $name
      [1] "B" "C"
      
      $color
      [1] "red" "red"
      
      $weight
      [1] 9 3
      
      $cplx
      $cplx[[1]]
      [1] 1 2 3 4
      
      $cplx[[2]]
      [1] 1 2 3 4
      
      

# es printing

    Code
      E(g)[[1]]
    Output
      + 1/3 edge (vertex names):
        tail head tid hid color weight
      1    A    B   1   2   red     10
    Code
      E(g)[[2:3]]
    Output
      + 2/3 edges (vertex names):
        tail head tid hid color weight
      2    A    C   1   3   red      9
      3    B    C   2   3   red      3

# es printing, complex attributes

    Code
      E(g)[[1]]
    Output
      + 1/3 edge (vertex names):
      $color
      [1] "red"
      
      $weight
      [1] 10
      
      $cmpx
      $cmpx[[1]]
      [1] 1 2 3 4
      
      
    Code
      E(g)[[2:3]]
    Output
      + 2/3 edges (vertex names):
      $color
      [1] "red" "red"
      
      $weight
      [1] 9 3
      
      $cmpx
      $cmpx[[1]]
      [1] 1 2 3 4
      
      $cmpx[[2]]
      [1] 1 2 3 4
      
      

