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
      IGRAPH c7b5eec UN-- 5 8 -- 
      + attr: name (v/c)
      + edges from c7b5eec (vertex names):
      [1] A--D A--E B--C B--D B--E C--D C--E D--E
    Code
      graph_from_literal(A:B:C - D:E - F:G:H - I - J:K:L:M)
    Output
      IGRAPH a850fdc UN-- 13 19 -- 
      + attr: name (v/c)
      + edges from a850fdc (vertex names):
       [1] A--D A--E B--D B--E C--D C--E D--F D--G D--H E--F E--G E--H F--I G--I H--I
      [16] I--J I--K I--L I--M

# graph_from_literal() and simple directed graphs

    Code
      graph_from_literal(A - +B)
    Output
      IGRAPH d2b891b DN-- 2 1 -- 
      + attr: name (v/c)
      + edge from d2b891b (vertex names):
      [1] A->B
    Code
      graph_from_literal(A - +B - +C)
    Output
      IGRAPH f2169c8 DN-- 3 2 -- 
      + attr: name (v/c)
      + edges from f2169c8 (vertex names):
      [1] A->B B->C
    Code
      graph_from_literal(A - +B - +C - +A)
    Output
      IGRAPH 2037dfb DN-- 3 3 -- 
      + attr: name (v/c)
      + edges from 2037dfb (vertex names):
      [1] A->B B->C C->A
    Code
      graph_from_literal(A - +B + -C - +A)
    Output
      IGRAPH 9726188 DN-- 3 3 -- 
      + attr: name (v/c)
      + edges from 9726188 (vertex names):
      [1] A->B C->A C->B

# graph_from_literal() and directed explosion

    Code
      graph_from_literal(A:B:C - +D:E, B:D + -C:E)
    Output
      IGRAPH 040ffac DN-- 5 9 -- 
      + attr: name (v/c)
      + edges from 040ffac (vertex names):
      [1] A->D A->E B->D B->E C->B C->D C->E E->B E->D
    Code
      graph_from_literal(A:B:C - +D:E + -F:G:H - +I + -J:K:L:M)
    Output
      IGRAPH 6cf3e84 DN-- 13 19 -- 
      + attr: name (v/c)
      + edges from 6cf3e84 (vertex names):
       [1] A->D A->E B->D B->E C->D C->E F->D F->E F->I G->D G->E G->I H->D H->E H->I
      [16] J->I K->I L->I M->I

# graph_from_literal(simplify = FALSE)

    Code
      graph_from_literal(1 - 1, 1 - 2, 1 - 2)
    Output
      IGRAPH 63b8ad0 UN-- 2 1 -- 
      + attr: name (v/c)
      + edge from 63b8ad0 (vertex names):
      [1] 1--2
    Code
      graph_from_literal(1 - 1, 1 - 2, 1 - 2, simplify = FALSE)
    Output
      IGRAPH 474c8a9 UN-- 2 3 -- 
      + attr: name (v/c)
      + edges from 474c8a9 (vertex names):
      [1] 1--1 1--2 1--2

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

