test_that("basic plot test, layout 1", {
  skip_if_not_installed("vdiffr")

  g <- make_graph(c(1, 2, 1, 1, 2, 3), directed = F)
  g$layout <- structure(
    c(
      1.3334764568601,
      0.25005693449542,
      -0.832839300886122,
      -1.08278419159866,
      -0.70646229874506,
      -0.33032215991384
    ),
    dim = 3:2
  )

  vdiffr::expect_doppelganger(
    "Basic graph, layout 1",
    function() {
      cols <- c("red", "green", "blue")
      plot(g, edge.color = cols)
    }
  )
})

test_that("basic plot test, layout 2", {
  skip_if_not_installed("vdiffr")

  g <- make_graph(c(1, 2, 1, 1, 2, 3), directed = F)
  g$layout <- structure(
    c(
      1.17106961533433,
      1.63885278868168,
      2.10732892696401,
      3.91718168529106,
      2.87660789399794,
      1.83449260993935
    ),
    dim = 3:2
  )

  vdiffr::expect_doppelganger(
    "Basic graph, layout 2",
    function() {
      cols <- c("red", "green", "blue")
      plot(g, edge.color = cols)
    }
  )
})

test_that("basic plot test, spheres", {
  skip_if_not_installed("vdiffr")

  g <- make_graph(c(1, 2, 1, 1, 2, 3), directed = F)
  g$layout <- structure(
    c(
      1.17106961533433,
      1.63885278868168,
      2.10732892696401,
      3.91718168529106,
      2.87660789399794,
      1.83449260993935
    ),
    dim = 3:2
  )

  vdiffr::expect_doppelganger(
    "Basic graph, spheres",
    function() {
      plot(g, vertex.shape = "sphere", vertex.size = 40)
    }
  )
})

test_that("rglplot() works", {
  skip_if_not_installed("rgl", "1.3.14")

  # https://stackoverflow.com/a/46320771/5489251
  withr::local_envvar(RGL_USE_NULL = TRUE)
  withr::local_seed(42)

  el <- cbind(sample(1:5), sample(1:5))
  g <- graph_from_edgelist(el)

  expect_silent(rglplot(g))
  expect_silent(rglplot(g, edge.label = letters[1:ecount(g)]))
})

test_that("label colors are correct when loops are present", {
  # check that Bug 157 is fixed
  skip_if_not_installed("vdiffr")
  g <- make_graph(c(1, 2, 1, 1, 2, 3), directed = FALSE)
  g$layout <- structure(
    c(
      1.17106961533433,
      1.63885278868168,
      2.10732892696401,
      3.91718168529106,
      2.87660789399794,
      1.83449260993935
    ),
    dim = 3:2
  )
  cols <- c("red", "green", "blue")
  vdiffr::expect_doppelganger(
    "loop graph",
    function() {
      plot(
        g,
        edge.color = cols,
        edge.label.color = cols,
        edge.label = cols,
        margin = 0.5
      )
    }
  )
})

test_that("Edges stop at outside of rectangle node", {
  skip_if_not_installed("vdiffr")

  rectangle_edges <- function() {
    g <- make_graph(c(1, 2, 1, 4, 2, 1, 2, 5, 2, 3, 4, 1, 5, 2, 3, 2))
    layout <- cbind(
      c(-2.01, -1.16, -1.24, -2.74, -0.13),
      c(1.27, 2.1, 3.14, 0.56, 2.01)
    )
    plot(
      g,
      vertex.size = 30,
      vertex.size2 = 30,
      vertex.color = rgb(0.1, 0.7, 0.8, 0.1),
      vertex.shape = "rectangle",
      layout = layout
    )
  }

  vdiffr::expect_doppelganger("rectangle-edges", rectangle_edges)
})


test_that("layout as graph attribute error works", {
  g <- make_full_graph(10)
  g$layout <- layout_in_circle(g)[1:5, ]
  expect_snapshot_igraph_error({
    plot(g)
  })
})

test_that("Multi loops are arranged correctly", {
  skip_if_not_installed("vdiffr")

  multi_loops_triangle <- function() {
    g <- make_graph(c(1,2,2,3,3,1,1,1,1,1,1,1,1,1),directed = FALSE)
    V(g)$x <- c(1,1.5,2)
    V(g)$y <- c(0,1,0)
    plot(g, margin = 0.2, loop.size = 2)
  }

  vdiffr::expect_doppelganger("multi-loops-triangle", multi_loops_triangle)

  multi_loops_many <- function() {
    g2 <- make_graph(c(1,2, 2,3, 3,1, 1,4, 4,5, 5,1, 3,4, 5,2, 1,1, 1,1, 1,1, 1,1, 1,1, 1,1, 1,1),directed = FALSE)
    V(g2)$x <- c(1,2,2,0,0)
    V(g2)$y <- c(1,0,2,2,0)
    plot(g2, loop.size = 2)
  }

  vdiffr::expect_doppelganger("multi-loops-many", multi_loops_many)
})

test_that("Vertex label rotation works", {
  skip_if_not_installed("vdiffr")

  label_rotate <- function() {
    g <- make_ring(5, directed = FALSE, circular = FALSE)
    V(g)$label <- c("AAAAA", "BBBBB", "CCCCC","DDDDD", "EEEEE")
    g$layout <- cbind(1:5, rep(1, 5))
    plot(
      g,
      vertex.label.angle = c(90, 90, 270, 270, 90),
      vertex.label.adj = c(1.1,0.5)
    )
  }

  vdiffr::expect_doppelganger("label-rotate", label_rotate)
})

test_that("Arrow drawing works correctly", {
  skip_if_not_installed("vdiffr")

  standard_arrow <- function() {
    g <- make_graph(c(1, 2, 1, 3, 2, 4), directed = TRUE)
    g$layout <- cbind(1:4, rep(0, 4))
    plot(g)
  }
  vdiffr::expect_doppelganger("standard-arrow", standard_arrow)

  standard_arrow_modes <- function() {
    g <- make_graph(c(1, 2, 2, 3, 3, 4), directed = TRUE)
    g$layout <- cbind(1:4, rep(0, 4))
    plot(g, edge.arrow.mode = c(1,2,3))
  }
  vdiffr::expect_doppelganger("standard-arrow-modes", standard_arrow_modes)

  standard_arrow_sizes <- function() {
    g <- make_graph(c(1, 2, 2, 3, 3, 4), directed = TRUE)
    g$layout <- cbind(1:4, rep(0, 4))
    plot(g, edge.arrow.size = c(1,2,3))
  }
  vdiffr::expect_doppelganger("standard-arrow-sizes", standard_arrow_sizes)
})

test_that("mark border linewidth", {
  skip_if_not_installed("vdiffr")
  mark_border_lwd <- function() {
    g <- make_full_graph(4, directed = FALSE)
    V(g)$x <- c(1, 2, 2, 1)
    V(g)$y <- c(1, 1, 2, 2)
    wc <- cluster_walktrap(g)
    plot(
      wc,
      g,
      vertex.label = NA,
      vertex.size = 20,
      mark.shape = 0,
      edge.width = 0.1,
      mark.expand = 40,
      mark.lwd = 5,
      margin = 1
    )
  }

  vdiffr::expect_doppelganger("mark-border-lwd", mark_border_lwd)
})

test_that("i.repel_labels separates overlapping labels and is deterministic", {
  # two boxes stacked at the same point should be pushed apart (here along y,
  # the smaller-overlap axis)
  r <- i.repel_labels(
    x = c(0, 0),
    y = c(0, 0),
    hw = c(0.2, 0.2),
    hh = c(0.1, 0.1)
  )
  sep <- max(abs(r$x[1] - r$x[2]), abs(r$y[1] - r$y[2]))
  expect_gt(sep, 0.15) # was 0; now nearly the box height sum (0.2)

  # deterministic
  r2 <- i.repel_labels(
    x = c(0, 0),
    y = c(0, 0),
    hw = c(0.2, 0.2),
    hh = c(0.1, 0.1)
  )
  expect_equal(r, r2)

  # a single label is returned unchanged
  expect_equal(i.repel_labels(5, 7, 1, 1), list(x = 5, y = 7))

  # non-overlapping labels are left where they are
  far <- i.repel_labels(c(0, 10), c(0, 0), c(0.2, 0.2), c(0.1, 0.1))
  expect_equal(far$x, c(0, 10))
  expect_equal(far$y, c(0, 0))
})

test_that("i.loop_angles distributes loops and returns aligned vectors", {
  # Two vertices, vertex 1 has 2 loops, plus a 1-2 edge.
  g <- make_graph(c(1, 2, 1, 1, 1, 1), directed = FALSE)
  layout <- cbind(c(0, 1), c(0, 0))
  loops.v <- c(1, 1) # the two loop edges are both at vertex 1

  res <- i.loop_angles(g, layout, loops.v)
  expect_named(res, c("angles", "narrowing"))
  expect_length(res$angles, 2)
  expect_length(res$narrowing, 2)
  # narrowing is bounded to [0.2, 1]
  expect_true(all(res$narrowing >= 0.2 & res$narrowing <= 1))
  # the two loops get distinct angles
  expect_false(res$angles[1] == res$angles[2])
})

test_that("i.apply_alpha multiplies alpha and is a no-op at 1", {
  # no-op: fully opaque returns the input unchanged (keeps snapshots stable)
  expect_identical(i.apply_alpha(c("red", "blue"), 1), c("red", "blue"))
  expect_identical(i.apply_alpha(c("red", "blue"), c(1, 1)), c("red", "blue"))

  # fractional alpha reduces the alpha channel
  a <- i.apply_alpha("red", 0.5)
  expect_equal(unname(grDevices::col2rgb(a, alpha = TRUE)["alpha", ]), 128)

  # vectorised over colour and alpha (recycled)
  v <- i.apply_alpha(c("red", "green", "blue"), c(0.5, 1, 0.25))
  av <- grDevices::col2rgb(v, alpha = TRUE)["alpha", ]
  expect_equal(unname(av), c(128, 255, 64))

  # already-translucent input is further reduced (multiplicative)
  half <- i.apply_alpha(grDevices::rgb(1, 0, 0, 0.5), 0.5)
  expect_equal(unname(grDevices::col2rgb(half, alpha = TRUE)["alpha", ]), 64)

  expect_identical(i.apply_alpha(character(0), 0.5), character(0))
})

test_that("i.elbow_path is a two-corner route along the dominant axis", {
  # horizontal dominant: leave horizontally, turn at mid-x
  e <- i.elbow_path(0, 0, 10, 4)
  expect_equal(e$x, c(0, 5, 5, 10))
  expect_equal(e$y, c(0, 0, 4, 4))
  # vertical dominant: leave vertically, turn at mid-y
  v <- i.elbow_path(0, 0, 4, 10)
  expect_equal(v$x, c(0, 0, 4, 4))
  expect_equal(v$y, c(0, 5, 5, 10))
  # endpoints preserved
  expect_equal(c(e$x[1], e$y[1]), c(0, 0))
  expect_equal(c(e$x[4], e$y[4]), c(10, 4))
})

test_that("i.diagonal_path is a smooth path between the endpoints", {
  d <- i.diagonal_path(0, 0, 10, 4, n = 30)
  expect_length(d$x, 30)
  expect_equal(c(d$x[1], d$y[1]), c(0, 0))
  expect_equal(c(d$x[30], d$y[30]), c(10, 4))
  expect_true(all(is.finite(d$x)) && all(is.finite(d$y)))
  # deterministic
  expect_equal(d, i.diagonal_path(0, 0, 10, 4, n = 30))
})

test_that("i.arrowhead_shape returns matched polar arrays ending in NA", {
  # Pure geometry helper extracted from igraph.Arrows; device-free.
  head <- i.arrowhead_shape(cin = 0.2, w = 1.5, delta = 0.01)
  expect_named(head, c("deg.arr", "r.arr"))
  expect_equal(length(head$deg.arr), length(head$r.arr))
  # both arrays terminate in NA (the pen-up marker for the outline)
  expect_true(is.na(tail(head$deg.arr, 1)))
  expect_true(is.na(tail(head$r.arr, 1)))
  # radii are non-negative where defined
  expect_true(all(head$r.arr >= 0, na.rm = TRUE))
  # larger arrows (bigger cin) produce more outline points
  bigger <- i.arrowhead_shape(cin = 0.4, w = 1.5, delta = 0.01)
  expect_gt(length(bigger$r.arr), length(head$r.arr))
})

test_that("i.arrow_shaft_endpoints adjusts only the arrowed end", {
  uin <- c(1, 1) # square device units for a clean check
  # horizontal edge (0,0) -> (10,0). code 2 adjusts the from-end (x1d), leaving
  # the to-end at 10; the shift is r.seg along theta1 (= -1 here).
  s2 <- i.arrow_shaft_endpoints(0, 0, 10, 0, code = 2, r.seg = 1, uin = uin)
  expect_equal(s2$sx2, 10) # to-end unchanged for code 2
  expect_equal(s2$sx1, -1) # from-end shifted by r.seg
  # code 0 (no arrows): both ends unchanged
  s0 <- i.arrow_shaft_endpoints(0, 0, 10, 0, code = 0, r.seg = 1, uin = uin)
  expect_equal(c(s0$sx1, s0$sx2), c(0, 10))
})

test_that("i.edge_label_pos is two thirds from the target toward the source", {
  pos <- i.edge_label_pos(0, 0, 9, 0)
  expect_equal(unname(pos["x"]), 3) # 9 - 2/3*9, i.e. 2/3 from (9,0) toward (0,0)
  expect_equal(unname(pos["y"]), 0)
})

test_that("scales draw matching legends and colorbars", {
  skip_if_not_installed("vdiffr")

  ring10 <- function() {
    g <- make_ring(10)
    g$layout <- layout_in_circle(g)
    g
  }

  vdiffr::expect_doppelganger("scale-discrete-color", function() {
    g <- ring10()
    V(g)$grp <- rep(c("alpha", "beta"), 5)
    plot(g, vertex.color = scale_color(V(g)$grp), vertex.size = 20)
  })

  vdiffr::expect_doppelganger("scale-continuous-colorbar", function() {
    g <- ring10()
    plot(g, vertex.color = scale_color(1:10), vertex.size = 20)
  })

  vdiffr::expect_doppelganger("scale-size-legend", function() {
    g <- ring10()
    plot(g, vertex.size = scale_size(1:10, range = c(5, 25)))
  })

  vdiffr::expect_doppelganger("scale-color-and-size", function() {
    g <- ring10()
    V(g)$grp <- rep(c("alpha", "beta"), 5)
    plot(
      g,
      vertex.color = scale_color(V(g)$grp),
      vertex.size = scale_size(1:10, range = c(5, 25))
    )
  })

  vdiffr::expect_doppelganger("scale-legend-bottom-horizontal", function() {
    g <- ring10()
    V(g)$grp <- rep(c("alpha", "beta"), 5)
    plot(
      g,
      vertex.color = scale_color(V(g)$grp),
      vertex.size = 20,
      legend = "bottom"
    )
  })

  vdiffr::expect_doppelganger("scale-continuous-colorbar-top", function() {
    g <- ring10()
    plot(g, vertex.color = scale_color(1:10), vertex.size = 20, legend = "top")
  })

  vdiffr::expect_doppelganger("scale-edge-color", function() {
    g <- ring10()
    E(g)$type <- rep(c("x", "y"), length.out = ecount(g))
    plot(
      g,
      edge.color = scale_color(E(g)$type),
      edge.width = 2,
      vertex.size = 15
    )
  })
})

test_that("vertex.label.repel separates clustered labels", {
  skip_if_not_installed("vdiffr")

  vdiffr::expect_doppelganger("label-repel", function() {
    g <- make_empty_graph(8)
    layout <- cbind(
      c(0, 0.05, 0.1, -0.05, 1, 1.05, 0.95, 1.1),
      c(0, 0.05, -0.05, 0.02, 1, 0.95, 1.05, 1.02)
    )
    V(g)$label <- c(
      "Alice", "Bob", "Carol", "Dave", "Eve", "Frank", "Grace", "Heidi"
    )
    plot(g, layout = layout, vertex.size = 12, vertex.label.repel = TRUE)
  })
})

test_that("legend = FALSE suppresses the guide", {
  skip_if_not_installed("vdiffr")
  # Same graph as scale-discrete-color but with the legend turned off; should
  # render identically to a plain coloured plot (no guide box).
  vdiffr::expect_doppelganger("scale-legend-false", function() {
    g <- make_ring(10)
    g$layout <- layout_in_circle(g)
    V(g)$grp <- rep(c("alpha", "beta"), 5)
    plot(
      g,
      vertex.color = scale_color(V(g)$grp),
      vertex.size = 20,
      legend = FALSE
    )
  })
})

test_that("vector edge params are subset correctly across loops and non-loops", {
  # Guards the per-edge subsetting of loop vs non-loop edges in plot.igraph().
  skip_if_not_installed("vdiffr")

  vector_edge_params <- function() {
    # edges: 1->2, 2->3, 1->1 (loop), 3->3 (loop), 2->1
    g <- make_graph(c(1, 2, 2, 3, 1, 1, 3, 3, 2, 1), directed = TRUE)
    V(g)$x <- c(0, 1, 2)
    V(g)$y <- c(0, 1, 0)
    ne <- ecount(g)
    plot(
      g,
      edge.color = c("red", "green", "blue", "orange", "purple"),
      edge.width = c(1, 2, 3, 4, 5),
      edge.lty = c(1, 2, 1, 2, 1),
      edge.arrow.mode = c(1, 2, 3, 2, 1),
      edge.arrow.size = c(1, 1.5, 2, 1.5, 1),
      edge.label = letters[seq_len(ne)],
      edge.label.color = c("red", "green", "blue", "orange", "purple"),
      margin = 0.3
    )
  }
  vdiffr::expect_doppelganger("vector-edge-params-loops", vector_edge_params)
})

test_that("edge.gradient blends source to target vertex colours", {
  skip_if_not_installed("vdiffr")

  vdiffr::expect_doppelganger("edge-gradient", function() {
    g <- make_graph(c(1, 2, 2, 3, 3, 1, 1, 4), directed = TRUE)
    g$layout <- layout_in_circle(g)
    V(g)$color <- c("red", "green", "blue", "orange")
    plot(
      g,
      edge.gradient = TRUE,
      vertex.size = 24,
      edge.width = 3,
      edge.arrow.size = 0.6
    )
  })

  vdiffr::expect_doppelganger("edge-gradient-arc", function() {
    g <- make_graph(c(1, 2, 2, 3, 3, 1), directed = TRUE)
    g$layout <- layout_in_circle(g)
    V(g)$color <- c("red", "green", "blue")
    plot(
      g,
      edge.gradient = TRUE,
      edge.style = "arc",
      vertex.size = 24,
      edge.width = 3
    )
  })
})

test_that("vertex.alpha and edge.alpha render translucently", {
  skip_if_not_installed("vdiffr")

  vdiffr::expect_doppelganger("vertex-edge-alpha", function() {
    g <- make_full_graph(6)
    g$layout <- layout_in_circle(g)
    plot(
      g,
      vertex.alpha = 0.4,
      edge.alpha = 0.4,
      vertex.size = 30,
      vertex.color = "steelblue",
      edge.width = 3,
      edge.color = "firebrick"
    )
  })
})

test_that("edge.style routes edges (elbow / diagonal / mixed / arc)", {
  skip_if_not_installed("vdiffr")

  tree <- function() {
    g <- make_tree(15, children = 2)
    g$layout <- layout_as_tree(g)
    g
  }

  vdiffr::expect_doppelganger("edge-style-elbow", function() {
    plot(tree(), edge.style = "elbow", vertex.size = 12, edge.arrow.size = 0.4)
  })

  vdiffr::expect_doppelganger("edge-style-diagonal", function() {
    plot(
      tree(),
      edge.style = "diagonal",
      vertex.size = 12,
      edge.arrow.size = 0.4
    )
  })

  vdiffr::expect_doppelganger("edge-style-mixed", function() {
    g <- make_graph(c(1, 2, 2, 3, 3, 4, 4, 1), directed = TRUE)
    # deliberately non-axis-aligned so elbow/diagonal visibly bend
    g$layout <- cbind(c(0, 2, 1.6, 0.3), c(1, 1.4, 0, -0.2))
    plot(
      g,
      edge.style = c("straight", "arc", "elbow", "diagonal"),
      vertex.size = 20,
      edge.arrow.size = 0.5,
      margin = 0.2
    )
  })

  vdiffr::expect_doppelganger("edge-style-arc-single", function() {
    # "arc" forces a curve on single (otherwise straight) edges
    g <- make_ring(5, directed = TRUE)
    g$layout <- layout_in_circle(g)
    plot(g, edge.style = "arc", vertex.size = 20, edge.arrow.size = 0.5)
  })
})

test_that("mixed arrow modes with per-edge curved/size and loops render correctly", {
  # Regression guard: the per-arrow-code branch used to double-slice
  # `curved` and ignored per-edge arrow.size/width. Exercise that path with a
  # graph that has loops, non-loop edges, mixed arrow modes, and per-edge
  # curved + arrow.size vectors.
  skip_if_not_installed("vdiffr")

  mixed_modes_curved <- function() {
    # edges: 1->2, 2->3, 3->1, 1->1 (loop), 2->2 (loop)
    g <- make_graph(c(1, 2, 2, 3, 3, 1, 1, 1, 2, 2), directed = TRUE)
    V(g)$x <- c(0, 2, 1)
    V(g)$y <- c(0, 0, 2)
    ne <- ecount(g)
    plot(
      g,
      edge.arrow.mode = c(0, 1, 2, 2, 3),
      edge.curved = c(0.3, -0.3, 0.5, 0, 0),
      edge.arrow.size = c(0.5, 1, 1.5, 1, 1),
      edge.width = c(1, 2, 3, 1, 2),
      margin = 0.3
    )
  }
  vdiffr::expect_doppelganger("mixed-modes-curved", mixed_modes_curved)
})

test_that("multi-edges are auto-curved", {
  skip_if_not_installed("vdiffr")

  multi_edge_curve <- function() {
    g <- make_graph(c(1, 2, 1, 2, 1, 2, 2, 3), directed = TRUE)
    V(g)$x <- c(0, 2, 4)
    V(g)$y <- c(0, 0, 0)
    plot(g, edge.curved = TRUE, margin = 0.3)
  }
  vdiffr::expect_doppelganger("multi-edge-curve", multi_edge_curve)
})

test_that("NA in a vertex attribute warns and still plots", {
  g <- make_ring(3)
  V(g)$color <- c("red", NA, "blue")
  g$layout <- cbind(1:3, rep(0, 3))

  grDevices::pdf(NULL)
  withr::defer(grDevices::dev.off())
  expect_warning(plot(g), "contains NAs")
})

test_that("mark.groups draws multiple overlapping groups", {
  skip_if_not_installed("vdiffr")

  mark_groups_multi <- function() {
    g <- make_full_graph(5)
    V(g)$x <- c(0, 1, 2, 1, 0)
    V(g)$y <- c(0, 0, 1, 2, 2)
    plot(
      g,
      mark.groups = list(c(1, 2, 3), c(3, 4, 5)),
      mark.col = c("#ffcccc", "#ccccff"),
      mark.border = c("red", "blue"),
      margin = 0.5
    )
  }
  vdiffr::expect_doppelganger("mark-groups-multi", mark_groups_multi)
})

test_that("label.dist and label.degree position labels", {
  skip_if_not_installed("vdiffr")

  label_dist_degree <- function() {
    g <- make_ring(4)
    g$layout <- layout_in_circle(g)
    plot(
      g,
      vertex.label = c("N", "E", "S", "W"),
      vertex.label.dist = 2,
      vertex.label.degree = c(pi / 2, 0, -pi / 2, pi),
      margin = 0.4
    )
  }
  vdiffr::expect_doppelganger("label-dist-degree", label_dist_degree)
})

test_that("add = TRUE overlays a second graph on the same device", {
  skip_if_not_installed("vdiffr")

  overlay <- function() {
    g1 <- make_ring(3)
    g1$layout <- cbind(c(0, 1, 2), c(0, 0, 0))
    g2 <- make_ring(3)
    g2$layout <- cbind(c(0, 1, 2), c(1, 1, 1))
    plot(
      g1,
      rescale = FALSE,
      xlim = c(-1, 3),
      ylim = c(-1, 2),
      vertex.color = "red"
    )
    plot(g2, rescale = FALSE, add = TRUE, vertex.color = "blue")
  }
  vdiffr::expect_doppelganger("add-overlay", overlay)
})

test_that("numeric vertex.color indexes into a custom palette", {
  skip_if_not_installed("vdiffr")

  palette_index <- function() {
    g <- make_ring(4)
    g$layout <- layout_in_circle(g)
    plot(
      g,
      vertex.color = c(1, 2, 3, 4),
      palette = categorical_pal(4),
      vertex.size = 30
    )
  }
  vdiffr::expect_doppelganger("palette-index", palette_index)
})

test_that("plot rescales correctly", {
  skip_if_not_installed("vdiffr")
  rescale_coords <- function() {
    n <- 11
    a <- seq(0, 2 * pi, length.out = n + 1)[-1]
    x <- 5 * cos(a)
    y <- 3 * sin(a)
    L <- matrix(c(x, y), ncol = 2)

    G <- make_full_graph(n) |>
      set_vertex_attr("x", value = x) |>
      set_vertex_attr("y", value = y)

    withr::with_par(
      list(mfrow = c(1, 3)),
      code = {
        plot(G, layout = layout_nicely(G), axes = TRUE)
        plot(G, layout = L, rescale = FALSE, axes = TRUE)
        plot(
          G,
          xlim = range(V(G)$x),
          ylim = range(V(G)$y),
          rescale = FALSE,
          asp = 1,
          axes = TRUE
        )
      }
    )
  }
  vdiffr::expect_doppelganger("rescale-coords", rescale_coords)
})

test_that("vertex label halo draws an outline", {
  skip_if_not_installed("vdiffr")

  g <- make_ring(5)
  V(g)$name <- c("alpha", "beta", "gamma", "delta", "epsilon")
  g$layout <- layout_in_circle(g)

  vdiffr::expect_doppelganger(
    "vertex-label-halo",
    function() {
      plot(
        g,
        vertex.size = 30,
        vertex.label.color = "black",
        vertex.label.halo = "white",
        vertex.label.halo.width = 0.25
      )
    }
  )
})

test_that("edge label halo draws an outline", {
  skip_if_not_installed("vdiffr")

  g <- make_ring(4, directed = TRUE)
  E(g)$label <- c("e1", "e2", "e3", "e4")
  g$layout <- layout_in_circle(g)

  vdiffr::expect_doppelganger(
    "edge-label-halo",
    function() {
      plot(
        g,
        edge.label.color = "black",
        edge.label.halo = "yellow",
        edge.label.cex = 1.5
      )
    }
  )
})
