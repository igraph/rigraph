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

