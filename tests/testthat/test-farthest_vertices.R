test_that("farthest_vertices works", {
  kite <- graph_from_literal(
    Andre - Beverly:Carol:Diane:Fernando,
    Beverly - Andre:Diane:Ed:Garth,
    Carol - Andre:Diane:Fernando,
    Diane - Andre:Beverly:Carol:Ed:Fernando:Garth,
    Ed - Beverly:Diane:Garth,
    Fernando - Andre:Carol:Diane:Garth:Heather,
    Garth - Beverly:Diane:Ed:Fernando:Heather,
    Heather - Fernando:Garth:Ike,
    Ike - Heather:Jane,
    Jane - Ike
  )

  fn <- farthest_vertices(kite)
  fn$vertices <- as.vector(fn$vertices)
  expect_equal(fn, list(vertices = c(1, 10), distance = 4))

  expect_equal(
    distances(kite, v = fn$vertices[1], to = fn$vertices[2])[1],
    fn$distance
  )
  expect_equal(diameter(kite), fn$distance)
})
