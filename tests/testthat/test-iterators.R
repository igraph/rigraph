test_that("iterators work", {
  ring <- graph_from_literal(A - B - C - D - E - F - G - A)
  E(ring)$weight <- seq_len(ecount(ring))

  expect_equal(sort(E(ring)[weight < 4]$weight), 1:3)
  expect_equal(V(ring)[c("A", "C")]$name, c("A", "C"))

  withr::with_seed(42, {
    g_pa <- sample_pa(100, power = 0.3)
  })

  expect_equal(as.numeric(E(g_pa)[1:3 %--% 2:6]), 1:4)
  expect_equal(as.numeric(E(g_pa)[1:5 %->% 1:6]), 1:4)
  expect_length(as.numeric(E(g_pa)[1:2 %->% 5:6]), 0)
  expect_equal(as.numeric(E(g_pa)[1:3 %<-% 30:60]), c(36, 38, 44, 56))
  expect_equal(as.numeric(E(g_pa)[1:3 %<-% 5:6]), 4)
})

test_that("subsetting returns the whole if no argument", {
  g <- make_ring(10)
  expect_length(V(g)[, ], 10)
  expect_length(V(g)[, na_ok = FALSE], 10)
  expect_length(E(g)[, ], 10)
})

test_that("complex attributes work", {
  g <- make_ring(10)
  foo <- lapply(1:vcount(g), seq, from = 1)
  V(g)$foo <- foo

  V(g)$foo[[5]][1:3] <- 0
  expect_equal(V(g)[(1:10)[-5]]$foo, foo[-5])
  expect_equal(V(g)[[5]]$foo, c(0, 0, 0, 4, 5))
  expect_equal(V(g)[5]$foo, list(c(0, 0, 0, 4, 5)))

  V(g)$foo <- foo
  V(g)[[5]]$foo[1:3] <- 0
  expect_equal(V(g)[(1:10)[-5]]$foo, foo[-5])
  expect_equal(V(g)[[5]]$foo, c(0, 0, 0, 4, 5))
  expect_equal(V(g)[5]$foo, list(c(0, 0, 0, 4, 5)))

  V(g)$foo <- foo
  V(g)[5]$foo[[1]][1:3] <- 0
  expect_equal(V(g)[(1:10)[-5]]$foo, foo[-5])
  expect_equal(V(g)[[5]]$foo, c(0, 0, 0, 4, 5))
  expect_equal(V(g)[5]$foo, list(c(0, 0, 0, 4, 5)))
})

test_that("indexing by numbers works", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]
  E(g)$weight <- seq(ecount(g))

  expect_equal(as.vector(V(g)[6:10][1:5]), 6:10)
  expect_equal(as.vector(E(g)[6:10][1:5]), 6:10)
})

test_that("selecting edges using vertex names works", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]

  e1 <- E(g)[c("a|b", "c|d")]
  expect_equal(as.vector(e1), c(1, 3))
})

test_that("indexing with characters work as expected", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]
  E(g)$name <- LETTERS[1:10]

  expect_equal(as.vector(V(g)[letters[3:6]]), 3:6)
  expect_equal(as.vector(E(g)[LETTERS[4:7]]), 4:7)

  expect_error(V(g)[1:5]["h"], "Unknown vertex selected")
  expect_error(E(g)[1:5]["H"], "Unknown edge selected")
  expect_error(E(g)[6:9]["a|b"], "Unknown edge selected")
})

test_that("variable lookup in environment works", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]
  E(g)$index <- 10:19

  name <- c("d", "e")
  index <- 3

  expect_equal(as.vector(V(g)[name]), 1:10)
  expect_error(E(g)[index], "Unknown edge selected")

  expect_equal(as.vector(V(g)[.env$name]), c(4, 5))
  expect_equal(as.vector(E(g)[.env$index]), 3)

  expect_equal(as.vector(E(g)[.data$index >= 15]), 6:10)
})

test_that("V(g) returns complete iterator, completeness is lost with next subsetting", {
  g <- make_star(4)
  iter <- V(g)
  expect_true(is_complete_iterator(iter))
  expect_false(is_complete_iterator(iter[1]))
  expect_false(is_complete_iterator(iter[1:4]))
})

test_that("E(g) returns complete iterator, completeness is lost with next subsetting", {
  g <- make_full_graph(4)
  iter <- E(g)
  expect_true(is_complete_iterator(iter))
  expect_false(is_complete_iterator(iter[1]))
  expect_false(is_complete_iterator(iter[1:3]))
  expect_false(is_complete_iterator(E(g, P = 1:4)))
  expect_false(is_complete_iterator(E(g, path = 1:4)))
})

test_that("ids change when updating the graph", {
  g <- make_ring(10)

  g2 <- g + 1
  expect_false(graph_id(g) == graph_id(g2))

  g3 <- g + edge(1, 5)
  expect_false(graph_id(g) == graph_id(g3))
})


test_that("ids don't change when attributes change", {
  g <- make_ring(10)
  V(g)$color <- "green"
  E(g)$weight <- 1

  g2 <- set_vertex_attr(g, "color", value = "red")
  expect_equal(graph_id(g), graph_id(g2))

  g3 <- set_edge_attr(g, "weight", value = 3)
  expect_equal(graph_id(g), graph_id(g3))

  g4 <- set_vertex_attr(g, "name", value = LETTERS[1:10])
  expect_equal(graph_id(g), graph_id(g4))

  g5 <- set_edge_attr(g, "name", value = LETTERS[1:10])
  expect_equal(graph_id(g), graph_id(g5))
})


test_that("ids of vertex and edge sequences are correct", {
  g <- make_ring(10)

  vs <- V(g)
  expect_equal(graph_id(g), graph_id(vs))

  vs2 <- vs[1:5]
  expect_equal(graph_id(g), graph_id(vs2))

  es <- E(g)
  expect_equal(graph_id(g), graph_id(es))

  es2 <- es[1:5]
  expect_equal(graph_id(g), graph_id(es2))
})


test_that("ids of vertex and edge sequence remain after removing graph", {
  g <- make_ring(10)
  id <- graph_id(g)

  vs <- V(g)
  vs2 <- vs[1:5]
  es <- E(g)
  es2 <- es[1:5]

  rm(g)
  gc()

  expect_equal(id, graph_id(vs))
  expect_equal(id, graph_id(vs2))
  expect_equal(id, graph_id(es))
  expect_equal(id, graph_id(es2))
})

test_that("identical_graphs works", {
  g <- make_ring(5)
  g2 <- make_ring(5)
  expect_identical_graphs(g, g2)

  g3 <- make_ring(6)

  expect_not_identical_graphs(g, g3)
})

test_that("identical_graphs considers attributes", {
  g <- sample_pa(10)
  g2 <- g

  expect_identical_graphs(g, g2)

  g2$m <- 2

  expect_not_identical_graphs(g, g2)
  expect_identical_graphs(g, g2, attrs = FALSE)
})

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
  expect_identical(get_vs_graph(vs), g)

  es <- E(g)
  expect_identical(get_es_graph(es), g)
})

test_that("vs/es refers to the original graph", {
  ring1 <- ring2 <- make_ring(10)
  vs <- V(ring1)
  es <- E(ring1)

  ring1 <- ring1 + 4

  expect_identical(get_vs_graph(vs), ring2)
  expect_identical(get_es_graph(es), ring2)
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
  expect_identical_graphs(
    delete_edges(g, es),
    delete_edges(g, 1:5)
  )
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

test_that("logical indices are not recycled", {
  # https://github.com/igraph/rigraph/issues/848
  g <- make_ring(5)
  expect_snapshot(V(g)[c(TRUE, FALSE)], error = TRUE)
  expect_snapshot(E(g)[c(TRUE, FALSE)], error = TRUE)
})
