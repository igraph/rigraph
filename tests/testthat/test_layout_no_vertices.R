context("layouts for graphs with no vertices")

test_that("layout algorithms work for graphs with no vertices", {
    g <- make_empty_graph()
    mat <- matrix(as.numeric(c()), ncol=2)
    mat3 <- matrix(as.numeric(c()), ncol=3)

    expect_warning(layout_as_tree(g), regexp=NA)
    expect_equal(mat, layout_as_tree(g))

    expect_warning(layout_as_star(g), regexp=NA)
    expect_equal(mat, layout_as_star(g))

    expect_warning(layout_in_circle(g), regexp=NA)
    expect_equal(mat, layout_in_circle(g))

    expect_warning(layout_nicely(g), regexp=NA)
    expect_equal(mat, layout_nicely(g))

    expect_warning(layout_on_grid(g), regexp=NA)
    expect_equal(mat, layout_on_grid(g))

    expect_warning(layout_on_sphere(g), regexp=NA)
    expect_equal(mat3, layout_on_sphere(g))

    expect_warning(layout_randomly(g), regexp=NA)
    expect_equal(mat, layout_randomly(g))

    expect_warning(layout_with_dh(g), regexp=NA)
    expect_equal(mat, layout_with_dh(g))

    expect_warning(layout_with_fr(g), regexp=NA)
    expect_equal(mat, layout_with_fr(g))

    expect_warning(layout_with_gem(g), regexp=NA)
    expect_equal(mat, layout_with_gem(g))

    expect_warning(layout_with_graphopt(g), regexp=NA)
    expect_equal(mat, layout_with_graphopt(g))

    expect_warning(layout_with_kk(g), regexp=NA)
    expect_equal(mat, layout_with_kk(g))

    expect_warning(layout_with_lgl(g), regexp=NA)
    expect_equal(mat, layout_with_lgl(g))

    expect_warning(layout_with_mds(g), regexp=NA)
    expect_equal(mat, layout_with_mds(g))

    expect_warning(layout_with_sugiyama(g), regexp=NA)
    expect_equal(mat, layout_with_sugiyama(g)$layout)
    expect_equal(mat, layout_with_sugiyama(g)$layout.dummy)
})
