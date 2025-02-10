test_that("min_cut works -- value.only=FALSE", {
  g_twosquares <- make_graph(c(1, 2, 2, 3, 3, 4, 1, 6, 6, 5, 5, 4, 4, 1))
  E(g_twosquares)$capacity <- c(3, 1, 2, 10, 1, 3, 2)
  mc <- min_cut(g_twosquares, value.only = FALSE)

  expect_equal(mc$value, 1)
  expect_equal(as.vector(mc$cut), 2)
  expect_equal(as.vector(mc$partition1), 2)
  expect_equal(as.vector(mc$partition2), c(1, 3:6))
})

test_that("min_cut works -- value.only=TRUE", {
  g_twosquares <- make_graph(c(1, 2, 2, 3, 3, 4, 1, 6, 6, 5, 5, 4, 4, 1))
  E(g_twosquares)$capacity <- c(3, 1, 2, 10, 1, 3, 2)
  mc <- min_cut(g_twosquares, value.only = TRUE)

  expect_equal(mc, 1)
})

test_that("min_cut works -- value.only=FALSE source/target", {
  g_twosquares <- make_graph(c(1, 2, 2, 3, 3, 4, 1, 6, 6, 5, 5, 4, 4, 1))
  E(g_twosquares)$capacity <- c(3, 1, 2, 10, 1, 3, 2)
  mc <- min_cut(g_twosquares, source = 1, target = 4, value.only = FALSE)

  expect_equal(mc$value, 2)
  expect_equal(as.vector(mc$cut), c(2, 5))
  expect_equal(as.vector(mc$partition1), c(1, 2, 6))
  expect_equal(as.vector(mc$partition2), c(3, 4, 5))
})

test_that("min_cut works -- value.only=TRUE", {
  g_twosquares <- make_graph(c(1, 2, 2, 3, 3, 4, 1, 6, 6, 5, 5, 4, 4, 1))
  E(g_twosquares)$capacity <- c(3, 1, 2, 10, 1, 3, 2)
  mc <- min_cut(g_twosquares, source = 1, target = 4, value.only = TRUE)

  expect_equal(mc, 2)
})


test_that("min_cut errors work", {
  g_ring <- make_ring(5, directed = TRUE, circular = TRUE)
  E(g_ring)$capacity <- c(1, 2, 3, 4, 5)
  expect_error(min_cut(g_ring, source = 1))
  expect_error(min_cut(g_ring, target = 1))
})

test_that("st_cuts works", {
  g_path <- graph_from_literal(a - +b - +c - +d - +e)
  all_cuts_path <- st_cuts(g_path, source = "a", target = "e")
  expect_equal(unvs(all_cuts_path$cuts), list(1, 2, 3, 4))
  expect_equal(unvs(all_cuts_path$partition1s), list(1, 1:2, 1:3, 1:4))

  g_star_v7 <- graph_from_literal(s - +a:b - +t, a - +1:2:3 - +b)
  all_cuts_star_v7 <- st_cuts(g_star_v7, source = "s", target = "t")
  expect_equal(unvs(all_cuts_star_v7$cuts), list(c(1, 2), c(1, 7), c(2, 3, 4, 5, 6), c(2, 3, 4, 5, 10), c(2, 3, 4, 6, 9), c(2, 3, 4, 9, 10), c(2, 3, 5, 6, 8), c(2, 3, 5, 8, 10), c(2, 3, 6, 8, 9), c(2, 3, 8, 9, 10), c(3, 7)))
  expect_equal(
    unvs(all_cuts_star_v7$partition1s),
    list(1, c(1, 3), c(1, 2), c(1, 2, 7), c(1, 2, 6), c(1, 2, 6, 7), c(1, 2, 5), c(1, 2, 5, 7), c(1, 2, 5, 6), c(1, 2, 5, 6, 7), c(1, 2, 5, 6, 7, 3))
  )

  g_star_v9 <- graph_from_literal(s - +a:b - +t, a - +1:2:3:4:5 - +b)
  all_cuts_star_v9 <- st_min_cuts(g_star_v9, source = "s", target = "t")
  expect_equal(all_cuts_star_v9$value, 2)
  expect_equal(unvs(all_cuts_star_v9$cuts), list(c(1, 2), c(1, 9), c(3, 9)))
  expect_equal(unvs(all_cuts_star_v9$partition1s), list(1, c(1, 3), c(1, 3, 2, 9, 8, 7, 6, 5)))
})

test_that("st_cuts errors work", {
  g_path <- graph_from_literal(a - +b - +c - +d - +e)
  expect_error(st_cuts(g_path, source = "a", target = NULL))
  expect_error(st_cuts(g_path, source = NULL, target = "a"))
  expect_error(st_min_cuts(g_path, source = "a", target = NULL))
  expect_error(st_min_cuts(g_path, source = NULL, target = "a"))
})

test_that("max_flow works", {
  edge_mat <- rbind(c(1, 3, 3), c(3, 4, 1), c(4, 2, 2), c(1, 5, 1), c(5, 6, 2), c(6, 2, 10))
  colnames(edge_mat) <- c("from", "to", "capacity")
  g_ring_acyc <- graph_from_data_frame(as.data.frame(edge_mat))
  flow <- max_flow(g_ring_acyc, source = "1", target = "2")
  expect_equal(flow$value, 2)
  expect_equal(as.vector(flow$flow), rep(1, 6))
  expect_equal(sort(as.vector(flow$cut)), c(2, 4))
  expect_equal(sort(as.vector(flow$partition1)), 1:2)
  expect_equal(sort(as.vector(flow$partition2)), 3:6)
})

test_that("vertex_connectivity works", {
  g_path <- make_ring(5, circular = FALSE)
  expect_equal(vertex_connectivity(g_path), 1)

  g_disconnect <- make_graph(edges = c(1, 2, 3, 4), directed = FALSE)
  expect_equal(vertex_connectivity(g_disconnect), 0)

  g_ring <- make_ring(5, circular = TRUE)
  expect_equal(vertex_connectivity(g_ring, source = 1, target = 4), 2)
})

test_that("vertex_connectivity error works", {
  g_path <- make_ring(5, circular = FALSE)
  expect_error(vertex_connectivity(g_path, source = 1))
})

test_that("edge_connectivity works", {
  g_full <- make_full_graph(5)
  expect_equal(edge_connectivity(g_full), 4)
  expect_equal(edge_connectivity(g_full, source = 1, target = 2), 4)


  g_path <- make_ring(5, directed = TRUE, circular = FALSE)
  expect_equal(edge_connectivity(g_path), 0)
  expect_equal(edge_connectivity(g_path, source = 1, target = 3), 1)
})

test_that("edge_connectivity works -- names", {
  g_kite <- graph_from_literal(
    Andre - Beverly:Carol:Diane:Fernando,
    Beverly - Andre:Diane:Ed:Garth,
    Carol - Andre:Diane:Fernando,
    Diane - Andre:Beverly:Carol:Ed:Fernando:Garth,
    Ed - Beverly:Diane:Garth,
    Fernando - Andre:Carol:Diane:Garth:Heather,
    Garth - Beverly:Diane:Ed:Fernando:Heather,
    Heather - Fernando:Garth:Ike,
    Ike - Heather:Jane,
    Jane - Ike
  )

  ec1 <- edge_connectivity(g_kite, source = "Heather", target = "Andre")
  expect_equal(ec1, 2)
  ec2 <- edge_connectivity(g_kite, source = "Garth", target = "Andre")
  expect_equal(ec2, 4)
  ec3 <- edge_connectivity(g_kite, source = "Garth", target = "Ike")
  expect_equal(ec3, 1)
})

test_that("edge_connectivity error works", {
  g_path <- make_ring(5, circular = FALSE)
  expect_error(edge_connectivity(g_path, source = 1))
})

test_that("edge_disjoint_paths works", {
  g_full <- make_full_graph(5)
  expect_equal(edge_disjoint_paths(g_full, source = 1, target = 2), 4)

  g_path <- make_ring(5, directed = TRUE, circular = FALSE)
  expect_equal(edge_disjoint_paths(g_path, source = 1, target = 3), 1)
})

test_that("edge_disjoint_paths error works", {
  g_path <- make_ring(5, circular = FALSE)
  expect_error(edge_disjoint_paths(g_path, source = 1, target = NULL))
  expect_error(edge_disjoint_paths(g_path, source = NULL, target = 1))
})

test_that("vertex_disjoint_paths works", {
  g_full <- make_full_graph(5)
  expect_equal(vertex_disjoint_paths(g_full, source = 1, target = 2), 4)

  g_path <- make_ring(5, directed = TRUE, circular = FALSE)
  expect_equal(vertex_disjoint_paths(g_path, source = 1, target = 3), 1)
})

test_that("vertex_disjoint_paths error works", {
  g_path <- make_ring(5, circular = FALSE)
  expect_error(vertex_disjoint_paths(g_path, source = 1))
})

test_that("adhesion works", {
  g_full <- make_full_graph(5)
  expect_equal(adhesion(g_full), 4)

  g_path <- make_ring(5, directed = TRUE, circular = FALSE)
  expect_equal(adhesion(g_path), 0)
})

test_that("vertex_disjoint_paths error works", {
  g_path <- make_ring(5, circular = FALSE)
  expect_error(vertex_disjoint_paths(g_path, source = 1))
})


test_that("dominator_tree works", {
  g_tree <- graph_from_edgelist(matrix(c(1, 2, 2, 3, 3, 4, 2, 5, 5, 6), byrow = TRUE, ncol = 2), directed = TRUE)
  dom_tree_tree <- dominator_tree(g_tree, 1)

  expect_equal(dom_tree_tree$dom[2], 1)
  expect_equal(dom_tree_tree$dom[3], 2)
  expect_equal(dom_tree_tree$dom[5], 2)
  expect_equal(dom_tree_tree$dom[6], 5)

  g_one_vertex <- make_empty_graph(n = 1, directed = TRUE)
  dom_tree_one <- dominator_tree(g_one_vertex, 1)

  expect_equal(dom_tree_one$dom[1], -1)
})

test_that("dominator_tree errors work", {
  g_tree <- graph_from_edgelist(matrix(c(1, 2, 2, 3, 3, 4, 2, 5, 5, 6), byrow = TRUE, ncol = 2), directed = TRUE)
  expect_error(dominator_tree(g_tree))
  expect_error(dominator_tree(g_tree, root = NULL))
})

test_that("dominator_tree works -- legacy", {
  g <- graph_from_literal(
    R - +A:B:C, A - +D, B - +A:D:E, C - +F:G, D - +L,
    E - +H, F - +I, G - +I:J, H - +E:K, I - +K, J - +I,
    K - +I:R, L - +H
  )
  dtree <- dominator_tree(g, root = "R")
  names <- c("$root", V(g)$name)
  dtree$dom <- names[ifelse(dtree$dom < 0, 1, dtree$dom + 1)]
  dtree$leftout <- V(g)$name[dtree$leftout]
  expect_equal(dtree$dom, c("$root", "R", "R", "R", "R", "R", "C", "C", "D", "R", "R", "G", "R"))
  expect_equal(dtree$leftout, character())
  expect_equal(
    as_edgelist(dtree$domtree),
    structure(c("R", "R", "R", "R", "R", "C", "C", "D", "R", "R", "G", "R", "A", "B", "C", "D", "E", "F", "G", "L", "H", "I", "J", "K"), .Dim = c(12L, 2L))
  )
})

test_that("min_st_separators works", {
  g_zachary <- make_graph("Zachary")
  msts <- min_st_separators(g_zachary)
  is <- sapply(msts, is_separator, graph = g_zachary)
  expect_equal(unique(is), TRUE)

  ## TODO: check that it is minimal
})

test_that("min_st_separators() works for the note case", {
  g_note <- make_graph(~ 0 - 1 - 2 - 3 - 4 - 1)
  expect_snapshot(
    min_st_separators(g_note),
    transform = function(x) gsub("from.*", "from something", x)
  )
})

test_that("Minimal s-t separators work", {
  # bug 1033045
  g <- graph_from_literal(a - -1:3 - -5 - -2:4 - -b, 1 - -2, 3 - -4)
  stsep <- min_st_separators(g)
  ims <- sapply(stsep, is_min_separator, graph = g)
  expect_equal(ims, rep(TRUE, 9))
})

test_that("min_separators works", {
  camp <- graph_from_literal(
    Harry:Steve:Don:Bert - Harry:Steve:Don:Bert,
    Pam:Brazey:Carol:Pat - Pam:Brazey:Carol:Pat,
    Holly - Carol:Pat:Pam:Jennie:Bill,
    Bill - Pauline:Michael:Lee:Holly,
    Pauline - Bill:Jennie:Ann,
    Jennie - Holly:Michael:Lee:Ann:Pauline,
    Michael - Bill:Jennie:Ann:Lee:John,
    Ann - Michael:Jennie:Pauline,
    Lee - Michael:Bill:Jennie,
    Gery - Pat:Steve:Russ:John,
    Russ - Steve:Bert:Gery:John,
    John - Gery:Russ:Michael
  )
  camp <- simplify(camp)
  sep <- min_separators(camp)
  expect_true(all(sapply(sep, is_min_separator, graph = camp)))
})
