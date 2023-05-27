test_that("basic plot test, R < 4.1", {
  skip_if(getRversion() >= 4.1)

  vdiffr::expect_doppelganger(
    "Basic graph, R < 4.1",
    function() {
      set.seed("20221214")
      g <- make_graph(c(1, 2, 1, 1, 2, 3), directed = F)
      cols <- c("red", "green", "blue")
      plot(g, edge.color = cols)
    }
  )
})

test_that("basic plot test, 4.1 <= R < 4.3", {
  skip_if(getRversion() < 4.1)
  skip_if(getRversion() >= 4.3)

  vdiffr::expect_doppelganger(
    "Basic graph, R < 4.3",
    function() {
      set.seed("20221214")
      g <- make_graph(c(1, 2, 1, 1, 2, 3), directed = F)
      cols <- c("red", "green", "blue")
      plot(g, edge.color = cols)
    }
  )
})

test_that("basic plot test, R >= 4.3", {
  skip_if(getRversion() < 4.3)

  vdiffr::expect_doppelganger(
    "Basic graph, R 4.3 and later",
    function() {
      set.seed("20221214")
      g <- make_graph(c(1, 2, 1, 1, 2, 3), directed = F)
      cols <- c("red", "green", "blue")
      plot(g, edge.color = cols)
    }
  )
})
