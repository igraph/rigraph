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
