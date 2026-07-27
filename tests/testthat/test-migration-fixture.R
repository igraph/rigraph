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

test_that("head args go through base R partial matching, not our recovery", {
  # Abbreviating a head arg (before `...`) is plain R partial matching, not our
  # recovery. With `warnPartialMatchArgs` on, R emits its own partial-match
  # warning and our deprecation does not fire; when a tail arg is abbreviated
  # too, both warnings appear -- R's for the head, ours for the tail.
  rlang::local_options(
    lifecycle_verbosity = "warning",
    warnPartialMatchArgs = TRUE
  )
  expect_snapshot(migration_fixture(gr = "G", n = 5))
  expect_snapshot(migration_fixture(g = "G", 5, kind = "in"))
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

# ---- prefix-overlap fixture -------------------------------------------------

# migration_fixture_prefix(dimvector, p, ..., dim = NULL, permutation = NULL):
# `dim` is a strict prefix of the head arg `dimvector`, `p` is a strict prefix
# of the recoverable `permutation`. Previously the generator rejected such
# signatures outright; now it allows them and enumerates the forbidden
# prefixes (`d`, `di`), which error only when legacy arguments in `...`
# engage the recovery layer.

test_that("full tail names bind exactly despite the head prefix overlap", {
  expect_no_condition(
    res <- migration_fixture_prefix(c(2, 2), 0.5, dim = 2)
  )
  expect_equal(
    res,
    list(dimvector = c(2, 2), p = 0.5, dim = 2, permutation = NULL)
  )
})

test_that("legacy positional calls are recovered across the overlap", {
  rlang::local_options(lifecycle_verbosity = "warning")
  lifecycle::expect_deprecated(
    res <- migration_fixture_prefix(c(2, 2), 0.5, 2, "perm")
  )
  expect_equal(
    res,
    migration_fixture_prefix(c(2, 2), 0.5, dim = 2, permutation = "perm")
  )
})

test_that("abbreviations longer than the head arg are recovered", {
  rlang::local_options(lifecycle_verbosity = "warning")
  # `perm` is no prefix of the head `p`, so it reaches `...` and recovery.
  lifecycle::expect_deprecated(
    res <- migration_fixture_prefix(c(2, 2), 0.5, perm = "x")
  )
  expect_identical(res$permutation, "x")
})

test_that("forbidden prefixes error only when legacy arguments engage recovery", {
  # `di =` steals the head slot `dimvector`, `c(2, 2)` shifts into `p`,
  # and `0.5` lands in `...`:
  # recovery would rescue this never-valid call behind a deprecation
  # warning, so the guard errors instead.
  expect_snapshot(
    migration_fixture_prefix(c(2, 2), 0.5, di = 2),
    error = TRUE
  )
  # A named legacy argument in `...` engages recovery just the same.
  expect_error(
    migration_fixture_prefix(c(2, 2), 0.5, d = 2, perm = "x"),
    "matches multiple formal arguments"
  )
})

test_that("forbidden prefixes with empty dots bind the head arg silently", {
  # Previously broken calls that now work in a well-defined, silent way
  # are accepted:
  # `d =` was an ambiguity error under the old signature and now binds
  # `dimvector` via ordinary base R partial matching.
  # Only the warning-rescued combination -- a forbidden prefix plus legacy
  # arguments in `...` -- stays an error.
  expect_no_condition(res <- migration_fixture_prefix(d = c(2, 2), p = 0.5))
  expect_equal(
    res,
    list(dimvector = c(2, 2), p = 0.5, dim = NULL, permutation = NULL)
  )
})

test_that("the guard ignores calls without hazardous tags", {
  # Unnamed / fully named calls never trip the guard, including do.call().
  expect_no_condition(
    res <- do.call(migration_fixture_prefix, list(c(2, 2), 0.5))
  )
  expect_null(res$dim)
  expect_no_condition(
    migration_fixture_prefix(dimvector = c(2, 2), p = 0.5, dim = 1)
  )
})

# ---- deprecation message snapshots -----------------------------------------

test_that("recovery deprecation messages", {
  # No assignment, so the snapshot also shows the recovered values the call
  # resolved to.
  rlang::local_options(lifecycle_verbosity = "warning")
  expect_snapshot(migration_fixture("g", 5, 1:3, "in", TRUE))
  expect_snapshot(migration_fixture("g", 5, 1:3))
  expect_snapshot(migration_fixture("g", 5, weight = 1:3))
  expect_snapshot(migration_fixture("g", 5, kind = "in"))
  expect_snapshot(migration_fixture("g", 5, kin = "in"))
  expect_snapshot(migration_fixture("g", 5, dir = TRUE))
  # mixed: a positional value and a named abbreviation in the same call
  expect_snapshot(migration_fixture("g", 5, 1:3, dir = TRUE))
})

test_that("error message snapshots", {
  expect_snapshot(migration_fixture("g", 5, weig = 1), error = TRUE)
  expect_snapshot(migration_fixture("g", 5, foo = 1), error = TRUE)
  expect_snapshot(migration_fixture("g", 5, 1:3, weights = 9), error = TRUE)
  expect_snapshot(migration_fixture("g", 5, 1, 2, 3, 4), error = TRUE)
})

# ---- migrate_recover_args() helper (the engine behind the blocks) ----------

# `fixture_args()` (the config-equivalent wrapper) lives in
# helper-test-functions.R.

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
  registry <- gen_env$migration_registry_files(
    testthat::test_path("..", "..")
  )
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

test_that("normalise_migration() handles head/recoverable prefix overlaps", {
  # Head args are matched by base R (with partial matching) before `...`.
  # Exact matching protects full names, so prefix overlaps are allowed; the
  # generator enumerates the forbidden prefixes (strict prefixes of a head
  # arg that also prefix a recoverable name) for the runtime guard, which
  # rejects them only when legacy arguments in `...` engage recovery.
  generator <- testthat::test_path("..", "..", "tools", "generate-migrations.R")
  skip_if_not(file.exists(generator))
  gen_env <- new.env()
  sys.source(generator, envir = gen_env)

  # Head arg `type` is a prefix of the recoverable `typeof`: allowed. The
  # strict prefixes of `type` all prefix `typeof` too, so they are forbidden
  # in combination with legacy arguments in `...`.
  norm <- gen_env$normalise_migration(
    "head_prefix",
    list(
      old = function(graph, type, typeof) {},
      new = function(graph, type = "x", ..., typeof = NULL) {},
      when = "3.0.0"
    )
  )
  expect_identical(norm$forbidden_tags, c("t", "ty", "typ"))

  # Recoverable `type` is a prefix of the head arg `typeof`: allowed. A
  # supplied `type =` binds the post-`...` formal exactly; only the shorter
  # tags (which were ambiguous before) are enumerated.
  norm <- gen_env$normalise_migration(
    "recover_prefix",
    list(
      old = function(graph, typeof, type) {},
      new = function(graph, typeof = "x", ..., type = NULL) {},
      when = "3.0.0"
    )
  )
  expect_identical(norm$forbidden_tags, c("t", "ty", "typ"))

  # Sharing a leading letter (`graph` vs `groups`) enumerates the shared
  # prefixes too -- `f(g = )` binding `graph` is fine on its own, but not
  # when the recovery layer would rescue the rest of the call.
  norm <- gen_env$normalise_migration(
    "ok_shared_letter",
    list(
      old = function(graph, groups) {},
      new = function(graph, ..., groups = NULL) {},
      when = "3.0.0"
    )
  )
  expect_identical(norm$forbidden_tags, c("g", "gr"))

  # A tag that abbreviates two head args stays out of the forbidden list:
  # base R errors on it by itself before the body ever runs.
  norm <- gen_env$normalise_migration(
    "two_heads",
    list(
      old = function(g1, g2, graph.attr.comb) {},
      new = function(g1, g2, ..., graph.attr.comb = NULL) {},
      when = "3.0.0"
    )
  )
  expect_identical(norm$forbidden_tags, character(0))

  # No overlap at all: no tags, no guard.
  norm <- gen_env$normalise_migration(
    "no_overlap",
    list(
      old = function(graph, n, weights) {},
      new = function(graph, n, ..., weights = NULL) {},
      when = "3.0.0"
    )
  )
  expect_identical(norm$forbidden_tags, character(0))

  # A renamed-away old name that is a prefix of a head arg stays fatal: the
  # old name is no longer a formal, so a valid legacy `f(weight = )` would
  # silently bind the head arg -- no runtime guard can restore it.
  expect_error(
    gen_env$normalise_migration(
      "renamed_prefix",
      list(
        old = function(graph, weightx, weight = weights) {},
        new = function(graph, weightx = 1, ..., weights = NULL) {},
        when = "3.0.0"
      )
    ),
    "renamed-away"
  )
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
