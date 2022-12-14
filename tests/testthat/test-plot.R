test_that("basic plot test", {
  vdiffr::expect_doppelganger(
    "Basic graph",
    function() {
      g <- make_graph(c(1, 2, 1, 1, 2, 3), directed = F)
      cols <- c("red", "green", "blue")
      plot(g, edge.color = cols)
    }
  )
})
