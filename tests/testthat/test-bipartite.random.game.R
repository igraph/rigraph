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
