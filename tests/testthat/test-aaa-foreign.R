# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# IO functions

test_that("write_graph_edgelist_impl basic", {
  igraph_local_seed(20250909)
  g <- make_ring(3)
  tmp <- tempfile()
  write_graph_edgelist_impl(graph = g, outstream = tmp)
  content <- readLines(tmp)
  unlink(tmp)
  expect_snapshot(content)
})

test_that("read_graph_edgelist_impl basic", {
  igraph_local_seed(20250909)
  tmp <- tempfile()
  writeLines(c("0 1", "1 2", "2 0"), tmp)
  expect_snapshot(read_graph_edgelist_impl(
    instream = tmp,
    n = 3,
    directed = FALSE
  ))
  unlink(tmp)
})
