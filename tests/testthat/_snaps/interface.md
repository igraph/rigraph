# get.edge.ids() deprecation

    Code
      get.edge.ids(g, 1:2)
    Condition
      Warning:
      `get.edge.ids()` was deprecated in igraph 2.1.0.
      i Please use `get_edge_ids()` instead.
    Output
      [1] 0

---

    Code
      get.edge.ids(g, 1:2, multi = TRUE)
    Condition
      Error:
      ! The `multi` argument of `get.edge.ids()` was deprecated in igraph 2.0.0 and is now defunct.

# get_edge_id() errors correctly for wrong vp

    Code
      get_edge_ids(g, el_g)
    Condition
      Error:
      ! Only two-column data.frames and matrices, and vectors are allowed for vp

---

    Code
      get_edge_ids(g, df)
    Condition
      Error in `el_to_vec()`:
      ! The columns of the data.frame are of different type (character and double)

# neighbors(v = ) and incident(v = ) are deprecated but still work

    Code
      res_legacy <- neighbors(g, v = 1)
    Condition
      Warning:
      The `v` argument of `neighbors()` is deprecated as of igraph 3.0.0.
      i Please use the `vertex` argument instead.

---

    Code
      neighbors(g, vertex = 1, v = 2)
    Condition
      Error in `neighbors()`:
      ! Argument `vertex` of `neighbors()` was supplied more than once.
      i It was also supplied via its legacy name `v`.

