# Argument-signature migrations: test fixture
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  # Exercises the generator end-to-end without migrating a real function. The
  # arg names are chosen to cover every recovery path: two renames (`weight ->
  # weights`, `kind -> type`), a surviving arg (`directed`), unique
  # abbreviations (`kin`, `dir`) and one that matches both the old `weight` and
  # the new `weights` (`weig`) but resolves unambiguously because they are the
  # same argument. Head args (`graph`, `n`) stay before `...` and are
  # matched by base R, including abbreviations like `gr =`. Consumed by
  # tests/testthat/test-migration-fixture.R.
  migration_fixture = list(
    old = function(graph, n, weight = weights, kind = type, directed) {},
    new = function(
      graph,
      n,
      ...,
      weights = NULL,
      type = "out",
      directed = FALSE
    ) {},
    when = "3.0.0"
  ),

  # Exercises the head/recoverable prefix-overlap rules: the recoverable
  # `dim` is a strict prefix of the head arg `dimvector` (the make_lattice()
  # shape), and the head arg `p` is a strict prefix of the recoverable
  # `permutation` (the sample_correlated_gnp_pair() shape). The generator
  # computes forbidden_tags = c("d", "di") and emits the runtime guard that
  # rejects those tags when legacy arguments in `...` engage recovery.
  migration_fixture_prefix = list(
    old = function(dimvector, p, dim, permutation) {},
    new = function(dimvector, p, ..., dim = NULL, permutation = NULL) {},
    when = "3.0.0"
  ),

  # Exercises the two hazards the generated block has to survive in someone
  # else's function body, both taken from as_adjacency_matrix():
  #
  #   * Formals that shadow the functions the block calls. `names` and `c` are
  #     argument names here, and a *missing* formal is worse than a shadowing
  #     one -- R forces the promise while looking for a function of that name.
  #     Every call in a generated block is namespace-qualified for this reason.
  #   * An old name renamed away while a deprecated formal of that name stays
  #     behind: `attr` is recovered as `weights`, and `attr =` still binds the
  #     retained formal. Abbreviations of it (`a`, `at`, `att`) mean either, so
  #     the generator enumerates them and the block rejects them -- base R,
  #     which only sees the old names, would resolve them to `weights` silently.
  migration_fixture_shadow = list(
    old = function(graph, attr = weights, names, c) {},
    new = function(
      graph,
      ...,
      weights = NULL,
      names = TRUE,
      c = NULL,
      attr = deprecated()
    ) {},
    when = "3.0.0"
  )
)
