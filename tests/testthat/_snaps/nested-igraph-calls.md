# a callback may signal a deprecation

    Code
      order <- bfs(g, root = 1, callback = function(...) {
        is.igraph(g)
        FALSE
      })$order
    Condition
      Warning:
      `is.igraph()` was deprecated in igraph 2.0.0.
      i Please use `is_igraph()` instead.
      Warning:
      `is.igraph()` was deprecated in igraph 2.0.0.
      i Please use `is_igraph()` instead.

