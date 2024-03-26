test_that("diameter works -- undirected", {
  g <- largest_component(sample_gnp(30, 3 / 30))
  sp <- distances(g)
  expect_equal(max(sp), diameter(g))

  g <- largest_component(sample_gnp(100, 1 / 100))
  sp <- distances(g)
  sp[sp == Inf] <- NA
  expect_equal(max(sp, na.rm = TRUE), diameter(g))
})

test_that("diameter works -- directed", {
  g <- sample_gnp(30, 3 / 30, directed = TRUE)
  sp <- distances(g, mode = "out")
  sp[sp == Inf] <- NA
  expect_equal(max(sp, na.rm = TRUE), diameter(g, unconnected = TRUE))
})

test_that("diameter works -- weighted", {
  g <- sample_gnp(30, 3 / 30, directed = TRUE)
  E(g)$weight <- sample(1:10, ecount(g), replace = TRUE)
  sp <- distances(g, mode = "out")
  sp[sp == Inf] <- NA
  expect_equal(max(sp, na.rm = TRUE), diameter(g, unconnected = TRUE))
})

test_that("diameter works -- Bug #680538", {
  g <- make_tree(30, mode = "undirected")
  E(g)$weight <- 2
  expect_equal(diameter(g, unconnected = FALSE), 16)
})

test_that("diameter correctly handles disconnected graphs", {
  g <- make_tree(7, 2, mode = "undirected") %du% make_tree(4, 3, mode = "undirected")
  expect_equal(diameter(g, unconnected = TRUE), 4)
  expect_equal(diameter(g, unconnected = FALSE), Inf)
  E(g)$weight <- 2
  expect_equal(diameter(g, unconnected = FALSE), Inf)
})
