# printing connected vs/es works

    Code
      vs
    Output
      + 10/10 vertices:
       [1]  1  2  3  4  5  6  7  8  9 10
    Code
      es
    Output
      + 10/10 edges:
       [1] 1-- 2 2-- 3 3-- 4 4-- 5 5-- 6 6-- 7 7-- 8 8-- 9 9--10 1--10
    Code
      vs[1:5]
    Output
      + 5/10 vertices:
      [1] 1 2 3 4 5
    Code
      es[1:5]
    Output
      + 5/10 edges:
      [1] 1--2 2--3 3--4 4--5 5--6
    Code
      vs[numeric()]
    Output
      + 0/10 vertices:

---

    Code
      es[numeric()]
    Output
      + 0/10 edges:

# printing named connected vs/es works

    Code
      vs
    Output
      + 10/10 vertices, named:
       [1] a b c d e f g h i j
    Code
      es
    Output
      + 10/10 edges (vertex names):
       [1] a--b b--c c--d d--e e--f f--g g--h h--i i--j a--j
    Code
      vs[1:5]
    Output
      + 5/10 vertices, named:
      [1] a b c d e
    Code
      es[1:5]
    Output
      + 5/10 edges (vertex names):
      [1] a--b b--c c--d d--e e--f
    Code
      vs[numeric()]
    Output
      + 0/10 vertices, named:

---

    Code
      es[numeric()]
    Output
      + 0/10 edges (vertex names):

# printing unconnected vs/es works

    Code
      vs
    Output
      + 10/? vertices (deleted):
       [1]  1  2  3  4  5  6  7  8  9 10
    Code
      es
    Output
      + 10/? edges (deleted):
       [1]  1  2  3  4  5  6  7  8  9 10

---

    Code
      vs
    Output
      + 10/? vertices (deleted):
       [1]  1  2  3  4  5  6  7  8  9 10
    Code
      es
    Output
      + 10/? edges (deleted) (vertex names):
       [1] a|b b|c c|d d|e e|f f|g g|h h|i i|j a|j

# logical indices are not recycled

    Code
      V(g)[c(TRUE, FALSE)]
    Condition
      Error in `FUN()`:
      ! Error: Logical index length does not match the number of vertices. Recycling is not allowed.

---

    Code
      E(g)[c(TRUE, FALSE)]
    Condition
      Error in `FUN()`:
      ! Logical index length does not match the number of edges. Recycling is not allowed.

# assigning `NULL` to a subset of vertices/edges errors instead of silently doing nothing

    Code
      V(g)[1:3]$color <- NULL
    Condition
      Error in `[<-`:
      ! Can't find "value" for attribute "color".
      i Removing an attribute is only supported for the whole vertex sequence, e.g. `V(g)$color <- NULL`, not a subset. Use `delete_vertex_attr()`.

---

    Code
      E(g)[1:3]$weight <- NULL
    Condition
      Error in `[<-`:
      ! Can't find "value" for attribute "weight".
      i Removing an attribute is only supported for the whole edge sequence, e.g. `E(g)$weight <- NULL`, not a subset. Use `delete_edge_attr()`.

# assigning `NULL` for a non-existent attribute errors like `delete_vertex_attr()`/`delete_edge_attr()`

    Code
      V(g)$color <- NULL
    Condition
      Error in `delete_vertex_attr()`:
      ! No vertex attribute `color` found.

---

    Code
      E(g)$weight <- NULL
    Condition
      Error in `delete_edge_attr()`:
      ! No edge attribute `weight` found.

# direct misuse of `V<-`/`E<-`/`[<-`/`[[<-` errors well

    Code
      V(g) <- "blue"
    Condition
      Error in `V<-`:
      ! Can't find "name" for vertex attribute.

---

    Code
      E(g) <- "blue"
    Condition
      Error in `E<-`:
      ! Can't find "name" for edge attribute.

---

    Code
      V(g)[1] <- "blue"
    Condition
      Error in `[<-`:
      ! Can't find "name" for attribute.

---

    Code
      E(g)[1] <- "blue"
    Condition
      Error in `[<-`:
      ! Can't find "name" for attribute.

---

    Code
      V(g)[[1]] <- "blue"
    Condition
      Error in `[[<-`:
      ! Can't find "name" for attribute.

---

    Code
      E(g)[[1]] <- "blue"
    Condition
      Error in `[[<-`:
      ! Can't find "name" for attribute.

# querying or setting attributes errors when the graph is unknown

    Code
      vs$color
    Condition
      Error in `vs$color`:
      ! Can't find graph.

---

    Code
      vs$color <- "blue"
    Condition
      Error in `$<-`:
      ! Can't find graph.

---

    Code
      es$weight
    Condition
      Error in `es$weight`:
      ! Can't find graph.

---

    Code
      es$weight <- 0
    Condition
      Error in `$<-`:
      ! Can't find graph.

# `[<-.igraph.vs` reports an internal error when the graph is unknown

    Code
      `[<-.igraph.vs`(vs, 1, value = payload)
    Condition
      Error in `[<-.igraph.vs`:
      ! Graph is unknown.
      i This is an internal error that was detected in the igraph package.
        Please report it at <https://github.com/igraph/rigraph/issues> with a reprex (<https://tidyverse.org/help/>) and the full backtrace.

