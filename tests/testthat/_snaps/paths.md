# radius() works -- lifecycle

    Code
      radius(g, NULL, "out")
    Condition
      Warning:
      The `...` argument of `radius()` is deprecated as of igraph 2.1.0.
      i The arguments `weights` and `mode` must be named.
    Output
      [1] 0

# eccentricity() works -- lifecycle

    Code
      eccentricity(g, vids = V(g), NULL, "out")
    Condition
      Warning:
      The `...` argument of `eccentricity()` is deprecated as of igraph 2.1.0.
      i The arguments `weights` and `mode` must be named.
    Output
       [1] 3 2 1 1 1 0 0 0 0 0

