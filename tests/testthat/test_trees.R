context("is_tree")

test_that("is_tree works for non-trees", {
    g <- make_graph("zachary")
    expect_false(is_tree(g))
    expect_equal(is_tree(g, details=TRUE), list(res=FALSE, root=V(g)[numeric(0)]))

    g <- sample_pa(15, m=3)
    expect_false(is_tree(g))
    expect_false(is_tree(g, details=TRUE)$res)
})

test_that("is_tree works for undirected trees", {
    # g <- permute(make_tree(7, 2), c(5, 2, 3, 4, 1, 6, 7))
    g <- make_tree(7, 2)
    expect_true(is_tree(g))
    expect_equal(is_tree(g, details=TRUE), list(res=TRUE, root=V(g)[1]))
})

test_that("is_tree works for directed in-trees", {
    g <- permute(make_tree(7, 2, mode="in"), c(5, 2, 3, 4, 1, 6, 7))

    expect_true(is_tree(g, mode="in"))
    expect_equal(is_tree(g, mode="in", details=TRUE), list(res=TRUE, root=V(g)[5]))

    expect_true(is_tree(g, mode="all"))
    expect_equal(is_tree(g, mode="all", details=TRUE), list(res=TRUE, root=V(g)[1]))

    expect_false(is_tree(g, mode="out"))
    expect_false(is_tree(g, mode="out", details=TRUE)$res)
})

test_that("is_tree works for directed out-trees", {
    g <- permute(make_tree(7, 2, mode="out"), c(3, 2, 1, 4, 5, 6, 7))

    expect_true(is_tree(g, mode="out"))
    expect_equal(is_tree(g, mode="out", details=TRUE), list(res=TRUE, root=V(g)[3]))

    expect_true(is_tree(g, mode="all"))
    expect_equal(is_tree(g, mode="all", details=TRUE), list(res=TRUE, root=V(g)[1]))

    expect_false(is_tree(g, mode="in"))
    expect_false(is_tree(g, mode="in", details=TRUE)$res)
})
