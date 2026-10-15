# Pin print options for the whole test suite so output is deterministic and
# independent of the package defaults. `print.style = "classic"` keeps the
# historical `IGRAPH ... DNW-` output that most snapshots assert against; the
# cli-styled output is exercised explicitly in test-print-cli.R. `print.id`
# is pinned off because the 7-character graph id is non-deterministic.
igraph_options(print.style = "classic", print.id = FALSE)

# Establish a baseline global RNG state so `.Random.seed` always exists before
# any test runs. Without this, the first test to touch the RNG would *create*
# `.Random.seed` from nothing (many igraph C functions initialise the RNG even
# when they don't draw from it, e.g. voronoi_cells()), which the seed-leak check
# below would flag. Restoring that absent state (as igraph_local_seed() faithfully
# does when `before` was NULL) just pushes the creation onto the next test -- a
# whack-a-mole. Pinning a baseline here means only tests that genuinely *advance*
# the seed need igraph_local_seed().
set.seed(42)

# `igraph_local_seed()` (and its `restore_rng_state()` helper) live in helper.R
# so they are visible both to test code and to helper functions that call them.

# The seed-leak check is opt-in: only a dedicated CI runner sets
# IGRAPH_CHECK_RNG_STATE=true (see #2713). Keeping it gated (rather than
# always-on) means a stray leak doesn't block unrelated local test runs, while
# the dedicated runner still catches regressions.
if (Sys.getenv("IGRAPH_CHECK_RNG_STATE") == "true") {
  # Check that tests don't change the random seed.
  test_that <- function(name, code) {
    # Forward the block to testthat as a literal language object. Do NOT use
    # rlang::inject(testthat::test_that(name, !!code)) here: inject() walks the
    # whole expression and eagerly processes every injection operator (!!, !!!,
    # {{) in the test body. A test line like `set_vertex_attrs(g, !!!attr_list)`
    # would then be spliced in *this* frame -- where `attr_list` doesn't exist
    # yet -- giving "object 'attr_list' not found". Building the call with the
    # captured block embedded as a literal hands it to testthat untouched, so
    # those operators run at test time in the test's own scope.
    code <- substitute(code)
    before_state <- get0(".Random.seed", envir = .GlobalEnv, inherits = FALSE)
    eval(
      as.call(list(quote(testthat::test_that), name, code)),
      envir = parent.frame()
    )
    after_state <- get0(".Random.seed", envir = .GlobalEnv, inherits = FALSE)
    expect_identical(
      before_state,
      after_state,
      info = paste0("Test '", name, "' changed the random seed")
    )
  }
}
