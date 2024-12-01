test_that("as_adj_list works", {
  g <- sample_gnp(50, 2 / 50)
  al <- as_adj_list(g)
  g2 <- graph_from_adj_list(al, mode = "all")
  expect_isomorphic(g, g2)
  expect_true(graph.isomorphic.vf2(g, g2,
    vertex.color1 = 1:vcount(g),
    vertex.color2 = 1:vcount(g2)
  )$iso)

  ####

  el <- as_adj_edge_list(g)
  for (i in 1:vcount(g)) {
    a <- E(g)[.inc(i)]
    expect_equal(length(a), length(el[[i]]), ignore_attr = TRUE)
    expect_equal(sort(el[[i]]), sort(a), ignore_attr = TRUE)
  }

  g <- sample_gnp(50, 4 / 50, directed = TRUE)
  el1 <- as_adj_edge_list(g, mode = "out")
  el2 <- as_adj_edge_list(g, mode = "in")
  for (i in 1:vcount(g)) {
    a <- E(g)[.from(i)]
    expect_equal(length(a), length(el1[[i]]), ignore_attr = TRUE)
    expect_equal(sort(el1[[i]]), sort(a), ignore_attr = TRUE)
  }
  for (i in 1:vcount(g)) {
    a <- E(g)[.to(i)]
    expect_equal(length(a), length(el2[[i]]), ignore_attr = TRUE)
    expect_equal(sort(el2[[i]]), sort(a), ignore_attr = TRUE)
  }
})



test_that("as_adj_list works when return.vs.es is FALSE", {
  on.exit(try(igraph_options(old)), add = TRUE)
  old <- igraph_options(return.vs.es = FALSE)

  g <- sample_gnp(50, 2 / 50)
  al <- as_adj_list(g)
  g2 <- graph_from_adj_list(al, mode = "all")
  expect_isomorphic(g, g2)
  expect_true(graph.isomorphic.vf2(g, g2,
    vertex.color1 = 1:vcount(g),
    vertex.color2 = 1:vcount(g2)
  )$iso)

  ####

  el <- as_adj_edge_list(g)
  for (i in 1:vcount(g)) {
    a <- E(g)[.inc(i)]
    expect_equal(length(a), length(el[[i]]), ignore_attr = TRUE)
    expect_equal(sort(el[[i]]), sort(a), ignore_attr = TRUE)
  }

  g <- sample_gnp(50, 4 / 50, directed = TRUE)
  el1 <- as_adj_edge_list(g, mode = "out")
  el2 <- as_adj_edge_list(g, mode = "in")
  for (i in 1:vcount(g)) {
    a <- E(g)[.from(i)]
    expect_equal(length(a), length(el1[[i]]), ignore_attr = TRUE)
    expect_equal(sort(el1[[i]]), sort(a), ignore_attr = TRUE)
  }
  for (i in 1:vcount(g)) {
    a <- E(g)[.to(i)]
    expect_equal(length(a), length(el2[[i]]), ignore_attr = TRUE)
    expect_equal(sort(el2[[i]]), sort(a), ignore_attr = TRUE)
  }
})
