# Unit tests for the registry loader in tools/generate-migrations.R.
# The generator is plain base R and only exists in a source checkout
# (tools/ is .Rbuildignore'd), so these tests are skipped in a built package.

local_generator <- function(env = parent.frame()) {
  generator <- testthat::test_path("..", "..", "tools", "generate-migrations.R")
  skip_if_not(file.exists(generator), "tools/generate-migrations.R not found")
  gen_env <- new.env()
  sys.source(generator, envir = gen_env)
  gen_env
}

write_registry <- function(dir, name, code) {
  path <- file.path(dir, name)
  writeLines(code, path)
  path
}

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

test_that("render_call_arg() wraps a single long item without a stray comma", {
  gen <- local_generator()
  long_item <- paste0(
    "impl = c(\"auto\", \"copy_and_delete\", \"create_from_scratch\")"
  )
  out <- gen$render_call_arg("defaults", "list", long_item, "list()")
  expect_identical(
    out,
    c(
      "    defaults = list(",
      paste0("      ", long_item),
      "    ),"
    )
  )
  # and no element is a bare comma
  expect_false(any(grepl("^\\s*,\\s*$", out)))
})

test_that("default expressions keep air's spacing around binary `/`", {
  gen <- local_generator()
  entry <- list(
    old = function(graph, agebins, base) {},
    new = function(
      graph,
      ...,
      agebins = n / 7100,
      base = "http://a/b"
    ) {},
    when = "3.0.0"
  )
  norm <- gen$normalise_migration("fn_slash", entry)
  expect_identical(norm$defaults$agebins, "n / 7100")
  # slashes inside string literals stay untouched
  expect_identical(norm$defaults$base, "\"http://a/b\"")
})
