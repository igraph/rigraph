
test_that("Edges stop at outside of rectangle node", {
  rectangle_edges <- function() {
    set.seed(1234)
    g <- erdos.renyi.game(5, 6, 'gnm', directed = TRUE)
    plot(g,
       vertex.size = 30,
       vertex.color = rgb(0.1, 0.7, 0.8, 0.1),
       vertex.shape = "rectangle"
       )
  }
  vdiffr::expect_doppelganger("rectangle-edges", rectangle_edges)
})
