test_that("realize_degseq works", {
  g <- largest_component(sample_gnp(1000, 2 / 1000))

  nG <- realize_degseq(degree(g))
  expect_equal(degree(nG), degree(g))
  expect_true(is_connected(nG))
  expect_true(is_simple(nG))

  nG <- realize_degseq(degree(g), method = "smallest")
  expect_equal(degree(nG), degree(g))
  expect_true(is_simple(nG))

  nG <- realize_degseq(degree(g), method = "index", allowed.edge.types = "all")
  expect_equal(degree(nG), degree(g))

  #####

  g2 <- sample_gnp(1000, 2 / 1000, directed = TRUE)

  nG <- realize_degseq(degree(g2, mode = "out"), degree(g2, mode = "in"))
  expect_equal(degree(nG, mode = "out"), degree(g2, mode = "out"))
  expect_equal(degree(nG, mode = "in"), degree(g2, mode = "in"))
  expect_true(is_simple(nG))
})

test_that("realize_degseq supports the make_(...) syntax", {
  degs <- rep(4, 20)
  g1 <- make_(degseq(degs, deterministic = T))
  g2 <- make_(degseq(degs, deterministic = T))

  expect_equal(degree(g1), degs)
  expect_equal(degree(g2), degs)

  expect_true(identical_graphs(g1, g2))
})
