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
      plot(g, vertex.shape = "sphere", vertex.size = 100)
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
      plot(g, edge.color = cols, edge.label.color = cols, edge.label = cols)
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
    plot(g,
      vertex.size = 30,
      vertex.color = rgb(0.1, 0.7, 0.8, 0.1),
      vertex.shape = "rectangle",
      layout = layout
    )
  }

  vdiffr::expect_doppelganger("rectangle-edges", rectangle_edges)
})
