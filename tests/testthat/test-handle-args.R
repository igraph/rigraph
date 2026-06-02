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

# ---- migrate_recover_args() helper (the engine behind the blocks) ----------

# Config equivalent to the fixture, for exercising the helper directly.
fixture_args <- function(dots, current = list(c_renamed = NULL, d = NULL)) {
  migrate_recover_args(
    dots,
    current = current,
    recover_new = c("c_renamed", "d"),
    recover_old = c("c", "d"),
    match_names = c("c", "c_renamed", "d"),
    match_to = c("c_renamed", "c_renamed", "d"),
    defaults = list(c_renamed = NULL, d = NULL),
    head_args = c("a", "b"),
    fn_name = "migration_fixture"
  )
}

test_that("migrate_recover_args() returns NULL when there is nothing to recover", {
  expect_null(fixture_args(list()))
})

test_that("migrate_recover_args() returns recovered values and message parts", {
  res <- fixture_args(list(3, 4))
  expect_equal(res$values, list(c_renamed = 3, d = 4))
  expect_match(res$what, "positional or abbreviated")
  expect_match(res$details[[1]], "migration_fixture\\(a, b, c, d\\)")
  expect_match(res$details[[2]], "c_renamed = , d = ")
})

test_that("migrate_recover_args() errors on an ambiguous abbreviation", {
  expect_error(
    migrate_recover_args(
      list(alph = 2),
      current = list(alpha = NULL, alphabet = NULL),
      recover_new = c("alpha", "alphabet"),
      recover_old = c("alpha", "alphabet"),
      match_names = c("alpha", "alphabet"),
      match_to = c("alpha", "alphabet"),
      defaults = list(alpha = NULL, alphabet = NULL),
      head_args = "x",
      fn_name = "amb_fixture"
    ),
    "matches multiple"
  )
})

test_that("migrate_recover_args() errors on unknown, conflict, and overflow", {
  expect_error(fixture_args(list(foo = 5)), "Unexpected argument")
  expect_error(
    fixture_args(list(3), current = list(c_renamed = "kw", d = NULL)),
    "supplied more than once"
  )
  expect_error(fixture_args(list(1, 2, 3)), "Too many arguments")
})

test_that("the BEGIN marker may carry a trailing note", {
  generator <- testthat::test_path("..", "..", "tools", "generate-migrations.R")
  skip_if_not(file.exists(generator))
  gen_env <- new.env()
  sys.source(generator, envir = gen_env)

  m <- regmatches(
    "  # BEGIN GENERATED ARG_HANDLE: foo, do not edit, see x",
    regexec(
      gen_env$begin_re,
      "  # BEGIN GENERATED ARG_HANDLE: foo, do not edit, see x"
    )
  )[[1]]
  expect_identical(m[[3]], "foo")
})
