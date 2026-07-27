# Argument-signature migrations: topology
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  automorphism_group = list(
    old = function(graph, colors, sh, details) {},
    new = function(
      graph,
      colors = NULL,
      ...,
      sh = c("fm", "f", "fs", "fl", "flm", "fsm"),
      details = FALSE
    ) {},
    when = "3.0.0"
  ),

  canonical_permutation = list(
    old = function(graph, colors, sh) {},
    new = function(
      graph,
      colors = NULL,
      ...,
      sh = c("fm", "f", "fs", "fl", "flm", "fsm")
    ) {},
    when = "3.0.0"
  ),

  count_automorphisms = list(
    old = function(graph, colors, sh) {},
    new = function(
      graph,
      colors = NULL,
      ...,
      sh = c("fm", "f", "fs", "fl", "flm", "fsm")
    ) {},
    when = "3.0.0"
  ),

  graph.count.isomorphisms.vf2 = list(
    old = function(
      graph1,
      graph2,
      vertex.color1,
      vertex.color2,
      edge.color1,
      edge.color2
    ) {},
    new = function(
      graph1,
      graph2,
      ...,
      vertex.color1 = NULL,
      vertex.color2 = NULL,
      edge.color1 = NULL,
      edge.color2 = NULL
    ) {},
    when = "3.0.0"
  ),

  graph.count.subisomorphisms.vf2 = list(
    old = function(
      graph1,
      graph2,
      vertex.color1,
      vertex.color2,
      edge.color1,
      edge.color2
    ) {},
    new = function(
      graph1,
      graph2,
      ...,
      vertex.color1 = NULL,
      vertex.color2 = NULL,
      edge.color1 = NULL,
      edge.color2 = NULL
    ) {},
    when = "3.0.0"
  ),

  graph.isomorphic.bliss = list(
    old = function(graph1, graph2, colors1, colors2, sh) {},
    new = function(
      graph1,
      graph2,
      ...,
      colors1 = NULL,
      colors2 = NULL,
      sh = c("fm", "f", "fs", "fl", "flm", "fsm")
    ) {},
    when = "3.0.0"
  ),

  graph.isomorphic.vf2 = list(
    old = function(
      graph1,
      graph2,
      vertex.color1,
      vertex.color2,
      edge.color1,
      edge.color2
    ) {},
    new = function(
      graph1,
      graph2,
      ...,
      vertex.color1 = NULL,
      vertex.color2 = NULL,
      edge.color1 = NULL,
      edge.color2 = NULL
    ) {},
    when = "3.0.0"
  ),

  graph.subisomorphic.lad = list(
    old = function(
      pattern,
      target,
      domains,
      induced,
      map,
      all.maps,
      time.limit
    ) {},
    new = function(
      pattern,
      target,
      ...,
      domains = NULL,
      induced = FALSE,
      map = TRUE,
      all.maps = FALSE,
      time.limit = Inf
    ) {},
    when = "3.0.0"
  ),

  graph.subisomorphic.vf2 = list(
    old = function(
      graph1,
      graph2,
      vertex.color1,
      vertex.color2,
      edge.color1,
      edge.color2
    ) {},
    new = function(
      graph1,
      graph2,
      ...,
      vertex.color1 = NULL,
      vertex.color2 = NULL,
      edge.color1 = NULL,
      edge.color2 = NULL
    ) {},
    when = "3.0.0"
  ),

  graph_from_isomorphism_class = list(
    old = function(size, number, directed) {},
    new = function(
      size,
      number,
      ...,
      directed = TRUE
    ) {},
    when = "3.0.0"
  )
)
