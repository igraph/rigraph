# Unit tests for the registry loader in tools/generate-migrations.R.
# The generator is plain base R and only exists in a source checkout
# (tools/ is .Rbuildignore'd), so these tests are skipped in a built package.

# The `local_generator()` and `write_registry()` helpers used below live in
# helper-test-functions.R.

test_that("migration_registry_files() finds the legacy file and topic files", {
  gen <- local_generator()
  root <- withr::local_tempdir()
  dir.create(file.path(root, "tools", "migrations"), recursive = TRUE)

  expect_identical(gen$migration_registry_files(root), character(0))

  legacy <- write_registry(
    file.path(root, "tools"),
    "migrations.R",
    "migrations <- list()"
  )
  b <- write_registry(
    file.path(root, "tools", "migrations"),
    "b-topic.R",
    "migrations <- list()"
  )
  a <- write_registry(
    file.path(root, "tools", "migrations"),
    "a-topic.R",
    "migrations <- list()"
  )

  # legacy first, then topic files sorted by path
  expect_identical(gen$migration_registry_files(root), c(legacy, a, b))
})

test_that("load_migrations() merges entries across registry files", {
  gen <- local_generator()
  dir <- withr::local_tempdir()

  one <- write_registry(
    dir,
    "one.R",
    c(
      "migrations <- list(",
      "  fn_one = list(",
      "    old = function(x, a) {},",
      "    new = function(x, ..., a = 1) {},",
      "    when = '3.0.0'",
      "  )",
      ")"
    )
  )
  two <- write_registry(
    dir,
    "two.R",
    c(
      "migrations <- list(",
      "  fn_two = list(",
      "    old = function(y, b) {},",
      "    new = function(y, ..., b = 2) {},",
      "    when = '3.0.0'",
      "  )",
      ")"
    )
  )

  merged <- gen$load_migrations(c(one, two))
  expect_named(merged, c("fn_one", "fn_two"))
  expect_identical(merged$fn_two$head, "y")
})

test_that("load_migrations() rejects duplicate entries across files", {
  gen <- local_generator()
  dir <- withr::local_tempdir()

  entry <- c(
    "migrations <- list(",
    "  fn_dup = list(",
    "    old = function(x, a) {},",
    "    new = function(x, ..., a = 1) {},",
    "    when = '3.0.0'",
    "  )",
    ")"
  )
  one <- write_registry(dir, "one.R", entry)
  two <- write_registry(dir, "two.R", entry)

  expect_error(
    gen$load_migrations(c(one, two)),
    "Duplicate migration entry across registry files: fn_dup"
  )
})

test_that("load_migrations() rejects files without a migrations list", {
  gen <- local_generator()
  dir <- withr::local_tempdir()

  bad <- write_registry(dir, "bad.R", "not_migrations <- list()")
  expect_error(
    gen$load_migrations(bad),
    "must define a `migrations` list"
  )
})

test_that("load_migrations() tolerates empty registries", {
  gen <- local_generator()
  dir <- withr::local_tempdir()

  empty <- write_registry(dir, "empty.R", "migrations <- list()")
  expect_identical(gen$load_migrations(empty), list())
  expect_identical(gen$load_migrations(character(0)), list())
})

test_that("default expressions keep air's spacing around binary `/`", {
  # The constant-defaults rule keeps arithmetic like `n / 7100` out of real
  # registries, but the renderer must stay air-clean for any deparsed
  # expression, so exercise the helpers directly.
  gen <- local_generator()
  fmls <- formals(function(agebins = n / 7100, base = "http://a/b") {})
  expect_identical(gen$default_expr(fmls, "agebins"), "n / 7100")
  # slashes inside string literals stay untouched
  expect_identical(gen$default_expr(fmls, "base"), "\"http://a/b\"")
})

test_that("is_constant_default() classifies expressions", {
  gen <- local_generator()
  const <- alist(
    NULL,
    TRUE,
    1,
    -1,
    "out",
    NA,
    NA_character_,
    Inf,
    c("a", "b"),
    c(1, -2.5),
    list(),
    (2),
    deprecated(),
    lifecycle::deprecated(),
    # typed empty vectors: the canonical spelling of an empty sequence
    logical(),
    integer(),
    numeric(),
    double(),
    complex(),
    character(),
    raw()
  )
  for (e in const) {
    expect_true(gen$is_constant_default(e), label = deparse(e))
  }
  nonconst <- alist(
    igraph_opt("sparsematrices"),
    V(graph),
    bins * 2,
    new.env(),
    stats::runif(1),
    rep(0, 3),
    sqrt(.Machine$double.eps),
    .Machine$double.eps,
    x,
    T,
    c(1, n),
    # not empty constructors: sized or converting calls stay non-constant
    numeric(2),
    integer(n),
    vector("numeric")
  )
  for (e in nonconst) {
    expect_false(gen$is_constant_default(e), label = deparse(e))
  }
})

test_that("non-constant defaults are rejected, with no escape hatch", {
  gen <- local_generator()
  entry <- list(
    old = function(graph, vids) {},
    new = function(graph, ..., vids = V(graph)) {},
    when = "3.0.0"
  )
  expect_error(
    gen$normalise_migration("fn_nc", entry),
    "non-constant default"
  )

  # the constant replacement passes
  entry$new <- function(graph, ..., vids = NULL) {}
  expect_silent(norm <- gen$normalise_migration("fn_nc", entry))
  expect_identical(norm$tail, "vids")

  # the retired grandfather field is called out explicitly
  entry$nonconst_defaults <- "vids"
  expect_error(
    gen$normalise_migration("fn_nc", entry),
    "not supported"
  )
})
