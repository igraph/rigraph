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
  expect_that(g, is_connected)

  g <- make_ring(10) + make_full_graph(5)
  expect_false(is_connected(g))
})

test_that("is_connected returns FALSE for the null graph", {
  g <- make_empty_graph(0)
  expect_false(is_connected(g))
})
