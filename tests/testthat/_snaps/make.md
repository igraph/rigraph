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
      [1] A--B B--C A--C

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
      [1] A->B C->B C->A

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
       [1] A->D A->E B->D B->E C->D C->E F->D G->D H->D F->E G->E H->E F->I G->I H->I
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
      make_empty_graph(10, directed = "spam")
    Condition
      Error in `make_empty_graph()`:
      ! `directed` must be a logical, not a string.

# make_generalized_petersen prints as expected

    Code
      make_generalized_petersen(5, 2)
    Output
      IGRAPH U--- 10 15 -- Generalized Petersen graph
      + attr: name (g/c), n (g/n), k (g/n)
      + edges:
       [1] 1-- 2 1-- 6 6-- 8 2-- 3 2-- 7 7-- 9 3-- 4 3-- 8 8--10 4-- 5 4-- 9 6-- 9
      [13] 1-- 5 5--10 7--10

# make_generalized_petersen rejects invalid arguments

    Code
      make_generalized_petersen(2, 1)
    Condition
      Error in `generalized_petersen_impl()`:
      ! n = 2 must be at least 3. Invalid value
      Source: <file>:<line>

---

    Code
      make_generalized_petersen(5, 3)
    Condition
      Error in `generalized_petersen_impl()`:
      ! k = 3 must be positive and less than n/2 with n = 5. Invalid value
      Source: <file>:<line>

---

    Code
      make_generalized_petersen(5, 2, directed = TRUE)
    Condition
      Error in `make_generalized_petersen()`:
      ! `...` must be empty.
      x Problematic argument:
      * directed = TRUE

# make_regular_tree prints as expected

    Code
      make_regular_tree(2)
    Output
      IGRAPH U--- 10 9 -- Regular tree
      + attr: name (g/c), h (g/n), k (g/n)
      + edges:
      [1] 1-- 2 1-- 3 1-- 4 2-- 5 2-- 6 3-- 7 3-- 8 4-- 9 4--10

# make_regular_tree rejects invalid arguments

    Code
      make_regular_tree(-1)
    Condition
      Error in `regular_tree_impl()`:
      ! Height of regular tree must be positive, got -1. Invalid value
      Source: <file>:<line>

---

    Code
      make_regular_tree(2, k = 1)
    Condition
      Error in `regular_tree_impl()`:
      ! Degree of regular tree must be at least 2, got 1. Invalid value
      Source: <file>:<line>

---

    Code
      make_regular_tree(2, 3, "out")
    Condition
      Error in `make_regular_tree()`:
      ! `...` must be empty.
      x Problematic argument:
      * ..1 = "out"
      i Did you forget to name an argument?

# make_symmetric_tree prints as expected

    Code
      make_symmetric_tree(c(3, 2))
    Output
      IGRAPH D--- 10 9 -- Symmetric tree
      + attr: name (g/c), branches (g/n)
      + edges:
      [1] 1-> 2 1-> 3 1-> 4 2-> 5 2-> 6 3-> 7 3-> 8 4-> 9 4->10

# make_symmetric_tree rejects invalid arguments

    Code
      make_symmetric_tree(c(2, -2))
    Condition
      Error in `symmetric_tree_impl()`:
      ! The number of branches must be positive at each level. Invalid value
      Source: <file>:<line>

---

    Code
      make_symmetric_tree(c(2, 2), "out")
    Condition
      Error in `make_symmetric_tree()`:
      ! `...` must be empty.
      x Problematic argument:
      * ..1 = "out"
      i Did you forget to name an argument?

