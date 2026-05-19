# modularity_matrix no longer accepts a membership argument for compatibility

    Code
      x <- modularity_matrix(karate, membership = rep(1, vcount(karate)))
    Condition
      Error:
      ! The `membership` argument of `modularity_matrix()` is no longer used as of igraph 2.1.0.

