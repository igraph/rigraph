test_that("serialization works", {
  local_igraph_options(print.id = FALSE)

  g <- make_ring(3, directed = TRUE)
  gs <- unserialize(serialize(g, NULL))

  expect_identical(unclass(g)[-igraph_t_idx_env], unclass(gs)[-igraph_t_idx_env])

  expect_snapshot({
    g
    gs
  })
})
