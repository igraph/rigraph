# Make lifecycle deprecations fatal in tests -- opt-in via
# IGRAPH_LIFECYCLE_ERRORS=true, set by one job in the full rcc matrix
# (see .github/versions-matrix.R).
#
# testthat's 3rd edition forces lifecycle_verbosity = "warning" inside every
# test_that() block: local_test_context() calls local_reproducible_output(),
# which hard-codes that option. A plain options() call here can therefore
# never make deprecations fatal -- it is overridden again at the start of
# each test. (globalCallingHandlers() is no alternative either: testthat
# sources setup files with calling handlers on the stack, where R refuses to
# install global handlers.)
#
# So, like the RNG-state check in setup.R (#2713), the gate shadows
# test_that() for all test files and prepends a bump to "error" to each test
# block. The bump runs *inside* the test, after testthat has forced
# "warning", so it wins -- and whatever a test sets later runs later still,
# so the escape hatches win over the bump. Unasserted deprecations --
# including *indirect* soft deprecations that deprecate_soft() keeps silent
# for users -- then fail their test outright instead of going unnoticed
# until the hard-deprecation release.
#
# The escape hatches stay intact:
# - lifecycle::expect_deprecated() pins lifecycle_verbosity = "warning"
#   internally, so asserted deprecations keep working;
# - snapshot tests set rlang::local_options(lifecycle_verbosity = "warning")
#   to record the warning text;
# - a test can opt out with rlang::local_options(lifecycle_verbosity = "quiet").
#
# Enable at most one of IGRAPH_LIFECYCLE_ERRORS and IGRAPH_CHECK_RNG_STATE:
# both checks shadow test_that(), and the RNG-state override in setup.R
# (sourced after this file) would take precedence. The baseline test in
# test-migration-fixture.R fails loudly if both are enabled.
if (Sys.getenv("IGRAPH_LIFECYCLE_ERRORS") == "true") {
  # Outside test_that() blocks (helper/setup-time code), surface deprecations
  # as warnings so they are at least visible in the test log.
  options(lifecycle_verbosity = "warning")

  test_that <- function(name, code) {
    # Forward the block to testthat as a literal language object, wrapped in
    # a `{` call behind the verbosity bump. As in the RNG-state override in
    # setup.R, do NOT use rlang::inject() to splice the block: it would
    # eagerly process injection operators (!!, !!!, {{) from the test body
    # in this frame. call("{", ...) keeps the captured block -- including
    # its srcrefs, so failure locations still point at the test file --
    # untouched.
    code <- call(
      "{",
      quote(rlang::local_options(lifecycle_verbosity = "error")),
      substitute(code)
    )
    eval(
      as.call(list(quote(testthat::test_that), name, code)),
      envir = parent.frame()
    )
  }
}
