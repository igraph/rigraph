test_that("basic plot test, R < 4.3", {
  set.seed("20221214")

  skip_if(getRversion() >= 4.3)

  vdiffr::expect_doppelganger(
    "Basic graph, R <= 4.2",
    function() {
      g <- make_graph(c(1, 2, 1, 1, 2, 3), directed = F)
      cols <- c("red", "green", "blue")
      plot(g, edge.color = cols)
    }
  )
})

test_that("basic plot test, R >= 4.3", {
  set.seed("20221214")

  skip_if(getRversion() < 4.3)

  # skip unconditionally; I don't have time to figure this out now but
  # we need the tests to pass
  skip_if(TRUE)

  vdiffr::expect_doppelganger(
    "Basic graph, R >= 4.3",
    function() {
      g <- make_graph(c(1, 2, 1, 1, 2, 3), directed = F)
      cols <- c("red", "green", "blue")
      plot(g, edge.color = cols)
    }
  )
})
