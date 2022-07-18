context("Automatic layout")

test_that("layout_nicely() works with negative weights", {
    g <- make_graph("petersen")
    E(g)$weight <- -5:10
    expect_warning(layout_nicely(g), regexp = "ignoring all weights")
})

test_that("layout_nicely() does not recurse into itself", {
    g <- make_graph("petersen")
    g$layout <- layout_nicely
    layout_nicely(g)   # should not recurse infinitely
})
