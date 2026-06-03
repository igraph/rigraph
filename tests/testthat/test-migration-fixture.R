# Tests for the in-place argument-migration generator (tools/generate-migrations.R)
# via the fixture `migration_fixture()` (R/migration-fixture.R). Old signature
# f(graph, n, weight, kind, directed); new f(graph, n, ..., weights, type,
# directed) with weight -> weights and kind -> type (directed survives). The
# head args (graph, n) stay before `...` and are matched by base R.

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

test_that("renamed-away old names are recovered by name", {
  rlang::local_options(lifecycle_verbosity = "warning")
  lifecycle::expect_deprecated(res <- migration_fixture("g", 5, weight = 1:3))
  expect_equal(res$weights, 1:3)
  lifecycle::expect_deprecated(res <- migration_fixture("g", 5, kind = "in"))
  expect_equal(res$type, "in")
})

test_that("abbreviations are recovered by partial match", {
  rlang::local_options(lifecycle_verbosity = "warning")
  lifecycle::expect_deprecated(res <- migration_fixture("g", 5, kin = "in"))
  expect_equal(res$type, "in")
  lifecycle::expect_deprecated(res <- migration_fixture("g", 5, dir = TRUE))
  expect_true(res$directed)
})

test_that("positional and named recovery can be mixed in one call", {
  rlang::local_options(lifecycle_verbosity = "warning")
  lifecycle::expect_deprecated(
    res <- migration_fixture("g", 5, 1:3, dir = TRUE)
  )
  expect_equal(res$weights, 1:3)
  expect_true(res$directed)
  expect_equal(res$type, "out")
})

test_that("head args are matched by base R, including abbreviations", {
  rlang::local_options(lifecycle_verbosity = "warning")
  # Abbreviating a head arg (before `...`) is plain R partial matching: it is
  # resolved silently and is *not* deprecated.
  expect_no_warning(res <- migration_fixture(gr = "G", n = 5))
  expect_equal(res$graph, "G")

  # A head abbreviation alongside a recovered tail arg: head stays silent, the
  # tail arg is recovered with a single deprecation.
  lifecycle::expect_deprecated(
    res <- migration_fixture(g = "G", 5, kind = "in")
  )
  expect_equal(res$graph, "G")
  expect_equal(res$type, "in")
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
  expect_snapshot(x <- migration_fixture("g", 5, kind = "in"))
  expect_snapshot(x <- migration_fixture("g", 5, kin = "in"))
  expect_snapshot(x <- migration_fixture("g", 5, dir = TRUE))
  # mixed: a positional value and a named abbreviation in the same call
  expect_snapshot(x <- migration_fixture("g", 5, 1:3, dir = TRUE))
  # head abbreviation (g -> graph, by base R) does not appear in the message
  expect_snapshot(x <- migration_fixture(g = "G", 5, kind = "in"))
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
    recover_old = c("weight", "kind", "directed"),
    match_names = c("weight", "kind", "weights", "type", "directed"),
    match_to = c("weights", "type", "weights", "type", "directed"),
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
    "migration_fixture\\(graph, n, weight, kind, directed\\)"
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

test_that("render_call_arg() wraps long arguments the way air formats them", {
  # The fixture's args stay under the 80-col width, but a real migration with
  # more arguments overflows; the renderer must wrap exactly as `air` would so
  # the after-install drift check (generator output vs air-formatted source)
  # stays clean. `splice_blocks()` prepends 2 spaces to every block line, which
  # the fit test accounts for.
  generator <- testthat::test_path("..", "..", "tools", "generate-migrations.R")
  skip_if_not(file.exists(generator))
  gen_env <- new.env()
  sys.source(generator, envir = gen_env)

  # Short -> single line.
  short <- gen_env$render_call_arg(
    "head_args",
    "c",
    c('"graph"', '"n"'),
    "character(0)"
  )
  expect_identical(short, '    head_args = c("graph", "n"),')

  # Empty -> the supplied literal, on a single line (never `c()`/`list()`).
  empty <- gen_env$render_call_arg(
    "recover_old",
    "c",
    character(0),
    "character(0)"
  )
  expect_identical(empty, "    recover_old = character(0),")

  # Long -> one item per line, opening/closing on their own lines, and every
  # emitted line (plus the 2-space splice indent) stays within 80 cols.
  items <- c(
    "weights = weights",
    "attr = attr",
    "edges = edges",
    "names = names",
    "sparse = sparse"
  )
  wrapped <- gen_env$render_call_arg("current", "list", items, "list()")
  expect_gt(length(wrapped), 1L)
  expect_identical(wrapped[[1]], "    current = list(")
  expect_identical(wrapped[[length(wrapped)]], "    ),")
  expect_identical(
    wrapped[2:6],
    paste0("      ", items, c(",", ",", ",", ",", ""))
  )
  expect_true(all(nchar(wrapped) + 2L <= 80L))
})
