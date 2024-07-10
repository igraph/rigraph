test_that("decompose works", {
  g <- sample_gnp(1000, 1 / 1500)
  G <- decompose(g)
  clu <- components(g)
  Gsizes <- sapply(G, vcount)
  expect_equal(sort(clu$csize), sort(Gsizes))
})

test_that("decompose works for many components", {
  g <- make_empty_graph(50001)
  tmp <- decompose(g)
  expect_equal(1, 1)
})

test_that("decompose works for many components and attributes", {
  g <- make_empty_graph(50001)
  V(g)$name <- 1:vcount(g)
  tmp <- decompose(g)
  expect_equal(1, 1)
})

test_that("decompose keeps attributes", {
  g <- make_ring(10) + make_ring(5)
  V(g)$name <- letters[1:(10 + 5)]
  E(g)$name <- apply(as_edgelist(g), 1, paste, collapse = "-")
  d <- decompose(g)
  d <- d[order(sapply(d, vcount))]

  expect_equal(length(d), 2)
  expect_equal(sapply(d, vcount), c(5, 10))
  expect_equal(V(d[[1]])$name, letters[1:5 + 10])
  expect_equal(V(d[[2]])$name, letters[1:10])
  e1 <- apply(as_edgelist(d[[1]]), 1, paste, collapse = "-")
  e2 <- apply(as_edgelist(d[[2]]), 1, paste, collapse = "-")
  expect_equal(E(d[[1]])$name, e1)
  expect_equal(E(d[[2]])$name, e2)
})

test_that("decompose protects correctly", {
  g <- make_graph(integer(), n = 10001)
  V(g)$a <- 1

  torture <- gctorture2(10001)
  on.exit(gctorture2(torture))

  expect_equal(length(decompose(g)), 10001)
})
