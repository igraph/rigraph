test_that("largest component is actually the largest", {
    g <- make_star(20, "undirected")
    h <- make_ring(10)

    G <- disjoint_union(g, h)

    expect_true(isomorphic(largest_component(G), g))
})

test_that("largest strongly and weakly components are correct", {
    g <- graph_from_literal(
        A -+ B,
        B -+ C,
        C -+ A,
        C -+ D,
        E
    )

    strongly <- graph_from_literal(
        A -+ B,
        B -+ C,
        C -+ A
    )
    weakly <- graph_from_literal(
        A -+ B,
        B -+ C,
        C -+ A,
        C -+ D
    )

    expect_true(isomorphic(largest_component(g, "weak"), weakly))
    expect_true(isomorphic(largest_component(g, "strong"), strongly))
})

test_that("the largest component of a null graph is a valid null graph", {
    nullgraph <- make_empty_graph(0)

    expect_true(isomorphic(largest_component(make_empty_graph(0)), nullgraph))
})

