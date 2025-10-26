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
      IGRAPH a861750 UN-- 5 8 -- 
      + attr: name (v/c)
      + edges from a861750 (vertex names):
      [1] A--D A--E B--C B--D B--E C--D C--E D--E
    Code
      graph_from_literal(A:B:C - D:E - F:G:H - I - J:K:L:M)
    Output
      IGRAPH 86a90e9 UN-- 13 19 -- 
      + attr: name (v/c)
      + edges from 86a90e9 (vertex names):
       [1] A--D A--E B--D B--E C--D C--E D--F D--G D--H E--F E--G E--H F--I G--I H--I
      [16] I--J I--K I--L I--M

# graph_from_literal() and simple directed graphs

    Code
      graph_from_literal(A - +B)
    Output
      IGRAPH 6410bb1 DN-- 2 1 -- 
      + attr: name (v/c)
      + edge from 6410bb1 (vertex names):
      [1] A->B
    Code
      graph_from_literal(A - +B - +C)
    Output
      IGRAPH e7ef194 DN-- 3 2 -- 
      + attr: name (v/c)
      + edges from e7ef194 (vertex names):
      [1] A->B B->C
    Code
      graph_from_literal(A - +B - +C - +A)
    Output
      IGRAPH c7e1d98 DN-- 3 3 -- 
      + attr: name (v/c)
      + edges from c7e1d98 (vertex names):
      [1] A->B B->C C->A
    Code
      graph_from_literal(A - +B + -C - +A)
    Output
      IGRAPH 7b46e32 DN-- 3 3 -- 
      + attr: name (v/c)
      + edges from 7b46e32 (vertex names):
      [1] A->B C->A C->B

# graph_from_literal() and directed explosion

    Code
      graph_from_literal(A:B:C - +D:E, B:D + -C:E)
    Output
      IGRAPH d59a1fb DN-- 5 9 -- 
      + attr: name (v/c)
      + edges from d59a1fb (vertex names):
      [1] A->D A->E B->D B->E C->B C->D C->E E->B E->D
    Code
      graph_from_literal(A:B:C - +D:E + -F:G:H - +I + -J:K:L:M)
    Output
      IGRAPH 15d63a5 DN-- 13 19 -- 
      + attr: name (v/c)
      + edges from 15d63a5 (vertex names):
       [1] A->D A->E B->D B->E C->D C->E F->D F->E F->I G->D G->E G->I H->D H->E H->I
      [16] J->I K->I L->I M->I

# graph_from_literal(simplify = FALSE)

    Code
      graph_from_literal(1 - 1, 1 - 2, 1 - 2)
    Output
      IGRAPH 20ff2d5 UN-- 2 1 -- 
      + attr: name (v/c)
      + edge from 20ff2d5 (vertex names):
      [1] 1--2
    Code
      graph_from_literal(1 - 1, 1 - 2, 1 - 2, simplify = FALSE)
    Output
      IGRAPH bb10007 UN-- 2 3 -- 
      + attr: name (v/c)
      + edges from bb10007 (vertex names):
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

