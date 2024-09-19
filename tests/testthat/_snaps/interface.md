# get.edge.ids() deprecation

    Code
      get.edge.ids(g, 1:2)
    Condition
      Warning:
      `get.edge.ids()` was deprecated in igraph 2.0.4.
      i Please use `get_edge_ids()` instead.
    Output
      [1] 0

---

    Code
      get.edge.ids(g, 1:2, multi = TRUE)
    Condition
      Error:
      ! The `multi` argument of `get.edge.ids()` was deprecated in igraph 2.0.0 and is now defunct.

