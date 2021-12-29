context("efficiency")

test_that("global_efficiency works", {
    g <- graph_from_literal(A-B-C-D-A)
    expect_that(global_efficiency(g), equals(5/6))

    g <- graph_from_literal(A-+B-+C-+D-+A)
    expect_that(global_efficiency(g), equals(11/18))
    expect_that(global_efficiency(g, directed=F), equals(5/6))
})
