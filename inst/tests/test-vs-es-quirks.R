
context("Vertex and edge sequence quirks")

test_that("graph is not updated if not in LHS", {

  g <- make_(ring(10),
             with_vertex_(name = LETTERS[1:10]),
             with_edge_(weight = 1:10))

  vs <- V(g)[1:5]
  vs$name <- letters[1:5]
  expect_equal(V(g)$name, LETTERS[1:10])

  es <- E(g)
  es$weight <- 0
  expect_equal(E(g)$weight, 1:10)

})

test_that("graph is updated if in LHS", {

  g <- make_(ring(10),
             with_vertex_(name = LETTERS[1:10]),
             with_edge_(weight = 1:10))

  V(g)[1:5]$name <- letters[1:5]
  expect_equal(V(g)$name, c(letters[1:5], LETTERS[6:10]))

  E(g)[1:5]$weight <- 0
  expect_equal(E(g)$weight, c(rep(0, 5), 6:10))

})
