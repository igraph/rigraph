test_that("sample_degseq() works -- 'configuration' generator", {
  degrees <- rep(2, 100)
  undirected_graph <- sample_degseq(degrees, method = "configuration")
  expect_equal(degree(undirected_graph), degrees)

  directed_graph <- sample_degseq(1:10, 10:1)
  expect_equal(degree(directed_graph, mode = "out"), 1:10)
  expect_equal(degree(directed_graph, mode = "in"), 10:1)
})

test_that("sample_degseq() works -- sample_gnp()", {
  erdos_renyi <- sample_gnp(1000, 1 / 1000)
  new_graph <- sample_degseq(degree(erdos_renyi), method = "configuration")
  expect_equal(degree(new_graph), degree(erdos_renyi))

  directed_erdos_renyi <- sample_gnp(1000, 2 / 1000, directed = TRUE)
  new_directed_graph <- sample_degseq(
    degree(directed_erdos_renyi, mode = "out"),
    degree(directed_erdos_renyi, mode = "in"),
    method = "configuration"
  )
  expect_equal(
    degree(new_directed_graph, mode = "out"),
    degree(directed_erdos_renyi, mode = "out")
  )
  expect_equal(
    degree(new_directed_graph, mode = "in"),
    degree(directed_erdos_renyi, mode = "in")
  )
})

test_that("sample_degseq() works -- 'configuration' generator, connected", {
  original_graph <- largest_component(sample_gnp(1000, 2 / 1000))

  simple_graph <- sample_degseq(degree(original_graph), method = "configuration")
  expect_equal(degree(simple_graph), degree(original_graph))

  vl_graph <- sample_degseq(degree(simple_graph), method = "vl")
  expect_equal(degree(vl_graph), degree(original_graph))
  expect_true(is_connected(vl_graph))
  expect_true(is_simple(vl_graph))
})

test_that("sample_degseq() works -- vl generator", {
  degrees <- rep(2, 100)
  vl_graph <- sample_degseq(degrees, method = "vl")
  expect_equal(degree(vl_graph), degrees)
  expect_true(is_simple(vl_graph))
})

test_that("sample_degseq() works -- exponential degree ok", {
  withr::local_seed(1)
  exponential_degrees <- sample(1:100, 100, replace = TRUE, prob = exp(-0.5 * (1:100)))
  exp_vl_graph <- sample_degseq(exponential_degrees, method = "vl")
  expect_equal(degree(exp_vl_graph), exponential_degrees)
})

test_that("sample_degseq() works -- exponential degree error", {
  withr::local_seed(11)
  exponential_degrees <- sample(1:100, 100, replace = TRUE, prob = exp(-0.5 * (1:100)))
  expect_snapshot(
    {
      sample_degseq(exponential_degrees, method = "vl")
    },
    error = TRUE,
    transform = function(x) sub("\\:[0-9]+", ":<linenumber>", x)
  )
})

test_that("sample_degseq() works -- Power-law degree ok", {
  withr::local_seed(3)
  powerlaw_degrees <- sample(1:100, 100, replace = TRUE, prob = (1:100)^-2)
  powerlaw_vl_graph <- sample_degseq(powerlaw_degrees, method = "vl")
  expect_equal(degree(powerlaw_vl_graph), powerlaw_degrees)
})

test_that("sample_degseq() works -- Power-law degree error", {
  withr::local_seed(7)
  powerlaw_degrees <- sample(1:100, 100, replace = TRUE, prob = (1:100)^-2)

  expect_snapshot(
    {
      sample_degseq(powerlaw_degrees, method = "vl")
    },
    error = TRUE,
    transform = function(x) sub("\\:[0-9]+", ":<linenumber>", x)
  )
})

test_that("sample_degseq() works -- fast.heur.simple", {
  g <- sample_gnp(1000, 1 / 1000)

  simple_nm_graph <- sample_degseq(
    degree(g, mode = "out"),
    degree(g, mode = "in"),
    method = "fast.heur.simple"
  )
  expect_equal(degree(simple_nm_graph, mode = "out"), degree(g, mode = "out"))
  expect_equal(degree(simple_nm_graph, mode = "in"), degree(g, mode = "in"))
})

test_that("sample_degseq() works -- configuration.simple", {
  g <- sample_gnp(1000, 1 / 1000)
  simple_nmu_graph <- sample_degseq(degree(g, mode = "out"),
    degree(g, mode = "in"),
    method = "configuration.simple"
  )
  expect_equal(degree(simple_nmu_graph, mode = "out"), degree(g, mode = "out"))
  expect_equal(degree(simple_nmu_graph, mode = "in"), degree(g, mode = "in"))
})

test_that("sample_degseq() works -- edge.switching.simple directed", {
  g <- sample_gnp(1000, 1 / 1000, directed = TRUE)
  simple_switch_graph <- sample_degseq(degree(g, mode = "out"),
    degree(g, mode = "in"),
    method = "edge.switching.simple"
  )
  expect_equal(degree(simple_switch_graph, mode = "out"), degree(g, mode = "out"))
  expect_equal(degree(simple_switch_graph, mode = "in"), degree(g, mode = "in"))
})

test_that("sample_degseq() works -- edge.switching.simple undirected", {
  g <- sample_gnp(1000, 1 / 1000, directed = FALSE)
  simple_switch_graph <- sample_degseq(
    degree(g, mode = "all"),
    method = "edge.switching.simple"
  )
  expect_equal(degree(simple_switch_graph, mode = "all"), degree(g, mode = "all"))
})

test_that("sample_degseq supports the sample_(...) syntax", {
  degs <- rep(4, 20)
  g1 <- sample_(degseq(degs))
  g2 <- sample_(degseq(degs))

  expect_equal(degree(g1), degs)
  expect_equal(degree(g2), degs)

  expect_false(identical_graphs(g1, g2))
})

test_that("sample_degseq works() -- old method names", {

  withr::local_options("lifecycle_verbosity" = "warning")

  expect_warning(
    sample_degseq(c(1, 1, 2, 2, 2), method = "simple"),
    "must be"
  )

  expect_warning(
    sample_degseq(c(1, 1, 2, 2, 2), method = "simple.no.multiple"),
    "must be"
  )

  expect_warning(
    sample_degseq(c(1, 1, 2, 2, 2), method = "simple.no.multiple.uniform"),
    "must be"
  )
})

test_that("sample_pa() works", {
  withr::local_seed(20240209)

  g <- sample_pa(100, m = 2)
  expect_equal(ecount(g), 197)
  expect_equal(vcount(g), 100)
  expect_true(is_simple(g))

  g2 <- sample_pa(100, m = 2, algorithm = "psumtree-multiple")
  expect_equal(ecount(g2), 198)
  expect_equal(vcount(g2), 100)
  expect_false(is_simple(g2))

  g3 <- sample_pa(100, m = 2, algorithm = "bag")
  expect_equal(ecount(g3), 198)
  expect_equal(vcount(g3), 100)
  expect_false(is_simple(g3))

  g4 <- sample_pa(3, out.seq = 0:2, directed = FALSE)
  expect_equal(degree(g4), rep(2, 3))

  g5 <- sample_pa(3, out.dist = rep(2, 1000), directed = FALSE)
  expect_equal(degree(g5), rep(2, 3))
})

test_that("sample_pa can start from a graph", {
  withr::local_seed(20231029)

  g4 <- sample_pa(10, m = 1, algorithm = "bag", start.graph = make_empty_graph(5))
  expect_equal(ecount(g4), 5)
  expect_equal(vcount(g4), 10)
  #  0    1    2    3    4
  # 24  809 3904 4240 1023
  is_degree_zero <- (degree(g4) == 0)
  expect_true(sum(is_degree_zero) %in% 0:4)
  #  2    3    4    5    6    7    8   10
  # 25  302 1820 2563 3350 1093  816   31
  is_degree_one <- (degree(g4) == 1)
  expect_true(sum(is_degree_one) %in% c(2:8, 10L))
  #   0    1    2    3    4
  # 879 2271 5289 1532   29
  is_degree_two_or_three <- (degree(g4) %in% 2:3)
  expect_true(sum(is_degree_two_or_three) %in% 0:4)

  g6 <- sample_pa(10, m = 1, algorithm = "bag", start.graph = make_star(10))
  expect_isomorphic(g6, make_star(10))

  g7 <- sample_pa(10,
    m = 3, algorithm = "psumtree-multiple",
    start.graph = make_empty_graph(5)
  )
  expect_equal(degree(g7, mode = "out"), c(0, 0, 0, 0, 0, 3, 3, 3, 3, 3))

  g8 <- sample_pa(10,
    m = 3, algorithm = "psumtree-multiple",
    start.graph = make_star(5)
  )
  expect_equal(degree(g8, mode = "out"), c(0, 1, 1, 1, 1, 3, 3, 3, 3, 3))
  expect_isomorphic(induced_subgraph(g8, 1:5), make_star(5))

  g9 <- sample_pa(10,
    m = 3, algorithm = "psumtree-multiple",
    start.graph = make_star(10)
  )
  expect_isomorphic(g9, make_star(10))

  g10 <- sample_pa(10, m = 3, start.graph = make_empty_graph(5))
  expect_equal(degree(g10, mode = "out"), c(0, 0, 0, 0, 0, 3, 3, 3, 3, 3))

  g11 <- sample_pa(10, m = 3, start.graph = make_star(5))
  expect_equal(degree(g11, mode = "out"), c(0, 1, 1, 1, 1, 3, 3, 3, 3, 3))
  expect_isomorphic(induced_subgraph(g11, 1:5), make_star(5))

  g12 <- sample_pa(10, m = 3, start.graph = make_star(10))
  expect_isomorphic(g12, make_star(10))
})

test_that("sample_bipartite() works", {
  rlang::local_options(lifecycle_verbosity = "quiet")
  withr::local_seed(42)
  g1 <- sample_bipartite(10, 5, type = "gnp", p = .1)
  expect_equal(g1$name, "Bipartite Gnp random graph")
  expect_equal(vcount(g1), 15)
  expect_equal(ecount(g1), 7)
  expect_true(bipartite_mapping(g1)$res)
  expect_false(is_directed(g1))

  g2 <- sample_bipartite(10, 5, type = "gnp", p = .1, directed = TRUE)
  expect_equal(vcount(g2), 15)
  expect_equal(ecount(g2), 6)
  expect_true(bipartite_mapping(g2)$res)
  expect_true(is_directed(g2))
  expect_output(print_all(g2), "5->11")

  g3 <- sample_bipartite(10, 5, type = "gnp", p = .1, directed = TRUE, mode = "in")
  expect_output(print_all(g3), "11->3")

  g4 <- sample_bipartite(10, 5, type = "gnm", m = 8)
  expect_equal(vcount(g4), 15)
  expect_equal(ecount(g4), 8)
  expect_true(bipartite_mapping(g4)$res)
  expect_false(is_directed(g4))

  g5 <- sample_bipartite(10, 5, type = "gnm", m = 8, directed = TRUE)
  expect_equal(vcount(g5), 15)
  expect_equal(ecount(g5), 8)
  expect_true(bipartite_mapping(g5)$res)
  expect_true(is_directed(g5))
  expect_output(print_all(g5), "5->12")

  g6 <- sample_bipartite(10, 5, type = "gnm", m = 8, directed = TRUE, mode = "in")
  expect_equal(vcount(g6), 15)
  expect_equal(ecount(g6), 8)
  expect_true(bipartite_mapping(g6)$res)
  expect_true(is_directed(g6))
  expect_output(print_all(g6), "12->10")

  #####

  g7 <- sample_bipartite(10, 5,
    type = "gnp", p = 0.9999, directed = TRUE,
    mode = "all"
  )
  expect_equal(ecount(g7), 100)

  g8 <- sample_bipartite(10, 5,
    type = "gnm", m = 99, directed = TRUE,
    mode = "all"
  )
  expect_equal(ecount(g8), 99)
})

test_that("sample_bipartite() deprecation", {
  expect_snapshot(s <- sample_bipartite(10, 5, type = "gnp", p = 0))
  expect_snapshot(s <- sample_bipartite(10, 5, type = "gnm", m = 0))
})

test_that("sample_bipartite_gnp() works", {
  withr::local_seed(42)
  g1 <- sample_bipartite_gnp(10, 5, p = .1)
  expect_equal(g1$name, "Bipartite Gnp random graph")
  expect_equal(vcount(g1), 15)
  expect_equal(ecount(g1), 7)
  expect_true(bipartite_mapping(g1)$res)
  expect_false(is_directed(g1))

  g2 <- sample_bipartite_gnp(10, 5, p = .1, directed = TRUE)
  expect_equal(vcount(g2), 15)
  expect_equal(ecount(g2), 6)
  expect_true(bipartite_mapping(g2)$res)
  expect_true(is_directed(g2))
  expect_output(print_all(g2), "5->11")

  g3 <- sample_bipartite_gnp(10, 5, p = .1, directed = TRUE, mode = "in")
  expect_output(print_all(g3), "11->3")

  g7 <- sample_bipartite_gnp(10, 5,
   p = 0.9999, directed = TRUE,
    mode = "all"
  )
  expect_equal(ecount(g7), 100)

})
test_that("sample_bipartite_gnm() works", {
  withr::local_seed(42)

  g4 <- sample_bipartite_gnm(10, 5, m = 8)
  expect_equal(vcount(g4), 15)
  expect_equal(ecount(g4), 8)
  expect_true(bipartite_mapping(g4)$res)
  expect_false(is_directed(g4))

  g5 <- sample_bipartite_gnm(10, 5, m = 8, directed = TRUE)
  expect_equal(vcount(g5), 15)
  expect_equal(ecount(g5), 8)
  expect_true(bipartite_mapping(g5)$res)
  expect_true(is_directed(g5))
  expect_output(print_all(g5), "5->11 7->11 8->11 8->12 4->13 5->13 6->13 9->13")

  g6 <- sample_bipartite_gnm(10, 5, m = 8, directed = TRUE, mode = "in")
  expect_equal(vcount(g6), 15)
  expect_equal(ecount(g6), 8)
  expect_true(bipartite_mapping(g6)$res)
  expect_true(is_directed(g6))
  expect_output(print_all(g6), "11-> 4 11-> 5 12-> 7 12-> 8 12-> 9 14-> 6 14->10 15-> 4")

  g8 <- sample_bipartite_gnm(10, 5,
    m = 99, directed = TRUE,
    mode = "all"
  )
  expect_equal(ecount(g8), 99)
})

test_that("HSBM works", {
  withr::local_seed(42)

  C <- matrix(c(
    1, 1 / 2, 0,
    1 / 2, 0, 1 / 2,
    0, 1 / 2, 1 / 2
  ), nrow = 3)

  g <- sample_hierarchical_sbm(100, 10, rho = c(3, 3, 4) / 10, C = C, p = 0)
  expect_equal(ecount(g), 172)
  expect_equal(vcount(g), 100)
  expect_false(is_directed(g))

  withr::local_seed(42)

  g2 <- sample_hierarchical_sbm(100, 10, rho = c(3, 3, 4) / 10, C = C, p = 1)
  expect_equal(ecount(g2), ecount(g) + 10 * 9 * (90 + 10) / 2)
  expect_equal(vcount(g2), 100)
  expect_true(is_simple(g2))

  withr::local_seed(42)

  g3 <- sample_hierarchical_sbm(100, 10, rho = c(3, 3, 4) / 10, C = C, p = 1e-15)
  expect_equal(ecount(g3), ecount(g))
  expect_equal(vcount(g3), 100)
  expect_true(is_simple(g3))

  withr::local_seed(42)

  g4 <- sample_hierarchical_sbm(100, 10, rho = c(3, 3, 4) / 10, C = C, p = 1 - 1e-15)
  expect_equal(ecount(g4), ecount(g2))
  expect_equal(vcount(g4), 100)
  expect_true(is_simple(g4))
})

test_that("HSBM with 1 cluster per block works", {
  res <- Matrix::Matrix(0, nrow = 10, ncol = 10, doDiag = FALSE)
  res[6:10, 1:5] <- res[1:5, 6:10] <- 1
  g <- sample_hierarchical_sbm(10, 5, rho = 1, C = matrix(0), p = 1)
  expect_equal(g[], res)
})

test_that("HSBM with list arguments works", {
  b <- 5
  C <- matrix(c(
    1, 1 / 2, 0,
    1 / 2, 0, 1 / 2,
    0, 1 / 2, 1 / 2
  ), nrow = 3)
  m <- 10
  rho <- c(3, 3, 4) / 10

  withr::local_seed(42)
  g <- sample_hierarchical_sbm(b * m, m, rho = rho, C = C, p = 0)

  withr::local_seed(42)
  g2 <- sample_hierarchical_sbm(b * m, rep(m, b), rho = rho, C = C, p = 0)
  expect_equal(g[], g2[])

  withr::local_seed(42)
  g3 <- sample_hierarchical_sbm(b * m, m, rho = replicate(b, rho, simplify = FALSE), C = C, p = 0)
  expect_equal(g[], g3[])

  withr::local_seed(42)
  g4 <- sample_hierarchical_sbm(b * m, m, rho = rho, C = replicate(b, C, simplify = FALSE), p = 0)
  expect_equal(g[], g4[])

  expect_error(
    sample_hierarchical_sbm(b * m, rep(m, b), rho = list(rho, rho), C = C, p = 0),
    "Lengths of `m', `rho' and `C' must match"
  )

  ###

  n <- function(x) x / sum(x)

  rho1 <- n(c(1, 2))
  C1 <- matrix(0, nrow = 2, ncol = 2)
  rho2 <- n(c(3, 3, 4))
  C2 <- matrix(0, nrow = 3, ncol = 3)
  rho3 <- 1
  C3 <- matrix(0)
  rho4 <- n(c(2, 1))
  C4 <- matrix(0, nrow = 2, ncol = 2)

  gg1 <- sample_hierarchical_sbm(21,
    m = c(3, 10, 5, 3), rho = list(rho1, rho2, rho3, rho4),
    C = list(C1, C2, C3, C4), p = 1
  )
  expect_true(is_simple(gg1))

  withr::local_seed(42)
  gg11 <- sample_hierarchical_sbm(21,
    m = c(3, 10, 5, 3), rho = list(rho1, rho2, rho3, rho4),
    C = list(C1, C2, C3, C4), p = 1 - 1e-10
  )
  expect_equal(gg1[], gg11[])

  rho1 <- n(c(1, 2))
  C1 <- matrix(1, nrow = 2, ncol = 2)
  rho2 <- n(c(3, 3, 4))
  C2 <- matrix(1, nrow = 3, ncol = 3)
  rho3 <- 1
  C3 <- matrix(1)
  rho4 <- n(c(2, 1))
  C4 <- matrix(1, nrow = 2, ncol = 2)
  gg2 <- sample_hierarchical_sbm(21,
    m = c(3, 10, 5, 3), rho = list(rho1, rho2, rho3, rho4),
    C = list(C1, C2, C3, C4), p = 0
  )
  expect_true(is_simple(gg2))

  gg22 <- sample_hierarchical_sbm(21,
    m = c(3, 10, 5, 3), rho = list(rho1, rho2, rho3, rho4),
    C = list(C1, C2, C3, C4), p = 1
  )
  expect_equal(gg1[] + gg2[], gg22[])
})

test_that("sample_chung_lu works", {
  g <- sample_chung_lu(c(3, 3, 2, 2, 1, 1))
  expect_false(any_multiple(g))

  g <- sample_chung_lu(c(3, 3, 2, 2, 1, 1), loops = FALSE, variant = 'original')
  expect_true(is_simple(g))

  g <- sample_chung_lu(c(3, 3, 2, 2, 1, 1), loops = FALSE, variant = 'maxent')
  expect_true(is_simple(g))

  g <- sample_chung_lu(c(3, 3, 2, 2, 1, 1), loops = FALSE, variant = 'nr')
  expect_true(is_simple(g))
})
