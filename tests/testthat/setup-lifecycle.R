# Make lifecycle deprecations fatal in tests.
#
# testthat's 3rd edition forces lifecycle_verbosity = "warning" inside every
# test_that() block: local_test_context() calls local_reproducible_output(),
# which hard-codes that option. A plain options() call here can therefore
# never make deprecations fatal -- it is overridden again at the start of
# each test. (globalCallingHandlers() is no alternative either: testthat
# sources setup files with calling handlers on the stack, where R refuses to
# install global handlers.)
#
# So we extend the exact hook testthat uses: after local_reproducible_output()
# sets up the test context, bump the verbosity to "error" in the same frame.
# Unasserted deprecations -- including *indirect* soft deprecations that
# deprecate_soft() keeps silent for users -- now fail their test outright
# instead of going unnoticed until the hard-deprecation release.
#
# The escape hatches stay intact:
# - lifecycle::expect_deprecated() pins lifecycle_verbosity = "warning"
#   internally, so asserted deprecations keep working;
# - snapshot tests set rlang::local_options(lifecycle_verbosity = "warning")
#   to record the warning text;
# - a test can opt out with rlang::local_options(lifecycle_verbosity = "quiet").
local({
  ns <- asNamespace("testthat")
  orig <- get("local_reproducible_output", envir = ns)
  if (isTRUE(attr(orig, "igraph_lifecycle_errors"))) {
    return(invisible())
  }
  wrapped <- function(..., .env = parent.frame()) {
    orig(..., .env = .env)
    withr::local_options(lifecycle_verbosity = "error", .local_envir = .env)
  }
  attr(wrapped, "igraph_lifecycle_errors") <- TRUE
  unlockBinding("local_reproducible_output", ns)
  assign("local_reproducible_output", wrapped, envir = ns)
  lockBinding("local_reproducible_output", ns)
})

# Outside test_that() blocks (helper/setup-time code), surface deprecations
# as warnings so they are at least visible in the test log.
options(lifecycle_verbosity = "warning")
