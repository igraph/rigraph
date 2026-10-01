# Argument-signature migrations: misc
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  greedy_vertex_coloring = list(
    old = function(graph, heuristic) {},
    new = function(
      graph,
      ...,
      heuristic = c("colored_neighbors", "dsatur")
    ) {},
    when = "3.0.0"
  ),

  time_bins = list(
    old = function(x, middle) {},
    new = function(
      x,
      ...,
      middle = TRUE
    ) {},
    when = "3.0.0"
  ),

  graph_from_graphdb = list(
    old = function(
      url,
      prefix,
      type,
      nodes = n,
      pair,
      which,
      base,
      compressed,
      directed
    ) {},
    new = function(
      url = NULL,
      ...,
      prefix = "iso",
      type = "r001",
      n = NULL,
      pair = "A",
      which = 0,
      base = "https://github.com/igraph/graphsdb/raw/refs/heads/main",
      compressed = TRUE,
      directed = TRUE
    ) {},
    when = "3.0.0"
  ),

  sir = list(
    old = function(graph, beta, gamma, no.sim) {},
    new = function(
      graph,
      beta,
      gamma,
      ...,
      no.sim = 100
    ) {},
    when = "3.0.0"
  ),

  stochastic_matrix = list(
    old = function(graph, column.wise, sparse) {},
    new = function(
      graph,
      ...,
      column.wise = FALSE,
      sparse = NULL
    ) {},
    when = "3.0.0"
  )
)
