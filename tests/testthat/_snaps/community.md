# cluster_leiden() recovers the renamed resolution_parameter argument

    Code
      res <- cluster_leiden(g, "modularity", resolution_parameter = 1.5)
    Condition
      Warning:
      Calling `cluster_leiden()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: cluster_leiden(graph, objective_function, resolution_parameter)
      i Use instead: cluster_leiden(graph, objective_function, resolution = )

# modularity_matrix no longer accepts a membership argument for compatibility

    Code
      modularity_matrix(karate, membership = rep(1, vcount(karate)))
    Condition
      Error:
      ! The `membership` argument of `modularity_matrix()` is no longer used as of igraph 2.1.0.

# modularity_matrix() covers migrated tail args and positional recovery

    Code
      modularity_matrix(karate, rep(1, vcount(karate)), rep(1, ecount(karate)))
    Condition
      Warning:
      Calling `modularity_matrix()` with positional or abbreviated arguments was deprecated in igraph 3.0.0.
      i Detected call: modularity_matrix(graph, membership, weights)
      i Use instead: modularity_matrix(graph, membership, weights = )
      Error:
      ! The `membership` argument of `modularity_matrix()` is no longer used as of igraph 2.1.0.

