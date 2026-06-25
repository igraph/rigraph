# Pin print options for the whole test suite so output is deterministic and
# independent of the package defaults. `print.style = "classic"` keeps the
# historical `IGRAPH ... DNW-` output that most snapshots assert against; the
# cli-styled output is exercised explicitly in test-print-cli.R. `print.id`
# is pinned off because the 7-character graph id is non-deterministic.
igraph_options(print.style = "classic", print.id = FALSE)

if (Sys.getenv("IGRAPH_CHECK_RNG_STATE") == "true") {
  # Check that tests don't change the random seed
  test_that <- function(name, code) {
    code <- rlang::enexpr(code)
    before_state <- get0(".Random.seed", envir = .GlobalEnv, inherits = FALSE)
    rlang::inject(testthat::test_that(name, !!code))
    after_state <- get0(".Random.seed", envir = .GlobalEnv, inherits = FALSE)
    expect_identical(
      before_state,
      after_state,
      info = paste0("Test '", name, "' changed the random seed")
    )
  }
}
