test_that("components works", {
  withr::local_seed(42)

  random_largest_component <- function(n) {
    largest_component(sample_gnp(n, 1 / n))
  }

  random_lg_list <- lapply(
    1:30,
    function(x) random_largest_component(sample(100, 1))
  )
  lg_size <- sapply(random_lg_list, vcount)

  dis_union <- disjoint_union(random_lg_list)
  clu <- components(dis_union)

  expect_equal(as.numeric(table(clu$membership)), clu$csize)
  expect_equal(sort(clu$csize), sort(lg_size))
  expect_equal(clu$no, length(random_lg_list))
})

test_that("components names results", {
  g <- make_ring(10) + make_full_graph(5)
  V(g)$name <- letters[1:15]

  clu <- components(g)
  expect_named(clu$membership, letters[1:15])
})

test_that("is_connected works", {
  ring <- make_ring(10)
  expect_true(is_connected(ring))

  g <- make_ring(10) + make_full_graph(5)
  expect_false(is_connected(g))
})

test_that("is_connected returns FALSE for the null graph", {
  empty <- make_empty_graph(0)
  expect_false(is_connected(empty))
})

test_that("decompose works", {
  gnp <- sample_gnp(1000, 1 / 1500)
  gnp_decomposed <- decompose(gnp)
  gnp_comps <- components(gnp)
  Gsizes <- sapply(gnp_decomposed, vcount)
  expect_equal(sort(gnp_comps$csize), sort(Gsizes))
})

test_that("decompose works for many components", {
  large_empty <- make_empty_graph(5001)
  large_empty_decompose <- decompose(large_empty)
  expect_length(large_empty_decompose, 5001)
})

test_that("decompose works for many components and attributes", {
  large_empty <- make_empty_graph(5001)
  V(large_empty)$name <- seq_len(vcount(large_empty))
  large_empty_decompose <- decompose(large_empty)
  expect_length(large_empty_decompose, 5001)
})

test_that("decompose keeps attributes", {
  g <- make_ring(10) + make_ring(5)
  V(g)$name <- letters[1:(10 + 5)]
  E(g)$name <- apply(as_edgelist(g), 1, paste, collapse = "-")
  g_decompose <- decompose(g)
  g_decompose <- g_decompose[order(sapply(g_decompose, vcount))]

  expect_length(g_decompose, 2)
  expect_equal(sapply(g_decompose, vcount), c(5, 10))
  expect_equal(V(g_decompose[[1]])$name, letters[1:5 + 10])
  expect_equal(V(g_decompose[[2]])$name, letters[1:10])
  e1 <- apply(as_edgelist(g_decompose[[1]]), 1, paste, collapse = "-")
  e2 <- apply(as_edgelist(g_decompose[[2]]), 1, paste, collapse = "-")
  expect_equal(E(g_decompose[[1]])$name, e1)
  expect_equal(E(g_decompose[[2]])$name, e2)
})

test_that("component_distribution() finds correct distribution", {
  g <- graph_from_literal(
    A,
    B - C,
    D - E - F,
    G - H
  )

  ref <- c(0.00, 0.25, 0.50, 0.25)

  expect_equal(component_distribution(g), ref)
})

test_that("largest component is actually the largest", {
  star <- make_star(20, "undirected")
  ring <- make_ring(10)

  dis_union <- disjoint_union(star, ring)

  expect_isomorphic(largest_component(dis_union), star)
})

test_that("largest strongly and weakly components are correct", {
  g <- graph_from_literal(
    A - +B,
    B - +C,
    C - +A,
    C - +D,
    E
  )

  strongly <- graph_from_literal(
    A - +B,
    B - +C,
    C - +A
  )
  expect_isomorphic(largest_component(g, "strong"), strongly)

  weakly <- graph_from_literal(
    A - +B,
    B - +C,
    C - +A,
    C - +D
  )
  expect_isomorphic(largest_component(g, "weak"), weakly)
})

test_that("the largest component of a null graph is a valid null graph", {
  nullgraph <- make_empty_graph(0)

  expect_isomorphic(largest_component(make_empty_graph(0)), nullgraph)
})

test_that("articulation_points works", {
  g <- make_full_graph(5) + make_full_graph(5)
  g_comps <- components(g)$membership
  g <- add_edges(g, c(match(1, g_comps), match(2, g_comps)))

  ap <- as.vector(articulation_points(g))
  deg <- degree(g)
  expect_equal(sort(which(deg == max(deg))), sort(ap))
})

test_that("bridges works", {
  kite <- make_graph("krackhardt_kite")
  expect_equal(
    sort(as.vector(bridges(kite))),
    (ecount(kite) - 1):(ecount(kite))
  )
})

test_that("biconnected_components works", {
  g <- make_full_graph(5) + make_full_graph(5)
  g_comps <- components(g)$membership
  g <- add_edges(g, c(match(1, g_comps), match(2, g_comps)))

  sortlist <- function(list) {
    list <- lapply(list, sort)
    list <- lapply(list, as.vector)
    list[order(sapply(list, paste, collapse = "x"))]
  }

  bc <- biconnected_components(g)
  expect_equal(bc$no, 3)
  expect_equal(
    sortlist(bc$tree_edges),
    list(c(11, 15, 18, 20), c(1, 5, 8, 10), 21)
  )
  expect_equal(sortlist(bc$component_edges), list(11:20, 1:10, 21))
  expect_equal(sortlist(bc$components), list(1:5, c(1, 6), 6:10))
  expect_equal(sort(as.vector(bc$articulation_points)), c(1, 6))

  expect_equal(
    sort(names(bc)),
    c(
      "articulation_points",
      "component_edges",
      "components",
      "no",
      "tree_edges"
    )
  )
  expect_s3_class(bc$articulation_points, "igraph.vs")
  expect_s3_class(bc$components[[1]], "igraph.vs")
  expect_s3_class(bc$component_edges[[1]], "igraph.es")
})

test_that("biconnected_components works without igraph.vs.es", {
  local_igraph_options(return.vs.es = FALSE)

  g <- make_full_graph(5) + make_full_graph(5)
  clu <- components(g)$membership
  g <- add_edges(g, c(match(1, clu), match(2, clu)))

  sortlist <- function(list) {
    list <- lapply(list, sort)
    list[order(sapply(list, paste, collapse = "x"))]
  }

  bc <- biconnected_components(g)
  expect_equal(bc$no, 3)
  expect_equal(
    sortlist(bc$tree_edges),
    list(c(11, 15, 18, 20), c(1, 5, 8, 10), 21)
  )
  expect_equal(sortlist(bc$component_edges), list(11:20, 1:10, 21))
  expect_equal(sortlist(bc$components), list(1:5, c(1, 6), 6:10))
  expect_equal(sort(bc$articulation_points), c(1, 6))

  expect_equal(
    sort(names(bc)),
    c(
      "articulation_points",
      "component_edges",
      "components",
      "no",
      "tree_edges"
    )
  )
})

test_that("is_biconnected works", {
  g <- make_full_graph(0)
  expect_false(is_biconnected(g))

  g <- make_full_graph(1)
  expect_false(is_biconnected(g))

  g <- make_full_graph(2)
  expect_true(is_biconnected(g))

  g <- make_full_graph(3)
  expect_true(is_biconnected(g))

  g <- make_graph(c(1, 2, 2, 3, 3, 1, 1, 4, 4, 4))
  expect_false(is_biconnected(g))
})
