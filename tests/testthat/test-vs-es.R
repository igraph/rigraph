test_that("we can create vertex/edge seqs", {
  g <- make_ring(10)
  V(g) %&&% expect_true(TRUE)
  E(g) %&&% expect_true(TRUE)

  V(g)$name <- letters[1:10]
  V(g) %&&% expect_true(TRUE)
  E(g) %&&% expect_true(TRUE)

  g <- make_ring(10)
  E(g)$name <- LETTERS[1:10]
  E(g) %&&% expect_true(TRUE)
})

test_that("vs/es keeps names", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]
  vs <- V(g)

  expect_equal(vs$name, names(vs))

  vs2 <- vs[4:7]
  expect_equal(vs2$name, names(vs2))

  E(g)$name <- LETTERS[1:10]
  es <- E(g)

  expect_equal(es$name, names(es))

  es2 <- es[4:7]
  expect_equal(es2$name, names(es2))
})

test_that("vs/es refers to the graph", {
  g <- make_ring(10)
  vs <- V(g)
  es <- E(g)

  expect_identical(get_vs_graph(vs), g)
  expect_identical(get_es_graph(es), g)
})

test_that("vs/es refers to the original graph", {
  g <- g2 <- make_ring(10)
  vs <- V(g)
  es <- E(g)

  g <- g + 4

  expect_identical(get_vs_graph(vs), g2)
  expect_identical(get_es_graph(es), g2)
})

test_that("vs/es references are weak", {
  g <- make_ring(10)
  vs <- V(g)
  es <- E(g)

  rm(g)
  gc()

  expect_null(get_vs_graph(vs))
  expect_null(get_es_graph(es))
})

test_that("save/load breaks references", {
  g <- make_ring(10)
  vs <- V(g)
  es <- E(g)

  tmp <- tempfile()
  on.exit(try(unlink(tmp)))

  save(vs, es, file = tmp)
  rm(vs, es)
  gc()

  load(tmp)
  expect_null(get_vs_graph(vs))
  expect_null(get_es_graph(es))
})

test_that("vs/es keeps names after graph is deleted", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]
  vs <- V(g)

  E(g)$name <- LETTERS[1:10]
  es <- E(g)

  rm(g)
  gc()

  expect_equal(names(vs), letters[1:10])

  vs2 <- vs[4:7]
  expect_equal(names(vs2), letters[4:7])

  expect_equal(names(es), LETTERS[1:10])

  es2 <- es[4:7]
  expect_equal(names(es2), LETTERS[4:7])
})

test_that("both edge and vertex names", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]
  E(g)$name <- LETTERS[1:10]

  es <- E(g)
  expect_equal(as.vector(es), 1:10)
  expect_equal(names(es), LETTERS[1:10])
  el <- as_edgelist(g)
  expect_equal(attr(es, "vnames"), paste(el[, 1], el[, 2], sep = "|"))

  x1 <- es[LETTERS[4:7]]
  x2 <- E(g)[4:7]
  expect_equal(as.vector(x1), as.vector(x2))
  expect_equal(names(x1), names(x2))
  expect_equal(attr(x1, "vnames"), attr(x2, "vnames"))

  y1 <- es[c("a|b", "d|e")]
  y2 <- E(g)[c(1, 4)]
  expect_equal(as.vector(y1), as.vector(y2))
  expect_equal(names(y1), names(y2))
  expect_equal(attr(y1, "vnames"), attr(y2, "vnames"))
})

test_that("printing connected vs/es works", {
  local_igraph_options(print.id = FALSE)

  g <- make_ring(10)
  vs <- V(g)
  es <- E(g)

  expect_snapshot({
    vs
    es
    vs[1:5]
    es[1:5]
    vs[numeric()]
  })

  expect_snapshot({
    es[numeric()]
  })
})

test_that("printing named connected vs/es works", {
  local_igraph_options(print.id = FALSE)

  g <- make_ring(10)
  V(g)$name <- letters[1:10]
  vs <- V(g)
  es <- E(g)

  expect_snapshot({
    vs
    es
    vs[1:5]
    es[1:5]
    vs[numeric()]
  })

  expect_snapshot({
    es[numeric()]
  })
})

test_that("printing unconnected vs/es works", {
  local_igraph_options(print.id = FALSE)

  g <- make_ring(10)
  vs <- V(g)
  es <- E(g)

  rm(g)
  gc()

  expect_snapshot({
    vs
    es
  })

  g <- make_ring(10)
  V(g)$name <- letters[1:10]
  vs <- V(g)
  es <- E(g)

  rm(g)
  gc()

  expect_snapshot({
    vs
    es
  })
})

test_that("unconnected vs/es can be reused with the same graph", {
  g <- make_ring(10)
  vs <- V(g)
  es <- E(g)[1:5]

  tmp <- tempfile()
  on.exit(unlink(tmp))
  save(g, es, vs, file = tmp)

  rm(g, es, vs)
  gc()

  load(tmp)

  expect_equal(degree(g, v = vs), rep(2, 10))
  expect_true(identical_graphs(
    delete_edges(g, es),
    delete_edges(g, 1:5)
  ))
})

test_that("indexing without arguments", {
  g <- make_ring(10)

  x <- V(g)[]
  expect_equal(ignore_attr = TRUE, V(g), x)

  x2 <- V(g)[[]]
  v <- set_single_index(V(g))

  expect_equal(ignore_attr = TRUE, v, x2)
})

test_that("vertex indexes are stored as raw numbers", {
  g <- make_ring(3, directed = TRUE)
  V(g)$id <- V(g)
  expect_identical(V(g)$id, as.numeric(1:3))
  expect_error(induced_subgraph(g, 1), NA)
})

test_that("edge indexes are stored as raw numbers", {
  g <- make_ring(3, directed = TRUE)
  E(g)$id <- E(g)
  expect_identical(E(g)$id, as.numeric(1:3))
  expect_error(induced_subgraph(g, 1:2), NA)
})
