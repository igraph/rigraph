
context("make_lattice")

test_that("make_lattice works", {

  g <- make_lattice(dim = 2, length = 3, circular=F)
  g2 <- make_empty_graph(n = 9) + edges( c(1,2, 1,4, 2,3, 2,5, 3,6, 4,5, 4,7, 5,6, 5,8, 6,9, 7,8, 8,9) )
  expect_equal(as_edgelist(g), as_edgelist(g2))

  g <- make_lattice(dim = 2, length = 3, circular=T)
  g2 <- make_empty_graph(n = 9) + edges( c(1,2, 1,4, 2,3, 2,5, 1,3, 3,6, 4,5, 4,7, 5,6, 5,8, 4,6, 6,9, 7,8, 1,7, 8,9, 2,8, 7,9, 3,9) )
  expect_equal(as_edgelist(g), as_edgelist(g2))

})

test_that("make_lattice prints a warning for fractional length)", {

  expect_warning(make_lattice(dim = 2, length = sqrt(2000)), "length was rounded")

  suppressWarnings(g <- make_lattice(dim = 2, length = sqrt(2000)))
  g2 <- make_lattice(dim = 2, length = 45)
  expect_true(identical_graphs(g, g2))

})
