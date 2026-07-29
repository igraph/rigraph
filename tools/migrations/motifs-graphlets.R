# Argument-signature migrations: motifs-graphlets
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  graphlet_basis = list(
    old = function(graph, weights) {},
    new = function(
      graph,
      ...,
      weights = NULL
    ) {},
    when = "3.0.0"
  ),

  graphlet_proj = list(
    old = function(graph, weights, cliques, niter, Mu) {},
    new = function(
      graph,
      ...,
      weights = NULL,
      cliques,
      niter = 1000,
      Mu = rep(1, length(cliques))
    ) {},
    when = "3.0.0"
  ),

  graphlets = list(
    old = function(graph, weights, niter) {},
    new = function(
      graph,
      ...,
      weights = NULL,
      niter = 1000
    ) {},
    when = "3.0.0"
  ),

  count_motifs = list(
    old = function(graph, size, cut.prob) {},
    new = function(
      graph,
      size = 3,
      ...,
      cut.prob = NULL
    ) {},
    when = "3.0.0"
  ),

  motifs = list(
    old = function(graph, size, cut.prob, callback) {},
    new = function(
      graph,
      size = 3,
      ...,
      cut.prob = NULL,
      callback = NULL
    ) {},
    when = "3.0.0"
  ),

  sample_motifs = list(
    old = function(graph, size, cut.prob, sample.size, sample) {},
    new = function(
      graph,
      size = 3,
      ...,
      cut.prob = rep(0, size),
      sample.size = NULL,
      sample = NULL
    ) {},
    when = "3.0.0"
  )
)
