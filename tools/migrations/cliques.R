# Argument-signature migrations: cliques
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  clique_size_counts = list(
    old = function(graph, min, max, maximal) {},
    new = function(
      graph,
      ...,
      min = 0,
      max = 0,
      maximal = FALSE
    ) {},
    when = "3.0.0"
  ),

  count_max_cliques = list(
    old = function(graph, min, max, subset) {},
    new = function(
      graph,
      min = NULL,
      max = NULL,
      ...,
      subset = NULL
    ) {},
    when = "3.0.0"
  ),

  is_clique = list(
    old = function(graph, candidate, directed) {},
    new = function(
      graph,
      candidate,
      ...,
      directed = FALSE
    ) {},
    when = "3.0.0"
  ),

  largest_weighted_cliques = list(
    old = function(graph, vertex.weights = vertex_weights) {},
    new = function(
      graph,
      ...,
      vertex_weights = NULL
    ) {},
    when = "3.0.0"
  ),

  weighted_clique_num = list(
    old = function(graph, vertex.weights = vertex_weights) {},
    new = function(
      graph,
      ...,
      vertex_weights = NULL
    ) {},
    when = "3.0.0"
  ),

  weighted_cliques = list(
    old = function(
      graph,
      vertex.weights = vertex_weights,
      min.weight = min_weight,
      max.weight = max_weight,
      maximal
    ) {},
    new = function(
      graph,
      ...,
      vertex_weights = NULL,
      min_weight = 0,
      max_weight = 0,
      maximal = FALSE
    ) {},
    when = "3.0.0"
  )
)
