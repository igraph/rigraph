test_that("operators work", {
  o <- function(x) x[order(x[, 1], x[, 2]), ]

  g1 <- make_ring(10)
  g2 <- make_star(11, center = 11, mode = "undirected")
  gu <- union(g1, g2)
  expect_that(vcount(gu), equals(11))
  expect_that(ecount(gu), equals(20))
  expect_that(
    o(rbind(as_edgelist(g1), as_edgelist(g2))),
    equals(o(as_edgelist(gu)))
  )

  gdu <- disjoint_union(g1, g2)
  expect_that(
    o(as_edgelist(gdu)),
    equals(o(rbind(
      as_edgelist(g1),
      as_edgelist(g2) + vcount(g1)
    )))
  )

  ####

  expect_true(graph.isomorphic(difference(gu, g1), g2))

  ####

  expect_true(graph.isomorphic(intersection(gu, g2), g2))

  expect_true(graph.isomorphic(
    intersection(gu, g1,
      keep.all.vertices = FALSE
    ),
    g1
  ))

  ####

  x <- complementer(complementer(g2))
  expect_true(identical_graphs(x, g2))

  ####

  gc <- compose(gu, g1)
  expect_that(vcount(gc), equals(11))
  expect_that(ecount(gc), equals(60))
  expect_that(diameter(gc), equals(2))
})

test_that("Union of directed named graphs", {
  graphs <- list(
    make_graph(~ 1:2:3:4:5, 1 -+ 2, 1 -+ 3, 2 -+ 3, 2 -+ 4, 3 -+ 4, 1 -+ 5, 3 -+ 5),
    make_graph(~ 1:2:3:4:5, 2 -+ 3, 1 -+ 4, 2 -+ 4, 3 -+ 4, 2 -+ 5, 3 -+ 5),
    make_graph(~ 1:2:3:4:5, 1 -+ 2, 1 -+ 3, 2 -+ 4, 3 -+ 4, 1 -+ 5, 4 -+ 5)
  )

  gg <- union.igraph(graphs)

  expect_equal(vcount(gg), 5)
  expect_equal(ecount(gg), 10)
})

test_that("edge reversal works", {
  # directed graph
  g <- make_graph(~ 1 -+ 2, 1 -+ 3, 1 -+ 4, 2 -+ 3, 3 -+ 4)
  g2 <- reverse_edges(g, 1:3)
  expected <- make_graph(~ 1 +- 2, 1 +- 3, 1 +- 4, 2 -+ 3, 3 -+ 4)
  expect_true(isomorphic(g2, expected))

  # undirected graph
  g <- make_graph(~ 1 -- 2, 1 -- 3, 1 -- 4, 2 -- 3, 3 -- 4)
  g2 <- reverse_edges(g, 1:3)
  expect_true(identical_graphs(g, g2))

  # all edges
  g <- make_graph(~ 1 -+ 2, 1 -+ 3, 1 -+ 4, 2 -+ 3, 3 -+ 4)
  g2 <- reverse_edges(g)
  expect_that(vcount(g2), equals(vcount(g)))
  expect_that(as_edgelist(g2), equals(as_edgelist(g)[, c(2, 1)]))

  # graph with isolated vertices
  g <- make_graph(~ 1:2:3:4:5, 1 -+ 2, 1 -+ 4)
  g2 <- reverse_edges(g)
  expect_that(vcount(g2), equals(vcount(g)))
  expect_that(as_edgelist(g2), equals(as_edgelist(g)[, c(2, 1)]))
})

test_that("t() is aliased to edge reversal for graphs", {
  g <- make_graph(~ 1 -+ 2, 1 -+ 3, 1 -+ 4, 2 -+ 3, 3 -+ 4)
  expect_that(vcount(t(g)), equals(vcount(g)))
  expect_that(as_edgelist(t(g)), equals(as_edgelist(g)[, c(2, 1)]))
})

test_that("vertices() works", {
  g_all_unnamed <-  make_empty_graph(1) + vertices("a", "b")
  expect_s3_class(V(g_all_unnamed), "igraph.vs")
  expect_identical(V(g_all_unnamed)$name, c(NA, "a", "b"))

  g_mix_named_unnamed <- make_empty_graph(1) + vertices("a", "b", foo = 5)
  expect_s3_class(V(g_mix_named_unnamed), "igraph.vs")
  expect_true(is.na(V(g_mix_named_unnamed)$name[1]))
  expect_identical(V(g_mix_named_unnamed)$name[-1], c("a", "b"))
  expect_equal(V(g_mix_named_unnamed)$foo, c(NA, 5, 5))

  g_mix_bigger_attribute <- make_empty_graph(1) + vertices("a", "b", "c", foo = 5:7, bar = 8)
  expect_s3_class(V(g_mix_bigger_attribute), "igraph.vs")
  expect_identical(V(g_mix_bigger_attribute)$name, c(NA, "a", "b", "c"))
  expect_equal(V(g_mix_bigger_attribute)$foo, c(NA, 5, 6, 7))
  expect_equal(V(g_mix_bigger_attribute)$bar, c(NA, 8, 8, 8))

  g_one_unnamed <- make_empty_graph(1) + vertices(letters)
  expect_s3_class(V(g_one_unnamed), "igraph.vs")
  expect_identical(V(g_one_unnamed)$name, c(NA, letters))

  g_all_named <- make_empty_graph(1) + vertices(foo = 5:7)
  expect_s3_class(V(g_all_named), "igraph.vs")
  expect_null(V(g_all_named)$name)
  expect_identical(V(g_all_named)$foo, c(NA, 5:7))

  g_all_named_empty <- make_empty_graph(1) + vertices(foo = numeric())
  expect_s3_class(V(g_all_named_empty), "igraph.vs")
  expect_null(V(g_all_named_empty)$name)
  expect_identical(V(g_all_named_empty)$foo, NA_real_)

  g_none <- make_empty_graph(1) + vertices()
  expect_s3_class(V(g_none), "igraph.vs")
  expect_null(V(g_none)$name)

  expect_snapshot_error(make_empty_graph(1) + vertices("a", "b", foo = 5:7))

  # Undefined,
  # make_empty_graph(1) + vertices("a", "b", name = "c")
})
