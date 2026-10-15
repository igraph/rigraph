# Argument-signature migrations: attribute combination
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  # Dotted `*.attr.comb` arguments renamed to snake_case. The old dotted names
  # keep working (recovered from `...`) under a single soft-deprecation.
  simplify = list(
    old = function(
      graph,
      remove.multiple,
      remove.loops,
      edge.attr.comb = edge_attr_combine
    ) {},
    new = function(
      graph,
      remove.multiple = TRUE,
      remove.loops = TRUE,
      ...,
      edge_attr_combine = NULL
    ) {},
    when = "3.0.0"
  ),

  as_undirected = list(
    old = function(graph, mode, edge.attr.comb = edge_attr_combine) {},
    new = function(
      graph,
      mode = c("collapse", "each", "mutual"),
      ...,
      edge_attr_combine = NULL
    ) {},
    when = "3.0.0"
  ),

  contract = list(
    old = function(graph, mapping, vertex.attr.comb = vertex_attr_combine) {},
    new = function(
      graph,
      mapping,
      ...,
      vertex_attr_combine = NULL
    ) {},
    when = "3.0.0"
  )
)
