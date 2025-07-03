test_that("basic plot test, layout 1", {
  skip_if_not_installed("vdiffr")

  g <- make_graph(c(1, 2, 1, 1, 2, 3), directed = F)
  g$layout <- structure(
    c(
      1.3334764568601,
      0.25005693449542,
      -0.832839300886122,
      -1.08278419159866,
      -0.70646229874506,
      -0.33032215991384
    ),
    dim = 3:2
  )

  vdiffr::expect_doppelganger(
    "Basic graph, layout 1",
    function() {
      cols <- c("red", "green", "blue")
      plot(g, edge.color = cols)
    }
  )
})

test_that("basic plot test, layout 2", {
  skip_if_not_installed("vdiffr")

  g <- make_graph(c(1, 2, 1, 1, 2, 3), directed = F)
  g$layout <- structure(
    c(
      1.17106961533433,
      1.63885278868168,
      2.10732892696401,
      3.91718168529106,
      2.87660789399794,
      1.83449260993935
    ),
    dim = 3:2
  )

  vdiffr::expect_doppelganger(
    "Basic graph, layout 2",
    function() {
      cols <- c("red", "green", "blue")
      plot(g, edge.color = cols)
    }
  )
})

test_that("basic plot test, spheres", {
  skip_if_not_installed("vdiffr")

  g <- make_graph(c(1, 2, 1, 1, 2, 3), directed = F)
  g$layout <- structure(
    c(
      1.17106961533433,
      1.63885278868168,
      2.10732892696401,
      3.91718168529106,
      2.87660789399794,
      1.83449260993935
    ),
    dim = 3:2
  )

  vdiffr::expect_doppelganger(
    "Basic graph, spheres",
    function() {
      plot(g, vertex.shape = "sphere", vertex.size = 40)
    }
  )
})

test_that("rglplot() works", {
  skip_if_not_installed("rgl", "1.3.14")

  # https://stackoverflow.com/a/46320771/5489251
  withr::local_envvar(RGL_USE_NULL = TRUE)
  withr::local_seed(42)

  el <- cbind(sample(1:5), sample(1:5))
  g <- graph_from_edgelist(el)

  expect_silent(rglplot(g))
  expect_silent(rglplot(g, edge.label = letters[1:ecount(g)]))
})

test_that("label colors are correct when loops are present", {
  # check that Bug 157 is fixed
  skip_if_not_installed("vdiffr")
  g <- make_graph(c(1, 2, 1, 1, 2, 3), directed = FALSE)
  g$layout <- structure(
    c(
      1.17106961533433,
      1.63885278868168,
      2.10732892696401,
      3.91718168529106,
      2.87660789399794,
      1.83449260993935
    ),
    dim = 3:2
  )
  cols <- c("red", "green", "blue")
  vdiffr::expect_doppelganger(
    "loop graph",
    function() {
      plot(
        g,
        edge.color = cols,
        edge.label.color = cols,
        edge.label = cols,
        margin = 0.5
      )
    }
  )
})

test_that("Edges stop at outside of rectangle node", {
  skip_if_not_installed("vdiffr")

  rectangle_edges <- function() {
    g <- make_graph(c(1, 2, 1, 4, 2, 1, 2, 5, 2, 3, 4, 1, 5, 2, 3, 2))
    layout <- cbind(
      c(-2.01, -1.16, -1.24, -2.74, -0.13),
      c(1.27, 2.1, 3.14, 0.56, 2.01)
    )
    plot(
      g,
      vertex.size = 30,
      vertex.size2 = 30,
      vertex.color = rgb(0.1, 0.7, 0.8, 0.1),
      vertex.shape = "rectangle",
      layout = layout
    )
  }

  vdiffr::expect_doppelganger("rectangle-edges", rectangle_edges)
})

test_that("Multi loops are arranged correctly", {
  skip_if_not_installed("vdiffr")

  multi_loops_triangle <- function() {
    g <- make_graph(c(1,2,2,3,3,1,1,1,1,1,1,1,1,1),directed = FALSE)
    V(g)$x <- c(1,1.5,2)
    V(g)$y <- c(0,1,0)
    plot(g, margin = 0.2, loop.size = 2)
  }

  vdiffr::expect_doppelganger("multi-loops-triangle", multi_loops_triangle)

  multi_loops_many <- function() {
    g2 <- make_graph(c(1,2, 2,3, 3,1, 1,4, 4,5, 5,1, 3,4, 5,2, 1,1, 1,1, 1,1, 1,1, 1,1, 1,1, 1,1),directed = FALSE)
    V(g2)$x <- c(1,2,2,0,0)
    V(g2)$y <- c(1,0,2,2,0)
    plot(g2, loop.size = 2)
  }

  vdiffr::expect_doppelganger("multi-loops-many", multi_loops_many)
})

test_that("Vertex label rotation works", {
  skip_if_not_installed("vdiffr")

  label_rotate <- function() {
    g <- make_ring(5, directed = FALSE, circular = FALSE)
    V(g)$label <- c("AAAAA", "BBBBB", "CCCCC","DDDDD", "EEEEE")
    g$layout <- cbind(1:5, rep(1, 5))
    plot(
      g,
      vertex.label.angle = c(90, 90, 270, 270, 90),
      vertex.label.adj = c(1.1,0.5)
    )
  }

  vdiffr::expect_doppelganger("label-rotate", label_rotate)
})

test_that("Arrow drawing works correctly", {
  skip_if_not_installed("vdiffr")

  standard_arrow <- function() {
    g <- make_graph(c(1, 2, 1, 3, 2, 4), directed = TRUE)
    g$layout <- cbind(1:4, rep(0, 4))
    plot(g)
  }
  vdiffr::expect_doppelganger("standard-arrow", standard_arrow)

  standard_arrow_modes <- function() {
    g <- make_graph(c(1, 2, 2, 3, 3, 4), directed = TRUE)
    g$layout <- cbind(1:4, rep(0, 4))
    plot(g, edge.arrow.mode = c(1,2,3))
  }
  vdiffr::expect_doppelganger("standard-arrow-modes", standard_arrow_modes)

  standard_arrow_sizes <- function() {
    g <- make_graph(c(1, 2, 2, 3, 3, 4), directed = TRUE)
    g$layout <- cbind(1:4, rep(0, 4))
    plot(g, edge.arrow.size = c(1,2,3))
  }
  vdiffr::expect_doppelganger("standard-arrow-sizes", standard_arrow_sizes)
})

test_that("mark border linewidth", {
  skip_if_not_installed("vdiffr")
  mark_border_lwd <- function() {
    g <- make_full_graph(4, directed = FALSE)
    V(g)$x <- c(1, 2, 2, 1)
    V(g)$y <- c(1, 1, 2, 2)
    wc <- cluster_walktrap(g)
    plot(
      wc,
      g,
      vertex.label = NA,
      vertex.size = 20,
      mark.shape = 0,
      edge.width = 0.1,
      mark.expand = 40,
      mark.lwd = 5,
      margin = 1
    )
  }

  vdiffr::expect_doppelganger("mark-border-lwd", mark_border_lwd)
})
