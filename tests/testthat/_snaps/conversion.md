# as.directed() deprecation

    Code
      is_directed(as.directed(g, mode = "mutual"))
    Condition
      Warning:
      `as.directed()` was deprecated in igraph 2.0.4.
      i Please use `as_directed()` instead.
    Output
      [1] TRUE

# as.undirected() deprecation

    Code
      is_directed(as.undirected(g, mode = "collapse"))
    Condition
      Warning:
      `as.undirected()` was deprecated in igraph 2.0.4.
      i Please use `as_undirected()` instead.
    Output
      [1] FALSE

# as_adjacency_matrix() errors well -- sparse

    Code
      as_adjacency_matrix(g, attr = "bla")
    Condition
      Error in `get.adjacency.sparse()`:
      ! no such edge attribute

---

    Code
      as_adjacency_matrix(g, attr = "bla")
    Condition
      Error in `get.adjacency.sparse()`:
      ! Matrices must be either numeric or logical, and the edge attribute is not

# as_adjacency_matrix() errors well -- dense

    Code
      as_adjacency_matrix(g, attr = "bla", sparse = FALSE)
    Condition
      Error in `get.adjacency.dense()`:
      ! no such edge attribute

---

    Code
      as_adjacency_matrix(g, attr = "bla", sparse = FALSE)
    Condition
      Error in `get.adjacency.dense()`:
      ! Matrices must be either numeric or logical, and the edge attribute is not

