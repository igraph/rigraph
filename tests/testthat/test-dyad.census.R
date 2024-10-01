test_that("dyad_census works", {
  g1 <- make_ring(10)
  expect_warning(dc1 <- dyad_census(g1), "directed")
  expect_equal(dc1, list(mut = 10, asym = 0, null = 35))

  g2 <- make_ring(10, directed = TRUE, mutual = TRUE)
  dc2 <- dyad_census(g2)
  expect_equal(dc2, list(mut = 10, asym = 0, null = 35))

  g3 <- make_ring(10, directed = TRUE, mutual = FALSE)
  dc3 <- dyad_census(g3)
  expect_equal(dc3, list(mut = 0, asym = 10, null = 35))

  # Supporting 64-bit integers now, can't test for overflow
})

test_that("dyad_census works with celegansneural", {
  ce <- simplify(read_graph(gzfile("celegansneural.gml.gz"), format = "gml"))
  dc <- dyad_census(ce)

  expect_equal(dc, list(mut = 197, asym = 1951, null = 41808))
  expect_equal(sum(which_mutual(ce)), dc$mut * 2)
  expect_equal(
    ecount(as_undirected(ce, mode = "collapse")) - dc$mut,
    dc$asym
  )
  expect_equal(sum(unlist(dc)), vcount(ce) * (vcount(ce) - 1) / 2)
})
