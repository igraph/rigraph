test_that("ego works", {
  neig <- function(graph, order, vertices) {
    sp <- distances(graph)
    v <- unique(unlist(lapply(vertices, function(x) {
      w <- which(sp[x, ] <= order)
    })))
    induced_subgraph(graph, c(v, vertices))
  }

  g <- sample_gnp(50, 5 / 50)

  v <- sample(vcount(g), 1)
  g1 <- make_ego_graph(g, 2, v)[[1]]
  g2 <- neig(g, 2, v)
  expect_true(graph.isomorphic(g1, g2))

  #########

  nei <- function(graph, order, vertices) {
    sp <- distances(graph)
    v <- unique(unlist(lapply(vertices, function(x) {
      w <- which(sp[x, ] <= order)
    })))
    v
  }

  v1 <- ego(g, 2, v)[[1]]
  v2 <- nei(g, 2, v)
  expect_equal(as.vector(sort(v1)), sort(v2))

  #########

  s <- ego_size(g, 2, v)[[1]]
  expect_equal(s, length(v1))
})

test_that("mindist works", {
  g <- make_ring(10)
  expect_equal(ego_size(g, order = 2, mindist = 0), rep(5, 10))
  expect_equal(ego_size(g, order = 2, mindist = 1), rep(4, 10))
  expect_equal(ego_size(g, order = 2, mindist = 2), rep(2, 10))

  unvs <- function(x) lapply(x, as.vector)

  n0 <- unvs(ego(g, order = 2, 5:6, mindist = 0))
  n1 <- unvs(ego(g, order = 2, 5:6, mindist = 1))
  n2 <- unvs(ego(g, order = 2, 5:6, mindist = 2))

  expect_equal(lapply(n0, sort), list(3:7, 4:8))
  expect_equal(lapply(n1, sort), list(c(3, 4, 6, 7), c(4, 5, 7, 8)))
  expect_equal(lapply(n2, sort), list(c(3, 7), c(4, 8)))

  ng0 <- make_ego_graph(g, order = 2, 5:6, mindist = 0)
  ng1 <- make_ego_graph(g, order = 2, 5:6, mindist = 1)
  ng2 <- make_ego_graph(g, order = 2, 5:6, mindist = 2)

  expect_equal(sapply(ng0, vcount), c(5, 5))
  expect_equal(sapply(ng1, vcount), c(4, 4))
  expect_equal(sapply(ng2, vcount), c(2, 2))

  expect_equal(sapply(ng0, ecount), c(4, 4))
  expect_equal(sapply(ng1, ecount), c(2, 2))
  expect_equal(sapply(ng2, ecount), c(0, 0))
})
