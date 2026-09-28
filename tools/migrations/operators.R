# Argument-signature migrations: operators
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  complementer = list(
    old = function(graph, loops) {},
    new = function(
      graph,
      ...,
      loops = FALSE
    ) {},
    when = "3.0.0"
  ),

  compose = list(
    old = function(
      g1,
      g2,
      byname,
      graph.attr.comb = graph_attr_combine,
      vertex.attr.comb = vertex_attr_combine,
      edge.attr.comb = edge_attr_combine
    ) {},
    new = function(
      g1,
      g2,
      ...,
      byname = "auto",
      graph_attr_combine = NULL,
      vertex_attr_combine = "rename",
      edge_attr_combine = "rename"
    ) {},
    when = "3.0.0"
  ),

  each_edge = list(
    old = function(prob, loops, multiple, mode) {},
    new = function(
      prob,
      ...,
      loops = FALSE,
      multiple = FALSE,
      mode = c("all", "out", "in", "total")
    ) {},
    when = "3.0.0"
  )
)
