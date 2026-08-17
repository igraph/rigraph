# Argument-signature migrations: interface
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  adjacent_vertices = list(
    old = function(graph, v, mode) {},
    new = function(
      graph,
      vertices,
      ...,
      mode = c("out", "in", "all", "total"),
      v = deprecated()
    ) {},
    when = "3.0.0"
  ),

  ends = list(
    old = function(graph, es, names) {},
    new = function(
      graph,
      es,
      ...,
      names = TRUE
    ) {},
    when = "3.0.0"
  ),

  get_edge_ids = list(
    old = function(graph, vp, directed, error) {},
    new = function(
      graph,
      vp,
      ...,
      directed = TRUE,
      error = FALSE
    ) {},
    when = "3.0.0"
  ),

  incident = list(
    old = function(graph, v, mode) {},
    new = function(
      graph,
      v,
      ...,
      mode = c("all", "out", "in", "total")
    ) {},
    when = "3.0.0"
  ),

  incident_edges = list(
    old = function(graph, v, mode) {},
    new = function(
      graph,
      vertices,
      ...,
      mode = c("out", "in", "all", "total"),
      v = deprecated()
    ) {},
    when = "3.0.0"
  ),

  neighbors = list(
    old = function(graph, v, mode) {},
    new = function(
      graph,
      v,
      ...,
      mode = c("out", "in", "all", "total")
    ) {},
    when = "3.0.0"
  ),

  E = list(
    old = function(graph, P, path, directed) {},
    new = function(
      graph,
      ...,
      P = NULL,
      path = NULL,
      directed = TRUE
    ) {},
    when = "3.0.0"
  ),

  identical_graphs = list(
    old = function(g1, g2, attrs) {},
    new = function(
      g1,
      g2,
      ...,
      attrs = TRUE
    ) {},
    when = "3.0.0"
  )
)
