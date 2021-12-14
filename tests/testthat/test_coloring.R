context("greedy vertex coloring")

test_that("greedy_vertex_coloring works", {
    g <- make_star(10, mode="undirected")
    expect_that(
        greedy_vertex_coloring(g),
        equals(c(1, rep(2, vcount(g)-1)))
    )
    expect_that(
        greedy_vertex_coloring(g, heuristic="colored_neighbors"),
        equals(c(1, rep(2, vcount(g)-1)))
    )
})
