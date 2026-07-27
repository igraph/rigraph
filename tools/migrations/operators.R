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
      graph.attr.comb,
      vertex.attr.comb,
      edge.attr.comb
    ) {},
    new = function(
      g1,
      g2,
      ...,
      byname = "auto",
      graph.attr.comb = igraph_opt("graph.attr.comb"),
      vertex.attr.comb = "rename",
      edge.attr.comb = "rename"
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
