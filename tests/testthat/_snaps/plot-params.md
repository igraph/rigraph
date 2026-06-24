# i.check_aes_lengths rejects mismatched vertex lengths

    Code
      i.check_aes_lengths(vertex = list(color = c("red", "green")), edge = list(),
      vc = 5, ec = 4)
    Condition
      Error:
      ! Invalid length for vertex aesthetic color.
      x It has length 2, but must be length 1 or 5.
      i The graph has 5 vertices.

# i.check_aes_lengths rejects mismatched edge lengths

    Code
      i.check_aes_lengths(vertex = list(), edge = list(width = c(1, 2, 3)), vc = 5,
      ec = 5)
    Condition
      Error:
      ! Invalid length for edge aesthetic width.
      x It has length 3, but must be length 1 or 5.
      i The graph has 5 edges.

# igraph.check.shapes() aborts on unknown shapes

    Code
      igraph.check.shapes(c("circle", "not_a_shape"))
    Condition
      Error in `igraph.check.shapes()`:
      ! Bad vertex shapes: not_a_shape.

