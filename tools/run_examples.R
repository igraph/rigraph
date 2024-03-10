#! /usr/bin/env Rscript

library(igraph)
library(magrittr)

rd_files <- list.files("./man", pattern = "\\.Rd$", full.names = TRUE)

exfile <- tempfile()

for (rd_file in rd_files) {
  tools::Rd2ex(rd_file, out = exfile)

  if (!file.exists(exfile)) {
    next
  }

  example <- readLines(exfile)

  eval(parse(text = paste(example, collapse = "\n")))
}
