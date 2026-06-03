# Test fixture for the in-place argument-migration generator (tools/migrations.R,
# tools/generate-migrations.R). `migration_fixture()` carries a generated
# ARG_HANDLE block that recovers a legacy call to its pre-3.0.0 signature
# f(graph, n, weight, type, directed) -- now
# f(graph, n, ..., weights, type, directed) with weight renamed to weights. The
# names are chosen so the tests can exercise renames, unique abbreviations and an
# ambiguous one. It exists only to exercise the generator end-to-end; see
# tests/testthat/test-migration-fixture.R.

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
      current = list(weights = weights, type = type, directed = directed),
      recover_new = c("weights", "type", "directed"),
      recover_old = c("weight", "type", "directed"),
      match_names = c("weight", "weights", "type", "directed"),
      match_to = c("weights", "weights", "type", "directed"),
      defaults = list(weights = NULL, type = "out", directed = FALSE),
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
