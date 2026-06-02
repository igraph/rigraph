# Test fixture for the in-place argument-migration generator (tools/migrations.R,
# tools/generate-migrations.R). `migration_fixture()` carries a generated
# ARG_HANDLE block that recovers a legacy call to its pre-3.0.0 signature
# f(a, b, c, d) -- now f(a, b, ..., c_renamed, d) with c renamed to c_renamed.
# It exists only to exercise the generator end-to-end; see
# tests/testthat/test-handle-args.R.

#' @noRd
migration_fixture <- function(a, b, ..., c_renamed = NULL, d = NULL) {
  # BEGIN GENERATED ARG_HANDLE: migration_fixture, do not edit, see tools/generate-migrations.R
  .arg_handle <- migrate_recover_args(
    list(...),
    current = list(c_renamed = c_renamed, d = d),
    recover_new = c("c_renamed", "d"),
    recover_old = c("c", "d"),
    match_names = c("c", "c_renamed", "d"),
    match_to = c("c_renamed", "c_renamed", "d"),
    defaults = list(c_renamed = NULL, d = NULL),
    head_args = c("a", "b"),
    fn_name = "migration_fixture"
  )
  if (!is.null(.arg_handle)) {
    list2env(.arg_handle$values, environment())
    lifecycle::deprecate_soft(
      "3.0.0",
      what = I(.arg_handle$what),
      details = .arg_handle$details
    )
  }
  # END GENERATED ARG_HANDLE

  list(a = a, b = b, c_renamed = c_renamed, d = d)
}
