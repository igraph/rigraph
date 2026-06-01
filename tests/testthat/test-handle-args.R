# Tests for the generated argument-migration helpers (tools/generate-migrations.R).
#
# These exercise the test fixture `handle_args_migration_fixture()`, generated
# from the `migration_fixture` entry in tools/migrations.R. Old signature:
# f(a, b, c, d); new signature: f(a, b, ..., c_renamed, d) with c -> c_renamed.

test_that("pure new-API call returns the bindings unchanged", {
  expect_equal(
    handle_args_migration_fixture(a = 1, b = 2, c_renamed = 3, d = 4),
    list(a = 1, b = 2, c_renamed = 3, d = 4)
  )
})

test_that("empty dots fall back to the formal defaults", {
  expect_equal(
    handle_args_migration_fixture(a = 1, b = 2),
    list(a = 1, b = 2, c_renamed = NULL, d = NULL)
  )
})

test_that("a named extension in `...` errors via check_dots_empty()", {
  expect_error(
    handle_args_migration_fixture(1, 2, c_renamed = 3, d = 4, foo = 5),
    class = "rlib_error_dots_nonempty"
  )
})

test_that("a legacy positional call is recovered with one soft-deprecation", {
  rlang::local_options(lifecycle_verbosity = "warning")

  lifecycle::expect_deprecated(
    res <- handle_args_migration_fixture(1, 2, 3, 4),
    "migration_fixture"
  )
  expect_equal(res, list(a = 1, b = 2, c_renamed = 3, d = 4))
})

test_that("a legacy positional call recovering a single slot still works", {
  rlang::local_options(lifecycle_verbosity = "warning")

  lifecycle::expect_deprecated(
    res <- handle_args_migration_fixture(1, 2, 99)
  )
  expect_equal(res, list(a = 1, b = 2, c_renamed = 99, d = NULL))
})

test_that("recovery only fires one deprecation warning, not one per slot", {
  rlang::local_options(lifecycle_verbosity = "warning")

  warnings <- character()
  withCallingHandlers(
    handle_args_migration_fixture(1, 2, 3, 4),
    lifecycle_warning_deprecated = function(w) {
      warnings <<- c(warnings, conditionMessage(w))
      invokeRestart("muffleWarning")
    }
  )
  expect_length(warnings, 1L)
})

test_that("supplying a slot both positionally and by its new keyword errors", {
  expect_error(
    handle_args_migration_fixture(1, 2, 3, c_renamed = "kw"),
    "both positionally and as"
  )
})

test_that("too many positional arguments errors", {
  expect_error(
    handle_args_migration_fixture(1, 2, 3, 4, 5),
    "Too many arguments"
  )
})

test_that(".user_env controls whether the soft-deprecation surfaces", {
  # Gotcha: lifecycle::deprecate_soft() only signals when is_direct(user_env) is
  # TRUE -- a package-internal `user_env` is swallowed *even under*
  # lifecycle_verbosity = "warning" (it gates on `direct` before honouring the
  # verbosity override). This is why the generated helper threads `.user_env`,
  # and why public callers must pass `.user_env = rlang::caller_env()` so it
  # resolves to the *user's* frame rather than the package namespace.
  rlang::local_options(lifecycle_verbosity = "warning")

  # A direct user env (the default here is this test's frame) -> warning fires.
  lifecycle::expect_deprecated(
    res <- handle_args_migration_fixture(1, 2, 3, 4)
  )
  expect_equal(res, list(a = 1, b = 2, c_renamed = 3, d = 4))

  # A package namespace user env -> suppressed, but recovery still happens.
  expect_no_warning(
    res <- handle_args_migration_fixture(1, 2, 3, 4, .user_env = asNamespace("igraph"))
  )
  expect_equal(res, list(a = 1, b = 2, c_renamed = 3, d = 4))
})

test_that("the generated helper is in sync with the registry", {
  # tools/ is excluded from the built package (.Rbuildignore), so this only runs
  # from a source checkout (local dev + CI). CI also guards drift via
  # .github/workflows/check-migrations.yaml.
  generator <- testthat::test_path("..", "..", "tools", "generate-migrations.R")
  skip_if_not(file.exists(generator))

  gen_env <- new.env()
  sys.source(generator, envir = gen_env)
  registry <- testthat::test_path("..", "..", "tools", "migrations.R")
  entries <- gen_env$load_migrations(registry)
  fixture <- Filter(function(e) e$fn == "migration_fixture", entries)[[1]]

  expected <- gen_env$render_migration(fixture)
  committed <- readLines(
    testthat::test_path("..", "..", "R", "handle-args-migration_fixture.R")
  )
  expect_identical(committed, expected)
})
