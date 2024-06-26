test_that("transitivity works", {
  withr::local_seed(42)
  g <- sample_gnp(100, p = 10 / 100)

  t1 <- transitivity(g, type = "global")
  expect_equal(t1, 0.10483870967741935887)

  t2 <- transitivity(g, type = "average")
  expect_equal(t2, 0.10159943848720931481)

  t3 <- transitivity(g, type = "local", vids = V(g))
  t33 <- transitivity(g, type = "local")
  est3 <- structure(c(0, 0.06667, 0.1028, 0.1016, 0.1333, 0.2222),
    .Names = c(
      "Min.", "1st Qu.", "Median", "Mean",
      "3rd Qu.", "Max."
    ),
    class = c("summaryDefault", "table")
  )
  expect_equal(summary(t3), est3, tolerance = 1e-3)
  expect_equal(summary(t33), est3, tolerance = 1e-3)
})

test_that("no integer overflow", {
  withr::local_seed(42)
  g <- make_star(80000, mode = "undirected") + edges(sample(2:1000), 100)
  mtr <- min(transitivity(g, type = "local"), na.rm = TRUE)
  expect_true(mtr > 0)
})

# Check that transitivity() produces named vectors, see #943
# The four tests below check four existing code paths
test_that("local transitivity produces named vectors", {
  g <- make_graph(~ a - b - c - a - d)
  E(g)$weight <- 1:4
  t1 <- transitivity(g, type = "local")
  t2 <- transitivity(g, type = "barrat")

  vs <- c("a", "c")
  t3 <- transitivity(g, type = "local", vids = vs)
  t4 <- transitivity(g, type = "barrat", vids = vs)

  expect_equal(names(t1), V(g)$name)
  expect_equal(names(t2), V(g)$name)
  expect_equal(names(t3), vs)
  expect_equal(names(t4), vs)
})
