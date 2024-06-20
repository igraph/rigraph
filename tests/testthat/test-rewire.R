test_that("rewire(each_edge(mode='in')) keeps the in-degree distribution", {
  g <- sample_pa(1000)

  g2 <- g %>% rewire(each_edge(mode = "in", multiple = T, prob = 0.2))
  expect_equal(degree(g, mode = "in"), degree(g2, mode = "in"))
  expect_false(all(degree(g, mode = "out") == degree(g2, mode = "out")))
})

test_that("rewire(each_edge(mode='out')) keeps the out-degree distribution", {
  g <- sample_pa(1000)

  g2 <- g %>% rewire(each_edge(mode = "out", multiple = T, prob = 0.2))
  expect_equal(degree(g, mode = "out"), degree(g2, mode = "out"))
  expect_false(all(degree(g, mode = "in") == degree(g2, mode = "in")))
})

test_that("rewire() with zero probability does not do anything", {
  g <- sample_pa(100)
  g2 <- g %>% rewire(each_edge(prob = 0))
  expect_true(identical_graphs(g, g2))
})
