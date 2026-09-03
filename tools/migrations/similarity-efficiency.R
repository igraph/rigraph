# Argument-signature migrations: similarity-efficiency
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  assortativity_degree = list(
    old = function(graph, directed) {},
    new = function(
      graph,
      ...,
      directed = TRUE
    ) {},
    when = "3.0.0"
  ),

  assortativity_nominal = list(
    old = function(graph, types, directed, normalized) {},
    new = function(
      graph,
      types,
      ...,
      directed = TRUE,
      normalized = TRUE
    ) {},
    when = "3.0.0"
  ),

  average_local_efficiency = list(
    old = function(graph, weights, directed, mode) {},
    new = function(
      graph,
      ...,
      weights = NULL,
      directed = TRUE,
      mode = c("all", "out", "in", "total")
    ) {},
    when = "3.0.0"
  ),

  global_efficiency = list(
    old = function(graph, weights, directed) {},
    new = function(
      graph,
      ...,
      weights = NULL,
      directed = TRUE
    ) {},
    when = "3.0.0"
  ),

  local_efficiency = list(
    old = function(graph, vids, weights, directed, mode) {},
    new = function(
      graph,
      vids = NULL,
      ...,
      weights = NULL,
      directed = TRUE,
      mode = c("all", "out", "in", "total")
    ) {},
    when = "3.0.0"
  ),

  similarity = list(
    old = function(graph, vids, mode, loops, method) {},
    new = function(
      graph,
      vids = NULL,
      ...,
      mode = c(
        "all",
        "out",
        "in",
        "total"
      ),
      loops = FALSE,
      method = c(
        "jaccard",
        "dice",
        "invlogweighted"
      )
    ) {},
    when = "3.0.0"
  )
)
