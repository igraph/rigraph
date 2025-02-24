test_that("writing Pajek files works", {
  g <- make_ring(9)
  V(g)$color <- rep_len(c("red", "green", "yellow"), length.out = 9)

  tc <- rawConnection(raw(0), "w")
  write_graph(g, format = "pajek", file = tc)
  out <- rawToChar(rawConnectionValue(tc))
  close(tc)

  expect_equal(out, "*Vertices 9\n1 \"1\" ic \"red\"\n2 \"2\" ic \"green\"\n3 \"3\" ic \"yellow\"\n4 \"4\" ic \"red\"\n5 \"5\" ic \"green\"\n6 \"6\" ic \"yellow\"\n7 \"7\" ic \"red\"\n8 \"8\" ic \"green\"\n9 \"9\" ic \"yellow\"\n*Edges\n1 2\n2 3\n3 4\n4 5\n5 6\n6 7\n7 8\n8 9\n1 9\n")
})

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
