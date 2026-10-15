# Argument-signature migrations: trees
# Schema: see tools/migrations.R. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  is_chordal = list(
    old = function(graph, alpha, alpham1, fillin, newgraph) {},
    new = function(
      graph,
      ...,
      alpha = NULL,
      alpham1 = NULL,
      fillin = FALSE,
      newgraph = FALSE
    ) {},
    when = "3.0.0"
  ),

  is_forest = list(
    old = function(graph, mode, details) {},
    new = function(
      graph,
      ...,
      mode = c("out", "in", "all", "total"),
      details = FALSE
    ) {},
    when = "3.0.0"
  ),

  is_tree = list(
    old = function(graph, mode, details) {},
    new = function(
      graph,
      ...,
      mode = c("out", "in", "all", "total"),
      details = FALSE
    ) {},
    when = "3.0.0"
  ),

  sample_spanning_tree = list(
    old = function(graph, vid) {},
    new = function(
      graph,
      ...,
      vid = 0
    ) {},
    when = "3.0.0"
  )
)
