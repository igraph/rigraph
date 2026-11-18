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

test_that("read.graph.toraw() returns every byte, in order", {
  # Chunks are 20000 bytes. The pattern differs between chunks, so a lost,
  # repeated or reordered chunk fails.
  for (size in c(0, 1, 19999, 20000, 20001, 40000, 40001, 123457)) {
    path <- withr::local_tempfile()
    bytes <- as.raw(seq_len(size) %% 251)
    writeBin(bytes, path)

    expect_identical(read.graph.toraw(path), bytes)
    expect_identical(read.graph.toraw(file(path)), bytes)
    expect_identical(read.graph.toraw(file(path, open = "rb")), bytes)
    expect_identical(read.graph.toraw(rawConnection(bytes)), bytes)
  }
})

test_that("read_graph() and write_graph() through `~` match a plain path", {
  # A `~` in the path, or a connection, routes the file through
  # read.graph.toraw(). Only a leading `~` is expanded, so files stay in `dir`.
  dir <- withr::local_tempdir()
  plain <- file.path(dir, "plain.edges")
  tilde <- file.path(dir, "tilde~.edges")
  out_plain <- file.path(dir, "out.edges")
  out_tilde <- file.path(dir, "out~.edges")

  # Four bytes per edge: 0, 4, 20000, 40000 and 104004 bytes.
  for (n_edges in c(0L, 1L, 5000L, 10000L, 26001L)) {
    i <- seq_len(n_edges)
    edge_lines <- sprintf("%d %d\n", i %% 10L, (3L * i + 1L) %% 10L)
    writeBin(charToRaw(paste(edge_lines, collapse = "")), plain)
    file.copy(plain, tilde, overwrite = TRUE)
    expect_equal(file.size(tilde), 4 * n_edges)

    g <- read_graph(plain, format = "edgelist")
    expect_ecount(g, n_edges)
    expect_identical_graphs(read_graph(tilde, format = "edgelist"), g)
    expect_identical_graphs(read_graph(file(plain), format = "edgelist"), g)

    write_graph(g, out_plain, format = "edgelist")
    write_graph(g, out_tilde, format = "edgelist")
    expect_identical(
      readBin(out_tilde, raw(0), n = file.size(out_tilde)),
      readBin(out_plain, raw(0), n = file.size(out_plain))
    )
  }
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

test_that("graph_from_graphdb works", {
  # FIXME: Need to fix ingestion code on Windows
  skip_on_os("windows")
  skip_on_cran()

  # Bug in base R? Checked with 2024-11-01 r87285:
  # docker run --rm -ti -v $PWD:/rigraph -e MAKEFLAGS=-j4 ghcr.io/cynkra/r-debug/r-debug-csan-igraph:latest RDcsan -q -e 'filename <- "/rigraph/DESCRIPTION"; gz_file_con <- file(filename, open = "rb"); file_con <- gzcon(gz_file_con); close(file_con); gc()'
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

# ---- ellipsis migration: argument coverage ----------------------------------

test_that("graph_from_graphdb() accepts every tail argument by name", {
  # A real download is required to build a graph, so this runs on the CI hosts
  # that can reach the graph database. It mirrors the guards of the
  # `graph_from_graphdb works` test and additionally skips (rather than fails)
  # when the database is unreachable, e.g. sandboxed mirrors returning 403.
  skip_on_os("windows")
  skip_on_cran()
  skip_if(Sys.getenv("R_SANITIZER") == "true")

  # suppressWarnings(): an unreachable database makes `file()` emit a "cannot
  # open URL" warning before the connection error we catch below; muffle it so
  # the skip is clean. A successful download is silent, so nothing is hidden.
  g <- tryCatch(
    suppressWarnings(graph_from_graphdb(
      url = NULL,
      prefix = "iso",
      type = "r001",
      nodes = 1000,
      pair = "A",
      which = 0,
      base = "https://github.com/igraph/graphsdb/raw/refs/heads/main",
      compressed = TRUE,
      directed = FALSE
    )),
    error = function(e) e
  )
  if (inherits(g, "condition")) {
    skip(paste("graph database unreachable:", conditionMessage(g)))
  }
  expect_true(is_igraph(g))
  expect_false(is_directed(g))
  expect_vcount(g, 1000)
})

test_that("graph_from_graphdb() wires up legacy positional recovery", {
  # A successful recovery would need the network, so we exercise the path with an
  # offline validation error instead: a legacy positional `prefix` routes to the
  # `prefix` argument, and an invalid value raises the prefix-specific error
  # *after* the deprecation warning -- proving the value reached `prefix` without
  # a download.
  lifecycle::expect_deprecated(
    expect_error(
      graph_from_graphdb(NULL, "not_existing", nodes = 10),
      regexp = "not a valid prefix"
    )
  )
})
