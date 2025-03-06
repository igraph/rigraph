test_that("make_ works, order of arguments does not matter", {
  g0 <- make_undirected_graph(1:10)
  g1 <- make_(undirected_graph(1:10))
  expect_identical_graphs(g0, g1)

  g2 <- make_(undirected_graph(), 1:10)
  expect_identical_graphs(g0, g2)

  g3 <- make_(1:10, undirected_graph())
  expect_identical_graphs(g0, g3)
})

test_that("make_ works with n parameter", {
  g0 <- make_undirected_graph(1:10, n = 15)
  expect_vcount(g0, 15)

  g1 <- make_directed_graph(1:10, n = 15)
  expect_vcount(g1, 15)
})

test_that("sample_, graph_ also work", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  g0 <- make_undirected_graph(1:10)
  g1 <- sample_(undirected_graph(1:10))
  expect_identical_graphs(g0, g1)

  g2 <- sample_(undirected_graph(), 1:10)
  expect_identical_graphs(g0, g2)

  g3 <- sample_(1:10, undirected_graph())
  expect_identical_graphs(g0, g3)

  g4 <- graph_(undirected_graph(1:10))
  expect_identical_graphs(g0, g4)

  g5 <- graph_(undirected_graph(), 1:10)
  expect_identical_graphs(g0, g5)

  g6 <- graph_(1:10, undirected_graph())
  expect_identical_graphs(g0, g6)
})

test_that("error messages are proper", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  expect_snapshot(
    {
      make_()
      make_(1:10)

      graph_()
      graph_(1:10)

      graph_(directed_graph(), directed_graph())
      sample_()
      sample_(1:10)
      sample_(directed_graph(), directed_graph())
    },
    error = TRUE
  )
})

test_that("we pass arguments unevaluated", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  g0 <- graph_from_literal(A - +B:C)
  g1 <- graph_(from_literal(A - +B:C))
  expect_identical_graphs(g0, g1)
})

test_that("graph_from_literal() and simple undirected graphs", {
  local_igraph_options(print.id = FALSE)
  expect_snapshot({
    graph_from_literal(A - B)
    graph_from_literal(A - B - C)
    graph_from_literal(A - B - C - A)
  })
})

test_that("graph_from_literal() and undirected explosion", {
  local_igraph_options(print.id = FALSE)
  expect_snapshot({
    graph_from_literal(A:B:C - D:E, B:D - C:E)
    graph_from_literal(A:B:C - D:E - F:G:H - I - J:K:L:M)
  })
})

test_that("graph_from_literal() and simple directed graphs", {
  local_igraph_options(print.id = FALSE)
  expect_snapshot({
    graph_from_literal(A - +B)
    graph_from_literal(A - +B - +C)
    graph_from_literal(A - +B - +C - +A)
    graph_from_literal(A - +B + -C - +A)
  })
})

test_that("graph_from_literal() and directed explosion", {
  local_igraph_options(print.id = FALSE)
  expect_snapshot({
    graph_from_literal(A:B:C - +D:E, B:D + -C:E)
    graph_from_literal(A:B:C - +D:E + -F:G:H - +I + -J:K:L:M)
  })
})

test_that("graph_from_literal(simplify = FALSE)", {
  local_igraph_options(print.id = FALSE)
  expect_snapshot({
    graph_from_literal(1 - 1, 1 - 2, 1 - 2)
    graph_from_literal(1 - 1, 1 - 2, 1 - 2, simplify = FALSE)
  })
})

test_that("empty graph works", {
  empty <- make_empty_graph()
  expect_vcount(empty, 0)
  expect_ecount(empty, 0)
})

test_that("make_star works", {
  adj_mat <- matrix(0, 3, 3)
  adj_mat[2:3, 1] <- 1
  expect_isomorphic(
    make_star(3, "in"),
    graph_from_adjacency_matrix(adj_mat)
  )
  expect_isomorphic(
    make_star(3, "out"),
    graph_from_adjacency_matrix(t(adj_mat))
  )
  expect_isomorphic(
    make_star(3, "undirected"),
    graph_from_adjacency_matrix(adj_mat, mode = "max")
  )
})

test_that("make_full_graph works", {
  adj_mat <- matrix(1, 3, 3)
  diag(adj_mat) <- 0
  expect_isomorphic(
    make_full_graph(3, directed = TRUE),
    graph_from_adjacency_matrix(adj_mat, mode = "directed")
  )
  expect_isomorphic(
    make_full_graph(3, directed = FALSE),
    graph_from_adjacency_matrix(adj_mat, mode = "undirected")
  )
})

test_that("make_lattice works", {
  lattice_make <- make_lattice(dim = 2, length = 3, periodic = FALSE)
  lattice_elist <- make_empty_graph(n = 9) + edges(c(
    1, 2,
    1, 4,
    2, 3,
    2, 5,
    3, 6,
    4, 5,
    4, 7,
    5, 6,
    5, 8,
    6, 9,
    7, 8,
    8, 9
  ))
  expect_equal(as_edgelist(lattice_make), as_edgelist(lattice_elist))

  lattice_make_periodic <- make_lattice(dim = 2, length = 3, periodic = TRUE)
  lattice_elist_periodic <- make_empty_graph(n = 9) + edges(c(
    1, 2,
    1, 4,
    2, 3,
    2, 5,
    1, 3,
    3, 6,
    4, 5,
    4, 7,
    5, 6,
    5, 8,
    4, 6,
    6, 9,
    7, 8,
    1, 7,
    8, 9,
    2, 8,
    7, 9,
    3, 9
  ))
  expect_equal(as_edgelist(lattice_make_periodic), as_edgelist(lattice_elist_periodic))
})

test_that("make_lattice prints a warning for fractional length)", {
  expect_warning(make_lattice(dim = 2, length = sqrt(2000)), "`length` was rounded")

  suppressWarnings(lattice_rounded <- make_lattice(dim = 2, length = sqrt(2000)))
  lattice_integer <- make_lattice(dim = 2, length = 45)
  expect_identical_graphs(lattice_rounded, lattice_integer)
})

test_that("make_graph works", {
  graph_make <- make_graph(1:10)
  graph_elist <- make_empty_graph(n = 10) + edges(1:10)
  expect_identical_graphs(graph_make, graph_elist)
})

test_that("make_graph accepts an empty vector or NULL", {
  graph_make <- make_graph(c())
  graph_empty <- make_empty_graph(n = 0)
  expect_identical_graphs(graph_make, graph_empty)

  graph_make_null <- make_graph(NULL, n = 0)
  expect_identical_graphs(graph_make_null, graph_empty)

  graph_make_c <- make_graph(edges = c(), n = 0)
  expect_identical_graphs(graph_make_c, graph_empty)
})

test_that("make_graph works for numeric edges and isolates", {
  graph_make <- make_graph(1:10, n = 20)
  graph_elist <- make_empty_graph(n = 20) + edges(1:10)
  expect_identical_graphs(graph_make, graph_elist)
})

test_that("make_graph handles names", {
  graph_make_names <- make_graph(letters[1:10])
  graph_elist_names <- make_empty_graph() + vertices(letters[1:10]) + edges(letters[1:10])
  expect_identical_graphs(graph_make_names, graph_elist_names)
})

test_that("make_graph handles names and isolates", {
  graph_make_iso <- make_graph(letters[1:10], isolates = letters[11:20])
  graph_elist_iso <- make_empty_graph() + vertices(letters[1:20]) + edges(letters[1:10])
  expect_identical_graphs(graph_make_iso, graph_elist_iso)
})

test_that("make_graph gives warning for ignored arguments", {
  expect_warning(make_graph(letters[1:10], n = 10), "ignored for edge list with vertex names")
  expect_warning(make_graph(1:10, isolates = 11:12), "ignored for numeric edge list")
})

test_that("compatibility when arguments are not named", {
  # Commit: eb46e5bb252e80780cf3c7f02ca44a57e7469752
  elist <- cbind(1, 3)
  nodes <- 3
  graph_unnamed_args <- make_graph(as.vector(t(elist)), nodes, FALSE)

  expect_vcount(graph_unnamed_args, 3)
  expect_ecount(graph_unnamed_args, 1)
})

test_that("make_empty_graph gives an error for invalid arguments", {
  expect_snapshot(make_empty_graph(NULL), error = TRUE)
  expect_warning(expect_error(make_empty_graph("spam")), "NAs introduced by coercion")
})

test_that("make_graph_atlas works", {
  atlas_124 <- graph_from_atlas(124)
  expect_isomorphic(atlas_124, make_graph(c(1, 2, 2, 3, 3, 4, 4, 5, 1, 5, 1, 3, 2, 6),
    directed = FALSE
  ))
  atlas_234 <- graph_from_atlas(234)
  expect_isomorphic(atlas_234, make_graph(c(1, 6, 2, 6, 3, 6, 4, 6, 5, 6),
    n = 7,
    directed = FALSE
  ))
})

test_that("make_chordal_ring works", {
  chord <- make_chordal_ring(
    15,
    matrix(c(3, 12, 4, 7, 8, 11), nr = 2)
  )
  expect_equal(degree(chord), rep(6, 15))
})

test_that("make_line_graph works", {
  graph_ring_n5 <- make_ring(n = 5)
  graph_line_n5 <- make_line_graph(graph_ring_n5)
  expect_isomorphic(graph_line_n5, graph_ring_n5)
})

test_that("make_de_bruijn_graph works", {
  de_bruijn21 <- make_de_bruijn_graph(2, 1)
  de_bruijn22 <- make_de_bruijn_graph(2, 2)
  de_bruijn21_line <- make_line_graph(de_bruijn21)

  expect_isomorphic(de_bruijn21_line, make_graph(c(
    1, 1, 3, 1, 1, 2, 3, 2, 2, 3,
    4, 3, 2, 4, 4, 4
  )))
  expect_isomorphic(de_bruijn22, de_bruijn21_line)
})

test_that("make_bipartite_graph works", {
  inc_mat_rand <- matrix(sample(0:1, 35, replace = TRUE, prob = c(3, 1)), ncol = 5)
  bip_from_inc <- graph_from_biadjacency_matrix(inc_mat_rand)

  edges <- unlist(sapply(seq_len(nrow(inc_mat_rand)), function(x) {
    w <- which(inc_mat_rand[x, ] != 0) + nrow(inc_mat_rand)
    if (length(w) != 0) {
      as.vector(rbind(x, w))
    } else {
      numeric()
    }
  }))
  bip_from_make <- make_bipartite_graph(seq_len(nrow(inc_mat_rand) + ncol(inc_mat_rand)) > nrow(inc_mat_rand), edges)
  inc_mat_bip <- as_biadjacency_matrix(bip_from_make)

  expect_equal(inc_mat_bip, inc_mat_rand, ignore_attr = TRUE)
})

test_that("make_bipartite_graph works with vertex names", {
  types <- c(0, 1, 0, 1, 0, 1)
  names(types) <- LETTERS[1:length(types)]
  edges <- c("A", "B", "C", "D", "E", "F", "A", "D", "D", "E", "B", "C", "C", "F")
  bip_grap <- make_bipartite_graph(types, edges)

  expect_equal(V(bip_grap)$name, c("A", "B", "C", "D", "E", "F"), ignore_attr = TRUE)
  expect_equal(V(bip_grap)$type, c(FALSE, TRUE, FALSE, TRUE, FALSE, TRUE), ignore_attr = TRUE)

  expect_error(make_bipartite_graph(types, c(edges, "Q")), "edge vector contains a vertex name that is not found")
})

test_that("make_full_bipartite_graph works", {
  full_bip_star <- make_full_bipartite_graph(5, 1)
  expect_isomorphic(full_bip_star, make_star(6, "undirected"))

  full_bip <- make_full_bipartite_graph(5, 5)
  expect_vcount(full_bip, 10)
  expect_ecount(full_bip, 25)
})

test_that("make_kautz_graph works", {
  kautz <- make_kautz_graph(2, 3)
  expect_equal(kautz$name, "Kautz graph 2-3")
  expect_equal(kautz$m, 2)
  expect_equal(kautz$n, 3)

  el <- as_edgelist(kautz)
  el <- el[order(el[, 1], el[, 2]), ]
  expect_equal(el, structure(
    c(
      1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6,
      7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12,
      12, 13, 13, 14, 14, 15, 15, 16, 16, 17,
      17, 18, 18, 19, 19, 20, 20, 21, 21, 22,
      22, 23, 23, 24, 24, 9, 10, 11, 12, 13,
      14, 15, 16, 17, 18, 19, 20, 21, 22, 23,
      24, 1, 2, 3, 4, 5, 6, 7, 8, 17, 18, 19,
      20, 21, 22, 23, 24, 1, 2, 3, 4, 5, 6, 7,
      8, 9, 10, 11, 12, 13, 14, 15, 16
    ),
    .Dim = c(48L, 2L)
  ))
})

test_that("make_graph for notable graphs is case insensitive", {
  levi <- make_graph("Levi")
  Levi <- make_graph("levi")
  expect_identical_graphs(levi, Levi)
})

test_that("spaces are replaced in make_graph for notable graphs", {
  Kite <- make_graph("Krackhardt_Kite")
  kite <- make_graph("Krackhardt kite")
  expect_identical_graphs(Kite, kite)
})

test_that("warnings are given for extra arguments in make_graph for notables", {
  Levi <- make_graph("Levi")
  expect_warning(Levi1 <- make_graph("Levi", n = 10))
  expect_warning(Levi2 <- make_graph("Levi", isolates = "foo"))
  expect_warning(Levi3 <- make_graph("Levi", directed = FALSE))
  expect_identical_graphs(Levi, Levi1)
  expect_identical_graphs(Levi, Levi2)
  expect_identical_graphs(Levi, Levi3)
})

test_that("graph is not updated if not in LHS", {
  g <- make_(
    ring(10),
    with_vertex_(name = LETTERS[1:10]),
    with_edge_(weight = 1:10)
  )

  vs <- V(g)[1:5]
  vs$name <- letters[1:5]
  expect_equal(V(g)$name, LETTERS[1:10])

  es <- E(g)
  es$weight <- 0
  expect_equal(E(g)$weight, 1:10)
})

test_that("graph is updated if in LHS", {
  g <- make_(
    ring(10),
    with_vertex_(name = LETTERS[1:10]),
    with_edge_(weight = 1:10)
  )

  V(g)[1:5]$name <- letters[1:5]
  expect_equal(V(g)$name, c(letters[1:5], LETTERS[6:10]))

  E(g)[1:5]$weight <- 0
  expect_equal(E(g)$weight, c(rep(0, 5), 6:10))
})
