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


test_that("automorphism_group works", {
  g <- make_ring(10)
  aut <- lapply(automorphism_group(g), as.vector)
  aut <- aut[order(sapply(aut, '[[', 1))]
  expect_that(aut, equals(list(c(1, 10:2), c(2:10, 1))))

  g <- make_full_graph(4)
  aut <- lapply(automorphism_group(g), as.vector)
  aut <- aut[order(sapply(aut, '[[', 1))]
  expect_that(aut, equals(list(c(1, 2, 4, 3), c(1, 3, 2, 4), c(2, 1, 3, 4))))
})


test_that("automorphism_group works with colored graphs", {
  g <- make_full_graph(4)
  aut <- lapply(automorphism_group(g, colors=c(1,2,1,2)), as.vector)
  aut <- aut[order(sapply(aut, '[[', 1))]
  expect_that(aut, equals(list(c(1, 4, 3, 2), c(3, 2, 1, 4))))

  V(g)$color <- c(1,2,1,2)
  aut <- lapply(automorphism_group(g), as.vector)
  aut <- aut[order(sapply(aut, '[[', 1))]
  expect_that(aut, equals(list(c(1, 4, 3, 2), c(3, 2, 1, 4))))
})
