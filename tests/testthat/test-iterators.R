test_that("V(g) returns complete iterator, completeness is lost with next subsetting", {
  g <- make_star(4)
  iter <- V(g)
  expect_true(is_complete_iterator(iter))
  expect_false(is_complete_iterator(iter[1]))
  expect_false(is_complete_iterator(iter[1:4]))
})

test_that("E(g) returns complete iterator, completeness is lost with next subsetting", {
  g <- make_star(4)
  iter <- E(g)
  expect_true(is_complete_iterator(iter))
  expect_false(is_complete_iterator(iter[1]))
  expect_false(is_complete_iterator(iter[1:3]))
})
