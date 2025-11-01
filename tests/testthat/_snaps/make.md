# error messages are proper

    Code
      make_()
    Condition
      Error in `.extract_constructor_and_modifiers()`:
      ! Don't know how to make_, nothing given
    Code
      make_(1:10)
    Condition
      Error in `.extract_constructor_and_modifiers()`:
      ! Don't know how to make_, nothing given
    Code
      graph_()
    Condition
      Error in `.extract_constructor_and_modifiers()`:
      ! Don't know how to graph_, nothing given
    Code
      graph_(1:10)
    Condition
      Error in `.extract_constructor_and_modifiers()`:
      ! Don't know how to graph_, nothing given
    Code
      graph_(directed_graph(), directed_graph())
    Condition
      Error in `.extract_constructor_and_modifiers()`:
      ! Don't know how to graph_, multiple constructors given
    Code
      sample_()
    Condition
      Error in `.extract_constructor_and_modifiers()`:
      ! Don't know how to sample_, nothing given
    Code
      sample_(1:10)
    Condition
      Error in `.extract_constructor_and_modifiers()`:
      ! Don't know how to sample_, nothing given
    Code
      sample_(directed_graph(), directed_graph())
    Condition
      Error in `.extract_constructor_and_modifiers()`:
      ! Don't know how to sample_, multiple constructors given

# graph_from_literal() and simple undirected graphs

    Code
      graph_from_literal(A - B)
    Output
      IGRAPH UN-- 2 1 -- 
      + attr: name (v/c)
      + edge (vertex names):
      [1] A--A
    Code
      graph_from_literal(A - B - C)
    Output
      IGRAPH UN-- 3 2 -- 
      + attr: name (v/c)
    Condition
      Warning in `matrix()`:
      data length [3] is not a sub-multiple or multiple of the number of rows [2]
    Output
      + edges (vertex names):
    Condition
      Warning in `matrix()`:
      data length [3] is not a sub-multiple or multiple of the number of rows [2]
    Output
      [1] A--A B--A
    Code
      graph_from_literal(A - B - C - A)
    Output
      IGRAPH UN-- 3 3 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] A--B A--B
      + ... omitted several edges

# graph_from_literal() and undirected explosion

    Code
      graph_from_literal(A:B:C - D:E, B:D - C:E)
    Output
      IGRAPH UN-- 5 8 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] C--D A--B A--C A--D B--C B--D C--D
      + ... omitted several edges
    Code
      graph_from_literal(A:B:C - D:E - F:G:H - I - J:K:L:M)
    Output
      IGRAPH UN-- 13 19 -- 
      + attr: name (v/c)
      + edges (vertex names):
       [1] C--D A--C A--D B--C B--D C--E C--F C--G D--E D--F D--G E--H F--H G--H H--I
      [16] H--J H--K H--L
      + ... omitted several edges

# graph_from_literal() and simple directed graphs

    Code
      graph_from_literal(A - +B)
    Output
      IGRAPH DN-- 2 1 -- 
      + attr: name (v/c)
      + edge (vertex names):
      [1] A->A
    Code
      graph_from_literal(A - +B - +C)
    Output
      IGRAPH DN-- 3 2 -- 
      + attr: name (v/c)
    Condition
      Warning in `matrix()`:
      data length [3] is not a sub-multiple or multiple of the number of rows [2]
    Output
      + edges (vertex names):
    Condition
      Warning in `matrix()`:
      data length [3] is not a sub-multiple or multiple of the number of rows [2]
    Output
      [1] A->A B->A
    Code
      graph_from_literal(A - +B - +C - +A)
    Output
      IGRAPH DN-- 3 3 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] A->A B->B
      + ... omitted several edges
    Code
      graph_from_literal(A - +B + -C - +A)
    Output
      IGRAPH DN-- 3 3 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] A->B B->A
      + ... omitted several edges

# graph_from_literal() and directed explosion

    Code
      graph_from_literal(A:B:C - +D:E, B:D + -C:E)
    Output
      IGRAPH DN-- 5 9 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] C->D A->C A->D B->A B->C B->D D->A D->C
      + ... omitted several edges
    Code
      graph_from_literal(A:B:C - +D:E + -F:G:H - +I + -J:K:L:M)
    Output
      IGRAPH DN-- 13 19 -- 
      + attr: name (v/c)
      + edges (vertex names):
       [1] C->D A->C A->D B->C B->D E->C E->D E->H F->C F->D F->H G->C G->D G->H I->H
      [16] J->H K->H L->H
      + ... omitted several edges

# graph_from_literal(simplify = FALSE)

    Code
      graph_from_literal(1 - 1, 1 - 2, 1 - 2)
    Output
      IGRAPH UN-- 2 1 -- 
      + attr: name (v/c)
      + edge (vertex names):
      [1] 1--1
    Code
      graph_from_literal(1 - 1, 1 - 2, 1 - 2, simplify = FALSE)
    Output
      IGRAPH UN-- 2 3 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] 1--1
      + ... omitted several edges

# make_empty_graph gives an error for invalid arguments

    Code
      make_empty_graph(NULL)
    Condition
      Error in `make_empty_graph()`:
      ! `n` must be numeric, not NULL.

---

    Code
      make_empty_graph("spam")
    Condition
      Error in `make_empty_graph()`:
      ! `n` must be numeric, not a string.

---

    Code
      make_empty_graph(10, "spam")
    Condition
      Error in `make_empty_graph()`:
      ! `directed` must be a logical, not a string.

