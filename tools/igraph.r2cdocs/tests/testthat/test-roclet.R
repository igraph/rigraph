test_that("the roclet links the C functions a topic reaches", {
  base_path <- withr::local_tempdir()
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
  dir.create(file.path(base_path, "src", "vendor"), recursive = TRUE)
  writeLines(
    "#define IGRAPH_VERSION \"0.10.17-1-g16081ce60\"",
    file.path(base_path, "src", "vendor", "igraph_version.h")
  )

  suppressMessages(roxygen2::roxygenize(
    base_path,
    roclets = "igraph.r2cdocs::docs_rd",
    load_code = "source"
  ))

  rd <- readLines(file.path(base_path, "man", "my_degree.Rd"))
  expect_contains(rd, "\\section{Related documentation in the C library}{")
  expect_contains(
    rd,
    "\\href{https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_degree}{\\code{degree()}}"
  )
})
