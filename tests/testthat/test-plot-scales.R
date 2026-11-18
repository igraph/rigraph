# Unit tests for the scale layer: scale_color() / scale_size() and the internal
# i.apply_scales() that feeds plot.igraph().

test_that("scale_color() maps a discrete vector to categorical colours", {
  s <- scale_color(c("a", "b", "a", "c"))
  expect_s3_class(s, "igraph_scale")
  expect_type(s$values, "character")

  pal <- categorical_pal(3)
  # levels are sorted: a, b, c
  expect_equal(s$values, pal[c(1, 2, 1, 3)])

  expect_equal(s$guide$aesthetic, "color")
  expect_equal(s$guide$type, "discrete")
  expect_equal(s$guide$labels, c("a", "b", "c"))
  expect_equal(s$guide$colors, pal)
})

test_that("scale_color() respects factor level order and a custom palette", {
  x <- factor(c("lo", "hi", "lo"), levels = c("lo", "hi"))
  s <- scale_color(x, palette = c("red", "blue"))
  expect_equal(s$guide$labels, c("lo", "hi")) # factor order, not sorted
  expect_equal(s$values, c("red", "blue", "red"))
})

test_that("scale_color() sends NA data to na.value and drops it from the guide", {
  s <- scale_color(c("a", NA, "b"), na.value = "grey90")
  expect_equal(s$values[2], "grey90")
  expect_false("grey90" %in% s$guide$colors)
  expect_equal(s$guide$labels, c("a", "b"))
})

test_that("scale_color() maps a numeric vector continuously with a colorbar guide", {
  s <- scale_color(c(0, 5, 10))
  expect_equal(s$guide$type, "continuous")
  expect_equal(s$guide$limits, c(0, 10))
  expect_match(s$values, "^#", all = TRUE) # valid hex
  # endpoints differ (low vs high of the ramp)
  expect_false(s$values[1] == s$values[3])
})

test_that("scale_size() rescales numeric data to the size range", {
  s <- scale_size(c(1, 2, 3), range = c(10, 30))
  expect_s3_class(s, "igraph_scale")
  expect_equal(s$values, c(10, 20, 30))
  expect_equal(s$guide$aesthetic, "size")
  expect_equal(s$guide$type, "discrete")
})

test_that("scale_size() supports a transform and constant input", {
  s <- scale_size(c(1, 4, 9), range = c(0, 10), trans = "sqrt")
  # sqrt -> 1,2,3 -> linear 0,5,10
  expect_equal(s$values, c(0, 5, 10))

  flat <- scale_size(rep(5, 4), range = c(2, 8))
  expect_equal(flat$values, rep(5, 4)) # midpoint of range
})

test_that("scale_size() rejects non-numeric input", {
  expect_error(scale_size(c("a", "b")), "must be numeric")
})

test_that("i.apply_scales replaces scale args and collects guides", {
  dots <- list(
    vertex.color = scale_color(c("a", "b")),
    vertex.size = scale_size(c(1, 2)),
    edge.width = 3 # plain arg untouched
  )
  res <- i.apply_scales(dots)

  expect_type(res$dots$vertex.color, "character") # resolved
  expect_equal(res$dots$edge.width, 3) # untouched
  expect_length(res$guides, 2)
  # title defaults to the argument name
  names <- vapply(res$guides, function(g) g$name, character(1))
  expect_setequal(names, c("vertex.color", "vertex.size"))
})

test_that("a scale's explicit name overrides the argument-name default", {
  res <- i.apply_scales(list(
    vertex.color = scale_color(c("a", "b"), name = "Group")
  ))
  expect_equal(res$guides[[1]]$name, "Group")
})

test_that("a wrong-length scale is rejected by strict recycling at plot time", {
  g <- make_ring(5)
  grDevices::pdf(NULL)
  withr::defer(grDevices::dev.off())
  # 3 colours mapped, but 5 vertices
  expect_error(
    plot(g, vertex.color = scale_color(c("a", "b", "c"))),
    "length 3"
  )
})

test_that("named per-vertex aesthetics don't break edge drawing (#regression)", {
  # A named vertex.size (e.g. scale_size(degree(g)) carries degree()'s names)
  # used to propagate names into the clipped edge coordinates, where
  # i.edge_label_pos()'s c(x = ..., y = ...) produced names like "x.Alice"
  # instead of "x"/"y", crashing with "subscript out of bounds".
  g <- make_graph(~ A - B, B - C, C - A, A - D)
  grDevices::pdf(NULL)
  withr::defer(grDevices::dev.off())

  expect_silent(plot(g, vertex.size = scale_size(degree(g), range = c(10, 30))))
  expect_silent(plot(
    g,
    vertex.size = stats::setNames(c(10, 20, 30, 15), V(g)$name)
  ))
})

test_that("i.edge_label_pos returns x/y names even for named inputs", {
  pos <- i.edge_label_pos(
    stats::setNames(0, "a"),
    stats::setNames(0, "a"),
    stats::setNames(1, "b"),
    stats::setNames(1, "b")
  )
  expect_named(pos, c("x", "y"))
  expect_equal(pos[["x"]], 1 / 3)
  expect_equal(pos[["y"]], 1 / 3)
})
