# A package root whose vendored C library reports `version`.
local_engine <- function(version, env = parent.frame()) {
  base_path <- withr::local_tempdir(.local_envir = env)
  dir.create(file.path(base_path, "src", "vendor"), recursive = TRUE)
  writeLines(
    c(
      "#ifndef IGRAPH_VERSION_H",
      sprintf("#define IGRAPH_VERSION \"%s\"", version),
      "#define IGRAPH_VERSION_MAJOR 0"
    ),
    file.path(base_path, "src", "vendor", "igraph_version.h")
  )
  base_path
}

test_that("a development snapshot maps to the release of its tag", {
  expect_equal(c_docs_version("0.10.17-1-g16081ce60"), "0.10.17")
  expect_equal(c_docs_version("0.11.0-156-g4b67f79d4"), "0.11.0")
  expect_equal(c_docs_version("1.0.0-rc.1-3-gabcdef0"), "1.0.0-rc.1")
  expect_equal(c_docs_version("0.10.17-1-g16081ce60-dirty"), "0.10.17")
})

test_that("a release maps to itself", {
  expect_equal(c_docs_version("0.10.17"), "0.10.17")
  expect_equal(c_docs_version("1.0.0"), "1.0.0")
  expect_equal(c_docs_version("1.0.0-rc.1"), "1.0.0-rc.1")
  expect_equal(c_docs_version("1.0.0-rc1"), "1.0.0-rc1")
})

test_that("a version without a table is served by the newest release before it", {
  releases <- c("0.10.16", "0.10.17", "1.0.1")

  expect_equal(c_links_release("0.10.17", releases), "0.10.17")
  expect_equal(c_links_release("0.11.0", releases), "0.10.17")
  expect_equal(c_links_release("1.0.0", releases), "0.10.17")
  expect_equal(c_links_release("1.0.0-rc1", c(releases, "1.0.0")), "0.10.17")
  expect_equal(c_links_release("1.0.2", c("1.0.0", "1.0.0-rc1")), "1.0.0")
  expect_identical(c_links_release("0.10.15", releases), NA_character_)
})

test_that("a release links the table this package carries for it", {
  clinks <- c_links(local_engine("0.10.17"))

  expect_named(clinks, c("method", "url"))
  expect_contains(clinks$method, "igraph_degree")
  expect_true(all(startsWith(clinks$url, "https://igraph.org/c/html/0.10.17/")))
})

test_that("a development snapshot links the manual of its tag, quietly", {
  expect_silent(clinks <- c_links(local_engine("0.10.17-1-g16081ce60")))
  expect_identical(clinks, c_links(local_engine("0.10.17")))
})

test_that("a snapshot past the newest table keeps that table, and says so", {
  expect_message(
    clinks <- c_links(local_engine("0.11.0-156-g4b67f79d4")),
    "linking the manual of 0.10.17"
  )
  expect_identical(clinks, c_links(local_engine("0.10.17")))
})

test_that("a release without a table keeps the newest one before it, with a warning", {
  expect_warning(
    clinks <- c_links(local_engine("99.0.0")),
    "linking the manual of 0.10.17"
  )
  expect_identical(clinks, c_links(local_engine("0.10.17")))
})

test_that("a version before every table is an error", {
  expect_error(c_links(local_engine("0.9.0")), "or an earlier release")
})
