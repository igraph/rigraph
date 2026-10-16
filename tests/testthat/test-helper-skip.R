test_that("engine_before() orders igraph's describe versions", {
  expect_true(engine_before("0.11.0-54-g8590948bf", "1.0.1"))
  expect_true(engine_before("0.10.17", "0.11.0"))
  expect_true(engine_before("1.0.1", "1.0.1-3-gabcdef123"))
  expect_false(engine_before("1.0.1", "1.0.1"))
  expect_false(engine_before("1.0.1-3-gabcdef123", "1.0.1"))
  expect_false(engine_before("1.0.10", "1.0.9"))
})

test_that("engine_before() lets a gate it cannot read run its test", {
  expect_false(engine_before("not a version", "1.0.0"))
  expect_false(engine_before("1.0.0", "next"))
})

test_that("skip_if_engine_before() reads the vendored engine", {
  expect_no_error(skip_if_engine_before("0.0.1", "every engine is newer"))
})
