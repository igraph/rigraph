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

test_that("sample_degseq works", {
  gc <- function(graph) {
    clu <- components(graph)
    induced_subgraph(graph, which(clu$membership == which.max(clu$csize)))
  }

  g <- gc(sample_gnp(1000, 2 / 1000))

  nG <- sample_degseq(degree(g), method = "simple")
  expect_that(degree(nG), equals(degree(g)))

  nG <- sample_degseq(degree(g), method = "vl")
  expect_that(degree(nG), equals(degree(g)))
  expect_true(is_connected(nG))
  expect_true(is_simple(nG))

  #####

  g <- sample_gnp(1000, 1 / 1000)

  nG <- sample_degseq(degree(g), method = "simple")
  expect_that(degree(nG), equals(degree(g)))

  g2 <- sample_gnp(1000, 2 / 1000, directed = TRUE)

  nG2 <- sample_degseq(degree(g, mode = "out"),
    degree(g, mode = "in"),
    method = "simple"
  )
  expect_that(degree(nG, mode = "out"), equals(degree(g, mode = "out")))
  expect_that(degree(nG, mode = "in"), equals(degree(g, mode = "in")))

  nG3 <- sample_degseq(degree(g, mode = "out"),
    degree(g, mode = "in"),
    method = "simple.no.multiple"
  )
  expect_that(degree(nG, mode = "out"), equals(degree(g, mode = "out")))
  expect_that(degree(nG, mode = "in"), equals(degree(g, mode = "in")))

  nG4 <- sample_degseq(degree(g, mode = "out"),
    degree(g, mode = "in"),
    method = "simple.no.multiple.uniform"
  )
  expect_that(degree(nG, mode = "out"), equals(degree(g, mode = "out")))
  expect_that(degree(nG, mode = "in"), equals(degree(g, mode = "in")))
})

test_that("sample_degseq supports the sample_(...) syntax", {
  degs <- rep(4, 20)
  g1 <- sample_(degseq(degs))
  g2 <- sample_(degseq(degs))

  expect_that(degree(g1), equals(degs))
  expect_that(degree(g2), equals(degs))

  expect_false(identical_graphs(g1, g2))
})
