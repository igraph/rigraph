
context("Graph ids")

test_that("ids change when updating the graph", {

  g <- make_ring(10)

  g2 <- g + 1
  g3 <- g + edge(1,5)
  g4 <- set_vertex_attr(g, "color", value = "red")

  expect_false( graph_id(g) == graph_id(g2) )
  expect_false( graph_id(g) == graph_id(g3) )

})


test_that("ids don't change when attributes change", {

  g <- make_ring(10)
  V(g)$color <- "green"
  E(g)$weight <- 1

  g2 <- set_vertex_attr(g, "color", value = "red")
  g3 <- set_edge_attr(g, "weight", value = 3)
  g4 <- set_vertex_attr(g, "name", value = LETTERS[1:10])
  g5 <- set_edge_attr(g, "name", value = LETTERS[1:10])

  expect_equal(graph_id(g), graph_id(g2))
  expect_equal(graph_id(g), graph_id(g3))
  expect_equal(graph_id(g), graph_id(g4))
  expect_equal(graph_id(g), graph_id(g5))

})


test_that("ids of vertex and edge sequences are correct", {

  g <- make_ring(10)

  vs <- V(g)
  vs2 <- vs[1:5]
  es <- E(g)
  es2 <- es[1:5]

  expect_equal(graph_id(g), graph_id(vs))
  expect_equal(graph_id(g), graph_id(vs2))
  expect_equal(graph_id(g), graph_id(es))
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
