test_that("automorphisms works", {
  g <- make_ring(10)
  expect_equal(count_automorphisms(g)$group_size, "20")

  g <- make_full_graph(4)
  expect_equal(count_automorphisms(g)$group_size, "24")
})


test_that("automorphisms works with colored graphs", {
  g <- make_full_graph(4)
  expect_equal(count_automorphisms(g, colors = c(1, 2, 1, 2))$group_size, "4")

  V(g)$color <- c(1, 2, 1, 2)
  expect_equal(count_automorphisms(g)$group_size, "4")
  expect_equal(count_automorphisms(g, colors = NULL)$group_size, "24")
})


test_that("automorphism_group works", {
  g <- make_ring(10)
  aut <- lapply(automorphism_group(g), as.vector)
  aut <- aut[order(sapply(aut, "[[", 1))]
  expect_equal(aut, list(c(1, 10:2), c(2:10, 1)))

  g <- make_full_graph(4)
  aut <- lapply(automorphism_group(g), as.vector)
  aut <- aut[order(sapply(aut, "[[", 1))]
  expect_equal(aut, list(c(1, 2, 4, 3), c(1, 3, 2, 4), c(2, 1, 3, 4)))
})


test_that("automorphism_group works with colored graphs", {
  g <- make_full_graph(4)
  aut <- lapply(automorphism_group(g, colors = c(1, 2, 1, 2)), as.vector)
  aut <- aut[order(sapply(aut, "[[", 1))]
  expect_equal(aut, list(c(1, 4, 3, 2), c(3, 2, 1, 4)))

  V(g)$color <- c(1, 2, 1, 2)
  aut <- lapply(automorphism_group(g), as.vector)
  aut <- aut[order(sapply(aut, "[[", 1))]
  expect_equal(aut, list(c(1, 4, 3, 2), c(3, 2, 1, 4)))
})

test_that("isomorphisms works", {
  motif <- make_empty_graph(directed = FALSE) +
    vertices("D1", "D2", type = c("type1", "type1")) +
    edges("D1", "D2", type = c("type2"))
  subgraph_isomorphisms(
    target = motif, pattern = motif, method = "vf2",
    vertex.color1 = 2:1, vertex.color2 = 1:2
  )
})

test_that("isomorphisms() works", {
  motif <- make_empty_graph(directed = FALSE) +
    vertices("D1", "D2", type = c("type1", "type1")) +
    edges("D1", "D2", type = c("type2"))
  out <- isomorphisms(
    motif, motif,
    method = "vf2",
    vertex.color1 = 2:1, vertex.color2 = 1:2
  )
  expect_length(out, 1)
  expect_equal(as.numeric(out[[1]]), 2:1)
})

test_that("subgraph_isomorphisms works", {
  motif <- make_empty_graph(directed = FALSE) +
    vertices("D1", "D2", type = c("type1", "type1")) +
    edges("D1", "D2", type = c("type2"))
  out <- subgraph_isomorphisms(
    target = motif, pattern = motif, method = "vf2",
    vertex.color1 = 2:1, vertex.color2 = 1:2
  )
  expect_length(out, 1)
  expect_equal(as.numeric(out[[1]]), 2:1)
})
