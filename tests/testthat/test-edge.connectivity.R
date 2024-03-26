test_that("edge_connectivity works", {

  g <- largest_component(sample_gnp(30, 8 / 30))
  ec <- edge_connectivity(g)
  ecST <- Inf
  for (j in 1:(vcount(g) - 1)) {
    for (k in (j + 1):vcount(g)) {
      ec2 <- edge_connectivity(g, source = j, target = k)
      if (ec2 < ecST) {
        ecST <- ec2
      }
    }
  }
  expect_equal(ec, ecST)

})

test_that("edge_connectivity works -- names", {

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

  ec1 <- edge_connectivity(kite, source = "Heather", target = "Andre")
  ec2 <- edge_connectivity(kite, source = "Garth", target = "Andre")
  ec3 <- edge_connectivity(kite, source = "Garth", target = "Ike")
  expect_equal(ec1, 2)
  expect_equal(ec2, 4)
  expect_equal(ec3, 1)
})
