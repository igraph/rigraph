test_that("assortativity works", {
  writeLines(character(), file.path(Sys.getenv("RUNNER_TEMP"), "1.txt"))
  g <- read_graph(f <- gzfile("celegansneural.gml.gz"), format = "gml")
})
