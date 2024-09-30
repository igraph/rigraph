# graph_from_biadjacency_matrix() works -- dense

    Code
      (g <- graph_from_biadjacency_matrix(inc))
    Output
      IGRAPH UN-B 8 7 -- 
      + attr: type (v/l), name (v/c)
      + edges (vertex names):
      [1] A--c A--d B--b B--c B--e C--b C--d

---

    Code
      (weighted_g <- graph_from_biadjacency_matrix(inc, weighted = TRUE))
    Output
      IGRAPH UNWB 8 7 -- 
      + attr: type (v/l), name (v/c), weight (e/n)
      + edges (vertex names):
      [1] A--c A--d B--b B--c B--e C--b C--d

# graph_from_biadjacency_matrix() works -- sparse

    Code
      (g <- graph_from_biadjacency_matrix(inc))
    Output
      IGRAPH UN-B 8 7 -- 
      + attr: type (v/l), name (v/c)
      + edges (vertex names):
      [1] B--b C--b A--c B--c A--d C--d B--e

---

    Code
      (weighted_g <- graph_from_biadjacency_matrix(inc, weighted = TRUE))
    Output
      IGRAPH UNWB 8 7 -- 
      + attr: type (v/l), name (v/c), weight (e/n)
      + edges (vertex names):
      [1] B--b C--b A--c B--c A--d C--d B--e

# graph_from_biadjacency_matrix() works -- sparse + multiple

    Code
      (g <- graph_from_biadjacency_matrix(inc, multiple = TRUE))
    Output
      IGRAPH UN-B 8 10 -- 
      + attr: type (v/l), name (v/c)
      + edges (vertex names):
       [1] B--b C--b A--c C--c C--c A--d A--d A--e B--e C--e

# graph_from_biadjacency_matrix() errors well

    Code
      (g <- graph_from_biadjacency_matrix(inc, weight = FALSE))
    Condition
      Error in `graph_from_biadjacency_matrix()`:
      ! `weighted` can't be `FALSE`.
      i See `?graph_from_biadjacency_matrix()`'s manual page.

---

    Code
      (g <- graph_from_biadjacency_matrix(inc, weight = 42))
    Condition
      Error in `graph_from_biadjacency_matrix()`:
      ! `weighted` can't be a number.
      i See `?graph_from_biadjacency_matrix()`'s manual page.

