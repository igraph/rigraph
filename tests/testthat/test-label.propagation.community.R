test_that("label.propagation.community works", {
  g <- make_graph("Zachary")
  withr::local_seed(20231029)
  lpc <- cluster_label_prop(g)
  expect_equal(lpc$modularity, modularity(g, lpc$membership))
  #  1   2   3   4   5
  # 29 453 431  84   3
  expect_true(length(lpc) %in% 1:5)
  expect_true(all(as.vector(membership(lpc)) %in% seq_len(length(lpc))))
  expect_s3_class(sizes(lpc), "table")
  expect_equal(sum(sizes(lpc)), vcount(g))
  expect_identical(sizes(lpc), table(membership(lpc), dnn = "Community sizes"))
})
