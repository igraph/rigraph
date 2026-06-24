# Unit tests for the (non-exported) plotting parameter-resolution machinery and
# getter helpers in R/plot.common.R. These are fast, mostly device-free tests
# that pin down behavior before the planned plotting refactor.

# ---------------------------------------------------------------------------
# i.parse.plot.params(): precedence, routing, recycling, NA handling
# ---------------------------------------------------------------------------

test_that("i.parse.plot.params() resolves arg > attr > option > default", {
  g <- make_ring(3)

  # default: nothing set anywhere -> hard-coded default (vertex color = 1)
  p_default <- i.parse.plot.params(g, list())
  expect_equal(p_default("vertex", "color"), 1)

  # option beats default
  withr::local_options(igraph_verbose = FALSE)
  local_igraph_options(vertex.color = "green")
  p_opt <- i.parse.plot.params(g, list())
  expect_equal(p_opt("vertex", "color"), "green")

  # graph attribute beats option
  ga <- set_vertex_attr(g, "color", value = rep("red", 3))
  p_attr <- i.parse.plot.params(ga, list())
  expect_equal(p_attr("vertex", "color"), rep("red", 3))

  # explicit argument beats everything
  p_arg <- i.parse.plot.params(ga, list(vertex.color = "blue"))
  expect_equal(p_arg("vertex", "color"), "blue")
})

test_that("i.parse.plot.params() routes vertex./edge./plain prefixes", {
  g <- make_ring(3)
  p <- i.parse.plot.params(
    g,
    list(vertex.size = 99, edge.width = 7, margin = 0.5)
  )
  expect_equal(p("vertex", "size"), 99)
  expect_equal(p("edge", "width"), 7)
  expect_equal(p("plot", "margin"), 0.5)
})

test_that("i.parse.plot.params() calls function-valued defaults with the graph", {
  g <- make_ring(3)
  g <- set_vertex_attr(g, "name", value = c("a", "b", "c"))
  p <- i.parse.plot.params(g, list())

  # vertex label default is i.get.labels(), which returns the name attribute
  expect_equal(p("vertex", "label"), c("a", "b", "c"))

  # dontcall = TRUE returns the function itself rather than calling it
  expect_true(is.function(p("vertex", "label", dontcall = TRUE)))
})

test_that("i.parse.plot.params() selects a single recycled element via range", {
  g <- make_ring(3)

  # scalar value: returned as-is for a scalar range
  p_scalar <- i.parse.plot.params(g, list(vertex.size = 5))
  expect_equal(p_scalar("vertex", "size", range = 2), 5)

  # vector value: 0-based index into rep(v, length.out = range + 1)
  p_vec <- i.parse.plot.params(g, list(vertex.size = c(10, 20)))
  expect_equal(p_vec("vertex", "size", range = 0), 10)
  expect_equal(p_vec("vertex", "size", range = 1), 20)
  expect_equal(p_vec("vertex", "size", range = 2), 10) # recycles
})

test_that("i.parse.plot.params() warns and replaces NA in non-label attributes", {
  g <- make_ring(3)
  g <- set_vertex_attr(g, "color", value = c("red", NA, "blue"))
  p <- i.parse.plot.params(g, list())

  expect_warning(res <- p("vertex", "color"), "contains NAs")
  # NA replaced with the default vertex color (1), coerced into the vector
  expect_false(anyNA(res))
  expect_equal(res[c(1, 3)], c("red", "blue"))
})

test_that("i.parse.plot.params() silently replaces NA labels with empty string", {
  g <- make_ring(3)
  g <- set_vertex_attr(g, "label", value = c("a", NA, "c"))
  p <- i.parse.plot.params(g, list())

  expect_no_warning(res <- p("vertex", "label"))
  expect_equal(res, c("a", "", "c"))
})

# ---------------------------------------------------------------------------
# Stage 1 aesthetic tables (i.aes_table / i.edge_aes_table)
# ---------------------------------------------------------------------------

test_that("i.aes_table recycles columns to n rows", {
  tbl <- i.aes_table(list(a = 1, b = c("x", "y")), n = 4)
  expect_s3_class(tbl, "data.frame")
  expect_equal(nrow(tbl), 4)
  expect_equal(tbl$a, rep(1, 4))
  expect_equal(tbl$b, c("x", "y", "x", "y"))
})

test_that("i.edge_aes_table expands scalars and is sliceable by edge index", {
  tbl <- i.edge_aes_table(
    color = "red",
    width = c(1, 2, 3),
    lty = 1,
    arrow.mode = 2,
    arrow.size = 1,
    arrow.width = 1,
    curved = 0,
    label.color = "blue",
    label.family = "serif",
    label.font = 1,
    label.cex = 1,
    label.halo = NA,
    label.halo.width = 0.15,
    style = "auto",
    alpha = 1,
    gradient = FALSE,
    n = 3
  )
  expect_equal(nrow(tbl), 3)
  expect_equal(tbl$color, rep("red", 3)) # scalar expanded
  expect_equal(tbl$width, c(1, 2, 3)) # vector preserved
  expect_equal(tbl$style, rep("auto", 3))
  expect_equal(tbl$alpha, rep(1, 3))
  expect_equal(tbl$gradient, rep(FALSE, 3))

  sliced <- vctrs::vec_slice(tbl, c(1, 3))
  expect_equal(nrow(sliced), 2)
  expect_equal(sliced$width, c(1, 3))
})

# ---------------------------------------------------------------------------
# i.check_aes_lengths() — strict recycling (igraph 3.0.0)
# ---------------------------------------------------------------------------

test_that("i.check_aes_lengths accepts length 1 and length n", {
  expect_silent(
    i.check_aes_lengths(
      vertex = list(color = "red", size = c(1, 2, 3)),
      edge = list(width = 1),
      vc = 3,
      ec = 2
    )
  )
})

test_that("i.check_aes_lengths rejects mismatched vertex lengths", {
  expect_snapshot_igraph_error(
    i.check_aes_lengths(
      vertex = list(color = c("red", "green")),
      edge = list(),
      vc = 5,
      ec = 4
    )
  )
})

test_that("i.check_aes_lengths rejects mismatched edge lengths", {
  expect_snapshot_igraph_error(
    i.check_aes_lengths(
      vertex = list(),
      edge = list(width = c(1, 2, 3)),
      vc = 5,
      ec = 5
    )
  )
})

test_that("plot() errors on a wrong-length vertex aesthetic (strict recycling)", {
  g <- make_ring(5)
  grDevices::pdf(NULL)
  withr::defer(grDevices::dev.off())
  # 3 colors for 5 vertices: previously silently recycled, now an error
  expect_error(plot(g, vertex.color = c("red", "green", "blue")), "length 3")
})

test_that("plot() still accepts length-1 and length-n aesthetics", {
  g <- make_ring(5)
  grDevices::pdf(NULL)
  withr::defer(grDevices::dev.off())
  expect_no_error(plot(g, vertex.color = "red"))
  expect_no_error(plot(g, vertex.color = rep("red", 5)))
})

# ---------------------------------------------------------------------------
# i.get.arrow.mode()
# ---------------------------------------------------------------------------

test_that("i.get.arrow.mode() maps character arrow specs to numeric codes", {
  g <- make_ring(3, directed = TRUE)
  expect_equal(
    i.get.arrow.mode(g, c("<", "<-", ">", "->", "<>", "<->", "x")),
    c(1, 1, 2, 2, 3, 3, 0)
  )
})

test_that("i.get.arrow.mode() reads a vertex attribute via the 'a:' prefix", {
  g <- make_ring(2, directed = TRUE)
  g <- set_vertex_attr(g, "am", value = c("->", "<-"))
  expect_equal(i.get.arrow.mode(g, "a:am"), c(2, 1))
})

test_that("i.get.arrow.mode() defaults by graph directedness when NULL", {
  expect_equal(i.get.arrow.mode(make_ring(3, directed = TRUE), NULL), 2)
  expect_equal(i.get.arrow.mode(make_ring(3, directed = FALSE), NULL), 0)
})

# ---------------------------------------------------------------------------
# label getters
# ---------------------------------------------------------------------------

test_that("i.get.labels() uses the name attribute, else vertex indices", {
  g_named <- set_vertex_attr(make_ring(3), "name", value = c("x", "y", "z"))
  expect_equal(i.get.labels(g_named), c("x", "y", "z"))

  expect_equal(i.get.labels(make_ring(3)), 1:3)
})

test_that("i.get.edge.labels() defaults to an NA vector of edge length", {
  g <- make_ring(4)
  res <- i.get.edge.labels(g)
  expect_length(res, ecount(g))
  expect_true(all(is.na(res)))
})

# ---------------------------------------------------------------------------
# i.get.main() / i.get.xlab() and annotate.plot
# ---------------------------------------------------------------------------

test_that("i.get.main()/i.get.xlab() respect the annotate.plot option", {
  g <- make_ring(3)
  g$name <- "my graph"

  # default: no annotation
  expect_identical(i.get.main(g), "")
  expect_identical(i.get.xlab(g), "")

  # with annotate.plot = TRUE, return graph metadata
  local_igraph_options(annotate.plot = TRUE)
  expect_identical(i.get.main(g), "my graph")
  expect_match(i.get.xlab(g), "3 vertices")
  expect_match(i.get.xlab(g), "3 edges")
})

# ---------------------------------------------------------------------------
# igraph.check.shapes()
# ---------------------------------------------------------------------------

test_that("igraph.check.shapes() passes valid shapes through", {
  expect_equal(
    igraph.check.shapes(c("circle", "square")),
    c("circle", "square")
  )
})

test_that("igraph.check.shapes() aborts on unknown shapes", {
  expect_snapshot_igraph_error({
    igraph.check.shapes(c("circle", "not_a_shape"))
  })
})

# ---------------------------------------------------------------------------
# curve_multiple()
# ---------------------------------------------------------------------------

test_that("curve_multiple() returns zero curvature for a simple graph", {
  g <- make_ring(4)
  expect_equal(curve_multiple(g), rep(0, ecount(g)))
})

test_that("curve_multiple() spreads symmetric curvature across multi-edges", {
  # two parallel edges in the same direction share an edgelist key
  g <- make_graph(c(1, 2, 1, 2), directed = TRUE)
  expect_equal(curve_multiple(g), c(-0.5, 0.5))

  # reciprocal edges (1->2, 2->1) are distinct keys, so each stays 0
  g2 <- make_graph(c(1, 2, 2, 1), directed = TRUE)
  expect_equal(curve_multiple(g2), c(0, 0))
})

# ---------------------------------------------------------------------------
# i.rescale.vertex() -- needs an open device for par("usr")
# ---------------------------------------------------------------------------

test_that("i.rescale.vertex() clamps sizes to the relative-size range", {
  grDevices::pdf(NULL)
  withr::defer(grDevices::dev.off())
  plot(0, 0, type = "n", xlim = c(-1, 1), ylim = c(-1, 1))

  minmax <- c(0.01, 0.025)
  res <- i.rescale.vertex(c(10, 20, 30), minmax.relative.size = minmax)

  usr <- par("usr")[1:2]
  scal <- (usr[2] - usr[1]) * minmax

  expect_length(res, 3)
  # smallest input maps to the lower bound, largest to the upper bound
  expect_equal(res[1], scal[1])
  expect_equal(res[3], scal[2])
  # monotonic increasing in between
  expect_true(all(diff(res) > 0))
})
