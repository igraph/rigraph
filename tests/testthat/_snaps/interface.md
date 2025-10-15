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

# incident() works

    Code
      incident(g, 1)
    Output
      + 16/78 edges:
       [1] 1-- 2 1-- 3 1-- 4 1-- 5 1-- 6 1-- 7 1-- 8 1-- 9 1--11 1--12 1--13 1--14
      [13] 1--18 1--20 1--22 1--32

---

    Code
      incident(g, 34)
    Output
      + 17/78 edges:
       [1]  9--34 10--34 14--34 15--34 16--34 19--34 20--34 21--34 23--34 24--34
      [11] 27--34 28--34 29--34 30--34 31--34 32--34 33--34

