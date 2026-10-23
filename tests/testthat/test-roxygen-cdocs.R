# The C-docs roclet of R/roxygen-cdocs.R.
# Both files are `.Rbuildignore`d, so only `testthat::test_local()` runs these,
# where `Config/Needs/roxygen2` is installed.

skip_if_not_installed("roxygen2")
skip_if_not_installed("treesitter")
skip_if_not_installed("treesitter.r")
skip_if_not_installed("xml2")

# A package root whose vendored C library reports `version`,
# and whose changelog lists `releases`.
local_engine <- function(
  version,
  releases = "0.10.17",
  env = parent.frame()
) {
  base_path <- withr::local_tempdir(.local_envir = env)
  dir.create(
    file.path(base_path, "src", "vendor", "cigraph"),
    recursive = TRUE
  )
  writeLines(
    c(
      "#ifndef IGRAPH_VERSION_H",
      sprintf("#define IGRAPH_VERSION \"%s\"", version),
      "#define IGRAPH_VERSION_MAJOR 0"
    ),
    file.path(base_path, "src", "vendor", "igraph_version.h")
  )
  writeLines(
    c(
      "# igraph C library changelog",
      "## [master]",
      sprintf("## [%s] - 2025-09-19", releases)
    ),
    file.path(base_path, "src", "vendor", "cigraph", "CHANGELOG.md")
  )
  base_path
}

# A cache of link tables holding one for each of `releases`,
# without a download.
local_clinks_cache <- function(releases = "0.10.17", env = parent.frame()) {
  withr::local_envvar(
    R_USER_CACHE_DIR = withr::local_tempdir(.local_envir = env),
    .local_envir = env
  )
  dir.create(c_links_cache_dir(), recursive = TRUE)
  for (release in releases) {
    utils::write.csv(
      data.frame(
        method = c("igraph_degree", "igraph_vcount"),
        url = sprintf(
          "https://igraph.org/c/html/%s/igraph-Basic.html#%s",
          release,
          c("igraph_degree", "igraph_vcount")
        )
      ),
      file.path(c_links_cache_dir(), paste0(release, ".csv")),
      row.names = FALSE
    )
  }
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

test_that("the releases come from the vendored changelog", {
  base_path <- local_engine("0.10.17", releases = c("0.10.17", "0.10.16"))
  expect_equal(c_releases(base_path), c("0.10.17", "0.10.16"))
})

test_that("a release links the cached table for it", {
  local_clinks_cache()
  clinks <- c_links(local_engine("0.10.17"))

  expect_named(clinks, c("method", "url"))
  expect_contains(clinks$method, "igraph_degree")
  expect_true(all(startsWith(clinks$url, "https://igraph.org/c/html/0.10.17/")))
})

test_that("a development snapshot links the manual of its tag, quietly", {
  local_clinks_cache()
  expect_silent(clinks <- c_links(local_engine("0.10.17-1-g16081ce60")))
  expect_identical(clinks, c_links(local_engine("0.10.17")))
})

test_that("a snapshot past the newest table keeps that table, and says so", {
  local_clinks_cache()
  expect_message(
    clinks <- c_links(local_engine("0.11.0-156-g4b67f79d4")),
    "linking the manual of 0.10.17"
  )
  expect_identical(clinks, c_links(local_engine("0.10.17")))
})

test_that("a release whose table cannot be downloaded keeps the newest one before it, with a warning", {
  local_clinks_cache()
  local_mocked_bindings(c_links_download = function(...) stop("offline"))
  expect_warning(
    clinks <- c_links(local_engine(
      "99.0.0",
      releases = c("99.0.0", "0.10.17")
    )),
    "linking the manual of 0.10.17"
  )
  expect_identical(clinks, c_links(local_engine("0.10.17")))
})

test_that("a version before every table is an error", {
  local_clinks_cache()
  local_mocked_bindings(c_links_download = function(...) stop("offline"))
  expect_error(
    c_links(local_engine("0.9.0", releases = "0.9.0")),
    "or an earlier release"
  )
})

test_that("a release missing from the cache is downloaded once", {
  local_clinks_cache(releases = character())
  downloaded <- character()
  local_mocked_bindings(c_links_download = function(version, ...) {
    downloaded <<- c(downloaded, version)
    utils::write.csv(
      data.frame(method = "igraph_degree", url = "u"),
      file.path(c_links_cache_dir(), paste0(version, ".csv")),
      row.names = FALSE
    )
  })

  c_links(local_engine("0.10.17-1-g16081ce60"))
  c_links(local_engine("0.10.17"))
  expect_equal(downloaded, "0.10.17")
})

test_that("callees are visited breadth first, by vertex index", {
  # `b` is numbered before `c`, having appeared first as a caller,
  # so it comes first among the callees of `a`, which calls `c` first.
  graph <- call_graph(
    from = c("a", "a", "b", "c", "c"),
    to = c("c", "b", "d_impl", "a", "e_impl")
  )

  expect_equal(graph$vertices, c("a", "b", "c", "d_impl", "e_impl"))
  expect_equal(
    reachable_functions(graph, "a"),
    c("a", "b", "c", "d_impl", "e_impl")
  )
  expect_equal(
    reachable_functions(graph, "c"),
    c("c", "a", "e_impl", "b", "d_impl")
  )
  expect_equal(find_impl("c", graph), c("e_impl", "d_impl"))
})

test_that("a function that is not defined reaches nothing", {
  graph <- call_graph(from = "a", to = "b_impl")

  expect_equal(reachable_functions(graph, "z"), character())
  expect_equal(find_impl("z", graph), character())
})

test_that("the walk visits functions in the order subcomponent() does", {
  set.seed(20261016)
  functions <- c(paste0("f", 1:30), paste0("g", 1:10, "_impl"))
  from <- sample(functions[1:30], 120, replace = TRUE)
  to <- sample(functions, 120, replace = TRUE)

  graph <- call_graph(from, to)
  reference <- graph_from_data_frame(data.frame(from = from, to = to))

  expect_equal(graph$vertices, V(reference)$name)
  for (start in graph$vertices) {
    expect_equal(
      reachable_functions(graph, start),
      names(subcomponent(reference, start, mode = "out"))
    )
  }
})

test_that("the call graph comes from the function definitions under R/", {
  base_path <- withr::local_tempdir()
  dir.create(file.path(base_path, "R"))
  writeLines(
    c(
      "outer <- function(x) inner(x)",
      "inner <- function(x) {",
      "  list(degree_impl(x), vcount_impl(x))",
      "}"
    ),
    file.path(base_path, "R", "a.R")
  )

  graph <- r_call_graph(base_path)

  expect_equal(
    reachable_functions(graph, "outer"),
    c("outer", "inner", "list", "degree_impl", "vcount_impl")
  )
})

test_that("the roclet links the C functions a topic reaches", {
  local_clinks_cache()
  base_path <- local_engine("0.10.17-1-g16081ce60")
  writeLines(
    c(
      "Package: minipkg",
      "Title: Test",
      "Version: 0.0.1",
      "Description: Test.",
      "License: MIT",
      "Encoding: UTF-8"
    ),
    file.path(base_path, "DESCRIPTION")
  )
  dir.create(file.path(base_path, "R"))
  writeLines(
    c(
      "#' Degrees",
      "#'",
      "#' @param graph A graph.",
      "#' @returns The degrees.",
      "#' @export",
      "my_degree <- function(graph) {",
      "  count_degrees(graph)",
      "}",
      "",
      "count_degrees <- function(graph) {",
      "  degree_impl(graph)",
      "}",
      "",
      "degree_impl <- function(graph) NULL"
    ),
    file.path(base_path, "R", "degree.R")
  )

  # `docs_rd` is found on the search path, where the package under test is
  # attached, whatever its flavored name.
  suppressMessages(roxygen2::roxygenize(
    base_path,
    roclets = "docs_rd",
    load_code = "source"
  ))

  rd <- readLines(file.path(base_path, "man", "my_degree.Rd"))
  expect_contains(rd, "\\section{Related documentation in the C library}{")
  expect_contains(
    rd,
    "\\href{https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_degree}{\\code{degree()}}"
  )
})
