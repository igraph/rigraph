# Label decluttering helper: label_top() keeps the highest-ranked labels and
# blanks the rest with NA so plot.igraph() omits them.

test_that("label_top keeps exactly n labels, the highest by `by`", {
  by <- c(5, 1, 9, 3, 7)
  out <- label_top(by, n = 2, labels = letters[1:5])
  expect_length(out, 5)
  expect_equal(sum(!is.na(out)), 2)
  # the two highest are 9 (pos 3, "c") and 7 (pos 5, "e")
  expect_equal(which(!is.na(out)), c(3, 5))
  expect_equal(out[!is.na(out)], c("c", "e"))
})

test_that("label_top supports prop (rounded up)", {
  by <- 1:10
  out <- label_top(by, prop = 0.25, labels = as.character(1:10))
  expect_equal(sum(!is.na(out)), 3) # ceiling(0.25 * 10)
  expect_equal(out[!is.na(out)], c("8", "9", "10"))
})

test_that("label_top decreasing = FALSE keeps the lowest", {
  by <- c(5, 1, 9, 3, 7)
  out <- label_top(by, n = 2, labels = letters[1:5], decreasing = FALSE)
  expect_equal(which(!is.na(out)), c(2, 4)) # values 1 and 3
})

test_that("label_top defaults labels to names then indices", {
  named <- c(a = 5, b = 1, c = 9)
  expect_equal(label_top(named, n = 1), c(NA, NA, "c"))

  unnamed <- c(5, 1, 9)
  expect_equal(label_top(unnamed, n = 1), c(NA, NA, "3"))
})

test_that("label_top keeps everything when neither n nor prop given", {
  by <- c(5, 1, 9)
  expect_equal(label_top(by, labels = letters[1:3]), c("a", "b", "c"))
})

test_that("label_top handles ties via rank ties.method = 'min'", {
  by <- c(5, 5, 1)
  out <- label_top(by, n = 1, labels = letters[1:3])
  # both 5s rank 1 (min), so both kept even though n = 1
  expect_equal(which(!is.na(out)), c(1, 2))
})

test_that("label_top validates its arguments", {
  expect_error(label_top("x", n = 1), "numeric")
  expect_error(label_top(1:3, n = 1, prop = 0.5), "either")
  expect_error(label_top(1:3, prop = 2), "between 0 and 1")
  expect_error(label_top(1:3, labels = letters[1:2]), "same length")
})

test_that("label_top composes with plot.igraph (NA labels omitted)", {
  g <- make_ring(6)
  grDevices::pdf(NULL)
  withr::defer(grDevices::dev.off())
  expect_silent(plot(g, vertex.label = label_top(degree(g), n = 2)))
})
