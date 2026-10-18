# head_of(es = ) and tail_of(es = ) are deprecated but still work

    Code
      res <- head_of(g, es = E(g))
    Condition
      Warning:
      The `es` argument of `head_of()` is deprecated as of igraph 3.0.0.
      i Please use the `edges` argument instead.

---

    Code
      head_of(g, edges = 1, es = 2)
    Condition
      Error in `head_of()`:
      ! Argument `edges` of `head_of()` was supplied more than once.
      i It was also supplied via its legacy name `es`.

