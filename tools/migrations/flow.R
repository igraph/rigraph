# Argument-signature migrations: flow
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  cohesive_blocks = list(
    old = function(graph, labels) {},
    new = function(
      graph,
      ...,
      labels = TRUE
    ) {},
    when = "3.0.0"
  ),

  export_pajek = list(
    old = function(blocks, graph, file, project.file) {},
    new = function(
      blocks,
      graph,
      file,
      ...,
      project.file = TRUE
    ) {},
    when = "3.0.0"
  ),

  adhesion = list(
    old = function(graph, checks) {},
    new = function(
      graph,
      ...,
      checks = TRUE
    ) {},
    when = "3.0.0"
  ),

  dominator_tree = list(
    old = function(graph, root, mode) {},
    new = function(
      graph,
      root,
      ...,
      mode = c("out", "in", "all", "total")
    ) {},
    when = "3.0.0"
  ),

  edge_connectivity = list(
    old = function(graph, source, target, checks) {},
    new = function(
      graph,
      source = NULL,
      target = NULL,
      ...,
      checks = TRUE
    ) {},
    when = "3.0.0"
  ),

  max_flow = list(
    old = function(graph, source, target, capacity) {},
    new = function(
      graph,
      source,
      target,
      ...,
      capacity = NULL
    ) {},
    when = "3.0.0"
  ),

  min_cut = list(
    old = function(graph, source, target, capacity, value.only) {},
    new = function(
      graph,
      source = NULL,
      target = NULL,
      ...,
      capacity = NULL,
      value.only = TRUE
    ) {},
    when = "3.0.0"
  ),

  st_min_cuts = list(
    old = function(graph, source, target, capacity) {},
    new = function(
      graph,
      source,
      target,
      ...,
      capacity = NULL
    ) {},
    when = "3.0.0"
  ),

  vertex_connectivity = list(
    old = function(graph, source, target, checks) {},
    new = function(
      graph,
      source = NULL,
      target = NULL,
      ...,
      checks = TRUE
    ) {},
    when = "3.0.0"
  )
)
