test_that("realize_degseq works", {

  g <- largest_component(sample_gnp(1000, 2 / 1000))

  nG <- realize_degseq(degree(g))
  expect_that(degree(nG), equals(degree(g)))
  expect_true(is_connected(nG))
  expect_true(is_simple(nG))

  nG <- realize_degseq(degree(g), method = "smallest")
  expect_that(degree(nG), equals(degree(g)))
  expect_true(is_simple(nG))

  nG <- realize_degseq(degree(g), method = "index", allowed.edge.types = "all")
  expect_that(degree(nG), equals(degree(g)))

  #####

  g2 <- sample_gnp(1000, 2 / 1000, directed = TRUE)

  nG <- realize_degseq(degree(g2, mode = "out"), degree(g2, mode = "in"))
  expect_that(degree(nG, mode = "out"), equals(degree(g2, mode = "out")))
  expect_that(degree(nG, mode = "in"), equals(degree(g2, mode = "in")))
  expect_true(is_simple(nG))
})

test_that("realize_degseq supports the make_(...) syntax", {
  degs <- rep(4, 20)
  g1 <- make_(degseq(degs, deterministic = T))
  g2 <- make_(degseq(degs, deterministic = T))

  expect_that(degree(g1), equals(degs))
  expect_that(degree(g2), equals(degs))

  expect_true(identical_graphs(g1, g2))
})
