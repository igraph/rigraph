test_that("shortest_paths works", {
  edges <- matrix(
    c(
      "s", "a", 2,
      "s", "b", 4,
      "a", "t", 4,
      "b", "t", 2,
      "a", "1", 1,
      "a", "2", 1,
      "a", "3", 2,
      "1", "b", 1,
      "2", "b", 2,
      "3", "b", 1
    ),
    byrow = TRUE, ncol = 3,
    dimnames = list(NULL, c("from", "to", "weight"))
  )
  edges <- as.data.frame(edges)
  edges[[3]] <- as.numeric(as.character(edges[[3]]))

  g <- graph_from_data_frame(as.data.frame(edges))

  all1 <- all_shortest_paths(g, "s", "t", weights = NA)$vpaths
  all2 <- all_shortest_paths(g, "s", "t")$vpaths

  s1 <- shortest_paths(g, "s", "t", weights = NA)
  s2 <- get.shortest.paths(g, "s", "t")

  expect_true(s1$vpath %in% all1)
  expect_true(s2$vpath %in% all2)
})

test_that("shortest_paths can handle negative weights", {
  g <- make_tree(7)
  E(g)$weight <- -1
  sps <- shortest_paths(g, 2)$vpath

  expect_true(length(sps) == 7)
  expect_equal(ignore_attr = TRUE, as.vector(sps[[1]]), integer(0))
  expect_equal(ignore_attr = TRUE, as.vector(sps[[2]]), c(2))
  expect_equal(ignore_attr = TRUE, as.vector(sps[[3]]), integer(0))
  expect_equal(ignore_attr = TRUE, as.vector(sps[[4]]), c(2, 4))
  expect_equal(ignore_attr = TRUE, as.vector(sps[[5]]), c(2, 5))
  expect_equal(ignore_attr = TRUE, as.vector(sps[[6]]), integer(0))
  expect_equal(ignore_attr = TRUE, as.vector(sps[[7]]), integer(0))
})
