test_that("vs printing", {
  local_igraph_options(print.id = FALSE)

  local_rng_version("3.5.0")
  withr::local_seed(42)
  g <- make_graph(~ A - A:B:C, B - A:B:C) %>%
    set_vertex_attr("color", value = "red") %>%
    set_vertex_attr("weight", value = sample(1:10, 3))

  expect_snapshot({
    V(g)[[1]]
    V(g)[[2]]
    V(g)[1:2]
    V(g)[2:3]
  })
})

test_that("vs printing, complex attributes", {
  local_igraph_options(print.id = FALSE)

  local_rng_version("3.5.0")
  withr::local_seed(42)
  g <- make_graph(~ A - A:B:C, B - A:B:C) %>%
    set_vertex_attr("color", value = "red") %>%
    set_vertex_attr("weight", value = sample(1:10, 3)) %>%
    set_vertex_attr("cplx", value = replicate(3, 1:4, simplify = FALSE))

  expect_snapshot({
    V(g)[[1]]
    V(g)[[2:3]]
  })
})

test_that("es printing", {
  local_igraph_options(print.id = FALSE)

  local_rng_version("3.5.0")
  withr::local_seed(42)
  g <- make_graph(~ A - A:B:C, B - A:B:C) %>%
    set_edge_attr("color", value = "red") %>%
    set_edge_attr("weight", value = sample(1:10, 3))

  expect_snapshot({
    E(g)[[1]]
    E(g)[[2:3]]
  })
})

test_that("es printing, complex attributes", {
  local_igraph_options(print.id = FALSE)

  local_rng_version("3.5.0")
  withr::local_seed(42)
  g <- make_graph(~ A - A:B:C, B - A:B:C) %>%
    set_edge_attr("color", value = "red") %>%
    set_edge_attr("weight", value = sample(1:10, 3)) %>%
    set_edge_attr("cmpx", value = replicate(3, 1:4, simplify = FALSE))

  expect_snapshot({
    E(g)[[1]]
    E(g)[[2:3]]
  })
})
