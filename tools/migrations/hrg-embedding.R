# Argument-signature migrations: hrg-embedding
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  embed_adjacency_matrix = list(
    old = function(graph, no, weights, which, scaled, cvec, options) {},
    new = function(
      graph,
      no,
      ...,
      weights = NULL,
      which = c("lm", "la", "sa"),
      scaled = TRUE,
      cvec = NULL,
      options = NULL
    ) {},
    when = "3.0.0"
  ),

  embed_laplacian_matrix = list(
    old = function(graph, no, weights, which, type, scaled, options) {},
    new = function(
      graph,
      no,
      ...,
      weights = NULL,
      which = c("lm", "la", "sa"),
      type = c("default", "D-A", "DAD", "I-DAD", "OAP"),
      scaled = TRUE,
      options = NULL
    ) {},
    when = "3.0.0"
  ),

  sample_sphere_surface = list(
    old = function(dim, n, radius, positive) {},
    new = function(
      dim,
      n = 1,
      ...,
      radius = 1,
      positive = TRUE
    ) {},
    when = "3.0.0"
  ),

  sample_sphere_volume = list(
    old = function(dim, n, radius, positive) {},
    new = function(
      dim,
      n = 1,
      ...,
      radius = 1,
      positive = TRUE
    ) {},
    when = "3.0.0"
  ),

  consensus_tree = list(
    old = function(graph, hrg, start, num.samples) {},
    new = function(
      graph,
      hrg = NULL,
      ...,
      start = FALSE,
      num.samples = 10000
    ) {},
    when = "3.0.0"
  ),

  fit_hrg = list(
    old = function(graph, hrg, start, steps) {},
    new = function(
      graph,
      hrg = NULL,
      ...,
      start = FALSE,
      steps = 0
    ) {},
    when = "3.0.0"
  ),

  predict_edges = list(
    old = function(graph, hrg, start, num.samples, num.bins) {},
    new = function(
      graph,
      hrg = NULL,
      ...,
      start = FALSE,
      num.samples = 10000,
      num.bins = 25
    ) {},
    when = "3.0.0"
  )
)
