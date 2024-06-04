test_that("adhesion works", {
  g <- make_graph("Zachary")
  expect_equal(adhesion(g), 1)
  expect_equal(cohesion(g), 1)

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

  expect_equal(adhesion(kite), 1)
  expect_equal(cohesion(kite), 1)

  camp <- graph_from_literal(
    Harry:Steve:Don:Bert - Harry:Steve:Don:Bert,
    Pam:Brazey:Carol:Pat - Pam:Brazey:Carol:Pat,
    Holly - Carol:Pat:Pam:Jennie:Bill,
    Bill - Pauline:Michael:Lee:Holly,
    Pauline - Bill:Jennie:Ann,
    Jennie - Holly:Michael:Lee:Ann:Pauline,
    Michael - Bill:Jennie:Ann:Lee:John,
    Ann - Michael:Jennie:Pauline,
    Lee - Michael:Bill:Jennie,
    Gery - Pat:Steve:Russ:John,
    Russ - Steve:Bert:Gery:John,
    John - Gery:Russ:Michael
  )

  expect_equal(adhesion(camp), 2)
  expect_equal(cohesion(camp), 2)
})
