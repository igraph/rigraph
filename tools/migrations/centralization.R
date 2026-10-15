# Argument-signature migrations: centralization
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  centr_betw = list(
    old = function(graph, directed, normalized) {},
    new = function(
      graph,
      ...,
      directed = TRUE,
      normalized = TRUE
    ) {},
    when = "3.0.0"
  ),

  centr_betw_tmax = list(
    old = function(graph, nodes, directed) {},
    new = function(
      graph = NULL,
      nodes = 0,
      ...,
      directed = TRUE
    ) {},
    when = "3.0.0"
  ),

  centr_clo = list(
    old = function(graph, mode, normalized) {},
    new = function(
      graph,
      ...,
      mode = c("out", "in", "all", "total"),
      normalized = TRUE
    ) {},
    when = "3.0.0"
  ),

  centr_clo_tmax = list(
    old = function(graph, nodes, mode) {},
    new = function(
      graph = NULL,
      nodes = 0,
      ...,
      mode = c("out", "in", "all", "total")
    ) {},
    when = "3.0.0"
  ),

  centr_degree = list(
    old = function(graph, mode, loops, normalized) {},
    new = function(
      graph,
      ...,
      mode = c("all", "out", "in", "total"),
      loops = TRUE,
      normalized = TRUE
    ) {},
    when = "3.0.0"
  ),

  centralize = list(
    old = function(scores, theoretical.max, normalized) {},
    new = function(
      scores,
      ...,
      theoretical.max = 0,
      normalized = TRUE
    ) {},
    when = "3.0.0"
  )
)
