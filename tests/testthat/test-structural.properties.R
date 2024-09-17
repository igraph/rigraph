test_that("dfs() uses 1-based root vertex index", {
  g <- make_ring(3)
  expect_equal(dfs(g, root = 1)$root, 1)
})

test_that("dfs() does not pad order", {
  g <- make_star(3)
  expect_equal(as.numeric(dfs(g, root = 2, unreachable = FALSE)$order), c(2, 1))

  local_igraph_options(return.vs.es = FALSE)
  expect_equal(as.numeric(dfs(g, root = 2, unreachable = FALSE)$order), c(2, 1))
  expect_equal(as.numeric(dfs(g, root = 2, unreachable = FALSE, order.out = TRUE)$order.out), c(1, 2))
})

test_that("BFS uses 1-based root vertex index", {
  g <- make_ring(3)
  expect_equal(bfs(g, root = 1)$root, 1)
})

test_that("BFS works from multiple root vertices", {
  g <- make_ring(10) %du% make_ring(10)

  expect_equal(
    as.vector(bfs(g, 1)$order),
    c(1, 2, 10, 3, 9, 4, 8, 5, 7, 6, 11, 12, 20, 13, 19, 14, 18, 15, 17, 16)
  )

  expect_equal(
    as.vector(bfs(g, 1, unreachable = FALSE)$order),
    c(1, 2, 10, 3, 9, 4, 8, 5, 7, 6)
  )

  expect_equal(
    as.vector(bfs(g, c(1, 12), unreachable = FALSE)$order),
    c(1, 2, 10, 3, 9, 4, 8, 5, 7, 6, 12, 11, 13, 20, 14, 19, 15, 18, 16, 17)
  )

  expect_equal(
    as.vector(bfs(g, c(12, 1, 15), unreachable = FALSE)$order),
    c(12, 11, 13, 20, 14, 19, 15, 18, 16, 17, 1, 2, 10, 3, 9, 4, 8, 5, 7, 6)
  )
})

test_that("issue 133", {
  g <- graph_from_edgelist(matrix(c(1, 2, 2, 3), ncol = 2, byrow = TRUE))

  expect_equal(
    as.numeric(bfs(g, 1, restricted = c(1, 2), unreachable = FALSE)$order),
    c(1, 2)
  )
})

test_that("BFS callback works", {
  env <- new.env()
  env$history <- list()

  callback <- function(graph, data, extra) {
    env$history <- append(env$history, list(data))
    FALSE
  }

  g <- make_ring(5, directed = TRUE)
  bfs(g, root = 3, mode = "out", callback = callback)

  names <- c("vid", "pred", "succ", "rank", "dist")
  expect_equal(
    env$history,
    list(
      setNames(c(3, 0, 4, 1, 0), names),
      setNames(c(4, 3, 5, 2, 1), names),
      setNames(c(5, 4, 1, 3, 2), names),
      setNames(c(1, 5, 2, 4, 3), names),
      setNames(c(2, 1, 0, 5, 4), names)
    )
  )
})

test_that("BFS callback does not blow up when an invalid value is returned", {
  env <- new.env()
  env$history <- list()

  callback <- function(graph, data, extra) {
    env$history <- append(env$history, list(data))
    data
  }

  g <- make_ring(5, directed = TRUE)
  bfs(g, root = 3, mode = "out", callback = callback)

  # returned value is coerced to TRUE so it should terminate the search after
  # one step

  names <- c("vid", "pred", "succ", "rank", "dist")
  expect_equal(
    env$history,
    list(setNames(c(3, 0, 4, 1, 0), names))
  )
})

test_that("BFS callback does not blow up when an error is raised within the callback", {
  callback <- function(graph, data, extra) {
    stop("test")
    FALSE
  }

  g <- make_ring(5, directed = TRUE)
  expect_error(bfs(g, root = 3, mode = "out", callback = callback), "test")

  expect_true(TRUE)
})

test_that("BFS callback does not blow up when another igraph function is raised within the callback", {
  skip("nested igraph call handling not implemented yet")

  callback <- function(graph, data, extra) {
    neighbors(graph, 1)
    FALSE
  }

  g <- make_ring(5, directed = TRUE)
  bfs(g, root = 3, mode = "out", callback = callback)

  expect_true(TRUE)
})

test_that("bfs() works", {
  local_igraph_options(print.id = FALSE)

  expect_snapshot({
    g <- graph_from_literal(a - +b - +c, z - +a, d)
    bfs(
      g,
      root = 2,
      mode = "out",
      unreachable = FALSE,
      order = TRUE,
      rank = TRUE,
      father = TRUE,
      pred = TRUE,
      succ = TRUE,
      dist = TRUE
    )
  })
})

test_that("bfs() does not pad order", {
  g <- make_star(3)
  expect_equal(as.numeric(bfs(g, root = 2, unreachable = FALSE)$order), c(2, 1))

  local_igraph_options(return.vs.es = FALSE)
  expect_equal(as.numeric(bfs(g, root = 2, unreachable = FALSE)$order), c(2, 1))
})

test_that("diameter() works -- undirected", {
  g <- largest_component(sample_gnp(30, 3 / 30))
  sp <- distances(g)
  expect_equal(max(sp), diameter(g))

  g <- largest_component(sample_gnp(100, 1 / 100))
  sp <- distances(g)
  sp[sp == Inf] <- NA
  expect_equal(max(sp, na.rm = TRUE), diameter(g))
})

test_that("diameter() works -- directed", {
  g <- sample_gnp(30, 3 / 30, directed = TRUE)
  sp <- distances(g, mode = "out")
  sp[sp == Inf] <- NA
  expect_equal(max(sp, na.rm = TRUE), diameter(g, unconnected = TRUE))
})

test_that("diameter() works -- weighted", {
  g <- sample_gnp(30, 3 / 30, directed = TRUE)
  E(g)$weight <- sample(1:10, ecount(g), replace = TRUE)
  sp <- distances(g, mode = "out")
  sp[sp == Inf] <- NA
  expect_equal(max(sp, na.rm = TRUE), diameter(g, unconnected = TRUE))
})

test_that("diameter() works -- Bug #680538", {
  g <- make_tree(30, mode = "undirected")
  E(g)$weight <- 2
  expect_equal(diameter(g, unconnected = FALSE), 16)
})

test_that("diameter() correctly handles disconnected graphs", {
  g <- make_tree(7, 2, mode = "undirected") %du% make_tree(4, 3, mode = "undirected")
  expect_equal(diameter(g, unconnected = TRUE), 4)
  expect_equal(diameter(g, unconnected = FALSE), Inf)
  E(g)$weight <- 2
  expect_equal(diameter(g, unconnected = FALSE), Inf)
})

test_that("get_diameter() works", {
  g <- make_ring(10)
  E(g)$weight <- sample(seq_len(ecount(g)))
  d <- diameter(g)
  gd <- get_diameter(g)
  sp <- distances(g)

  expect_equal(d, max(sp))
  expect_equal(sp[gd[1], gd[length(gd)]], d)

  d <- diameter(g, weights = NA)
  gd <- get_diameter(g, weights = NA)
  sp <- distances(g, weights = NA)

  expect_equal(d, max(sp))
  length(gd) == d + 1
  expect_equal(sp[gd[1], gd[length(gd)]], d)
})
