test_that("as_adj_list works", {
  g <- sample_gnp(50, 2 / 50)
  al <- as_adj_list(g)
  g2 <- graph_from_adj_list(al, mode = "all")
  expect_true(graph.isomorphic(g, g2))
  expect_true(graph.isomorphic.vf2(g, g2,
    vertex.color1 = 1:vcount(g),
    vertex.color2 = 1:vcount(g2)
  )$iso)

  ####

  el <- as_adj_edge_list(g)
  for (i in 1:vcount(g)) {
    a <- E(g)[.inc(i)]
    expect_that(length(a), is_equivalent_to(length(el[[i]])))
    expect_that(sort(el[[i]]), is_equivalent_to(sort(a)))
  }

  g <- sample_gnp(50, 4 / 50, directed = TRUE)
  el1 <- as_adj_edge_list(g, mode = "out")
  el2 <- as_adj_edge_list(g, mode = "in")
  for (i in 1:vcount(g)) {
    a <- E(g)[.from(i)]
    expect_that(length(a), is_equivalent_to(length(el1[[i]])))
    expect_that(sort(el1[[i]]), is_equivalent_to(sort(a)))
  }
  for (i in 1:vcount(g)) {
    a <- E(g)[.to(i)]
    expect_that(length(a), is_equivalent_to(length(el2[[i]])))
    expect_that(sort(el2[[i]]), is_equivalent_to(sort(a)))
  }
})
