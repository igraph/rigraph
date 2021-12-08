context("automorphisms")

test_that("automorphisms works", {
  library(igraph)

  g <- make_ring(10)
  expect_that(automorphisms(g)$group_size, equals("20"))

  g <- make_full_graph(4)
  expect_that(automorphisms(g)$group_size, equals("24"))
})


test_that("automorphisms works with colored graphs", {
  library(igraph)

  g <- make_full_graph(4)
  expect_that(automorphisms(g, colors=c(1,2,1,2))$group_size, equals("4"))

  V(g)$color <- c(1,2,1,2)
  expect_that(automorphisms(g)$group_size, equals("4"))
  expect_that(automorphisms(g, colors=NULL)$group_size, equals("24"))
})
