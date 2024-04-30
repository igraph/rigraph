test_that("reading GraphML file works", {
  skip_if_no_graphml()

  g <- read_graph(f <- gzfile("zachary.graphml.gz"), format = "graphml")
  g2 <- make_graph("zachary")

  expect_true(isomorphic(g2, g))
})

test_that("reading graph in NCOL format", {
  ncol_path <- tempfile("testfile", fileext = ".ncol")
  g <- make_graph(c(1, 2, 2, 3))
  write_graph(g, ncol_path, "ncol")
  expect_no_error(g2 <- read_graph(ncol_path, "ncol"))
})

test_that("reading graph in LGL format", {
  lgl_path <- tempfile("testfile", fileext = ".lgl")
  g <- make_graph(c(1, 2, 2, 3))
  write_graph(g, lgl_path, "lgl")
  expect_no_error(g2 <- read_graph(lgl_path, "lgl"))
})
