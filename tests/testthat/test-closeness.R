test_that("closeness works", {
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

  clo <- closeness(kite) * (vcount(kite) - 1)
  expect_equal(
    round(sort(clo, decreasing = TRUE), 3),
    c(Fernando = 0.643, Garth = 0.643, Diane = 0.600, Heather = 0.600, Andre = 0.529, Beverly = 0.529, Carol = 0.500, Ed = 0.500, Ike = 0.429, Jane = 0.310)
  )

  clo2 <- closeness(kite, normalized = TRUE)
  expect_equal(clo, clo2)
})

## TODO: weighted closeness

test_that("closeness centralization works", {
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

  c1 <- closeness(kite, normalized = TRUE)
  c2 <- centr_clo(kite)
  expect_equal(unname(c1), c2$res)
  expect_equal(c2$centralization, 0.270374931581828)
  expect_equal(c2$theoretical_max, 4.23529411764706)
})
