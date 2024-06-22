test_that("sample_chung_lu works", {
  g <- sample_chung_lu(c(3, 3, 2, 2, 1, 1))
  expect_false(any_multiple(g))

  g <- sample_chung_lu(c(3, 3, 2, 2, 1, 1), loops = FALSE, variant = 'original')
  expect_true(is_simple(g))

  g <- sample_chung_lu(c(3, 3, 2, 2, 1, 1), loops = FALSE, variant = 'maxent')
  expect_true(is_simple(g))

  g <- sample_chung_lu(c(3, 3, 2, 2, 1, 1), loops = FALSE, variant = 'nr')
  expect_true(is_simple(g))
})
