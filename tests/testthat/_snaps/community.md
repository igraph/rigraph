# modularity_matrix still accepts a membership argument for compatibility

    Code
      x <- modularity_matrix(karate, membership = rep(1, vcount(karate)))
    Condition
      Warning:
      The `membership` argument of `modularity_matrix()` is no longer used as of igraph 2.1.0.

