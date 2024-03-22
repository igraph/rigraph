test_that("sample_degseq() works -- simple generator", {
  degrees <- rep(2, 100)
  undirected_graph <- sample_degseq(degrees)
  expect_equal(degree(undirected_graph), degrees)

  directed_graph <- sample_degseq(1:10, 10:1)
  expect_equal(degree(directed_graph, mode = "out"), 1:10)
  expect_equal(degree(directed_graph, mode = "in"), 10:1)
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
  expect_snapshot({
    sample_degseq(exponential_degrees, method = "vl")
  },
    error = TRUE,
    transform = function(x) sub("\\:[0-9]+", ":<linenumber>", x))
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

 expect_snapshot({
    sample_degseq(powerlaw_degrees, method = "vl")
  },
    error = TRUE,
    transform = function(x) sub("\\:[0-9]+", ":<linenumber>", x))
})

test_that("sample_degseq() works -- simple.no.multiple", {
  g <- sample_gnp(1000, 1 / 1000)

  simple_nm_graph <- sample_degseq(
    degree(g, mode = "out"),
    degree(g, mode = "in"),
    method = "simple.no.multiple"
  )
  expect_equal(degree(simple_nm_graph, mode = "out"), degree(g, mode = "out"))
  expect_equal(degree(simple_nm_graph, mode = "in"), degree(g, mode = "in"))
})

test_that("sample_degseq() works -- simple.no.multiple.uniform", {
  g <- sample_gnp(1000, 1 / 1000)
  simple_nmu_graph <- sample_degseq(degree(g, mode = "out"),
    degree(g, mode = "in"),
    method = "simple.no.multiple.uniform"
  )
  expect_equal(degree(simple_nmu_graph, mode = "out"), degree(g, mode = "out"))
  expect_equal(degree(simple_nmu_graph, mode = "in"), degree(g, mode = "in"))
})

test_that("sample_degseq supports the sample_(...) syntax", {
  degs <- rep(4, 20)
  g1 <- sample_(degseq(degs))
  g2 <- sample_(degseq(degs))

  expect_that(degree(g1), equals(degs))
  expect_that(degree(g2), equals(degs))

  expect_false(identical_graphs(g1, g2))
})
