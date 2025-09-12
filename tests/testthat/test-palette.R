test_that("categorical_pal() works correctly", {
  # Basic functionality
  pal1 <- categorical_pal(1)
  expect_length(pal1, 1)
  expect_equal(pal1, "#E69F00")

  pal3 <- categorical_pal(3)
  expect_length(pal3, 3)
  expect_equal(pal3, c("#E69F00", "#56B4E9", "#009E73"))

  # Maximum colors
  pal8 <- categorical_pal(8)
  expect_length(pal8, 8)
  expect_equal(pal8[1], "#E69F00")
  expect_equal(pal8[8], "#999999")

  # All colors are valid hex codes
  expect_true(all(grepl("^#[0-9A-F]{6}$", pal8)))
})

test_that("categorical_pal() handles edge cases", {
  # Warning for too many colors
  expect_warning(
    result <- categorical_pal(10),
    "Cannot make 10 categorical colors"
  )
  expect_length(result, 8) # Should return max available

  # Error for invalid input
  expect_error(categorical_pal(0))
  expect_error(categorical_pal(-1))
  expect_error(categorical_pal(NULL))
})

test_that("sequential_pal() works correctly", {
  # Test different sizes
  pal1 <- sequential_pal(1)
  expect_length(pal1, 1)
  expect_equal(pal1, "#FEE8C8")

  pal3 <- sequential_pal(3)
  expect_length(pal3, 3)
  expect_equal(pal3, c("#FEE8C8", "#FDBB84", "#E34A33"))

  # Maximum colors
  pal9 <- sequential_pal(9)
  expect_length(pal9, 9)
  expect_true(all(grepl("^#[0-9A-F]{6}$", pal9)))

  # Sequential order (should get progressively darker/more intense)
  # Test that first color is lighter than last
  first_color <- pal9[1]
  last_color <- pal9[9]
  expect_equal(first_color, "#FFF7EC") # Lightest
  expect_equal(last_color, "#7F0000") # Darkest
})

test_that("sequential_pal() handles edge cases", {
  # Zero colors
  pal0 <- sequential_pal(0)
  expect_length(pal0, 0)
  expect_type(pal0, "character")

  # Warning for too many colors
  expect_warning(
    result <- sequential_pal(15),
    "Cannot make 15 sequential colors"
  )
  expect_length(result, 9) # Should return max available

  # Error for invalid input
  expect_error(sequential_pal(-1))
  expect_error(sequential_pal(NULL))
})

test_that("diverging_pal() works correctly", {
  # Test different sizes
  pal1 <- diverging_pal(1)
  expect_length(pal1, 1)
  expect_equal(pal1, "#F1A340")

  pal5 <- diverging_pal(5)
  expect_length(pal5, 5)
  expect_equal(pal5, c("#E66101", "#FDB863", "#F7F7F7", "#B2ABD2", "#5E3C99"))

  # Maximum colors
  pal11 <- diverging_pal(11)
  expect_length(pal11, 11)
  expect_true(all(grepl("^#[0-9A-F]{6}$", pal11)))

  # Should have neutral color in middle for odd numbers
  pal7 <- diverging_pal(7)
  expect_equal(pal7[4], "#F7F7F7") # Middle should be neutral
})

test_that("diverging_pal() handles edge cases", {
  # Warning for too many colors
  expect_warning(
    result <- diverging_pal(15),
    "Cannot make 15 divergent colors"
  )
  expect_length(result, 11) # Should return max available

  # Error for invalid input
  expect_error(diverging_pal(0))
  expect_error(diverging_pal(-1))
  expect_error(diverging_pal(NULL))
})

test_that("r_pal() works correctly", {
  # Test different sizes
  pal1 <- r_pal(1)
  expect_length(pal1, 1)

  pal3 <- r_pal(3)
  expect_length(pal3, 3)

  # Maximum colors (should match R's default palette)
  pal8 <- r_pal(8)
  expect_length(pal8, 8)
  expect_equal(pal8, palette()[1:8])

  # Colors should be valid R color names or hex codes
  expect_true(all(nzchar(pal8)))
})

test_that("r_pal() handles edge cases", {
  # Warning for too many colors (note: message says "divergent" - this might be a bug!)
  expect_warning(
    result <- r_pal(15),
    "Cannot make 15 divergent colors" # This warning message seems wrong
  )

  # Zero colors
  pal0 <- r_pal(0)
  expect_length(pal0, 0)
  expect_type(pal0, "character")

  # Error for invalid input
  expect_error(r_pal(-1))
  expect_error(r_pal(NULL))
})
test_that("all palettes return valid colors", {
  palettes <- list(
    categorical = categorical_pal,
    sequential = sequential_pal,
    diverging = diverging_pal,
    r = r_pal
  )

  for (pal_name in names(palettes)) {
    pal_func <- palettes[[pal_name]]

    # Test with small number
    colors <- suppressWarnings(pal_func(3))
    expect_true(all(nzchar(colors)), info = paste("Empty colors in", pal_name))

    # Colors should be unique within palette
    expect_equal(
      length(colors),
      length(unique(colors)),
      info = paste("Duplicate colors in", pal_name)
    )
  }
})

test_that("categorical palette is color-blind friendly", {
  # The categorical palette should be distinguishable
  # Test that we have the expected color-blind friendly colors
  pal8 <- categorical_pal(8)
  expected_colors <- c(
    "#E69F00", "#56B4E9", "#009E73", "#F0E442",
    "#0072B2", "#D55E00", "#CC79A7", "#999999"
  )
  expect_equal(pal8, expected_colors)
})

test_that("diverging palette is symmetric where appropriate", {
  # For odd numbers, middle color should be neutral
  for (n in c(3, 5, 7, 9, 11)) {
    if (n <= 11) {
      pal <- diverging_pal(n)
      middle_idx <- ceiling(n / 2)
      expect_equal(
        pal[middle_idx],
        "#F7F7F7",
        info = paste("Middle color not neutral for n =", n)
      )
    }
  }
})
test_that("palettes work with igraph plotting", {
  skip_if_not_installed("vdiffr")

  g <- make_ring(8)

  # Test categorical palette
  vdiffr::expect_doppelganger(
    "categorical palette",
    function() {
      V(g)$color <- categorical_pal(vcount(g))
      plot(g, vertex.size = 20, layout = layout_in_circle(g))
    }
  )

  # Test sequential palette
  vdiffr::expect_doppelganger(
    "sequential palette",
    function() {
      V(g)$color <- sequential_pal(vcount(g))
      plot(g, vertex.size = 20, layout = layout_in_circle(g))
    }
  )

  # Test diverging palette
  vdiffr::expect_doppelganger(
    "diverging palette",
    function() {
      V(g)$color <- diverging_pal(vcount(g))
      plot(g, vertex.size = 20, layout = layout_in_circle(g))
    }
  )
})

test_that("palettes work with different graph sizes", {
  skip_if_not_installed("vdiffr")

  # Test with different numbers of vertices
  for (n in c(3, 5, 8)) {
    g <- make_ring(n)

    vdiffr::expect_doppelganger(
      paste("categorical palette", n, "vertices"),
      function() {
        V(g)$color <- categorical_pal(vcount(g))
        plot(g, vertex.size = 25, layout = layout_in_circle(g))
      }
    )
  }
})
test_that("palettes handle unusual inputs gracefully", {
  # Test with floating point inputs (should be truncated/converted)
  expect_silent(categorical_pal(3.7))
  expect_length(categorical_pal(3.7), 3)

  # Test with very large numbers
  expect_warning(categorical_pal(1000))
  expect_warning(sequential_pal(1000))
  expect_warning(diverging_pal(1000))

  # Test that warnings are informative
  expect_warning(
    categorical_pal(20),
    "Cannot make 20 categorical colors"
  )
})

test_that("r_pal warning message bug", {
  # This test documents what appears to be a bug in r_pal
  # The warning message says "divergent colors" instead of "R palette colors"
  expect_warning(
    r_pal(15),
    "Cannot make 15 divergent colors" # This should probably be "R palette colors"
  )

  # This test can be updated when the bug is fixed
})
