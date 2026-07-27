# Argument-signature migrations: centrality
# Schema: see tools/migrations.R. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  alpha_centrality = list(
    old = function(graph, nodes, alpha, loops, exo, weights, tol, sparse) {},
    new = function(
      graph,
      nodes = V(graph),
      ...,
      alpha = 1,
      loops = FALSE,
      exo = 1,
      weights = NULL,
      tol = 1e-7,
      sparse = TRUE
    ) {},
    when = "3.0.0"
  ),

  betweenness = list(
    old = function(graph, v, directed, weights, normalized, cutoff) {},
    new = function(
      graph,
      v = V(graph),
      ...,
      directed = TRUE,
      weights = NULL,
      normalized = FALSE,
      cutoff = -1
    ) {},
    when = "3.0.0"
  ),

  closeness = list(
    old = function(graph, vids, mode, weights, normalized, cutoff) {},
    new = function(
      graph,
      vids = V(graph),
      ...,
      mode = c("out", "in", "all", "total"),
      weights = NULL,
      normalized = FALSE,
      cutoff = -1
    ) {},
    when = "3.0.0"
  ),

  diversity = list(
    old = function(graph, weights, vids) {},
    new = function(
      graph,
      ...,
      weights = NULL,
      vids = V(graph)
    ) {},
    when = "3.0.0"
  ),

  edge_betweenness = list(
    old = function(graph, e, directed, weights, cutoff) {},
    new = function(
      graph,
      e = E(graph),
      ...,
      directed = TRUE,
      weights = NULL,
      cutoff = -1
    ) {},
    when = "3.0.0"
  ),

  harmonic_centrality = list(
    old = function(graph, vids, mode, weights, normalized, cutoff) {},
    new = function(
      graph,
      vids = V(graph),
      ...,
      mode = c("out", "in", "all", "total"),
      weights = NULL,
      normalized = FALSE,
      cutoff = -1
    ) {},
    when = "3.0.0"
  ),

  page_rank = list(
    old = function(
      graph,
      algo,
      vids,
      directed,
      damping,
      personalized,
      weights,
      options
    ) {},
    new = function(
      graph,
      ...,
      algo = c("prpack", "arpack"),
      vids = V(graph),
      directed = TRUE,
      damping = 0.85,
      personalized = NULL,
      weights = NULL,
      options = NULL
    ) {},
    when = "3.0.0"
  ),

  power_centrality = list(
    old = function(
      graph,
      nodes,
      loops,
      exponent,
      rescale,
      tol,
      sparse,
      weights
    ) {},
    new = function(
      graph,
      nodes = V(graph),
      ...,
      loops = FALSE,
      exponent = 1,
      rescale = FALSE,
      tol = 1e-7,
      sparse = TRUE,
      weights = NULL
    ) {},
    when = "3.0.0"
  ),

  strength = list(
    old = function(graph, vids, mode, loops, weights) {},
    new = function(
      graph,
      vids = V(graph),
      ...,
      mode = c("all", "out", "in", "total"),
      loops = TRUE,
      weights = NULL
    ) {},
    when = "3.0.0"
  ),

  subgraph_centrality = list(
    old = function(graph, diag) {},
    new = function(
      graph,
      ...,
      diag = FALSE
    ) {},
    when = "3.0.0"
  )
)
