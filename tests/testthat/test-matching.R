test_that("is_matching works", {
  df <- data.frame(x = 1:5, y = letters[1:5])
  g <- graph_from_data_frame(df)

  expect_true(is_matching(g, c(6:10, 1:5)))
  expect_true(is_matching(g, c(6:9, NA, 1:4, NA)))
  expect_true(is_matching(g, rep(NA, 10)))

  expect_false(is_matching(g, c(1:10)))
  expect_false(is_matching(g, c(6:10, 5:1)))
  expect_false(is_matching(g, c(2)))
})

test_that("is_matching works with names", {
  df <- data.frame(x = 1:5, y = letters[1:5])
  g <- graph_from_data_frame(df)

  expect_true(is_matching(g, c("a", "b", "c", "d", "e", "1", "2", "3", "4", "5")))
  expect_true(is_matching(g, c("a", "b", "c", "d", NA, "1", "2", "3", "4", NA)))

  expect_false(is_matching(g, c("1", "2", "3", "4", "5", "a", "b", "c", "d", "e")))
  expect_false(is_matching(g, c("a", "b", "c", "d", "e", "5", "4", "3", "2", "1")))
  expect_false(is_matching(g, c("a", "b")))
})

test_that("is_max_matching works", {
  df <- data.frame(x = 1:5, y = letters[1:5])
  g <- graph_from_data_frame(df)

  expect_true(is_max_matching(g, c(6:10, 1:5)))
  expect_false(is_max_matching(g, c(6:9, NA, 1:4, NA)))
  expect_false(is_max_matching(g, rep(NA, 10)))

  expect_false(is_max_matching(g, c(1:10)))
  expect_false(is_max_matching(g, c(6:10, 5:1)))
  expect_false(is_max_matching(g, c(2)))
})

test_that("is_max_matching works with names", {
  df <- data.frame(x = 1:5, y = letters[1:5])
  g <- graph_from_data_frame(df)

  expect_true(is_max_matching(g, c("a", "b", "c", "d", "e", "1", "2", "3", "4", "5")))
  expect_false(is_max_matching(g, c("a", "b", "c", "d", NA, "1", "2", "3", "4", NA)))

  expect_false(is_max_matching(g, c("1", "2", "3", "4", "5", "a", "b", "c", "d", "e")))
  expect_false(is_max_matching(g, c("a", "b", "c", "d", "e", "5", "4", "3", "2", "1")))
  expect_false(is_max_matching(g, c("a", "b")))
})

test_that("max_bipartite_match works", {
  df <- data.frame(x = 1:5, y = letters[1:5])
  g <- graph_from_data_frame(df)
  V(g)$type <- 1:vcount(g) > 5
  match <- max_bipartite_match(g)

  expect_equal(match$matching_size, 5)
  expect_equal(match$matching_weight, 5)
  expect_equal(sort(as.vector(match$matching)), sort(V(g)$name))
})

test_that("max_bipartite_match handles missing types gracefully", {
  df <- data.frame(x = 1:5, y = letters[1:5])
  g <- graph_from_data_frame(df)
  expect_error(max_bipartite_match(g), "supply .*types.* argument")
})
