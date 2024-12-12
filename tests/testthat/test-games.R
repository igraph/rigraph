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

