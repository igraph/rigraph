#! /usr/bin/env Rscript

rd_files <- list.files("./man", pattern = "\\.Rd$", full.names = TRUE)

exfile <- tempfile()

for (rd_file in rd_files) {
  tools::Rd2ex(rd_file, out = exfile)

  if (!file.exists(exfile)) {
    next
  }

  example <- readLines(exfile)

  libraries <- "library(igraph)\nlibrary(magrittr)"
  examples_with_libraries <- paste(libraries, paste(example, collapse = "\n"))

  eval(parse(text = examples_with_libraries))
}
