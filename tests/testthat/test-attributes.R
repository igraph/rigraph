test_that("assigning and querying attributes work", {
  ring <- graph_from_literal(A - B - C - D - E - F - G - A)
  E(ring)$weight <- seq_len(ecount(ring))

  expect_equal(V(ring)$name, LETTERS[seq_len(vcount(ring))])
  expect_equal(E(ring)$weight, seq_len(ecount(ring)))
})

test_that("bracketing works (not changing attribute of similar graphs)", {
  # https://github.com/igraph/igraph/issues/533
  g <- make_graph(c(1, 2, 1, 3, 3, 4))

  g <- set_vertex_attr(g, name = "weight", value = 1:vcount(g))
  graph2 <- set_vertex_attr(g, name = "weight", value = rep(1, vcount(g)))
  expect_equal(vertex_attr(g, name = "weight"), 1:4)

  g <- set_edge_attr(g, name = "weight", value = 1:ecount(g))
  graph2 <- set_edge_attr(g, name = "weight", value = rep(1, ecount(g)))
  expect_equal(edge_attr(g, name = "weight"), 1:3)

  g <- set_graph_attr(g, name = "name", "foo")
  graph2 <- set_graph_attr(g, name = "name", "foobar")
  expect_equal(graph_attr(g, name = "name"), "foo")

})

test_that("bracketing works with a function (not changing attribute of similar graphs)", {
  # https://github.com/igraph/igraph/issues/533
  g <- make_graph(c(1, 2, 1, 3, 3, 4))

  g <- set_vertex_attr(g, name = "weight", value = 1:vcount(g))
  g <- set_edge_attr(g, name = "weight", value = 1:ecount(g))
  g <- set_graph_attr(g, name = "name", "foo")

  run.test <- function(g) {
    graph2 <- set_vertex_attr(g, name = "weight", value = rep(1, vcount(g)))
    graph2 <- set_edge_attr(g, name = "weight", value = rep(1, ecount(g)))
    graph2 <- set_graph_attr(g, name = "name", "foobar")
  }

  g2 <- run.test(g)
  expect_equal(vertex_attr(g, name = "weight"), 1:4)
  expect_equal(edge_attr(g, name = "weight"), 1:3)
  expect_equal(graph_attr(g, name = "name"), "foo")
})

test_that("bracketing works with shortcuts (not changing attribute of similar graphs)", {
  # https://github.com/igraph/igraph/issues/533
  g <- make_graph(c(1, 2, 1, 3, 3, 4))
  g <- set_vertex_attr(g, name = "weight", value = 1:vcount(g))
  g <- set_edge_attr(g, name = "weight", value = 1:ecount(g))
  g <- set_graph_attr(g, name = "name", "foo")

  run.test <- function(graph) {
    V(graph)$weight <- rep(1, vcount(graph))
    E(graph)$weight <- rep(1, ecount(graph))
    graph$name <- "foobar"
  }

  g2 <- run.test(g)
  expect_equal(vertex_attr(g, name = "weight"), 1:4)
  expect_equal(edge_attr(g, name = "weight"), 1:3)
  expect_equal(graph_attr(g, name = "name"), "foo")
})

test_that("we can query all attributes at once", {
  g <- make_graph(c(1, 2, 1, 3, 2, 4))

  expect_equal(graph_attr(g), structure(list(), .Names = character(0)))
  expect_equal(unname(vertex_attr(g)), list())
  expect_equal(unname(edge_attr(g)), list())

  g$name <- "toy"
  g$layout <- cbind(1:4, 1:4)
  expect_equal(graph_attr(g), list(name = "toy", layout = cbind(1:4, 1:4)))

  V(g)$name <- letters[1:4]
  V(g)$color <- rainbow(4)
  expect_equal(vertex_attr(g), list(name = letters[1:4], color = rainbow(4)))

  E(g)$weight <- 1:3
  E(g)$label <- LETTERS[1:3]
  expect_equal(edge_attr(g), list(weight = 1:3, label = LETTERS[1:3]))
})

test_that("we can query single attributes with the generic functions", {
  g <- make_graph(c(1, 2, 1, 3, 2, 4))

  g$name <- "toy"
  expect_equal(graph_attr(g, "name"), "toy")

  g$layout <- cbind(1:4, 1:4)
  expect_equal(graph_attr(g, "layout"), cbind(1:4, 1:4))

  V(g)$name <- letters[1:4]
  expect_equal(vertex_attr(g, "name"), letters[1:4])

  V(g)$color <- rainbow(4)
  expect_equal(vertex_attr(g, "color"), rainbow(4))

  E(g)$weight <- 1:3
  expect_equal(edge_attr(g, "weight"), 1:3)

  E(g)$label <- LETTERS[1:3]
  expect_equal(edge_attr(g, "label"), LETTERS[1:3])
})

test_that("we can query a subset of vertices", {
  g <- make_graph(c(1, 2, 1, 3, 2, 4))

  V(g)$name <- letters[1:4]
  expect_equal(vertex_attr(g, "name", c(1, 3)), letters[c(1, 3)])

  V(g)$color <- as.list(rainbow(4))
  expect_equal(
    vertex_attr(g, "color", c("a", "c")),
    as.list(rainbow(4))[c(1, 3)]
  )

  E(g)$weight <- 1:3
  expect_equal(edge_attr(g, "weight", 2:3), 2:3)

  E(g)$label <- as.list(LETTERS[1:3])
  expect_equal(edge_attr(g, "label", 2:3), as.list(LETTERS[1:3])[2:3])
})

test_that("we can set all attributes at once", {
  g <- make_graph(c(1, 2, 1, 3, 2, 4))

  g$name <- "toy"
  g$layout <- cbind(1:4, 1:4)
  V(g)$name <- letters[1:4]
  V(g)$color <- as.list(rainbow(4))
  E(g)$weight <- 1:3
  E(g)$label <- as.list(LETTERS[1:3])

  g2 <- make_graph(c(2, 1, 3, 1, 4, 1))

  graph_attr(g2) <- graph_attr(g)
  expect_equal(graph_attr(g2), graph_attr(g))

  vertex_attr(g2) <- vertex_attr(g)
  expect_equal(vertex_attr(g2), vertex_attr(g))

  edge_attr(g2) <- edge_attr(g)
  expect_equal(edge_attr(g2), edge_attr(g))
})

test_that("we can set all attributes on some vertices/edges", {
  g <- make_graph(c(1, 2, 1, 3, 2, 4))

  V(g)$name <- letters[1:4]
  V(g)$color <- as.list(rainbow(4))
  E(g)$weight <- 1:3
  E(g)$label <- as.list(LETTERS[1:3])

  g2 <- make_graph(c(2, 1, 3, 1, 4, 1, 2, 5, 3, 6))

  vertex_attr(g2, index = c(1, 2, 4, 5)) <- vertex_attr(g)
  expect_equal(vertex_attr(g2), list(name = c(
    "a", "b", NA_character_,
    "c", "d", NA_character_
  ), color = list(
    rainbow(4)[1], rainbow(4)[2], NULL,
    rainbow(4)[3], rainbow(4)[4], NULL
  )))

  edge_attr(g2, index = c(1, 3, 5)) <- edge_attr(g)
  expect_equal(edge_attr(g2), list(weight = c(
    1L, NA_integer_, 2L,
    NA_integer_, 3L
  ), label = list("A", NULL, "B", NULL, "C")))
})

test_that("cannot use vs/es from another graph", {
  g <- make_ring(10)
  g2 <- g + 1
  v <- V(g)[1:4]
  expect_error(g2 - v, "Cannot use a vertex sequence from another graph")

  e <- E(g)[1:2]
  expect_error(g2 - e, "Cannot use an edge sequence from another graph")
})

test_that("attribute combinations handle errors correctly", {
  g <- make_graph(c(1, 2, 2, 1))
  E(g)$weight <- c("a", "b")
  expect_error(as.undirected(g, edge.attr.comb = list(weight = "sum")), "invalid 'type'")
  expect_error(as.undirected(g, edge.attr.comb = list(weight = sum)), "invalid 'type'")
})

test_that("can change type of attributes (#466)", {
  g <- make_ring(10)

  V(g)$foo <- 1
  expect_equal(V(g)$foo, rep(1, 10))
  V(g)$foo <- "a"
  expect_equal(V(g)$foo, rep("a", 10))
  V(g)$foo <- 2
  expect_equal(V(g)$foo, rep(2, 10))

  E(g)$foo <- 1
  expect_equal(E(g)$foo, rep(1, 10))
  E(g)$foo <- "a"
  expect_equal(E(g)$foo, rep("a", 10))
  E(g)$foo <- 2
  expect_equal(E(g)$foo, rep(2, 10))
})

test_that("setting attributes strips names (#466)", {
  g <- make_ring(10)

  V(g)$foo <- stats::setNames(1:10, letters[1:10])
  expect_identical(V(g)$foo, 1:10)

  E(g)$foo <- stats::setNames(1:10, letters[1:10])
  expect_identical(E(g)$foo, 1:10)

  V(g)$bar <- c(a = 1)
  expect_identical(V(g)$bar, rep(1, 10))

  E(g)$bar <- c(a = 1)
  expect_identical(E(g)$bar, rep(1, 10))
})

test_that("setting NULL attributes works and doesn't change the input (#466)", {
  g <- make_ring(10)

  expect_identical(set_vertex_attr(g, "foo", value = NULL), g)
  expect_identical(set_vertex_attr(g, "foo", 1:3, value = NULL), g)
  expect_identical(set_edge_attr(g, "foo", value = NULL), g)
  expect_identical(set_edge_attr(g, "foo", 1:3, value = NULL), g)
})

test_that("GRAPH attributes are destroyed when the graph is destroyed", {
  finalized <- FALSE
  finalizer <- function(e) {
    finalized <<- TRUE
  }

  env <- new.env(parent = emptyenv())
  reg.finalizer(env, finalizer)

  g <- make_ring(1)
  g$a <- list(env)
  rm(env)
  gc()
  expect_false(finalized)

  rm(g)
  gc()
  expect_true(finalized)
})

test_that("vertex attributes are destroyed when the graph is destroyed", {
  finalized <- FALSE
  finalizer <- function(e) {
    finalized <<- TRUE
  }

  env <- new.env(parent = emptyenv())
  reg.finalizer(env, finalizer)

  g <- make_ring(1)
  V(g)$a <- list(env)
  rm(env)
  gc()
  expect_false(finalized)

  g <- add_vertices(g, 1)
  gc()
  expect_false(finalized)

  g <- delete_vertices(g, 2)
  gc()
  expect_false(finalized)

  # Called for the side effect of clearing the protect list
  make_empty_graph()
  expect_false(finalized)

  rm(g)

  gc()
  expect_true(finalized)
})

test_that("edge attributes are destroyed when the graph is destroyed", {
  finalized <- FALSE
  finalizer <- function(e) {
    finalized <<- TRUE
  }

  env <- new.env(parent = emptyenv())
  reg.finalizer(env, finalizer)

  g <- make_ring(2)
  E(g)$a <- list(env)
  rm(env)
  gc()
  expect_false(finalized)

  g <- add_vertices(g, 1)
  gc()
  expect_false(finalized)

  g <- add_edges(g, c(2, 3))
  gc()
  expect_false(finalized)

  g <- delete_edges(g, 2)
  gc()
  expect_false(finalized)

  # Called for the side effect of clearing the protect list
  make_empty_graph()
  expect_false(finalized)

  rm(g)

  gc()
  expect_true(finalized)
})

test_that("assert_named_list() works", {
  not_list <- 1:10
  expect_error(assert_named_list(not_list), "named list")

  expect_silent(assert_named_list(list()))

  unnamed_list <- as.list(1:10)
  expect_error(assert_named_list(unnamed_list), "named list")

  empty_name <- rlang::set_names(unnamed_list, c(as.character(1:9), ""))
  expect_error(assert_named_list(empty_name), "named list")

  dups <- rlang::set_names(unnamed_list, rep("bla", 10))
  expect_error(assert_named_list(dups), "named list")

})

test_that("is_bipartite works", {
  I <- matrix(sample(0:1, 35, replace = TRUE, prob = c(3, 1)), ncol = 5)
  g <- graph_from_biadjacency_matrix(I)
  expect_true(bipartite_mapping(g)$res)

  withr::local_seed(42)
  I <- matrix(sample(0:1, 35, replace = TRUE, prob = c(3, 1)), ncol = 5)
  g <- graph_from_biadjacency_matrix(I)
  expect_equal(
    bipartite_mapping(g),
    list(res = TRUE, type = c(rep(FALSE, 7), rep(TRUE, 5)))
  )
})
