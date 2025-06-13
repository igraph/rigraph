test_that("writing Pajek files works", {
  g <- make_ring(9)
  V(g)$color <- rep_len(c("red", "green", "yellow"), length.out = 9)

  tc <- withr::local_connection(rawConnection(raw(0), "w"))

  write_graph(g, format = "pajek", file = tc)

  expect_equal(
    rawToChar(rawConnectionValue(tc)),
    "*Vertices 9\n1 \"1\" ic \"red\"\n2 \"2\" ic \"green\"\n3 \"3\" ic \"yellow\"\n4 \"4\" ic \"red\"\n5 \"5\" ic \"green\"\n6 \"6\" ic \"yellow\"\n7 \"7\" ic \"red\"\n8 \"8\" ic \"green\"\n9 \"9\" ic \"yellow\"\n*Edges\n1 2\n2 3\n3 4\n4 5\n5 6\n6 7\n7 8\n8 9\n1 9\n"
  )
})

test_that("reading GraphML file works", {
  skip_if_no_graphml()

  g <- read_graph(f <- gzfile("zachary.graphml.gz"), format = "graphml")
  g2 <- make_graph("zachary")

  expect_isomorphic(g2, g)
})

test_that("reading graph in NCOL format", {
  local_igraph_options(print.id = FALSE)

  ncol_path <- withr::local_tempfile(pattern = "testfile", fileext = ".ncol")
  g <- make_graph(c(1, 2, 2, 3))
  write_graph(g, ncol_path, "ncol")
  expect_snapshot(read_graph(ncol_path, "ncol"))
})

test_that("reading graph in LGL format", {
  local_igraph_options(print.id = FALSE)

  lgl_path <- withr::local_tempfile(pattern = "testfile", fileext = ".lgl")
  g <- make_graph(c(1, 2, 2, 3))
  write_graph(g, lgl_path, "lgl")
  expect_snapshot(read_graph(lgl_path, "lgl"))
})

test_that("graph_from_graphdb works", {
  skip_on_cran()

  # Bug in base R? Checked with 2024-11-01 r87285:
  # docker run --rm -ti -v $PWD:/rigraph -e MAKEFLAGS=-j4 ghcr.io/cynkra/docker-images/rigraph-san:latest RDcsan -q -e 'filename <- "/rigraph/DESCRIPTION"; gz_file_con <- file(filename, open = "rb"); file_con <- gzcon(gz_file_con); close(file_con); gc()'
  skip_if(Sys.getenv("R_SANITIZER") == "true")

  expect_snapshot(g <- graph_from_graphdb(nodes = 1000))
  expect_snapshot(g <- graph_from_graphdb(), error = TRUE)
  expect_snapshot(
    g <- graph_from_graphdb(nodes = 10, prefix = "not_existing"),
    error = TRUE
  )
  expect_snapshot(
    g <- graph_from_graphdb(nodes = 10, type = "not_existing"),
    error = TRUE
  )
})
