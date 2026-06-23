# igraph.check.shapes() aborts on unknown shapes

    Code
      igraph.check.shapes(c("circle", "not_a_shape"))
    Condition
      Error in `igraph.check.shapes()`:
      ! Bad vertex shapes: not_a_shape.

