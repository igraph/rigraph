test_that("basic plot test, layout 1", {
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
