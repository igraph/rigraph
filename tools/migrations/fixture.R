# Argument-signature migrations: test fixture
# Schema: see tools/migrations/README.md. Regenerate with:
#   Rscript tools/generate-migrations.R

migrations <- list(
  # Exercises the generator end-to-end without migrating a real function. The
  # arg names are chosen to cover every recovery path: two renames (`weight ->
  # weights`, `kind -> type`), a surviving arg (`directed`), unique
  # abbreviations (`kin`, `dir`) and an ambiguous one (`weig` matches both
  # `weight` and `weights`). Head args (`graph`, `n`) stay before `...` and are
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
  )
)
