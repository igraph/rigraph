test_that("dyad_census works", {
  g1 <- make_ring(10)
  expect_warning(dc1 <- dyad_census(g1), "directed")
  expect_that(dc1, equals(list(mut = 10, asym = 0, null = 35)))

  g2 <- make_ring(10, directed = TRUE, mutual = TRUE)
  dc2 <- dyad_census(g2)
  expect_that(dc2, equals(list(mut = 10, asym = 0, null = 35)))

  g3 <- make_ring(10, directed = TRUE, mutual = FALSE)
  dc3 <- dyad_census(g3)
  expect_that(dc3, equals(list(mut = 0, asym = 10, null = 35)))

  # Supporting 64-bit integers now, can't test for overflow
})

test_that("dyad_census works with celegansneural", {
  ce <- simplify(read_graph(gzfile("celegansneural.gml.gz"), format = "gml"))
  dc <- dyad_census(ce)

  expect_that(dc, equals(list(mut = 197, asym = 1951, null = 41808)))
  expect_that(sum(which_mutual(ce)), equals(dc$mut * 2))
  expect_that(
    ecount(as.undirected(ce, mode = "collapse")) - dc$mut,
    equals(dc$asym)
  )
  expect_that(sum(unlist(dc)), equals(vcount(ce) * (vcount(ce) - 1) / 2))
})
