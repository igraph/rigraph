# jarl-ignore-file implicit_assignment: just the way it works
test_that("shapes() lists all available shapes", {
  all_shapes <- shapes()
  expect_type(all_shapes, "character")
  expect_true(length(all_shapes) > 0)
  expect_true("circle" %in% all_shapes)
  expect_true("square" %in% all_shapes)
  expect_true("rectangle" %in% all_shapes)
})

test_that("shapes() returns specific shape functions", {
  circle_shape <- shapes("circle")
  expect_type(circle_shape, "list")
  expect_named(circle_shape, c("clip", "plot"))
  expect_type(circle_shape$clip, "closure")
  expect_type(circle_shape$plot, "closure")
})

test_that("shapes() returns NULL for non-existent shape", {
  expect_null(shapes("nonexistent"))
})

test_that("add_shape() validates inputs correctly", {
  # Valid inputs
  expect_true(add_shape("test_shape"))
  expect_true("test_shape" %in% shapes())

  # Invalid shape name
  expect_error(add_shape(123), "must be a character")
  expect_error(add_shape(c("a", "b")), "must be a character of length 1")

  # Invalid clip function
  expect_error(
    add_shape("test2", clip = "not_a_function"),
    "must be a function"
  )

  # Invalid plot function
  expect_error(add_shape("test3", plot = 123), "must be a function")

  # Invalid parameters
  expect_error(
    add_shape("test4", parameters = c(1, 2, 3)),
    "must be a named list"
  )
  expect_error(
    add_shape("test5", parameters = list(1, 2)),
    "must be a named list"
  )
})

test_that("add_shape() validates clip/plot signatures", {
  # Remove the shapes registered below so they don't leak into other tests
  # (e.g. the "render all shapes" snapshot test).
  withr::defer({
    for (s in c("dots_shape", "good_shape")) {
      if (exists(s, envir = .igraph.shapes)) {
        rm(list = s, envir = .igraph.shapes)
      }
    }
  })
  # clip missing `end`
  expect_error(
    add_shape("bad_clip", clip = function(coords, el, params) coords),
    "missing required argument"
  )
  # plot missing `params`
  expect_error(
    add_shape("bad_plot", plot = function(coords, v) invisible()),
    "missing required argument"
  )
  # functions taking ... are accepted
  expect_true(
    add_shape(
      "dots_shape",
      clip = function(...) NULL,
      plot = function(...) invisible()
    )
  )
  # a correctly-shaped custom shape is accepted
  expect_true(
    add_shape(
      "good_shape",
      clip = function(coords, el, params, end) coords,
      plot = function(coords, v = NULL, params) invisible()
    )
  )
})

test_that("add_shape() can override existing shapes", {
  original_circle <- shapes("circle")
  dummy_plot <- function(coords, v = NULL, params) invisible(NULL)

  add_shape("circle", plot = dummy_plot)
  modified_circle <- shapes("circle")

  expect_false(identical(original_circle$plot, modified_circle$plot))

  # Restore original
  add_shape("circle", clip = original_circle$clip, plot = original_circle$plot)
})

test_that("shape_noclip() handles different end parameters", {
  coords <- matrix(c(0, 0, 10, 10), nrow = 1)
  el <- matrix(c(1, 2), nrow = 1)
  params <- function(type, param) 5

  # Test "both"
  result_both <- shape_noclip(coords, el, params, "both")
  expect_equal(result_both, coords)

  # Test "from"
  result_from <- shape_noclip(coords, el, params, "from")
  expect_equal(result_from, coords[, 1:2, drop = FALSE])

  # Test "to"
  result_to <- shape_noclip(coords, el, params, "to")
  expect_equal(result_to, coords[, 3:4, drop = FALSE])
})

test_that("shape_noplot() returns invisible NULL", {
  coords <- matrix(c(0, 0, 10, 10), nrow = 2)
  result <- shape_noplot(coords)
  expect_null(result)
})

test_that("circle clipping works correctly", {
  # Setup test data
  coords <- matrix(c(0, 0, 10, 0), nrow = 1) # horizontal line
  el <- matrix(c(1, 2), nrow = 1)
  params <- function(type, param) {
    if (param == "size") {
      return(2)
    }
    return(1)
  }

  clip_func <- shapes("circle")$clip

  # Test "from" clipping
  result_from <- clip_func(coords, el, params, "from")
  expect_equal(ncol(result_from), 2)
  expect_true(result_from[1, 1] > 0) # Should be clipped inward

  # Test "to" clipping
  result_to <- clip_func(coords, el, params, "to")
  expect_equal(ncol(result_to), 2)
  expect_true(result_to[1, 1] < 10) # Should be clipped inward

  # Test "both" clipping
  result_both <- clip_func(coords, el, params, "both")
  expect_equal(ncol(result_both), 4)
})

test_that("clipping handles empty coordinates", {
  empty_coords <- matrix(numeric(0), nrow = 0, ncol = 4)
  el <- matrix(numeric(0), nrow = 0, ncol = 2)
  params <- function(type, param) 1

  built_in <- c(
    "circle", "square", "csquare", "rectangle", "crectangle",
    "vrectangle", "pie"
  )
  for (shape_name in built_in) {
    clip_func <- shapes(shape_name)$clip
    result <- clip_func(empty_coords, el, params, "both")
    expect_equal(nrow(result), 0)
  }
})

test_that("non-circle clip functions return the right column structure", {
  # diagonal edge from (0,0) to (10,10)
  coords <- matrix(c(0, 0, 10, 10), nrow = 1)
  el <- matrix(c(1, 2), nrow = 1)
  params <- function(type, param) {
    switch(param, "size" = 2, "size2" = 2, 1)
  }

  all_clip <- c("square", "csquare", "rectangle", "crectangle", "vrectangle", "pie")
  for (shape_name in all_clip) {
    clip_func <- shapes(shape_name)$clip
    expect_equal(ncol(clip_func(coords, el, params, "from")), 2, info = shape_name)
    expect_equal(ncol(clip_func(coords, el, params, "to")), 2, info = shape_name)
    expect_equal(ncol(clip_func(coords, el, params, "both")), 4, info = shape_name)
  }
})

test_that("non-centered clip functions clip endpoints inward", {
  # diagonal edge from (0,0) to (10,10)
  coords <- matrix(c(0, 0, 10, 10), nrow = 1)
  el <- matrix(c(1, 2), nrow = 1)
  params <- function(type, param) {
    switch(param, "size" = 2, "size2" = 2, 1)
  }

  # csquare/crectangle clip to a face-center (can sit on an axis for a 45 deg
  # edge), so the inward check applies only to the non-centered shapes.
  for (shape_name in c("square", "rectangle", "vrectangle", "pie")) {
    clip_func <- shapes(shape_name)$clip
    expect_true(clip_func(coords, el, params, "from")[1, 1] > 0, info = shape_name)
    expect_true(clip_func(coords, el, params, "to")[1, 1] < 10, info = shape_name)
  }
})

test_that("clip functions select vertex.size per endpoint from a vector", {
  # Two identical diagonal edges, distinct from/to vertex indices, so that a
  # per-vertex size vector must be indexed by el[, 1] (from) and el[, 2] (to).
  # This pins the exact per-endpoint selection that the planned refactor
  # deduplicates across shapes.
  coords <- rbind(c(0, 0, 10, 10), c(0, 0, 10, 10))
  el <- rbind(c(1, 2), c(3, 4))
  sizes <- c(2, 2, 8, 8) # vertices 3 and 4 are larger
  params <- function(type, param) {
    if (param == "size") return(sizes)
    1
  }

  clip_func <- shapes("circle")$clip

  # "from" uses size[el[, 1]] = c(2, 8): the larger from-vertex (row 2) is
  # clipped further along the edge, so its x is greater.
  res_from <- clip_func(coords, el, params, "from")
  expect_gt(res_from[2, 1], res_from[1, 1])

  # "to" uses size[el[, 2]] = c(2, 8): the larger to-vertex (row 2) clips the
  # endpoint back more, so its x is smaller.
  res_to <- clip_func(coords, el, params, "to")
  expect_lt(res_to[2, 1], res_to[1, 1])
})

test_that("all built-in shapes render correctly", {
  skip_if_not_installed("vdiffr")

  g <- make_ring(10)
  available_shapes <- setdiff(shapes(), "raster") # Exclude raster if not available

  for (shape in available_shapes) {
    vdiffr::expect_doppelganger(
      paste("vertex shape", shape),
      function() {
        plot(
          g,
          vertex.shape = shape,
          vertex.size = 15,
          vertex.size2 = 10, # For rectangles
          vertex.color = "lightblue",
          vertex.frame.color = "black",
          vertex.pie = if (shape == "pie") list(c(1, 2, 3)) else list(c(0)),
          vertex.pie.color = if (shape == "pie") {
            list(c("red", "green", "blue"))
          } else {
            list("white")
          },
          layout = layout_in_circle(g)
        )
      }
    )
  }
})

test_that("shapes work with different vertex parameters", {
  skip_if_not_installed("vdiffr")

  g <- make_star(6)

  vdiffr::expect_doppelganger(
    "mixed vertex parameters",
    function() {
      plot(
        g,
        vertex.shape = c("circle", "square", "rectangle", "circle", "square", "rectangle"),
        vertex.size = c(10, 15, 20, 25, 30, 35),
        vertex.size2 = c(5, 10, 15, 20, 25, 30),
        vertex.color = rainbow(6),
        vertex.frame.color = "black",
        vertex.frame.width = c(1, 2, 3, 1, 2, 3),
        layout = layout_as_star(g)
      )
    }
  )
})

test_that("pie chart vertices work correctly", {
  skip_if_not_installed("vdiffr")

  g <- make_ring(4)

  vdiffr::expect_doppelganger(
    "pie chart vertices",
    function() {
      plot(
        g,
        vertex.shape = "pie",
        vertex.pie = list(
          c(1, 2, 3),
          c(2, 3, 1),
          c(3, 1, 2),
          c(1, 1, 1)
        ),
        vertex.pie.color = list(
          c("red", "green", "blue"),
          c("yellow", "orange", "purple"),
          c("pink", "cyan", "magenta"),
          c("brown", "gray", "black")
        ),
        vertex.size = 20,
        layout = layout_in_circle(g)
      )
    }
  )
})

test_that("deprecated functions still work with warnings", {
  # Test deprecated wrapper functions
  lifecycle::expect_deprecated(
    result1 <- igraph.shape.noplot(matrix(c(0, 0), nrow = 1))
  )
  expect_null(result1)

  lifecycle::expect_deprecated(
    result2 <- vertex.shapes()
  )
  expect_type(result2, "character")

  lifecycle::expect_deprecated(
    result3 <- add.vertex.shape("test_deprecated")
  )
  expect_true(result3)
})

test_that("shape functions handle edge cases", {
  skip_if_not_installed("vdiffr")

  # Test with single vertex
  single_coords <- matrix(c(0, 0), nrow = 1)
  params <- function(type, param) {
    switch(
      param,
      "size" = 5,
      "color" = "red",
      "frame.color" = "black",
      "frame.width" = 1,
      1
    )
  }

  for (shape_name in c("circle", "square", "rectangle")) {
    plot_func <- shapes(shape_name)$plot

    vdiffr::expect_doppelganger(paste0("edge-test ", shape_name), function() {
      plot(
        single_coords,
        type = "n",
        xlim = c(-10, 10),
        ylim = c(-10, 10),
        asp = 1
      )
      plot_func(single_coords, NULL, params)
    })
  }

  # Test with zero-size vertices
  params_zero <- function(type, param) {
    if (param == "size") {
      return(0)
    }
    return(1)
  }

  for (shape_name in c("circle", "square")) {
    clip_func <- shapes(shape_name)$clip
    coords <- matrix(c(0, 0, 10, 10), nrow = 1)
    el <- matrix(c(1, 2), nrow = 1)
    expect_silent(clip_func(coords, el, params_zero, "both"))
  }
})
