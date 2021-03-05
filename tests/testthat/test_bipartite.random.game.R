
context("sample_bipartite")

test_that("sample_bipartite works", {

  library(igraph)

  set.seed(42)
  g1 <- sample_bipartite(10, 5, type="gnp", p=.1)
  expect_that(g1$name, equals("Bipartite Gnp random graph"))
  expect_that(vcount(g1), equals(15))
  expect_that(ecount(g1), equals(7))
  expect_true(bipartite_mapping(g1)$res)
  expect_false(is_directed(g1))

  g2 <- sample_bipartite(10, 5, type="gnp", p=.1, directed=TRUE)
  expect_that(vcount(g2), equals(15))
  expect_that(ecount(g2), equals(6))
  expect_true(bipartite_mapping(g2)$res)
  expect_true(is_directed(g2))
  expect_that(print_all(g2), prints_text("5->11"));

  g3 <- sample_bipartite(10, 5, type="gnp", p=.1, directed=TRUE, mode="in")
  expect_that(print_all(g3), prints_text("11->3"));

  g4 <- sample_bipartite(10, 5, type="gnm", m=8)
  expect_that(vcount(g4), equals(15))
  expect_that(ecount(g4), equals(8))
  expect_true(bipartite_mapping(g4)$res)
  expect_false(is_directed(g4))  

  g5 <- sample_bipartite(10, 5, type="gnm", m=8, directed=TRUE)
  expect_that(vcount(g5), equals(15))
  expect_that(ecount(g5), equals(8))
  expect_true(bipartite_mapping(g5)$res)
  expect_true(is_directed(g5))
  expect_that(print_all(g5), prints_text("5->12"))

  g6 <- sample_bipartite(10, 5, type="gnm", m=8, directed=TRUE, mode="in")
  expect_that(vcount(g6), equals(15))
  expect_that(ecount(g6), equals(8))
  expect_true(bipartite_mapping(g6)$res)
  expect_true(is_directed(g6))
  expect_that(print_all(g6), prints_text("12->10"))

#####

  g7 <- sample_bipartite(10, 5, type="gnp", p=0.9999, directed=TRUE,
                              mode="all")
  expect_that(ecount(g7), equals(100))

  g8 <- sample_bipartite(10, 5, type="gnm", m=99, directed=TRUE,
                              mode="all")
  expect_that(ecount(g8), equals(99))

})
