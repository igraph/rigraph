# graph_from_literal() and simple undirected graphs

    Code
      graph_from_literal(A - B)
    Output
      IGRAPH UN-- 2 1 -- 
      + attr: name (v/c)
      + edge (vertex names):
      [1] A--B
    Code
      graph_from_literal(A - B - C)
    Output
      IGRAPH UN-- 3 2 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] A--B B--C
    Code
      graph_from_literal(A - B - C - A)
    Output
      IGRAPH UN-- 3 3 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] A--B A--C B--C

# graph_from_literal() and undirected explosion

    Code
      graph_from_literal(A:B:C - D:E, B:D - C:E)
    Output
      IGRAPH UN-- 5 8 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] A--D A--E B--C B--D B--E C--D C--E D--E
    Code
      graph_from_literal(A:B:C - D:E - F:G:H - I - J:K:L:M)
    Output
      IGRAPH UN-- 13 19 -- 
      + attr: name (v/c)
      + edges (vertex names):
       [1] A--D A--E B--D B--E C--D C--E D--F D--G D--H E--F E--G E--H F--I G--I H--I
      [16] I--J I--K I--L I--M

# graph_from_literal() and simple directed graphs

    Code
      graph_from_literal(A - +B)
    Output
      IGRAPH DN-- 2 1 -- 
      + attr: name (v/c)
      + edge (vertex names):
      [1] A->B
    Code
      graph_from_literal(A - +B - +C)
    Output
      IGRAPH DN-- 3 2 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] A->B B->C
    Code
      graph_from_literal(A - +B - +C - +A)
    Output
      IGRAPH DN-- 3 3 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] A->B B->C C->A
    Code
      graph_from_literal(A - +B + -C - +A)
    Output
      IGRAPH DN-- 3 3 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] A->B C->A C->B

# graph_from_literal() and directed explosion

    Code
      graph_from_literal(A:B:C - +D:E, B:D + -C:E)
    Output
      IGRAPH DN-- 5 9 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] A->D A->E B->D B->E C->B C->D C->E E->B E->D
    Code
      graph_from_literal(A:B:C - +D:E + -F:G:H - +I + -J:K:L:M)
    Output
      IGRAPH DN-- 13 19 -- 
      + attr: name (v/c)
      + edges (vertex names):
       [1] A->D A->E B->D B->E C->D C->E F->D F->E F->I G->D G->E G->I H->D H->E H->I
      [16] J->I K->I L->I M->I

# graph_from_literal(simplify = FALSE)

    Code
      graph_from_literal(1 - 1, 1 - 2, 1 - 2)
    Output
      IGRAPH UN-- 2 1 -- 
      + attr: name (v/c)
      + edge (vertex names):
      [1] 1--2
    Code
      graph_from_literal(1 - 1, 1 - 2, 1 - 2, simplify = FALSE)
    Output
      IGRAPH UN-- 2 3 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] 1--1 1--2 1--2

