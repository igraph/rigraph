# Test shapes() function
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

  for (shape_name in c("circle", "square", "rectangle")) {
    clip_func <- shapes(shape_name)$clip
    result <- clip_func(empty_coords, el, params, "both")
    expect_equal(nrow(result), 0)
  }
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
