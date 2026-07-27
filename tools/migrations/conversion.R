# Argument-signature migrations: conversion
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  # `attr` (a character edge-attribute name) is retired in favour of the more
  # capable `weights` argument. The old `attr` slot is renamed to `weights`
  # (the bare-symbol default below) and recovered positionally; named `attr =`
  # calls keep working via the surviving `attr = deprecated()` formal, handled
  # by resolve_edge_weights() in R/conversion.R.
  as_adjacency_matrix = list(
    old = function(graph, type, attr = weights, edges, names, sparse) {},
    new = function(
      graph,
      type = c("both", "upper", "lower"),
      ...,
      weights = NULL,
      names = TRUE,
      sparse = igraph_opt("sparsematrices"),
      edges = deprecated(),
      attr = deprecated()
    ) {},
    when = "3.0.0"
  ),

  as_biadjacency_matrix = list(
    old = function(graph, types, attr = weights, names, sparse) {},
    new = function(
      graph,
      types = NULL,
      ...,
      weights = NULL,
      names = TRUE,
      sparse = FALSE,
      attr = deprecated()
    ) {},
    when = "3.0.0"
  ),

  from_adjacency = list(
    old = function(
      adjmatrix,
      mode,
      weighted,
      diag,
      add.colnames,
      add.rownames
    ) {},
    new = function(
      adjmatrix,
      ...,
      mode = c("directed", "undirected", "max", "min", "upper", "lower", "plus"),
      weighted = NULL,
      diag = TRUE,
      add.colnames = NULL,
      add.rownames = NA
    ) {},
    when = "3.0.0"
  ),

  graph_from_adjacency_matrix = list(
    old = function(
      adjmatrix,
      mode,
      weighted,
      diag,
      add.colnames,
      add.rownames
    ) {},
    new = function(
      adjmatrix,
      ...,
      mode = c(
        "directed",
        "undirected",
        "max",
        "min",
        "upper",
        "lower",
        "plus"
      ),
      weighted = NULL,
      diag = TRUE,
      add.colnames = NULL,
      add.rownames = NA
    ) {},
    when = "3.0.0"
  ),

  as_adj_edge_list = list(
    old = function(graph, mode, loops) {},
    new = function(
      graph,
      ...,
      mode = c("all", "out", "in", "total"),
      loops = c("twice", "once", "ignore")
    ) {},
    when = "3.0.0"
  ),

  as_adj_list = list(
    old = function(graph, mode, loops, multiple) {},
    new = function(
      graph,
      ...,
      mode = c("all", "out", "in", "total"),
      loops = c("twice", "once", "ignore"),
      multiple = TRUE
    ) {},
    when = "3.0.0"
  ),

  as_directed = list(
    old = function(graph, mode) {},
    new = function(
      graph,
      ...,
      mode = c("mutual", "arbitrary", "random", "acyclic")
    ) {},
    when = "3.0.0"
  ),

  as_edgelist = list(
    old = function(graph, names) {},
    new = function(
      graph,
      ...,
      names = TRUE,
      as.vector = FALSE
    ) {},
    when = "3.0.0"
  ),

  graph_from_adj_list = list(
    old = function(adjlist, mode, duplicate) {},
    new = function(
      adjlist,
      ...,
      mode = c("out", "in", "all", "total"),
      duplicate = TRUE
    ) {},
    when = "3.0.0"
  ),

  graph_from_data_frame = list(
    old = function(d, directed, vertices) {},
    new = function(
      d,
      directed = TRUE,
      ...,
      vertices = NULL
    ) {},
    when = "3.0.0"
  ),

  graph_from_edgelist = list(
    old = function(el, directed) {},
    new = function(
      el,
      ...,
      directed = TRUE
    ) {},
    when = "3.0.0"
  ),

  graph_from_graphnel = list(
    old = function(graphNEL, name, weight, unlist.attrs) {},
    new = function(
      graphNEL,
      ...,
      name = TRUE,
      weight = TRUE,
      unlist.attrs = TRUE
    ) {},
    when = "3.0.0"
  ),

  graph_from_biadjacency_matrix = list(
    old = function(incidence, directed, mode, multiple, weighted, add.names) {},
    new = function(
      incidence,
      ...,
      directed = FALSE,
      mode = c("all", "out", "in", "total"),
      multiple = FALSE,
      weighted = NULL,
      add.names = NULL
    ) {},
    when = "3.0.0"
  )
)
