# Stage-3 rendering indirection (F5, phase 1): drawing is emitted through the
# i.r_*() dispatchers, which forward to the current renderer.

test_that("the default renderer is the base renderer", {
  r <- i.cur_renderer()
  expect_type(r, "list")
  expect_true(all(
    c("segments", "polyline", "polygon", "xspline", "text", "symbols", "raster") %in%
      names(r)
  ))
})

test_that("i.with_renderer installs a renderer and restores the previous one", {
  before <- i.cur_renderer()
  marker <- list(tag = "fake")
  fake <- c(before, list(tag = "fake"))
  i.with_renderer(fake, {
    expect_identical(i.cur_renderer()$tag, "fake")
  })
  # restored afterwards
  expect_null(i.cur_renderer()$tag)
})

test_that("dispatchers forward primitives to the current renderer", {
  rec <- new.env()
  rec$calls <- character()
  capture <- function(name) {
    function(...) {
      rec$calls <- c(rec$calls, name)
      invisible(NULL)
    }
  }
  fake <- list(
    init_canvas = capture("init_canvas"),
    segments = capture("segments"),
    polyline = capture("polyline"),
    polygon = capture("polygon"),
    xspline = capture("xspline"),
    text = capture("text"),
    symbols = capture("symbols"),
    raster = capture("raster"),
    group_begin = capture("group_begin"),
    group_end = capture("group_end")
  )
  i.with_renderer(fake, {
    i.r_segments(0, 0, 1, 1)
    i.r_polyline(c(0, 1), c(0, 1))
    i.r_polygon(c(0, 1, 1), c(0, 0, 1))
    i.r_text(0, 0, "x")
    i.r_symbols("circles", 0, 0, 1, "red", "black", 1)
  })
  expect_equal(
    rec$calls,
    c("segments", "polyline", "polygon", "text", "symbols")
  )
})

test_that("plot.igraph still works (drawing through the base renderer)", {
  grDevices::pdf(NULL)
  withr::defer(grDevices::dev.off())
  expect_silent(plot(make_ring(5)))
})
