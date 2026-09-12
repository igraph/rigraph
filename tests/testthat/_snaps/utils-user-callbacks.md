# lifecycle names the user rather than igraph

    Code
      as_user(igraph_function(FALSE), deprecated_igraph_function("soft_plain()"))
      as_user(igraph_function(FALSE), deprecated_igraph_function("warn_plain()",
        "deprecate_warn"))
    Condition
      Warning:
      `warn_plain()` was deprecated in igraph 2.0.0.
      i The deprecated feature was likely used in the igraph package.
        Please report the issue at <https://github.com/igraph/rigraph/issues>.
    Code
      as_user(igraph_function(TRUE), deprecated_igraph_function("soft_wrapped()"))
    Condition
      Warning:
      `soft_wrapped()` was deprecated in igraph 2.0.0.
    Code
      as_user(igraph_function(TRUE), deprecated_igraph_function("warn_wrapped()",
        "deprecate_warn"))
    Condition
      Warning:
      `warn_wrapped()` was deprecated in igraph 2.0.0.

# plot() reports a deprecated layout function

    Code
      cat(warnings, sep = "\n")
    Output
      `layout.circle()` was deprecated in igraph 2.1.0.
      i Please use `layout_in_circle()` instead.

# plot() reports a deprecated layout graph attribute

    Code
      cat(warnings, sep = "\n")
    Output
      `layout.random()` was deprecated in igraph 2.1.0.
      i Please use `layout_randomly()` instead.

# layout_nicely() reports a deprecated layout graph attribute

    Code
      coords <- as_user(layout_nicely, g)
    Condition
      Warning:
      `layout.circle()` was deprecated in igraph 2.1.0.
      i Please use `layout_in_circle()` instead.

# layout_components() reports a deprecated layout function

    Code
      coords <- as_user(layout_components, g, layout.circle)
    Condition
      Warning:
      `layout.circle()` was deprecated in igraph 2.1.0.
      i Please use `layout_in_circle()` instead.
      Warning:
      `layout.circle()` was deprecated in igraph 2.1.0.
      i Please use `layout_in_circle()` instead.

# add_shape() reports a deprecated shape function when it is used

    Code
      cat(warnings, sep = "\n")
    Output
      `igraph.shape.noplot()` was deprecated in igraph 2.0.0.
      i Please use `shape_noplot()` instead.

# local_scan() reports a deprecated FUN

    Code
      scan <- as_user(local_scan, g, FUN = graph.density)
    Condition
      Warning:
      `graph.density()` was deprecated in igraph 2.0.0.
      i Please use `edge_density()` instead.
      Warning:
      `graph.density()` was deprecated in igraph 2.0.0.
      i Please use `edge_density()` instead.

# attribute combinations report a deprecated function

    Code
      simple <- as_user(simplify, g, edge.attr.comb = list(weight = is.igraph))
    Condition
      Warning:
      `is.igraph()` was deprecated in igraph 2.0.0.
      i Please use `is_igraph()` instead.

# callbacks report a deprecated function

    Code
      as_user(cliques, g, min = 3, callback = is.igraph)
    Condition
      Warning:
      `is.igraph()` was deprecated in igraph 2.0.0.
      i Please use `is_igraph()` instead.

