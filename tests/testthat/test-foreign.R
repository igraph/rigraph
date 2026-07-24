# jarl-ignore-file implicit_assignment: just the way it works
test_that("writing Pajek files works", {
  # FIXME: Does the Pajek format allow for \r\n line endings on Windows?
  # Adapt test depending on that.
  skip_on_os("windows")

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
  ncol_path <- withr::local_tempfile(pattern = "testfile", fileext = ".ncol")
  g <- make_graph(c(1, 2, 2, 3))
  write_graph(g, ncol_path, "ncol")
  expect_snapshot(read_graph(ncol_path, "ncol"))
})

test_that("reading graph in LGL format", {
  lgl_path <- withr::local_tempfile(pattern = "testfile", fileext = ".lgl")
  g <- make_graph(c(1, 2, 2, 3))
  write_graph(g, lgl_path, "lgl")
  expect_snapshot(read_graph(lgl_path, "lgl"))
})

test_that("reading graph, unused argument", {
  lgl_path <- withr::local_tempfile(pattern = "testfile", fileext = ".lgl")
  g <- make_graph(c(1, 2, 2, 3))
  write_graph(g, lgl_path, "lgl")
  expect_snapshot_igraph_error(read_graph(lgl_path, "lgl", useless = 1))
})

test_that("reading graph in unsupported format", {
  expect_snapshot_igraph_error(read_graph("bla", format = "blop"))
})

test_that("writing graph in unsupported format", {
  g <- make_graph(c(1, 2, 2, 3))
  file <- withr::local_tempfile()
  expect_snapshot_igraph_error(write_graph(g, file, format = "blop"))
})

test_that("reading GML file works with lesmis", {
  skip_if_not_installed("igraphdata")

  expect_snapshot(read_graph(igraphdata::lesmis_gml(), format = "gml"))
})

test_that("reading GraphML file works with lesmis", {
  skip_if_no_graphml()
  skip_if_not_installed("igraphdata")

  expect_snapshot(read_graph(igraphdata::lesmis_graphml(), format = "graphml"))
})

test_that("reading Pajek file works with lesmis", {
  skip_if_not_installed("igraphdata")

  expect_snapshot(read_graph(igraphdata::lesmis_pajek(), format = "pajek"))
})

test_that("write/read Pajek round-trip preserves karate graph structure", {
  skip_if_not_installed("igraphdata")

  data("karate", package = "igraphdata")
  net_path <- withr::local_tempfile(fileext = ".net")
  write_graph(karate, net_path, format = "pajek")
  g <- read_graph(net_path, format = "pajek")

  expect_equal(vcount(g), vcount(karate))
  expect_equal(ecount(g), ecount(karate))
  expect_false(is_directed(g))
})

test_that("write/read GraphML round-trip preserves UKfaculty graph structure", {
  skip_if_no_graphml()
  skip_if_not_installed("igraphdata")

  data("UKfaculty", package = "igraphdata")
  graphml_path <- withr::local_tempfile(fileext = ".graphml")
  write_graph(UKfaculty, graphml_path, format = "graphml")
  g <- read_graph(graphml_path, format = "graphml")

  expect_equal(vcount(g), vcount(UKfaculty))
  expect_equal(ecount(g), ecount(UKfaculty))
  expect_true(is_directed(g))
  expect_true("Group" %in% vertex_attr_names(g))
  expect_true("weight" %in% edge_attr_names(g))
})

test_that("write/read NCOL round-trip preserves karate edge weights", {
  skip_if_not_installed("igraphdata")

  data("karate", package = "igraphdata")
  # NCOL rejects spaces in vertex names; replace with underscores
  V(karate)$name <- gsub(" ", "_", V(karate)$name)
  ncol_path <- withr::local_tempfile(fileext = ".ncol")
  write_graph(karate, ncol_path, format = "ncol")
  g <- read_graph(ncol_path, format = "ncol")

  expect_equal(vcount(g), vcount(karate))
  expect_equal(ecount(g), ecount(karate))
  expect_false(is_directed(g))
  expect_true("name" %in% vertex_attr_names(g))
  expect_true("weight" %in% edge_attr_names(g))
})

test_that("write_graph auto-detects GraphML format from .graphml extension", {
  skip_if_no_graphml()
  skip_if_not_installed("igraphdata")

  data("UKfaculty", package = "igraphdata")
  graphml_path <- withr::local_tempfile(fileext = ".graphml")
  write_graph(UKfaculty, graphml_path)
  g <- read_graph(graphml_path, format = "graphml")

  expect_equal(vcount(g), vcount(UKfaculty))
  expect_equal(ecount(g), ecount(UKfaculty))
})

test_that("write_graph auto-detects Pajek format from .net extension", {
  skip_if_not_installed("igraphdata")

  data("karate", package = "igraphdata")
  net_path <- withr::local_tempfile(fileext = ".net")
  write_graph(karate, net_path)
  g <- read_graph(net_path, format = "pajek")

  expect_equal(vcount(g), vcount(karate))
  expect_equal(ecount(g), ecount(karate))
})

test_that("read_graph auto-detects Pajek format for lesmis from .net extension", {
  skip_if_not_installed("igraphdata")

  g_orig <- read_graph(igraphdata::lesmis_pajek(), format = "pajek")
  net_path <- withr::local_tempfile(fileext = ".net")
  write_graph(g_orig, net_path, format = "pajek")
  g <- read_graph(net_path)

  expect_equal(vcount(g), vcount(g_orig))
  expect_equal(ecount(g), ecount(g_orig))
  expect_false(is_directed(g))
})

test_that("read_graph auto-detects GraphML format for lesmis from .graphml extension", {
  skip_if_no_graphml()
  skip_if_not_installed("igraphdata")

  # lesmis GraphML has an 'id' vertex attribute; igraph warns it cannot add its own
  g_orig <- suppressWarnings(read_graph(
    igraphdata::lesmis_graphml(),
    format = "graphml"
  ))
  graphml_path <- withr::local_tempfile(fileext = ".graphml")
  write_graph(g_orig, graphml_path, format = "graphml")
  g <- suppressWarnings(read_graph(graphml_path))

  expect_equal(vcount(g), vcount(g_orig))
  expect_equal(ecount(g), ecount(g_orig))
  expect_false(is_directed(g))
})

test_that("write_graph defaults to edgelist with deprecation for unknown extension", {
  skip_if_not_installed("igraphdata")

  data("karate", package = "igraphdata")
  txt_path <- withr::local_tempfile(fileext = ".txt")
  withr::local_options(lifecycle_verbosity = "warning")
  expect_warning(
    write_graph(karate, txt_path),
    "Defaulting to `edgelist`"
  )
  g <- read_graph(txt_path, format = "edgelist", directed = FALSE)

  expect_equal(vcount(g), vcount(karate))
  expect_equal(ecount(g), ecount(karate))
})

test_that("graph_from_graphdb works", {
  # FIXME: Need to fix ingestion code on Windows
  skip_on_os("windows")
  skip_on_cran()

  # Bug in base R? Checked with 2024-11-01 r87285:
  # docker run --rm -ti -v $PWD:/rigraph -e MAKEFLAGS=-j4 ghcr.io/cynkra/docker-images/rigraph-san:latest RDcsan -q -e 'filename <- "/rigraph/DESCRIPTION"; gz_file_con <- file(filename, open = "rb"); file_con <- gzcon(gz_file_con); close(file_con); gc()'
  skip_if(Sys.getenv("R_SANITIZER") == "true")

  expect_silent(graph_from_graphdb(nodes = 1000))
  expect_snapshot_igraph_error(graph_from_graphdb())
  expect_snapshot_igraph_error(
    graph_from_graphdb(nodes = 10, prefix = "not_existing")
  )
  expect_snapshot_igraph_error(
    graph_from_graphdb(nodes = 10, type = "not_existing")
  )
})
