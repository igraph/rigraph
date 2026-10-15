# Argument-signature migrations: walks-cycles
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  find_cycle = list(
    old = function(graph, mode) {},
    new = function(
      graph,
      ...,
      mode = c("out", "in", "all", "total")
    ) {},
    when = "3.0.0"
  ),

  random_edge_walk = list(
    old = function(graph, start, steps, weights, mode, stuck) {},
    new = function(
      graph,
      start,
      steps,
      ...,
      weights = NULL,
      mode = c("out", "in", "all", "total"),
      stuck = c("return", "error")
    ) {},
    when = "3.0.0"
  ),

  random_walk = list(
    old = function(graph, start, steps, weights, mode, stuck) {},
    new = function(
      graph,
      start,
      steps,
      ...,
      weights = NULL,
      mode = c("out", "in", "all", "total"),
      stuck = c("return", "error")
    ) {},
    when = "3.0.0"
  )
)
