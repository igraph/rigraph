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

test_that("the null graph is not a tree", {
	expect_false(is_tree(make_empty_graph(0)))
})

test_that("a graph with a single vertex and no edges is tree", {
	expect_true(is_tree(make_empty_graph(1)))
})

context("to_prufer, make_from_prufer")

test_that("to_prufer and make_from_prufer works for trees", {
    g <- make_tree(13, 3, mode="undirected")
    seq <- to_prufer(g)
    g2 <- make_from_prufer(seq)
    expect_true(isomorphic(g, g2))

    g <- make_tree(13, 3, mode="out")
    seq <- to_prufer(g)
    g2 <- make_from_prufer(seq)
    g3 <- as.undirected(g)
    expect_true(isomorphic(g2, g3))

    g <- make_tree(13, 3, mode="in")
    seq <- to_prufer(g)
    g2 <- make_from_prufer(seq)
    g3 <- as.undirected(g)
    expect_true(isomorphic(g2, g3))
})

test_that("to_prufer prints an error for non-trees", {
    expect_error(to_prufer(make_graph("zachary")), "must be a tree")
})
