test_that("BFS uses 1-based root vertex index", {
  g <- make_ring(3)
  expect_that(bfs(g, root = 1)$root, equals(1))
})

test_that("BFS works from multiple root vertices", {
  g <- make_ring(10) %du% make_ring(10)

  expect_that(
    as.vector(bfs(g, 1)$order),
    equals(c(1, 2, 10, 3, 9, 4, 8, 5, 7, 6, 11, 12, 20, 13, 19, 14, 18, 15, 17, 16))
  )

  expect_that(
    as.vector(bfs(g, 1, unreachable = FALSE)$order),
    equals(c(1, 2, 10, 3, 9, 4, 8, 5, 7, 6, rep(NA, 10)))
  )

  expect_that(
    as.vector(bfs(g, c(1, 12), unreachable = FALSE)$order),
    equals(c(1, 2, 10, 3, 9, 4, 8, 5, 7, 6, 12, 11, 13, 20, 14, 19, 15, 18, 16, 17))
  )

  expect_that(
    as.vector(bfs(g, c(12, 1, 15), unreachable = FALSE)$order),
    equals(c(12, 11, 13, 20, 14, 19, 15, 18, 16, 17, 1, 2, 10, 3, 9, 4, 8, 5, 7, 6))
  )
})

test_that("issue 133", {
  g <- graph_from_edgelist(matrix(c(1, 2, 2, 3), ncol = 2, byrow = TRUE))

  expect_equal(
    ignore_attr = TRUE,
    bfs(g, 1, restricted = c(1, 2), unreachable = FALSE)$order,
    V(g)[c(1, 2, NA_real_), na_ok = TRUE]
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

test_that("snapshot test", {
  local_igraph_options(print.id = FALSE)

  expect_snapshot({
    g <- graph_from_literal(a -+ b -+ c, z -+ a, d)
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
