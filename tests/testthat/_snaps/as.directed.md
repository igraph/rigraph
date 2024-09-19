# as.directed() deprecation

    Code
      is_directed(as.directed(g, mode = "mutual"))
    Condition
      Warning:
      `as.directed()` was deprecated in igraph 2.0.4.
      i Please use `as_directed()` instead.
    Output
      [1] TRUE

# as.undirected() deprecation

    Code
      is_directed(as.undirected(g, mode = "collapse"))
    Condition
      Warning:
      `as.undirected()` was deprecated in igraph 2.0.4.
      i Please use `as_undirected()` instead.
    Output
      [1] FALSE

