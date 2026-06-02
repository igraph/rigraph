# Tests for the in-place argument-migration generator (tools/generate-migrations.R).
#
# These exercise the test fixture `migration_fixture()` (R/migration-fixture.R),
# whose body carries a generated ARG_HANDLE block. Old signature f(a, b, c, d);
# new signature f(a, b, ..., c_renamed, d) with c -> c_renamed.

test_that("pure new-API call returns the bindings unchanged", {
  expect_equal(
    migration_fixture(a = 1, b = 2, c_renamed = 3, d = 4),
    list(a = 1, b = 2, c_renamed = 3, d = 4)
  )
})

test_that("empty dots fall back to the formal defaults", {
  expect_equal(
    migration_fixture(a = 1, b = 2),
    list(a = 1, b = 2, c_renamed = NULL, d = NULL)
  )
})

test_that("a legacy positional call is recovered with one soft-deprecation", {
  rlang::local_options(lifecycle_verbosity = "warning")

  lifecycle::expect_deprecated(
    res <- migration_fixture(1, 2, 3, 4),
    "migration_fixture"
  )
  expect_equal(res, list(a = 1, b = 2, c_renamed = 3, d = 4))
})

test_that("a legacy positional call recovering a single slot still works", {
  rlang::local_options(lifecycle_verbosity = "warning")

  lifecycle::expect_deprecated(
    res <- migration_fixture(1, 2, 99)
  )
  expect_equal(res, list(a = 1, b = 2, c_renamed = 99, d = NULL))
})

test_that("a renamed-away old name is recovered by name", {
  rlang::local_options(lifecycle_verbosity = "warning")

  lifecycle::expect_deprecated(
    res <- migration_fixture(1, 2, c = 99)
  )
  expect_equal(res, list(a = 1, b = 2, c_renamed = 99, d = NULL))
})

test_that("an abbreviation of a new arg is recovered by partial match", {
  rlang::local_options(lifecycle_verbosity = "warning")

  lifecycle::expect_deprecated(
    res <- migration_fixture(1, 2, c_r = 42)
  )
  expect_equal(res, list(a = 1, b = 2, c_renamed = 42, d = NULL))
})

test_that("recovery emits a single deprecation warning, not one per slot", {
  rlang::local_options(lifecycle_verbosity = "warning")

  warnings <- character()
  withCallingHandlers(
    migration_fixture(1, 2, 3, 4),
    lifecycle_warning_deprecated = function(w) {
      warnings <<- c(warnings, conditionMessage(w))
      invokeRestart("muffleWarning")
    }
  )
  expect_length(warnings, 1L)
})

test_that("the inline deprecation fires for a direct user call", {
  # The spliced `deprecate_soft()` runs in the function's own frame, so its
  # default `user_env` (caller_env(2)) resolves to the caller -- here the test
  # frame, which lifecycle treats as a direct user call. No `.user_env` plumbing.
  rlang::local_options(lifecycle_verbosity = "warning")
  lifecycle::expect_deprecated(migration_fixture(1, 2, 3, 4))
})

test_that("an unknown named argument errors", {
  expect_error(
    migration_fixture(1, 2, foo = 5),
    "Unexpected argument"
  )
})

test_that("supplying a slot both positionally and by its new keyword errors", {
  expect_error(
    migration_fixture(1, 2, 3, c_renamed = "kw"),
    "supplied more than once"
  )
})

test_that("supplying a slot by two different names errors", {
  expect_error(
    migration_fixture(1, 2, c = 1, c_renamed = 2),
    "supplied more than once"
  )
})

test_that("too many positional arguments errors", {
  expect_error(
    migration_fixture(1, 2, 3, 4, 5),
    "Too many arguments"
  )
})

# ---- generator-level tests (source checkout only) --------------------------

test_that("the spliced block is in sync with the registry", {
  # tools/ is excluded from the built package (.Rbuildignore), so this only runs
  # from a source checkout (local dev + CI). The before-install action guards
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

test_that("an abbreviation matching multiple arguments errors", {
  # Built from an ad-hoc registry + source file so we don't ship a second
  # fixture.
  generator <- testthat::test_path("..", "..", "tools", "generate-migrations.R")
  skip_if_not(file.exists(generator))

  gen_env <- new.env()
  sys.source(generator, envir = gen_env)

  dir <- withr::local_tempdir()
  writeLines(
    c(
      "migrations <- list(",
      "  amb_fixture = list(",
      "    old = function(x, alpha, alphabet) {},",
      "    new = function(x, ..., alpha = NULL, alphabet = NULL) {},",
      "    when = \"3.0.0\"",
      "  )",
      ")"
    ),
    file.path(dir, "migrations.R")
  )
  writeLines(
    c(
      "amb_fixture <- function(x, ..., alpha = NULL, alphabet = NULL) {",
      "  # BEGIN GENERATED ARG_HANDLE: amb_fixture",
      "  # END GENERATED ARG_HANDLE",
      "  list(x = x, alpha = alpha, alphabet = alphabet)",
      "}"
    ),
    file.path(dir, "amb.R")
  )
  suppressMessages(
    gen_env$generate_migrations(file.path(dir, "migrations.R"), dir)
  )
  sys.source(file.path(dir, "amb.R"), envir = environment())

  expect_error(
    amb_fixture(1, alph = 2),
    "matches multiple"
  )
})
