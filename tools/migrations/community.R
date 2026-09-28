# Argument-signature migrations: community
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  cluster_edge_betweenness = list(
    old = function(
      graph,
      weights,
      directed,
      edge.betweenness,
      merges,
      bridges,
      modularity,
      membership
    ) {},
    new = function(
      graph,
      ...,
      weights = NULL,
      directed = TRUE,
      edge.betweenness = TRUE,
      merges = TRUE,
      bridges = TRUE,
      modularity = TRUE,
      membership = TRUE
    ) {},
    when = "3.0.0"
  ),

  cluster_fast_greedy = list(
    old = function(graph, merges, modularity, membership, weights) {},
    new = function(
      graph,
      ...,
      merges = TRUE,
      modularity = TRUE,
      membership = TRUE,
      weights = NULL
    ) {},
    when = "3.0.0"
  ),

  cluster_infomap = list(
    old = function(graph, e.weights, v.weights, nb.trials, modularity) {},
    new = function(
      graph,
      ...,
      e.weights = NULL,
      v.weights = NULL,
      nb.trials = 10,
      modularity = TRUE
    ) {},
    when = "3.0.0"
  ),

  cluster_louvain = list(
    old = function(graph, weights, resolution) {},
    new = function(
      graph,
      ...,
      weights = NULL,
      resolution = 1
    ) {},
    when = "3.0.0"
  ),

  cluster_optimal = list(
    old = function(graph, weights) {},
    new = function(
      graph,
      ...,
      weights = NULL
    ) {},
    when = "3.0.0"
  ),

  cluster_spinglass = list(
    old = function(
      graph,
      weights,
      vertex,
      spins,
      parupdate,
      start.temp,
      stop.temp,
      cool.fact,
      update.rule,
      gamma,
      implementation,
      gamma.minus
    ) {},
    new = function(
      graph,
      ...,
      weights = NULL,
      vertex = NULL,
      spins = 25,
      parupdate = FALSE,
      start.temp = 1,
      stop.temp = 0.01,
      cool.fact = 0.99,
      update.rule = c("config", "random", "simple"),
      gamma = 1.0,
      implementation = c("orig", "neg"),
      gamma.minus = 1.0
    ) {},
    when = "3.0.0"
  ),

  cluster_walktrap = list(
    old = function(graph, weights, steps, merges, modularity, membership) {},
    new = function(
      graph,
      ...,
      weights = NULL,
      steps = 4,
      merges = TRUE,
      modularity = TRUE,
      membership = TRUE
    ) {},
    when = "3.0.0"
  ),

  make_clusters = list(
    old = function(graph, membership, algorithm, merges, modularity) {},
    new = function(
      graph,
      membership = NULL,
      ...,
      algorithm = NULL,
      merges = NULL,
      modularity = TRUE
    ) {},
    when = "3.0.0"
  ),

  modularity_matrix = list(
    old = function(graph, membership, weights, resolution, directed) {},
    new = function(
      graph,
      membership = lifecycle::deprecated(),
      ...,
      weights = NULL,
      resolution = 1,
      directed = TRUE
    ) {},
    when = "3.0.0"
  )
)
