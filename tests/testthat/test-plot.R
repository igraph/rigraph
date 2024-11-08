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
  skip_if_not_installed("rgl")
  skip_if(basename(commandArgs())[[1]] == "RDcsan")
  # https://github.com/dmurdoch/rgl/issues/439
  skip_if(identical(Sys.getenv("IGRAPH_SANITIZER"), "true"))

  # https://stackoverflow.com/a/46320771/5489251
  withr::local_envvar(RGL_USE_NULL = TRUE)
  withr::local_seed(42)

  el <- cbind(sample(1:5), sample(1:5))
  g <- graph_from_edgelist(el)

  expect_silent(rglplot(g))
  expect_silent(rglplot(g, edge.label = letters[1:ecount(g)]))
})
