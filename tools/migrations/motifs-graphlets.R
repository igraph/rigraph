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
    old = function(graph, weights, cliques, niter = n_iter, Mu = mu) {},
    new = function(
      graph,
      ...,
      weights = NULL,
      cliques,
      n_iter = 1000,
      mu = NULL
    ) {},
    when = "3.0.0"
  ),

  graphlets = list(
    old = function(graph, weights, niter = n_iter) {},
    new = function(
      graph,
      ...,
      weights = NULL,
      n_iter = 1000
    ) {},
    when = "3.0.0"
  ),

  count_motifs = list(
    old = function(graph, size, cut.prob = cut_prob) {},
    new = function(
      graph,
      size = 3,
      ...,
      cut_prob = NULL
    ) {},
    when = "3.0.0"
  ),

  motifs = list(
    old = function(graph, size, cut.prob = cut_prob, callback) {},
    new = function(
      graph,
      size = 3,
      ...,
      cut_prob = NULL,
      callback = NULL
    ) {},
    when = "3.0.0"
  ),

  sample_motifs = list(
    old = function(graph, size, cut.prob = cut_prob, sample.size = sample_size, sample) {},
    new = function(
      graph,
      size = 3,
      ...,
      cut_prob = NULL,
      sample_size = NULL,
      sample = NULL
    ) {},
    when = "3.0.0"
  )
)
