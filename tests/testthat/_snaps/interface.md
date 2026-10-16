# add_edges warning for legacy matrices

    Code
      . <- add_edges(g, matrix(c(1, 2, 3, 4), nrow = 2))
    Condition
      Warning:
      The `edges` argument of `add_edges()` should be an n times 2 matrix with one edge per row as of igraph 3.0.0.
      i A 2 times 2 matrix is ambiguous and is read column by column for now. Pass a data frame with two columns instead.
    Code
      . <- add_edges(g, matrix(c(1, 2, 1, 3, 1, 4), nrow = 2))
    Condition
      Warning:
      The `edges` argument of `add_edges()` should be an n times 2 matrix with one edge per row as of igraph 3.0.0.
      i It is read column by column for now. Transpose the matrix with t(), or pass a data frame with two columns.
    Code
      . <- add_edges(g, matrix(1:4, nrow = 1))
    Condition
      Warning:
      The `edges` argument of `add_edges()` should be an n times 2 matrix with one edge per row as of igraph 3.0.0.
      i It is read column by column for now. Pass an n times 2 matrix or a data frame with two columns.

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

