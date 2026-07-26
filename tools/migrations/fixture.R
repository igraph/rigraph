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

  # Second fixture: hazardous tail defaults (cross-reference, fresh
  # environment, RNG draw) -- recovery must not force any of them.
  migration_fixture2 = list(
    old = function(graph, bins, breaks, anchor, noise) {},
    new = function(
      graph,
      ...,
      bins = 7,
      breaks = bins * 2,
      anchor = new.env(),
      noise = stats::runif(1)
    ) {},
    when = "3.0.0"
  )
)
