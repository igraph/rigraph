test_that("components works", {
  withr::local_seed(42)

  rg <- function(n) {
    largest_component(sample_gnp(n, 1 / n))
  }

  G <- lapply(1:30, function(x) rg(sample(100, 1)))
  Gsize <- sapply(G, vcount)

  allg <- disjoint_union(G)
  clu <- components(allg)

  expect_equal(as.numeric(table(clu$membership)), clu$csize)
  expect_equal(sort(clu$csize), sort(Gsize))
  expect_equal(clu$no, length(G))
})

test_that("components names results", {
  g <- make_ring(10) + make_full_graph(5)
  V(g)$name <- letters[1:15]

  clu <- components(g)
  expect_equal(names(clu$membership), letters[1:15])
})

test_that("groups works", {
  g <- make_ring(10) + make_full_graph(5)
  gr <- groups(components(g))

  expect_equal(gr, structure(list(`1` = 1:10, `2` = 11:15), .Dim = 2L, .Dimnames = list(c("1", "2"))))

  V(g)$name <- letters[1:15]
  gr <- groups(components(g))

  expect_equal(gr, structure(list(`1` = letters[1:10], `2` = letters[11:15]), .Dim = 2L, .Dimnames = list(c("1", "2"))))
})

test_that("is_connected works", {
  g <- make_ring(10)
  expect_true(is_connected(g))

  g <- make_ring(10) + make_full_graph(5)
  expect_false(is_connected(g))
})

test_that("is_connected returns FALSE for the null graph", {
  g <- make_empty_graph(0)
  expect_false(is_connected(g))
})

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
