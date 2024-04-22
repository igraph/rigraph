test_that("reading GraphML file works", {
  skip_if_no_graphml()

  g <- read_graph(f <- gzfile("zachary.graphml.gz"), format = "graphml")
  g2 <- make_graph("zachary")

  expect_true(isomorphic(g2, g))
})

test_that("reading graph in ncol format", {
  library(igraph)
  g <- make_graph(c(1, 2, 2, 3))
  write_graph(g, "zoo.ncol", "ncol")
  expect_no_error(g2 <- read_graph("zoo.ncol", "ncol"))
})

test_that("reading graph in lgl format", {
  library(igraph)
  g <- make_graph(c(1, 2, 2, 3))
  write_graph(g, "zoo.lgl", "lgl")
  expect_no_error(g2 <- read_graph("zoo.lgl", "lgl"))
})
