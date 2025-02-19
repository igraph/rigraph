test_that("union() works", {
  order_by_two_first_columns <- function(x) x[order(x[, 1], x[, 2]), ]

  g1 <- make_ring(10)
  g2 <- make_star(11, center = 11, mode = "undirected")
  gu <- union(g1, g2)

  expect_vcount(gu, 11)
  expect_ecount(gu, 20)
  expect_equal(
    order_by_two_first_columns(rbind(as_edgelist(g1), as_edgelist(g2))),
    order_by_two_first_columns(as_edgelist(gu))
  )
  expect_isomorphic(difference(gu, g1), g2)
  expect_isomorphic(intersection(gu, g2), g2)
})

test_that("disjoint_union() works", {
  order_by_two_first_columns <- function(x) x[order(x[, 1], x[, 2]), ]

  g1 <- make_ring(10)
  g2 <- make_star(11, center = 11, mode = "undirected")
  gdu <- disjoint_union(g1, g2)
  expect_equal(
    order_by_two_first_columns(as_edgelist(gdu)),
    order_by_two_first_columns(rbind(
      as_edgelist(g1),
      as_edgelist(g2) + vcount(g1)
    ))
  )
})

test_that("disjoint_union() does not convert types", {
  # https://github.com/igraph/rigraph/issues/761

  g1 <- make_graph(~ A - -B)
  g2 <- make_graph(~ D - -E)

  g1 <- set_edge_attr(g1, "date", value = as.POSIXct(c("2021-01-01 01:01:01")))
  g2 <- set_edge_attr(g2, "date", value = as.POSIXct(c("2021-03-03 03:03:03")))

  u <- disjoint_union(g1, g2)

  expect_s3_class(E(u)$date, c("POSIXct", "POSIXt"))
})

test_that("intersection() works", {

  g1 <- make_ring(10)
  g2 <- make_star(11, center = 11, mode = "undirected")
  gu <- union(g1, g2)

  expect_isomorphic(intersection(gu, g1, keep.all.vertices = FALSE), g1)
})

test_that("complementer() works", {
  g2 <- make_star(11, center = 11, mode = "undirected")

  x <- complementer(complementer(g2))
  expect_true(identical_graphs(x, g2))

})

test_that("compose() works", {

  g1 <- make_ring(10)
  g2 <- make_star(11, center = 11, mode = "undirected")
  gu <- union(g1, g2)

  gc <- compose(gu, g1)
  expect_vcount(gc, 11)
  expect_ecount(gc, 60)
  expect_equal(diameter(gc), 2)
})

test_that("Union of directed named graphs", {
  graphs <- list(
    make_graph(~ 1:2:3:4:5, 1 -+ 2, 1 -+ 3, 2 -+ 3, 2 -+ 4, 3 -+ 4, 1 -+ 5, 3 -+ 5),
    make_graph(~ 1:2:3:4:5, 2 -+ 3, 1 -+ 4, 2 -+ 4, 3 -+ 4, 2 -+ 5, 3 -+ 5),
    make_graph(~ 1:2:3:4:5, 1 -+ 2, 1 -+ 3, 2 -+ 4, 3 -+ 4, 1 -+ 5, 4 -+ 5)
  )

  gg <- union.igraph(graphs)

  expect_vcount(gg, 5)
  expect_ecount(gg, 10)
})

test_that("edge reversal works", {
  directed_graph <- make_graph(~ 1 -+ 2, 1 -+ 3, 1 -+ 4, 2 -+ 3, 3 -+ 4)
  reverse_directed_graph <- reverse_edges(directed_graph, 1:3)
  expected <- make_graph(~ 1 +- 2, 1 +- 3, 1 +- 4, 2 -+ 3, 3 -+ 4)
  expect_true(isomorphic(reverse_directed_graph, expected))

  reverse_all_directed_graph <- reverse_edges(directed_graph)
  expect_vcount(reverse_all_directed_graph, vcount(directed_graph))
  expect_equal(
    as_edgelist(reverse_all_directed_graph),
    as_edgelist(directed_graph)[, c(2, 1)]
  )

  undirected_graph <- make_graph(~ 1 -- 2, 1 -- 3, 1 -- 4, 2 -- 3, 3 -- 4)
  reverse_undirected_graph <- reverse_edges(undirected_graph, 1:3)
  expect_true(identical_graphs(undirected_graph, reverse_undirected_graph))

  isolated_vertices_g <- make_graph(~ 1:2:3:4:5, 1 -+ 2, 1 -+ 4)
  reverse_isolated_vertices_g <- reverse_edges(isolated_vertices_g)
  expect_vcount(reverse_isolated_vertices_g, vcount(isolated_vertices_g))
  expect_equal(
    as_edgelist(reverse_isolated_vertices_g),
    as_edgelist(isolated_vertices_g)[, c(2, 1)]
  )
})

test_that("t() is aliased to edge reversal for graphs", {
  g <- make_graph(~ 1 -+ 2, 1 -+ 3, 1 -+ 4, 2 -+ 3, 3 -+ 4)
  expect_vcount(t(g), vcount(g))
  expect_equal(as_edgelist(t(g)), as_edgelist(g)[, c(2, 1)])
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
