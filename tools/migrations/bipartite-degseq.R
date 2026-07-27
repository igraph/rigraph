# Argument-signature migrations: bipartite-degseq
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  bipartite_projection = list(
    old = function(graph, types, multiplicity, probe1, which, remove.type) {},
    new = function(
      graph,
      types = NULL,
      ...,
      multiplicity = TRUE,
      probe1 = NULL,
      which = c("both", "true", "false"),
      remove.type = TRUE
    ) {},
    when = "3.0.0"
  ),

  is_graphical = list(
    old = function(out.deg, in.deg, allowed.edge.types) {},
    new = function(
      out.deg,
      in.deg = NULL,
      ...,
      allowed.edge.types = c("simple", "loops", "multi", "all")
    ) {},
    when = "3.0.0"
  )
)
