test_that("`is_symmetric()` works", {
  sym <- diag(3)
  asym <- matrix(1:4, nrow = 2)

  expect_true(is_symmetric(sym))
  expect_false(is_symmetric(asym))
})

test_that("`is_symmetric()` works for Matrix", {
  skip_if_not_installed("Matrix")

  sym <- diag(3)
  asym <- matrix(1:4, nrow = 2)

  expect_true(is_symmetric(as(sym, "TsparseMatrix")))
  expect_false(is_symmetric(as(asym, "TsparseMatrix")))
})

test_that("`is_symmetric()` works for amat", {
  skip_if_not_installed("pcalg")

  sym <- diag(3)
  asym <- matrix(1:4, nrow = 2)

  expect_true(is_symmetric(structure(
    sym,
    dimnames = list(LETTERS[1:3], LETTERS[1:3]),
    class = "amat",
    type = "cpdag"
  )))
  expect_false(is_symmetric(structure(
    asym,
    dimnames = list(LETTERS[1:2], LETTERS[1:2]),
    class = "amat",
    type = "cpdag"
  )))
})
