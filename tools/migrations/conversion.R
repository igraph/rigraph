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
  )
)
