local_rng_version("3.5.0")
withr::local_seed(12345)
n <- 10^3
p <- 0.1
g <- sample_gnp(n, p)
E(g)$weight <- sample(ecount(g))
gp <- sample_gnp(n, p)
E(gp)$weight <- sample(ecount(gp))

test_that("General scan-stat works, US, scan-0, unweighted", {
  s1 <- local_scan(g, k = 0)
  expect_equal(digest::digest(s1), "659ffaaf303742f0806a79b8ff3d88b3")
})

test_that("General scan-stat works, US, scan-0, weighted", {
  s1 <- local_scan(g, k = 0, weighted = TRUE)
  expect_equal(digest::digest(s1), "0f8d7ac831389cea04e0bfc5e2510c73")
})


test_that("General scan-stat works, US, scan-1, unweighted", {
  s1 <- local_scan(g)
  expect_equal(digest::digest(s1), "df0fd77489f70cc47f682dc31d9f52f5")
})

test_that("General scan-stat works, US, scan-1, weighted", {
  s1 <- local_scan(g, k = 1, weighted = TRUE)
  expect_equal(digest::digest(s1), "af720916ae4b49881745d2dcdd614401")
})

test_that("General scan-stat works, US, scan-2, unweighted", {
  s1 <- local_scan(g, k = 2)
  expect_equal(digest::digest(s1), "6f47f47abde25d00d615dd56826cca5a")
})

test_that("General scan-stat works, US, scan-2, weighted", {
  s1 <- local_scan(g, k = 2, weighted = TRUE)
  expect_equal(digest::digest(s1), "e02e9d58168ee5d53850497f6d4c76b0")
})

test_that("General scan-stat works, THEM, scan-0, unweighted", {
  s1 <- local_scan(g, gp, k = 0)
  expect_equal(digest::digest(s1), "f584f7d287f8f89f5f7882165ca41b8c")
})

test_that("General scan-stat works, THEM, scan-0, weighted", {
  s1 <- local_scan(g, gp, k = 0, weighted = TRUE)
  expect_equal(digest::digest(s1), "213db8e7517d1e6406da3dbd55281ed1")
})

test_that("General scan-stat works, THEM, scan-1, unweighted", {
  s1 <- local_scan(g, gp, k = 1)
  expect_equal(digest::digest(s1), "e9ca740ebba2fd1db4abe939954b2638")
})

test_that("General scan-stat works, THEM, scan-1, weighted", {
  s1 <- local_scan(g, gp, k = 1, weighted = TRUE)
  expect_equal(digest::digest(s1), "a98e9a03eda7feaae8524dc9348ad74b")
})

test_that("General scan-stat works, THEM, scan-2, unweighted", {
  s1 <- local_scan(g, gp, k = 2)
  expect_equal(digest::digest(s1), "a3237a9a55e9d86ab471c81a291eb03b")
})

test_that("General scan-stat works, THEM, scan-2, weighted", {
  s1 <- local_scan(g, gp, k = 2, weighted = TRUE)
  expect_equal(digest::digest(s1), "995d0b6a952834ff6e534efc2cfb917b")
})

test_that("Neighborhoods work for us", {
  nei <- neighborhood(g, order = 1)
  s1 <- local_scan(g, neighborhoods = nei)
  expect_equal(digest::digest(s1), "df0fd77489f70cc47f682dc31d9f52f5")
  s1 <- local_scan(g, k = 1, weighted = TRUE, neighborhoods = nei)
  expect_equal(digest::digest(s1), "af720916ae4b49881745d2dcdd614401")

  nei <- neighborhood(g, order = 2)
  s1 <- local_scan(g, k = 2, neighborhoods = nei)
  expect_equal(digest::digest(s1), "6f47f47abde25d00d615dd56826cca5a")
  s1 <- local_scan(g, k = 2, weighted = TRUE, neighborhoods = nei)
  expect_equal(digest::digest(s1), "e02e9d58168ee5d53850497f6d4c76b0")
})

test_that("Neighborhoods work for them", {
  nei <- neighborhood(g, order = 1)
  s1 <- local_scan(g, gp, k = 1, neighborhoods = nei)
  expect_equal(digest::digest(s1), "e9ca740ebba2fd1db4abe939954b2638")
  s1 <- local_scan(g, gp, k = 1, weighted = TRUE, neighborhoods = nei)
  expect_equal(digest::digest(s1), "a98e9a03eda7feaae8524dc9348ad74b")

  nei <- neighborhood(g, order = 2)
  s1 <- local_scan(g, gp, k = 2, neighborhoods = nei)
  expect_equal(digest::digest(s1), "a3237a9a55e9d86ab471c81a291eb03b")
  s1 <- local_scan(g, gp, k = 2, weighted = TRUE, neighborhoods = nei)
  expect_equal(digest::digest(s1), "995d0b6a952834ff6e534efc2cfb917b")
})

withr::local_seed(42)
n <- 10^3
p <- 0.1
g <- sample_gnp(n, p, directed = TRUE)
E(g)$weight <- sample(ecount(g))
gp <- sample_gnp(n, p)
E(gp)$weight <- sample(ecount(gp))

## US, scan-0, unweighted, directed
## TODO

test_that("General scan-stat works, US, scan-1, unweighted, directed", {
  s1o <- local_scan(g, k = 1, weighted = FALSE, mode = "out")
  expect_equal(digest::digest(s1o), "ac463c21b2b6bc91abf82f0141a4a7d4")

  s1i <- local_scan(g, k = 1, weighted = FALSE, mode = "in")
  expect_equal(digest::digest(s1i), "13fdaaeec54118e217821b56d8c3ff03")
})

test_that("General scan-stat works, US, scan-1, weighted, directed", {
  s1o <- local_scan(g, k = 1, weighted = TRUE, mode = "out")
  expect_equal(digest::digest(s1o), "da8e14f2ba63efc74b5fd7b9d8f79bbc")

  s1i <- local_scan(g, k = 1, weighted = TRUE, mode = "in")
  expect_equal(digest::digest(s1i), "f5f07eebb907ae0a244195a20971be11")
})

## US, scan-2, unweighted, directed
## TODO

test_that("Issue 18 is resolved", {
  g <- make_graph(c(1, 2, 2, 1, 1, 3, 3, 1, 2, 4, 3, 4, 3, 5, 5, 3, 4, 5, 5, 4))
  expect_equal(local_scan(g, mode = "all"), c(4, 3, 7, 6, 5))
  expect_equal(local_scan(g, mode = "out"), c(4, 3, 7, 2, 5))
  expect_equal(local_scan(g, mode = "in"), c(4, 2, 4, 6, 5))
})

test_that("Issue 18 is really resolved", {
  el <- c(
    1, 5, 1, 7, 2, 5, 2, 7, 2, 10, 2, 13, 2, 18, 3, 5, 3, 10, 3,
    13, 4, 5, 4, 10, 5, 7, 5, 10, 5, 13, 5, 18, 6, 3, 6, 5, 6, 7,
    6, 13, 7, 5, 8, 5, 8, 10, 8, 18, 9, 3, 9, 5, 9, 7, 9, 10, 11,
    5, 12, 5, 12, 7, 14, 5, 14, 7, 14, 13, 14, 18, 15, 5, 15, 13,
    15, 18, 16, 5, 16, 10, 16, 13, 16, 18, 17, 5
  )

  g <- make_graph(el)

  sc1 <- sapply(make_ego_graph(g, order = 1, mode = "all"), ecount)
  sc2 <- local_scan(graph.us = g, mode = "all", k = 1)
  expect_equal(sc1, sc2)

  g2 <- induced_subgraph(g, 5:8)
  sc21 <- sapply(make_ego_graph(g2, order = 1, mode = "all"), ecount)
  sc22 <- local_scan(graph.us = g2, mode = "all", k = 1)
  expect_equal(sc21, sc22)
})

test_that("Issue 20 is resolved", {
  withr::local_seed(12345)
  g1 <- sample_gnp(n = 20, p = 0.1, directed = TRUE)
  g2 <- sample_gnp(n = 20, p = 0.1, directed = TRUE)
  ls <- local_scan(g2, g1, k = 1, mode = "all")
  correct <- c(4, 1, 2, 1, 1, 8, 1, 2, 0, 5, 2, 3, 3, 4, 5, 3, 5, 4, 2, 1)
  expect_equal(ls, correct)
})

test_that("FUN argument works, #32", {
  r1 <- local_scan(make_ring(10), k = 1, FUN = "ecount")
  r2 <- local_scan(make_ring(10), k = 1, FUN = ecount)
  expect_equal(r1, rep(2, 10))
  expect_equal(r2, rep(2, 10))
})
