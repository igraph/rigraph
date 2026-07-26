# Test fixture for the in-place argument-migration generator (tools/migrations.R,
# tools/generate-migrations.R). `migration_fixture()` carries a generated
# ARG_HANDLE block that recovers a legacy call to its pre-3.0.0 signature
# f(graph, n, weight, kind, directed) -- now
# f(graph, n, ..., weights, type, directed), with `weight` renamed to `weights`
# and `kind` to `type` (`directed` survives unchanged). The names are chosen so
# the tests can exercise two renames, unique and ambiguous abbreviations, and
# base-R matching of the head args (`graph`, `n`). It exists only to exercise the
# generator end-to-end; see tests/testthat/test-migration-fixture.R.

#' @noRd
migration_fixture <- function(
  graph,
  n,
  ...,
  weights = NULL,
  type = "out",
  directed = FALSE
) {
  # BEGIN GENERATED ARG_HANDLE: migration_fixture, do not edit, see tools/generate-migrations.R
  if (...length() > 0L) {
    .arg_handle <- migrate_recover_args(
      list(...),
      supplied = c(
        weights = !missing(weights),
        type = !missing(type),
        directed = !missing(directed)
      ),
      recover_new = c("weights", "type", "directed"),
      recover_old = c("weight", "kind", "directed"),
      match_names = c("weight", "kind", "weights", "type", "directed"),
      match_to = c("weights", "type", "weights", "type", "directed"),
      head_args = c("graph", "n"),
      fn_name = "migration_fixture"
    )
    list2env(.arg_handle$values, environment())
    lifecycle::deprecate_soft(
      "3.0.0",
      what = I(.arg_handle$what),
      details = .arg_handle$details
    )
  }
  # END GENERATED ARG_HANDLE

  list(
    graph = graph,
    n = n,
    weights = weights,
    type = type,
    directed = directed
  )
}

# Second fixture: locks in that recovery never forces tail promises. Its tail
# defaults are exactly the hazardous kinds -- `breaks` references another tail
# arg, `anchor` allocates a fresh environment on every evaluation (never
# identical() across evaluations), and `noise` draws from the RNG. The old
# value-comparison supplied-check forced all three, which froze cross-
# referencing defaults at their pre-recovery values, misread irreproducible
# defaults as user-supplied conflicts, and consumed RNG draws. `noise` is
# deliberately never used in the body, so tests can assert the RNG state
# stays untouched. See tests/testthat/test-migration-fixture.R.

#' @noRd
migration_fixture2 <- function(
  graph,
  ...,
  bins = 7,
  breaks = bins * 2,
  anchor = new.env(),
  noise = stats::runif(1)
) {
  # BEGIN GENERATED ARG_HANDLE: migration_fixture2, do not edit, see tools/generate-migrations.R
  if (...length() > 0L) {
    .arg_handle <- migrate_recover_args(
      list(...),
      supplied = c(
        bins = !missing(bins),
        breaks = !missing(breaks),
        anchor = !missing(anchor),
        noise = !missing(noise)
      ),
      recover_new = c("bins", "breaks", "anchor", "noise"),
      recover_old = c("bins", "breaks", "anchor", "noise"),
      match_names = c("bins", "breaks", "anchor", "noise"),
      match_to = c("bins", "breaks", "anchor", "noise"),
      head_args = c("graph"),
      fn_name = "migration_fixture2"
    )
    list2env(.arg_handle$values, environment())
    lifecycle::deprecate_soft(
      "3.0.0",
      what = I(.arg_handle$what),
      details = .arg_handle$details
    )
  }
  # END GENERATED ARG_HANDLE

  list(graph = graph, bins = bins, breaks = breaks, anchor = anchor)
}
