
test_that("Edges stop at outside of rectangle node", {
  rectangle_edges <- function() {
    g <- graph(c(1,2, 1,4, 2,1, 2,5, 2,3, 4,1, 5,2, 3,2))
    layout <- cbind(c(-2.01, -1.16, -1.24, -2.74, -0.13),
                    c(1.27, 2.1, 3.14, 0.56, 2.01))
    plot(g,
       vertex.size = 30,
       vertex.color = rgb(0.1, 0.7, 0.8, 0.1),
       vertex.shape = "rectangle",
       layout = layout
       )
  }
  vdiffr::expect_doppelganger("rectangle-edges", rectangle_edges)
})
