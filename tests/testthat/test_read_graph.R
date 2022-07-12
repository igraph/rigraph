context("Graph file formats")

test_that("reading GraphML file works", {
    skip_if_no_graphml()

    g <- read_graph(f <- gzfile("zachary.graphml.gz"), format="graphml")
    g2 <- make_graph("zachary")

    expect_true(isomorphic(g2, g))
})
