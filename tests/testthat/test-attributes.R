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

  copy_test <- function(g) {
    graph2 <- set_vertex_attr(g, name = "weight", value = rep(1, vcount(g)))
    graph2 <- set_edge_attr(g, name = "weight", value = rep(1, ecount(g)))
    graph2 <- set_graph_attr(g, name = "name", "foobar")
  }

  g2 <- copy_test(g)
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

  copy_test <- function(graph) {
    V(graph)$weight <- rep(1, vcount(graph))
    E(graph)$weight <- rep(1, ecount(graph))
    graph$name <- "foobar"
  }

  g_copy <- copy_test(g)
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
  expect_equal(
    vertex_attr(g2),
    list(
      name = c(
        "a",
        "b",
        NA_character_,
        "c",
        "d",
        NA_character_
      ),
      color = list(
        rainbow(4)[1],
        rainbow(4)[2],
        NULL,
        rainbow(4)[3],
        rainbow(4)[4],
        NULL
      )
    )
  )

  edge_attr(g2, index = c(1, 3, 5)) <- edge_attr(g)
  expect_equal(
    edge_attr(g2),
    list(
      weight = c(
        1L,
        NA_integer_,
        2L,
        NA_integer_,
        3L
      ),
      label = list("A", NULL, "B", NULL, "C")
    )
  )
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
  expect_error(
    as_undirected(g, edge.attr.comb = list(weight = "sum")),
    "invalid 'type'"
  )
  expect_error(
    as_undirected(g, edge.attr.comb = list(weight = sum)),
    "invalid 'type'"
  )
})

test_that("can change type of attributes", {
  # https://github.com/igraph/rigraph/issues/466
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

test_that("setting attributes strips names", {
  # https://github.com/igraph/rigraph/issues/466
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

test_that("setting NULL attributes works and doesn't change the input", {
  # https://github.com/igraph/rigraph/issues/466
  g <- make_ring(10)

  expect_identical(set_vertex_attr(g, "foo", value = NULL), g)
  expect_identical(set_vertex_attr(g, "foo", 1:3, value = NULL), g)
  expect_identical(set_edge_attr(g, "foo", value = NULL), g)
  expect_identical(set_edge_attr(g, "foo", 1:3, value = NULL), g)
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
  biadj_mat1 <- matrix(
    sample(0:1, 35, replace = TRUE, prob = c(3, 1)),
    ncol = 5
  )
  g1 <- graph_from_biadjacency_matrix(biadj_mat1)
  expect_true(bipartite_mapping(g1)$res)

  withr::local_seed(42)
  biadj_mat2 <- matrix(
    sample(0:1, 35, replace = TRUE, prob = c(3, 1)),
    ncol = 5
  )
  g2 <- graph_from_biadjacency_matrix(biadj_mat2)
  expect_equal(
    bipartite_mapping(g2),
    list(res = TRUE, type = c(rep(FALSE, 7), rep(TRUE, 5)))
  )
})

test_that("without_attr", {
  withr::local_seed(42)
  g_stripped <- sample_gnp(10, 2 / 10) %>%
    delete_graph_attr("name") %>%
    delete_graph_attr("type") %>%
    delete_graph_attr("loops") %>%
    delete_graph_attr("p")

  withr::local_seed(42)
  g_no_attr <- sample_(gnp(10, 2 / 10), without_attr())

  expect_identical_graphs(g_stripped, g_no_attr)
  expect_equal(graph_attr_names(g_no_attr), character())
  expect_equal(vertex_attr_names(g_no_attr), character())
  expect_equal(edge_attr_names(g_no_attr), character())
})


test_that("without_loops", {
  g1 <- make_graph(~ A - A:B:C, B - A:B:C, simplify = FALSE) %>%
    simplify(remove.multiple = FALSE)

  g2 <- make_(
    from_literal(A - A:B:C, B - A:B:C, simplify = FALSE),
    without_loops()
  )

  expect_identical_graphs(g1, g2)
  expect_true(!any(which_loop(g2)))
})


test_that("without_multiple", {
  g1 <- make_graph(~ A - A:B:C, B - A:B:C, simplify = FALSE) %>%
    simplify(remove.loops = FALSE)

  g2 <- make_(
    from_literal(A - A:B:C, B - A:B:C, simplify = FALSE),
    without_multiples()
  )

  expect_identical_graphs(g1, g2)
  expect_true(!any(which_multiple(g2)))
})


test_that("simplified", {
  g1 <- make_graph(~ A - A:B:C, B - A:B:C)

  g2 <- make_(
    from_literal(A - A:B:C, B - A:B:C, simplify = FALSE),
    simplified()
  )

  expect_identical_graphs(g1, g2)
  expect_true(!any(which_multiple(g2)))
  expect_true(!any(which_loop(g2)))
})


test_that("with_vertex_", {
  g1 <- make_graph(~ A - A:B:C, B - A:B:C) %>%
    set_vertex_attr("color", value = "red") %>%
    set_vertex_attr("foo", value = paste0("xx", 1:3))

  g2 <- make_(
    from_literal(A - A:B:C, B - A:B:C),
    with_vertex_(
      color = "red",
      foo = paste0("xx", 1:3)
    )
  )

  expect_identical_graphs(g1, g2)
  expect_equal(V(g2)$color, rep("red", gorder(g2)))
  expect_equal(V(g2)$foo, paste0("xx", 1:3))
})


test_that("with_edge_", {
  g1 <- make_graph(~ A - A:B:C, B - A:B:C) %>%
    set_edge_attr("color", value = "red") %>%
    set_edge_attr("foo", value = seq_len(3))

  g2 <- make_(
    from_literal(A - A:B:C, B - A:B:C),
    with_edge_(
      color = "red",
      foo = seq_len(3)
    )
  )

  expect_identical_graphs(g1, g2)
  expect_equal(E(g1)$color, E(g2)$color)
  expect_equal(E(g1)$foo, E(g2)$foo)
})


test_that("with_graph_", {
  g1 <- make_graph(~ A - A:B:C, B - A:B:C) %>%
    set_graph_attr("color", value = "red") %>%
    set_graph_attr("foo", value = 1:5)

  g2 <- make_(
    from_literal(A - A:B:C, B - A:B:C),
    with_graph_(
      color = "red",
      foo = 1:5
    )
  )

  expect_identical_graphs(g1, g2)
  expect_equal(g1$color, g2$color)
  expect_equal(g1$foo, g2$foo)
})


test_that("adding and removing attributes", {
  g1 <- make_empty_graph()
  g2 <- make_empty_graph()

  g1$foo <- "bar"
  g1 <- delete_graph_attr(g1, "foo")
  E(g1)$foo <- "bar"
  g1 <- delete_edge_attr(g1, "foo")
  V(g1)$foo <- "bar"
  g1 <- delete_vertex_attr(g1, "foo")

  expect_identical_graphs(g1, g2)
})

test_that("error messages work", {
  g <- make_full_graph(5)
  expect_snapshot(set_vertex_attr(g, "test", value = c(1, 2)), error = TRUE)
  expect_snapshot(set_edge_attr(g, "test", value = c(1, 2)), error = TRUE)
  expect_snapshot(delete_graph_attr(g, "a"), error = TRUE)
  expect_snapshot(delete_vertex_attr(g, "a"), error = TRUE)
  expect_snapshot(delete_edge_attr(g, "a"), error = TRUE)
  expect_snapshot(assert_named_list("a"), error = TRUE)
  expect_snapshot(assert_named_list(list("a", "b")), error = TRUE)
})

test_that("empty returns work", {
  g <- make_full_graph(5)
  expect_length(vertex_attr_names(g), 0)
  expect_length(vertex_attr_names(g), 0)
  expect_length(edge_attr_names(g), 0)
})

test_that("assign data.frame attributes works", {
  # https://github.com/igraph/rigraph/issues/1669
  g <- make_tree(10, 3)
  edge.attributes(g) <- head(mtcars, ecount(g))
  expect_no_error(E(g)[c(1, 2)])
})

test_that("good error message when not using character", {
  ring <- graph_from_literal(A - B - C - D - E - F - G - A)
  expect_snapshot(error = TRUE, {
    set_graph_attr(ring, 1, 1)
  })
})
