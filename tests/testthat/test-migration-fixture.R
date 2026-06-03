# Tests for the in-place argument-migration generator (tools/generate-migrations.R)
# via the fixture `migration_fixture()` (R/migration-fixture.R). Old signature
# f(graph, n, weight, type, directed); new f(graph, n, ..., weights, type,
# directed) with weight -> weights.

# ---- behaviour --------------------------------------------------------------

test_that("a correct new-API call is returned unchanged (and is silent)", {
  rlang::local_options(lifecycle_verbosity = "warning")
  expect_no_warning(
    res <- migration_fixture(
      "g",
      5,
      weights = 1:3,
      type = "in",
      directed = TRUE
    )
  )
  expect_equal(
    res,
    list(graph = "g", n = 5, weights = 1:3, type = "in", directed = TRUE)
  )
})

test_that("empty dots fall back to the formal defaults", {
  expect_equal(
    migration_fixture("g", 5),
    list(graph = "g", n = 5, weights = NULL, type = "out", directed = FALSE)
  )
})

test_that("a legacy positional call is recovered", {
  rlang::local_options(lifecycle_verbosity = "warning")
  lifecycle::expect_deprecated(
    res <- migration_fixture("g", 5, 1:3, "in", TRUE)
  )
  expect_equal(
    res,
    list(graph = "g", n = 5, weights = 1:3, type = "in", directed = TRUE)
  )
})

test_that("a renamed-away old name and abbreviations are recovered by name", {
  rlang::local_options(lifecycle_verbosity = "warning")
  lifecycle::expect_deprecated(res <- migration_fixture("g", 5, weight = 1:3))
  expect_equal(res$weights, 1:3)
  lifecycle::expect_deprecated(res <- migration_fixture("g", 5, ty = "in"))
  expect_equal(res$type, "in")
  lifecycle::expect_deprecated(res <- migration_fixture("g", 5, dir = TRUE))
  expect_true(res$directed)
})

test_that("recovery emits a single deprecation warning, not one per slot", {
  rlang::local_options(lifecycle_verbosity = "warning")
  warnings <- character()
  withCallingHandlers(
    migration_fixture("g", 5, 1:3, "in", TRUE),
    lifecycle_warning_deprecated = function(w) {
      warnings <<- c(warnings, conditionMessage(w))
      invokeRestart("muffleWarning")
    }
  )
  expect_length(warnings, 1L)
})

# ---- deprecation message snapshots -----------------------------------------

test_that("recovery deprecation messages", {
  rlang::local_options(lifecycle_verbosity = "warning")
  expect_snapshot(x <- migration_fixture("g", 5, 1:3, "in", TRUE))
  expect_snapshot(x <- migration_fixture("g", 5, 1:3))
  expect_snapshot(x <- migration_fixture("g", 5, weight = 1:3))
  expect_snapshot(x <- migration_fixture("g", 5, ty = "in"))
  expect_snapshot(x <- migration_fixture("g", 5, dir = TRUE))
})

test_that("error message snapshots", {
  expect_snapshot(migration_fixture("g", 5, weig = 1), error = TRUE)
  expect_snapshot(migration_fixture("g", 5, foo = 1), error = TRUE)
  expect_snapshot(migration_fixture("g", 5, 1:3, weights = 9), error = TRUE)
  expect_snapshot(migration_fixture("g", 5, 1, 2, 3, 4), error = TRUE)
})

# ---- migrate_recover_args() helper (the engine behind the blocks) ----------

# Config equivalent to the fixture, for exercising the helper directly.
fixture_args <- function(
  dots,
  current = list(weights = NULL, type = "out", directed = FALSE)
) {
  migrate_recover_args(
    dots,
    current = current,
    recover_new = c("weights", "type", "directed"),
    recover_old = c("weight", "type", "directed"),
    match_names = c("weight", "weights", "type", "directed"),
    match_to = c("weights", "weights", "type", "directed"),
    defaults = list(weights = NULL, type = "out", directed = FALSE),
    head_args = c("graph", "n"),
    fn_name = "migration_fixture"
  )
}

test_that("migrate_recover_args() returns NULL when there is nothing to recover", {
  expect_null(fixture_args(list()))
})

test_that("migrate_recover_args() returns recovered values and message parts", {
  res <- fixture_args(list(1:3, "in", TRUE))
  expect_equal(res$values, list(weights = 1:3, type = "in", directed = TRUE))
  expect_match(res$what, "positional or abbreviated")
  expect_match(
    res$details[[1]],
    "migration_fixture\\(graph, n, weight, type, directed\\)"
  )
  expect_match(res$details[[2]], "weights = , type = , directed = ")
})

test_that("migrate_recover_args() errors on unknown, ambiguous, conflict, overflow", {
  expect_error(fixture_args(list(foo = 5)), "Unexpected argument")
  expect_error(fixture_args(list(weig = 1)), "matches multiple")
  expect_error(
    fixture_args(
      list(1:3),
      current = list(weights = 9, type = "out", directed = FALSE)
    ),
    "supplied more than once"
  )
  expect_error(fixture_args(list(1, 2, 3, 4)), "Too many arguments")
})

# ---- generator-level tests (source checkout only) --------------------------

test_that("the generated block is in sync with the registry", {
  # tools/ is excluded from the built package (.Rbuildignore), so this only runs
  # from a source checkout (local dev + CI). The after-install action guards
  # drift in CI.
  generator <- testthat::test_path("..", "..", "tools", "generate-migrations.R")
  skip_if_not(file.exists(generator))

  gen_env <- new.env()
  sys.source(generator, envir = gen_env)
  registry <- testthat::test_path("..", "..", "tools", "migrations.R")
  migrations <- gen_env$load_migrations(registry)
  by_fn <- stats::setNames(
    migrations,
    vapply(migrations, function(e) e$fn, character(1))
  )

  fixture <- testthat::test_path("..", "..", "R", "migration-fixture.R")
  lines <- readLines(fixture, warn = FALSE)
  spliced <- gen_env$splice_blocks(lines, by_fn)
  expect_identical(spliced$lines, lines)
})

test_that("the BEGIN marker may carry a trailing note", {
  generator <- testthat::test_path("..", "..", "tools", "generate-migrations.R")
  skip_if_not(file.exists(generator))
  gen_env <- new.env()
  sys.source(generator, envir = gen_env)

  marker <- "  # BEGIN GENERATED ARG_HANDLE: foo, do not edit, see x"
  m <- regmatches(marker, regexec(gen_env$begin_re, marker))[[1]]
  expect_identical(m[[3]], "foo")
})
