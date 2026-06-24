# Rendering indirection: drawing is emitted through the i.r_*() dispatchers,
# which forward to the current renderer.

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

test_that("the record renderer captures a backend-neutral draw list", {
  g <- make_ring(3)
  V(g)$name <- c("x", "y", "z")
  rec <- i.renderer_record()
  grDevices::pdf(NULL)
  withr::defer(grDevices::dev.off())
  i.with_renderer(rec, plot(g, vertex.size = 20))

  prims <- rec$.state$prims
  expect_gt(length(prims), 0)
  types <- vapply(prims, function(p) p$type, character(1))
  expect_true("symbols" %in% types) # vertices
  expect_true(any(types %in% c("segments", "polyline"))) # edges
  grp <- vapply(
    prims,
    function(p) if (is.null(p$group)) "" else p$group$type,
    character(1)
  )
  expect_true("vertices" %in% grp)
  expect_true("edge" %in% grp)
  # colours are canonicalised to hex
  sym <- prims[[which(types == "symbols")[1]]]
  expect_match(sym$bg[1], "^#")
})

test_that("as_svg produces well-formed SVG with per-vertex/edge ids and titles", {
  skip_if_not_installed("xml2")
  g <- make_ring(4, directed = TRUE)
  V(g)$name <- c("a", "b", "c", "d")
  svg <- as_svg(g)

  # well-formed
  expect_s3_class(xml2::read_xml(svg), "xml_document")
  # one group per vertex and per edge
  expect_length(gregexpr("id='vertex-", svg, fixed = TRUE)[[1]], 4)
  expect_length(gregexpr("id='edge-", svg, fixed = TRUE)[[1]], 4)
  # tooltip from the vertex name
  expect_match(svg, "<title>a</title>", fixed = TRUE)
})

test_that("as_svg writes to a file and honours the tooltips argument", {
  g <- make_ring(3)
  V(g)$kind <- c("p", "q", "r")

  f <- withr::local_tempfile(fileext = ".svg")
  out <- as_svg(g, file = f, tooltips = "kind")
  expect_true(file.exists(f))
  expect_match(paste(readLines(f), collapse = ""), "<svg", fixed = TRUE)
  expect_match(out, "<title>p</title>", fixed = TRUE)
})

test_that("a label halo emits the offset copies plus the real label in SVG", {
  skip_if_not_installed("xml2")
  g <- make_ring(3)
  V(g)$name <- c("aa", "bb", "cc")

  plain <- as_svg(g)
  haloed <- as_svg(g, vertex.label.halo = "white", vertex.label.halo.width = 0.2)

  expect_s3_class(xml2::read_xml(haloed), "xml_document")
  # the halo adds offset copies of every glyph, so there are strictly more
  # <text> elements than without it, and the real labels are still present.
  n_plain <- length(gregexpr("<text", plain, fixed = TRUE)[[1]])
  n_halo <- length(gregexpr("<text", haloed, fixed = TRUE)[[1]])
  expect_gt(n_halo, n_plain)
  expect_match(haloed, ">aa<", fixed = TRUE)
})
