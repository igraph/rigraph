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

test_that("sample_chung_lu works", {
  chung_lu_small <- sample_chung_lu(c(3, 3, 2, 2, 1, 1))
  expect_false(any_multiple(chung_lu_small))

  chung_lu_no_loop_1 <- sample_chung_lu(c(3, 3, 2, 2, 1, 1), loops = FALSE, variant = "original")
  expect_true(is_simple(chung_lu_no_loop_1))

  chung_lu_no_loop_2 <- sample_chung_lu(c(3, 3, 2, 2, 1, 1), loops = FALSE, variant = "maxent")
  expect_true(is_simple(chung_lu_no_loop_2))

  chung_lu_no_loop_3 <- sample_chung_lu(c(3, 3, 2, 2, 1, 1), loops = FALSE, variant = "nr")
  expect_true(is_simple(chung_lu_no_loop_3))
})

test_that("sample_forestfire() works -- sparse", {
  withr::local_seed(20231029)
  N <- 5000
  xv <- log(2:N)

  forest_fire <- sample_forestfire(N, fw.prob = 0.35, bw.factor = 0.2 / 0.35)
  yv1 <- log(cumsum(degree(forest_fire, mode = "out"))[-1])

  expect_equal(coef(lm(yv1 ~ xv))[[2]], 1.04, tolerance = 0.05)
})

test_that("sample_forestfire() works -- densifying", {
  withr::local_seed(20231029)

  N <- 5000
  xv <- log(2:N)

  forest_fire <- sample_forestfire(N, fw.prob = 0.37, bw.factor = 0.32 / 0.37)
  yv2 <- log(cumsum(degree(forest_fire, mode = "out"))[-1])

  expect_equal(coef(lm(yv2 ~ xv))[[2]], 1.21, tolerance = 0.05)
})

test_that("sample_forestfire() works -- dense", {
  withr::local_seed(20231029)

  N <- 5000
  xv <- log(2:N)

  forest_fire <- sample_forestfire(N, fw.prob = 0.38, bw.factor = 0.38 / 0.37)
  yv3 <- log(cumsum(degree(forest_fire, mode = "out"))[-1])

  expect_equal(coef(lm(yv3 ~ xv))[[2]], 1.9, tolerance = 0.05)
})

test_that("Generating stochastic block models works", {
  pm <- matrix(1, nrow = 2, ncol = 2)
  bs <- c(4, 6)
  sbm_small <- sample_sbm(10,
    pref.matrix = pm, block.sizes = bs,
    directed = FALSE, loops = FALSE
  )
  expect_isomorphic(sbm_small, make_full_graph(10, directed = FALSE, loops = FALSE))

  sbm_small_loops <- sample_sbm(10,
    pref.matrix = pm, block.sizes = bs,
    directed = FALSE, loops = TRUE
  )
  full_graph_loops <- make_full_graph(10, directed = FALSE, loops = TRUE)
  expect_equal(sbm_small_loops[sparse = FALSE], full_graph_loops[sparse = FALSE])

  sbm_small_directed <- sample_sbm(10,
    pref.matrix = pm, block.sizes = bs,
    directed = TRUE, loops = FALSE
  )
  full_graph_directed <- make_full_graph(10, directed = TRUE, loops = FALSE)
  expect_equal(sbm_small_directed[sparse = FALSE], full_graph_directed[sparse = FALSE])

  sbm_small_all <- sample_sbm(10,
    pref.matrix = pm, block.sizes = bs,
    directed = TRUE, loops = TRUE
  )
  full_graph_all <- make_full_graph(10, directed = TRUE, loops = TRUE)
  expect_equal(sbm_small_all[sparse = FALSE], full_graph_all[sparse = FALSE])
})

test_that("sample_smallworld works", {
  for (i in 1:50) {
    p <- runif(1)
    d <- sample(1:3, 1)
    nei <- sample(2:5, 1)
    g <- sample_smallworld(d, 10, nei, p, loops = FALSE)
    expect_false(any(which_loop(g)))
  }
})

test_that("sample_pa() works", {
  withr::local_seed(20240209)

  g_pa <- sample_pa(100, m = 2)
  expect_equal(ecount(g_pa), 197)
  expect_vcount(g_pa, 100)
  expect_true(is_simple(g_pa))

  g_pa2 <- sample_pa(100, m = 2, algorithm = "psumtree-multiple")
  expect_equal(ecount(g_pa2), 198)
  expect_vcount(g_pa2, 100)
  expect_false(is_simple(g_pa2))

  g_pa3 <- sample_pa(100, m = 2, algorithm = "bag")
  expect_equal(ecount(g_pa3), 198)
  expect_vcount(g_pa3, 100)
  expect_false(is_simple(g_pa3))

  g_pa4 <- sample_pa(3, out.seq = 0:2, directed = FALSE)
  expect_equal(degree(g_pa4), rep(2, 3))

  g_pa5 <- sample_pa(3, out.dist = rep(2, 1000), directed = FALSE)
  expect_equal(degree(g_pa5), rep(2, 3))
})

test_that("sample_pa can start from a graph", {
  withr::local_seed(20231029)

  g_pa1 <- sample_pa(10, m = 1, algorithm = "bag", start.graph = make_empty_graph(5))
  expect_equal(ecount(g_pa1), 5)
  expect_vcount(g_pa1, 10)

  is_degree_zero <- (degree(g_pa1) == 0)
  expect_true(sum(is_degree_zero) %in% 0:4)
  #  2    3    4    5    6    7    8   10
  # 25  302 1820 2563 3350 1093  816   31
  is_degree_one <- (degree(g_pa1) == 1)
  expect_true(sum(is_degree_one) %in% c(2:8, 10L))
  #   0    1    2    3    4
  # 879 2271 5289 1532   29
  is_degree_two_or_three <- (degree(g_pa1) %in% 2:3)
  expect_true(sum(is_degree_two_or_three) %in% 0:4)

  g_pa2 <- sample_pa(10, m = 1, algorithm = "bag", start.graph = make_star(10))
  expect_isomorphic(g_pa2, make_star(10))

  g_pa3 <- sample_pa(10,
    m = 3, algorithm = "psumtree-multiple",
    start.graph = make_empty_graph(5)
  )
  expect_equal(degree(g_pa3, mode = "out"), c(0, 0, 0, 0, 0, 3, 3, 3, 3, 3))

  g_pa4 <- sample_pa(10,
    m = 3, algorithm = "psumtree-multiple",
    start.graph = make_star(5)
  )
  expect_equal(degree(g_pa4, mode = "out"), c(0, 1, 1, 1, 1, 3, 3, 3, 3, 3))
  expect_isomorphic(induced_subgraph(g_pa4, 1:5), make_star(5))

  g_pa5 <- sample_pa(10,
    m = 3, algorithm = "psumtree-multiple",
    start.graph = make_star(10)
  )
  expect_isomorphic(g_pa5, make_star(10))

  g_pa6 <- sample_pa(10, m = 3, start.graph = make_empty_graph(5))
  expect_equal(degree(g_pa6, mode = "out"), c(0, 0, 0, 0, 0, 3, 3, 3, 3, 3))

  g_pa7 <- sample_pa(10, m = 3, start.graph = make_star(5))
  expect_equal(degree(g_pa7, mode = "out"), c(0, 1, 1, 1, 1, 3, 3, 3, 3, 3))
  expect_isomorphic(induced_subgraph(g_pa7, 1:5), make_star(5))

  g_pa8 <- sample_pa(10, m = 3, start.graph = make_star(10))
  expect_isomorphic(g_pa8, make_star(10))
})

test_that("sample_bipartite works -- undirected gnp", {
  withr::local_seed(42)

  g_rand_bip <- sample_bipartite(10, 5, type = "gnp", p = .1)
  expect_equal(g_rand_bip$name, "Bipartite Gnp random graph")
  expect_vcount(g_rand_bip, 15)
  expect_equal(ecount(g_rand_bip), 7)
  expect_true(bipartite_mapping(g_rand_bip)$res)
  expect_false(is_directed(g_rand_bip))
})

test_that("sample_bipartite works -- directed gnp", {
  g_rand_bip_dir <- sample_bipartite(10, 5, type = "gnp", p = .1, directed = TRUE)
  expect_vcount(g_rand_bip_dir, 15)
  expect_equal(ecount(g_rand_bip_dir), 6)
  expect_true(bipartite_mapping(g_rand_bip_dir)$res)
  expect_true(is_directed(g_rand_bip_dir))
  expect_output(print_all(g_rand_bip_dir), "5->11")

  g_rand_bip_in <- sample_bipartite(10, 5, type = "gnp", p = .1, directed = TRUE, mode = "in")
  expect_output(print_all(g_rand_bip_in), "11->3")
})

test_that("sample_bipartite works -- undirected gnm", {
  g_rand_bip_gnm <- sample_bipartite(10, 5, type = "gnm", m = 8)
  expect_vcount(g_rand_bip_gnm, 15)
  expect_equal(ecount(g_rand_bip_gnm), 8)
  expect_true(bipartite_mapping(g_rand_bip_gnm)$res)
  expect_false(is_directed(g_rand_bip_gnm))
})
test_that("sample_bipartite works -- directed gnm", {
  g_rand_bip_gnm_dir <- sample_bipartite(10, 5, type = "gnm", m = 8, directed = TRUE)
  expect_vcount(g_rand_bip_gnm_dir, 15)
  expect_equal(ecount(g_rand_bip_gnm_dir), 8)
  expect_true(bipartite_mapping(g_rand_bip_gnm_dir)$res)
  expect_true(is_directed(g_rand_bip_gnm_dir))
  expect_output(print_all(g_rand_bip_gnm_dir), "5->12")

  g_rand_bip_gnm_in <- sample_bipartite(10, 5, type = "gnm", m = 8, directed = TRUE, mode = "in")
  expect_vcount(g_rand_bip_gnm_in, 15)
  expect_equal(ecount(g_rand_bip_gnm_in), 8)
  expect_true(bipartite_mapping(g_rand_bip_gnm_in)$res)
  expect_true(is_directed(g_rand_bip_gnm_in))
  expect_output(print_all(g_rand_bip_gnm_in), "12->10")

  g_rand_bip_full <- sample_bipartite(10, 5,
    type = "gnp", p = 0.9999, directed = TRUE,
    mode = "all"
  )
  expect_equal(ecount(g_rand_bip_full), 100)

  g_rand_bip_edges <- sample_bipartite(10, 5,
    type = "gnm", m = 99, directed = TRUE,
    mode = "all"
  )
  expect_equal(ecount(g_rand_bip_edges), 99)
})


test_that("sample_correlated_gnp works", {
  withr::local_seed(42)

  gnp_graph <- sample_gnp(10, .1)
  cor_gnp_graph_1 <- sample_correlated_gnp(gnp_graph, corr = 1, p = gnp_graph$p, permutation = NULL)
  expect_equal(gnp_graph[], cor_gnp_graph_1[])

  cor_gnp_graph_0 <- sample_correlated_gnp(gnp_graph, corr = 0, p = gnp_graph$p, permutation = NULL)
  graph_cor_1 <- cor(as.vector(gnp_graph[]), as.vector(cor_gnp_graph_0[]))
  expect_true(abs(graph_cor_1) < .3)

  cor_gnp_no_p_1 <- sample_correlated_gnp(gnp_graph, corr = 1)
  expect_equal(gnp_graph[], cor_gnp_no_p_1[])

  cor_gnp_no_p_0 <- sample_correlated_gnp(gnp_graph, corr = 0)
  graph_cor_2 <- cor(as.vector(gnp_graph[]), as.vector(cor_gnp_no_p_0[]))
  expect_true(abs(graph_cor_2) < .3)
})


test_that("sample_correlated_gnp works even for non-ER graphs", {
  withr::local_seed(42)

  grg_graph <- sample_grg(100, 0.2)
  cor_gnp_graph_1 <- sample_correlated_gnp(grg_graph, corr = 1)
  expect_equal(grg_graph[], cor_gnp_graph_1[])

  cor_gnp_graph_0 <- sample_correlated_gnp(grg_graph, corr = 0)
  graph_cor <- cor(as.vector(grg_graph[]), as.vector(cor_gnp_graph_0[]))
  expect_true(abs(graph_cor) < .3)
})

test_that("sample_correlated_gnp_pair works", {
  withr::local_seed(42)

  cor_gnp_pair <- sample_correlated_gnp_pair(10, corr = .95, p = .1, permutation = NULL)
  expect_true(abs(ecount(cor_gnp_pair[[1]]) - ecount(cor_gnp_pair[[2]])) < 3)
})

## Some corner cases

test_that("sample_correlated_gnp corner cases work", {
  withr::local_seed(42)

  is_full <- function(g) {
    g_full <- make_full_graph(vcount(g), directed = is_directed(g))
    isomorphic(g, g_full)
  }

  gnp_graph <- sample_gnp(10, .3)
  cor_gnp_full <- sample_correlated_gnp(gnp_graph, corr = 0.000001, p = .99999999)
  expect_true(is_full(cor_gnp_full))

  cor_gnp_empty <- sample_correlated_gnp(gnp_graph, corr = 0.000001, p = 0.0000001)
  expect_equal(ecount(cor_gnp_empty), 0)
  expect_vcount(cor_gnp_empty, 10)

  gnp_graph_directed <- sample_gnp(10, .3, directed = TRUE)
  cor_gnp_directed <- sample_correlated_gnp(gnp_graph_directed, corr = 0.000001, p = .99999999)
  expect_true(is_full(cor_gnp_directed))

  cor_gnp_directed_empty <- sample_correlated_gnp(gnp_graph_directed, corr = 0.000001, p = 0.0000001)
  expect_equal(ecount(cor_gnp_directed_empty), 0)
  expect_vcount(cor_gnp_directed_empty, 10)
})

test_that("permutation works for sample_correlated_gnp", {
  withr::local_seed(42)

  gnp_graph <- sample_gnp(10, .3)
  perm <- sample(vcount(gnp_graph))
  cor_gnp_graph <- sample_correlated_gnp(gnp_graph, corr = .99999, p = .3, permutation = perm)
  gnp_graph <- permute(gnp_graph, perm)
  expect_equal(gnp_graph[], cor_gnp_graph[])

  perm <- sample(vcount(gnp_graph))
  cor_gnp_graph <- sample_correlated_gnp(gnp_graph, corr = 1, p = .3, permutation = perm)
  gnp_graph <- permute(gnp_graph, perm)
  expect_equal(gnp_graph[], cor_gnp_graph[])
})

test_that("HSBM works", {
  withr::local_seed(42)

  C <- matrix(c(
    1, 1 / 2, 0,
    1 / 2, 0, 1 / 2,
    0, 1 / 2, 1 / 2
  ), nrow = 3)

  g_hsbm1 <- sample_hierarchical_sbm(100, 10, rho = c(3, 3, 4) / 10, C = C, p = 0)
  expect_equal(ecount(g_hsbm1), 172)
  expect_vcount(g_hsbm1, 100)
  expect_false(is_directed(g_hsbm1))

  withr::local_seed(42)

  g_hsbm2 <- sample_hierarchical_sbm(100, 10, rho = c(3, 3, 4) / 10, C = C, p = 1)
  expect_equal(ecount(g_hsbm2), ecount(g_hsbm1) + 10 * 9 * (90 + 10) / 2)
  expect_vcount(g_hsbm2, 100)
  expect_true(is_simple(g_hsbm2))

  withr::local_seed(42)

  g_hsbm3 <- sample_hierarchical_sbm(100, 10, rho = c(3, 3, 4) / 10, C = C, p = 1e-15)
  expect_equal(ecount(g_hsbm3), ecount(g_hsbm1))
  expect_vcount(g_hsbm3, 100)
  expect_true(is_simple(g_hsbm3))

  withr::local_seed(42)

  g_hsbm4 <- sample_hierarchical_sbm(100, 10, rho = c(3, 3, 4) / 10, C = C, p = 1 - 1e-15)
  expect_equal(ecount(g_hsbm4), ecount(g_hsbm2))
  expect_vcount(g_hsbm4, 100)
  expect_true(is_simple(g_hsbm4))
})

test_that("HSBM with 1 cluster per block works", {
  res <- Matrix::Matrix(0, nrow = 10, ncol = 10, doDiag = FALSE)
  res[6:10, 1:5] <- res[1:5, 6:10] <- 1
  g_hsbm <- sample_hierarchical_sbm(10, 5, rho = 1, C = matrix(0), p = 1)
  expect_equal(g_hsbm[], res)
})

test_that("HSBM with list arguments works", {
  blocks <- 5
  C <- matrix(c(
    1, 1 / 2, 0,
    1 / 2, 0, 1 / 2,
    0, 1 / 2, 1 / 2
  ), nrow = 3)
  vertices_per_block <- 10
  rho <- c(3, 3, 4) / 10

  withr::local_seed(42)
  g_hsbm1 <- sample_hierarchical_sbm(
    blocks * vertices_per_block,
    vertices_per_block,
    rho = rho, C = C, p = 0
  )

  withr::local_seed(42)
  g_hsbm2 <- sample_hierarchical_sbm(
    blocks * vertices_per_block,
    rep(vertices_per_block, blocks),
    rho = rho, C = C, p = 0
  )
  expect_equal(g_hsbm1[], g_hsbm2[])

  withr::local_seed(42)
  g_hsbm3 <- sample_hierarchical_sbm(
    blocks * vertices_per_block,
    vertices_per_block,
    rho = replicate(blocks, rho, simplify = FALSE), C = C, p = 0
  )
  expect_equal(g_hsbm1[], g_hsbm3[])

  withr::local_seed(42)
  g_hsbm4 <- sample_hierarchical_sbm(
    blocks * vertices_per_block,
    vertices_per_block,
    rho = rho, C = replicate(blocks, C, simplify = FALSE), p = 0
  )

  expect_equal(g_hsbm1[], g_hsbm4[])

  expect_error(
    sample_hierarchical_sbm(
      blocks * vertices_per_block,
      rep(vertices_per_block, blocks),
      rho = list(rho, rho), C = C, p = 0
    )
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

  g_hsbm5 <- sample_hierarchical_sbm(21,
    m = c(3, 10, 5, 3), rho = list(rho1, rho2, rho3, rho4),
    C = list(C1, C2, C3, C4), p = 1
  )
  expect_true(is_simple(g_hsbm5))

  withr::local_seed(42)
  g_hsbm6 <- sample_hierarchical_sbm(21,
    m = c(3, 10, 5, 3), rho = list(rho1, rho2, rho3, rho4),
    C = list(C1, C2, C3, C4), p = 1 - 1e-10
  )
  expect_equal(g_hsbm5[], g_hsbm6[])

  rho1 <- n(c(1, 2))
  C1 <- matrix(1, nrow = 2, ncol = 2)
  rho2 <- n(c(3, 3, 4))
  C2 <- matrix(1, nrow = 3, ncol = 3)
  rho3 <- 1
  C3 <- matrix(1)
  rho4 <- n(c(2, 1))
  C4 <- matrix(1, nrow = 2, ncol = 2)
  g_hsbm7 <- sample_hierarchical_sbm(21,
    m = c(3, 10, 5, 3), rho = list(rho1, rho2, rho3, rho4),
    C = list(C1, C2, C3, C4), p = 0
  )
  expect_true(is_simple(g_hsbm7))

  g_hsbm8 <- sample_hierarchical_sbm(21,
    m = c(3, 10, 5, 3), rho = list(rho1, rho2, rho3, rho4),
    C = list(C1, C2, C3, C4), p = 1
  )
  expect_equal(g_hsbm5[] + g_hsbm7[], g_hsbm8[])
})
