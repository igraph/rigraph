# Argument-signature migrations: community
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  cluster_edge_betweenness = list(
    old = function(
      graph,
      weights,
      directed,
      edge.betweenness = edge_betweenness,
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
      edge_betweenness = TRUE,
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
    old = function(
      graph,
      e.weights = weights,
      v.weights = vertex_weights,
      nb.trials = n_trials,
      modularity
    ) {},
    new = function(
      graph,
      ...,
      weights = NULL,
      vertex_weights = NULL,
      n_trials = 10,
      modularity = TRUE
    ) {},
    when = "3.0.0"
  ),

  cluster_leiden = list(
    old = function(
      graph,
      objective_function,
      weights,
      resolution_parameter = resolution,
      beta,
      initial_membership,
      n_iterations = n_iter,
      vertex_weights
    ) {},
    new = function(
      graph,
      objective_function = c("CPM", "modularity"),
      ...,
      weights = NULL,
      resolution = 1,
      beta = 0.01,
      initial_membership = NULL,
      n_iter = 2,
      vertex_weights = NULL
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
      start.temp = start_temp,
      stop.temp = stop_temp,
      cool.fact = cool_fact,
      update.rule = update_rule,
      gamma,
      implementation = algorithm,
      gamma.minus = gamma_minus
    ) {},
    new = function(
      graph,
      ...,
      weights = NULL,
      vertex = NULL,
      spins = 25,
      parupdate = FALSE,
      start_temp = 1,
      stop_temp = 0.01,
      cool_fact = 0.99,
      update_rule = c("config", "random", "simple"),
      gamma = 1.0,
      algorithm = c("orig", "neg"),
      gamma_minus = 1.0
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
