context("GraphML format")

test_that("GraphML support is compiled in", {
    g <- read_graph(f <- gzfile("zachary.graphml.gz"), format="graphml")
    g2 <- make_graph("zachary")

    expect_true(isomorphic(g2, g))
})
