# radius() works -- lifecycle

    Code
      radius(g, "out")
    Condition
      Warning:
      The `...` argument of `radius()` is deprecated as of igraph 2.1.0.
      i The argument `mode` must be named.
    Output
      [1] 0

# eccentricity() works -- lifecycle

    Code
      eccentricity(g, vids = V(g), "out")
    Condition
      Warning:
      The `...` argument of `eccentricity()` is deprecated as of igraph 2.1.0.
      i The argument `mode` must be named.
    Output
       [1] 3 2 1 1 1 0 0 0 0 0

# widest path functions require edge weights

    Code
      widest_path_widths(g)
    Condition
      Error in `widest_path_widths()`:
      ! Widest path functions require edge weights.
      i Supply `weights` or set a weight edge attribute.

---

    Code
      widest_paths(g, from = 1)
    Condition
      Error in `widest_paths()`:
      ! Widest path functions require edge weights.
      i Supply `weights` or set a weight edge attribute.

---

    Code
      widest_path_widths(g, weights = NA)
    Condition
      Error in `widest_path_widths()`:
      ! Widest path functions require edge weights, so `weights = NA` is not supported.

---

    Code
      widest_paths(g, from = 1, weights = NA)
    Condition
      Error in `widest_paths()`:
      ! Widest path functions require edge weights, so `weights = NA` is not supported.

# widest path functions reject positional arguments after the ellipsis

    Code
      widest_path_widths(g, 1, 3, "all")
    Condition
      Error in `widest_path_widths()`:
      ! `...` must be empty.
      x Problematic argument:
      * ..1 = "all"
      i Did you forget to name an argument?

---

    Code
      widest_paths(g, 1, 3, "out")
    Condition
      Error in `widest_paths()`:
      ! `...` must be empty.
      x Problematic argument:
      * ..1 = "out"
      i Did you forget to name an argument?

# widest_paths() predecessors and inbound edges print

    Code
      print(result$predecessors)
    Output
      -- <vertex sequence> 5/5 -------------------------------------------------------
      [1] NA  3  4  5  1
    Code
      print(result$inbound_edges)
    Output
      -- <edge sequence> 5/5 ---------------------------------------------------------
      [1] NA  2  3  4  5

