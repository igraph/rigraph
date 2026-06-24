#   IGraph R package
#   Copyright (C) 2003-2012  Gabor Csardi <csardi.gabor@gmail.com>
#   334 Harvard street, Cambridge, MA 02139 USA

#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
#   02110-1301 USA
#
###################################################################

# Vertex sizes and edge widths are specified on a 0-200 scale (a `vertex.size`
# of 15 is the default); this factor converts them to user coordinates, where
# the plotting region spans [-1, 1] after rescaling.
VERTEX_SIZE_SCALE <- 1 / 200

# Arrowhead width scaling factor used by igraph.Arrows(); combined with the
# character size from par("cin") to size arrowheads relative to the device.
ARROW_WIDTH_FACTOR <- 1.2 / 4

# --- Self-loop / Bézier drawing helpers --------------------------------------
# Hoisted out of plot.igraph()'s body (they capture no enclosing state). Named
# with an `i.` prefix; `i.plot.bezier` in particular must NOT be called
# `plot.bezier`, which R would treat as an S3 plot() method for class "bezier".

# A single point on a cubic Bézier curve defined by control points `cp` (a 4x2
# matrix) at parameter `t` in [0, 1].
i.point.on.cubic.bezier <- function(cp, t) {
  c <- 3 * (cp[2, ] - cp[1, ])
  b <- 3 * (cp[3, ] - cp[2, ]) - c
  a <- cp[4, ] - cp[1, ] - c - b

  t2 <- t * t
  t3 <- t * t * t

  a * t3 + b * t2 + c * t + cp[1, ]
}

# `points` evenly spaced points along the cubic Bézier curve `cp`.
i.compute.bezier <- function(cp, points) {
  dt <- seq(0, 1, by = 1 / (points - 1))
  sapply(dt, function(t) i.point.on.cubic.bezier(cp, t))
}

# Draw a Bézier curve with optional arrowheads at its ends.
i.plot.bezier <- function(
  cp,
  points,
  color,
  width,
  arr,
  lty,
  arrow.size,
  arr.w
) {
  p <- i.compute.bezier(cp, points)
  i.r_polygon(p[1, ], p[2, ], border = color, lwd = width, lty = lty)
  if (arr == 1 || arr == 3) {
    igraph.Arrows(
      p[1, ncol(p) - 1],
      p[2, ncol(p) - 1],
      p[1, ncol(p)],
      p[2, ncol(p)],
      sh.col = color,
      h.col = color,
      size = arrow.size,
      sh.lwd = width,
      h.lwd = width,
      open = FALSE,
      code = 2,
      width = arr.w
    )
  }
  if (arr == 2 || arr == 3) {
    igraph.Arrows(
      p[1, 2],
      p[2, 2],
      p[1, 1],
      p[2, 1],
      sh.col = color,
      h.col = color,
      size = arrow.size,
      sh.lwd = width,
      h.lwd = width,
      open = FALSE,
      code = 2,
      width = arr.w
    )
  }
}

# Draw one self-loop as a rotated Bézier curve, plus its optional label.
# arrow.size/arr.w/loopSize defaults are placeholders only: every call site
# (the mapply() in plot.igraph) supplies them explicitly.
i.draw.loop <- function(
  x0,
  y0,
  cx = x0,
  cy = y0,
  color,
  angle = 0,
  label = NA,
  label.color,
  label.font,
  label.family,
  label.cex,
  label.halo = NA,
  label.halo.width = 0.15,
  width = 1,
  arr = 2,
  lty = 1,
  arrow.size = 1,
  arr.w = 1,
  lab.x,
  lab.y,
  loopSize = 1,
  narrowing = 1
) {
  rad <- angle
  center <- c(cx, cy)
  cp <- matrix(
    c(
      x0,
      y0,
      x0 + 0.4 * loopSize,
      y0 + narrowing * 0.2 * loopSize,
      x0 + 0.4 * loopSize,
      y0 - narrowing * 0.2 * loopSize,
      x0,
      y0
    ),
    ncol = 2,
    byrow = TRUE
  )
  cp_centered <- cp -
    matrix(rep(center, each = nrow(cp)), ncol = 2, byrow = FALSE)

  rotation_matrix <- matrix(c(cos(rad), -sin(rad), sin(rad), cos(rad)), ncol = 2)
  cp_rotated <- t(rotation_matrix %*% t(cp_centered))

  cp <- cp_rotated +
    matrix(rep(center, each = nrow(cp_rotated)), ncol = 2, byrow = FALSE)

  if (is.na(width)) {
    width <- 1
  }

  i.plot.bezier(
    cp,
    50,
    color,
    width,
    arr = arr,
    lty = lty,
    arrow.size = arrow.size,
    arr.w = arr.w
  )

  if (is.language(label) || !is.na(label)) {
    # Get midpoint of the Bezier curve for label placement
    p <- i.compute.bezier(cp, 50)
    mid_index <- floor(ncol(p) / 2)
    lx <- p[1, mid_index]
    ly <- p[2, mid_index]

    # Override if label position explicitly given
    if (!is.na(lab.x)) {
      lx <- lab.x
    }
    if (!is.na(lab.y)) {
      ly <- lab.y
    }

    i.r_text_halo(
      lx,
      ly,
      label,
      col = label.color,
      font = label.font,
      family = label.family,
      cex = label.cex,
      halo = label.halo,
      halo.width = label.halo.width
    )
  }
}

# Initialize the plotting canvas: an empty plot region
# with the requested limits, axes, aspect ratio and titles. Isolated from the
# drawing orchestration in plot.igraph() so the latter reads as
# setup -> edges -> vertices -> labels.
i.init_plot_canvas <- function(
  xlim,
  ylim,
  xlab,
  ylab,
  axes,
  frame.plot,
  asp,
  main,
  sub
) {
  i.r_init_canvas(
    xlim = xlim,
    ylim = ylim,
    xlab = xlab,
    ylab = ylab,
    axes = axes,
    frame.plot = frame.plot,
    asp = asp,
    main = main,
    sub = sub
  )
}

# Distribute self-loops around each vertex. For a vertex with
# k loops, place them evenly inside the largest angular gap between its incident
# (non-loop) edges, and compute a narrowing factor that compresses the loops
# when that gap is tight. Returns per-loop `angles` and `narrowing` vectors
# aligned to `loops.v`.
i.loop_angles <- function(graph, layout, loops.v) {
  la_dyn <- numeric(length(loops.v))
  narrowing <- numeric(length(loops.v))

  for (v in unique(loops.v)) {
    idx <- which(loops.v == v)
    n_loops <- length(idx)

    incident_edges <- incident(graph, v, mode = "all")
    incident_edges <- incident_edges[!which_loop(graph)[incident_edges]]

    if (length(incident_edges) == 0) {
      # Full circle available if no edges
      loop_angles <- seq(0, 2 * pi, length.out = n_loops + 1)[-1]
      gap_span <- 2 * pi
    } else {
      angles <- sapply(incident_edges, function(e) {
        ends_e <- ends(graph, e, names = FALSE)
        other <- if (as.numeric(ends_e[1]) == v) {
          as.numeric(ends_e[2])
        } else {
          as.numeric(ends_e[1])
        }
        dx <- layout[other, 1] - layout[v, 1]
        dy <- layout[other, 2] - layout[v, 2]
        atan2(dy, dx)
      })

      angles <- (angles + 2 * pi) %% (2 * pi)
      angles <- sort(angles)
      gaps <- diff(c(angles, angles[1] + 2 * pi))
      max_gap_index <- which.max(gaps)

      gap_start <- angles[max_gap_index]
      gap_span <- gaps[max_gap_index]
      gap_end <- (gap_start + gap_span) %% (2 * pi)

      # Generate loop angles spaced inside the gap
      if (gap_end > gap_start) {
        loop_angles <- seq(gap_start, gap_end, length.out = n_loops + 2)[
          -c(1, n_loops + 2)
        ]
      } else {
        # wrap around
        gap_end <- gap_end + 2 * pi
        loop_angles <- seq(gap_start, gap_end, length.out = n_loops + 2)[
          -c(1, n_loops + 2)
        ] %%
          (2 * pi)
      }
    }

    la_dyn[idx] <- loop_angles

    # Compute narrowing factor based on angular space
    angle_per_loop <- gap_span / n_loops
    # Scale narrowing between 1 (wide) and ~0.2 (tight)
    narrowing_factor <- pmin(1, pmax(0.2, angle_per_loop / (pi / 4))) # full width if ≥45°, compress below
    narrowing[idx] <- narrowing_factor
  }

  list(angles = la_dyn, narrowing = narrowing)
}

# Iteratively nudge overlapping text labels apart (ggrepel / Gephi "label
# adjust" style). Each label is repelled by other labels whose boxes overlap and
# gently sprung back toward its original anchor. Pure geometry given the label
# box half-sizes; deterministic (no randomness), so snapshots are stable.
# `hw`/`hh` are per-label half-width/height in user coordinates.
i.repel_labels <- function(x, y, hw, hh, iter = 200, spring = 0.04) {
  n <- length(x)
  if (n < 2) {
    return(list(x = x, y = y))
  }
  px <- x
  py <- y
  for (it in seq_len(iter)) {
    fx <- numeric(n)
    fy <- numeric(n)
    for (i in seq_len(n - 1)) {
      for (j in (i + 1):n) {
        dx <- px[i] - px[j]
        dy <- py[i] - py[j]
        ox <- (hw[i] + hw[j]) - abs(dx) # overlap along x
        oy <- (hh[i] + hh[j]) - abs(dy) # overlap along y
        if (ox > 0 && oy > 0) {
          # separate along the axis of smaller overlap (cheaper move)
          if (ox <= oy) {
            s <- if (dx >= 0) 1 else -1
            fx[i] <- fx[i] + s * ox * 0.5
            fx[j] <- fx[j] - s * ox * 0.5
          } else {
            s <- if (dy >= 0) 1 else -1
            fy[i] <- fy[i] + s * oy * 0.5
            fy[j] <- fy[j] - s * oy * 0.5
          }
        }
      }
    }
    # spring back toward the original anchor
    fx <- fx + (x - px) * spring
    fy <- fy + (y - py) * spring
    if (max(abs(c(fx, fy))) < 1e-4) {
      break
    }
    px <- px + fx
    py <- py + fy
  }
  list(x = px, y = py)
}

# Draw vertex labels, offset from each vertex by label.dist along
# label.degree. xpd = TRUE is scoped to this call so labels may spill outside
# the plot region. With `repel = TRUE`, overlapping labels are nudged apart and
# a leader line connects each moved label to its anchor. No-op for an empty
# graph.
i.draw_vertex_labels <- function(
  layout,
  labels,
  vertex.size,
  label.dist,
  label.degree,
  label.color,
  label.family,
  label.font,
  label.cex,
  label.angle,
  label.adj,
  repel = FALSE,
  label.halo = NA,
  label.halo.width = 0.15
) {
  vc <- nrow(layout)
  if (vc == 0) {
    return(invisible(NULL))
  }

  old_xpd <- par(xpd = TRUE)
  on.exit(par(old_xpd), add = TRUE)

  x <- layout[, 1] +
    label.dist *
      cos(-label.degree) *
      (vertex.size + 6 * 8 * log10(2)) *
      VERTEX_SIZE_SCALE
  y <- layout[, 2] +
    label.dist *
      sin(-label.degree) *
      (vertex.size + 6 * 8 * log10(2)) *
      VERTEX_SIZE_SCALE

  label.col <- rep(label.color, length.out = vc)
  label.fam <- rep(label.family, length.out = vc)
  label.fnt <- rep(label.font, length.out = vc)
  label.cex <- rep(label.cex, length.out = vc)
  label.ang <- rep(label.angle, length.out = vc)
  label.adj <- rep(list(label.adj), length.out = vc)
  label.text <- rep(labels, length.out = vc)
  label.halo <- rep(label.halo, length.out = vc)
  label.halo.w <- rep(label.halo.width, length.out = vc)

  if (isTRUE(any(repel)) && vc > 1) {
    drawn <- !is.na(label.text) & nzchar(as.character(label.text))
    if (sum(drawn) > 1) {
      hw <- rep(0, vc)
      hh <- rep(0, vc)
      hw[drawn] <- strwidth(label.text[drawn], cex = label.cex[drawn]) / 2 * 1.15
      hh[drawn] <- strheight(label.text[drawn], cex = label.cex[drawn]) / 2 * 1.6
      moved <- i.repel_labels(x[drawn], y[drawn], hw[drawn], hh[drawn])
      nx <- x
      ny <- y
      nx[drawn] <- moved$x
      ny[drawn] <- moved$y
      # leader lines from the original anchor to labels that actually moved
      shift <- sqrt((nx - x)^2 + (ny - y)^2)
      lead <- drawn & shift > pmax(hh, 1e-6)
      if (any(lead)) {
        i.r_segments(x[lead], y[lead], nx[lead], ny[lead], col = "grey60", lwd = 0.5)
      }
      x <- nx
      y <- ny
    }
  }

  invisible(mapply(
    function(x0, y0, lbl, col, fam, fnt, cex, srt, adj, halo, halo.w) {
      i.r_text_halo(
        x0,
        y0,
        labels = lbl,
        col = col,
        family = fam,
        font = fnt,
        cex = cex,
        srt = srt,
        adj = adj,
        halo = halo,
        halo.width = halo.w
      )
    },
    x,
    y,
    label.text,
    label.col,
    label.fam,
    label.fnt,
    label.cex,
    label.ang,
    label.adj,
    label.halo,
    label.halo.w
  ))
}

# Draw one label with an optional shadowtext halo for legibility.
# `halo = NA` (the default) is exactly `i.r_text()` -> byte-identical to before.
# Otherwise the glyphs are drawn `halo.steps` times offset on a circle of radius
# (halo.width * strheight) in the `halo` colour, then the real text on top, which
# produces a tight outline that reads over edges. Operates on a single label.
i.r_text_halo <- function(
  x,
  y,
  labels,
  col,
  family = "",
  font = 1,
  cex = 1,
  srt = 0,
  adj = NULL,
  halo = NA,
  halo.width = 0.15,
  halo.steps = 16
) {
  if (
    !is.na(halo) &&
      !is.na(labels) &&
      nzchar(as.character(labels))
  ) {
    r <- halo.width * strheight(labels, cex = cex)
    th <- seq(0, 2 * pi, length.out = halo.steps + 1)[-1]
    for (a in th) {
      i.r_text(
        x + r * cos(a),
        y + r * sin(a),
        labels = labels,
        col = halo,
        family = family,
        font = font,
        cex = cex,
        srt = srt,
        adj = adj
      )
    }
  }
  i.r_text(
    x,
    y,
    labels = labels,
    col = col,
    family = family,
    font = font,
    cex = cex,
    srt = srt,
    adj = adj
  )
}

#' Plotting of graphs
#'
#' `plot.igraph()` is able to plot graphs to any R device. It is the
#' non-interactive companion of the `tkplot()` function.
#'
#' One convenient way to plot graphs is to plot with [tkplot()]
#' first, handtune the placement of the vertices, query the coordinates by the
#' [tk_coords()] function and use them with [plot()] to
#' plot the graph to any R device.
#'
#' @aliases plot.graph
#' @param x The graph to plot.
#' @param axes Logical, whether to plot axes, defaults to FALSE.
#' @param add Logical scalar, whether to add the plot to the current device, or
#'   delete the device's current contents first.
#' @param xlim The limits for the horizontal axis, it is unlikely that you want
#'   to modify this.
#' @param ylim The limits for the vertical axis, it is unlikely that you want
#'   to modify this.
#' @param mark.groups A list of vertex ID vectors. It is interpreted as a set
#'   of vertex groups. Each vertex group is highlighted, by plotting a colored
#'   smoothed polygon around and \dQuote{under} it. See the arguments below to
#'   control the look of the polygons.
#' @param mark.shape A numeric scalar or vector. Controls the smoothness of the
#'   vertex group marking polygons. This is basically the \sQuote{shape}
#'   parameter of the [graphics::xspline()] function, its possible
#'   values are between -1 and 1. If it is a vector, then a different value is
#'   used for the different vertex groups.
#' @param mark.col A scalar or vector giving the colors of marking the
#'   polygons, in any format accepted by [graphics::xspline()]; e.g.
#'   numeric color IDs, symbolic color names, or colors in RGB.
#' @param mark.border A scalar or vector giving the colors of the borders of
#'   the vertex group marking polygons. If it is `NA`, then no border is
#'   drawn.
#' @param mark.expand A numeric scalar or vector, the size of the border around
#'   the marked vertex groups. It is in the same units as the vertex sizes. If a
#'   vector is given, then different values are used for the different vertex
#'   groups.
#' @param mark.lwd A numeric scalar or vector, the linewidth of the border around
#'   the marked vertex groups.  If a
#'   vector is given, then different values are used for the different vertex
#'   groups.
#' @param loop.size A numeric scalar that allows the user to scale the loop edges
#'   of the network. The default loop size is 1. Larger values will produce larger
#'   loops.
#' @param legend Controls drawing of legends/colorbars for any aesthetics
#'   supplied via [scale_color()] / [scale_size()]. The guide is drawn in the
#'   reserved outer margin on one side of the plot: `TRUE` (default) or
#'   `"right"` places it to the right, `"left"`/`"top"`/`"bottom"` on the
#'   corresponding side (`"top"`/`"bottom"` arrange entries horizontally);
#'   `FALSE` suppresses it. Has no effect when no scale is used.
#' @param \dots Additional plotting parameters. See [igraph.plotting] for
#'   the complete list.
#' @return Returns `NULL`, invisibly.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [layout()] for different layouts,
#' [igraph.plotting] for the detailed description of the plotting
#' parameters and [tkplot()] and [rglplot()] for other
#' graph plotting functions.
#' @method plot igraph
#' @export
#' @rawNamespace export(plot.igraph)
#' @family plot
#' @importFrom grDevices rainbow
#' @importFrom graphics plot polygon text par
#' @keywords graphs
#' @examples
#'
#' g <- make_ring(10)
#' plot(g, layout = layout_with_kk, vertex.color = "green")
#'
plot.igraph <- function(
  x,
  # SPECIFIC: #####################################
  axes = FALSE,
  add = FALSE,
  xlim = NULL,
  ylim = NULL,
  mark.groups = list(),
  mark.shape = 1 / 2,
  mark.col = rainbow(length(mark.groups), alpha = 0.3),
  mark.border = rainbow(length(mark.groups), alpha = 1),
  mark.expand = 15,
  mark.lwd = 1,
  loop.size = 1,
  legend = TRUE,
  ...
) {
  graph <- x
  ensure_igraph(graph)

  vc <- vcount(graph)

  ################################################################
  ## Visual parameters
  # Resolve any scale_*() arguments to plain aesthetic vectors and collect their
  # guides (legends/colorbars) to draw at the end. Must happen before
  # i.parse.plot.params(), whose recycling strips the scale class.
  scaled <- i.apply_scales(list(...))
  guides <- scaled$guides
  legend_side <- i.legend_side(legend, guides)
  params <- i.parse.plot.params(graph, scaled$dots)

  vertex.size <- params("vertex", "size")
  vertex.size.scaling <- params("vertex", "size.scaling")
  vertex.alpha <- params("vertex", "alpha")
  label.family <- params("vertex", "label.family")
  label.font <- params("vertex", "label.font")
  label.cex <- params("vertex", "label.cex")
  label.degree <- params("vertex", "label.degree")
  label.color <- params("vertex", "label.color")
  label.dist <- params("vertex", "label.dist")
  label.angle <- params("vertex", "label.angle")
  label.adj <- params("vertex", "label.adj")
  label.repel <- params("vertex", "label.repel")
  label.halo <- params("vertex", "label.halo")
  label.halo.width <- params("vertex", "label.halo.width")
  labels <- params("vertex", "label")
  shape <- igraph.check.shapes(params("vertex", "shape"))

  edge.color <- params("edge", "color")
  edge.alpha <- params("edge", "alpha")
  edge.color <- i.apply_alpha(edge.color, edge.alpha)
  edge.gradient <- as.logical(params("edge", "gradient"))
  # Base per-vertex fill colour (before vertex.alpha), only needed for gradients.
  vcol_base <- if (any(edge.gradient)) {
    rep(params("vertex", "color"), length.out = vc)
  } else {
    NULL
  }
  edge.width <- params("edge", "width")
  edge.lty <- params("edge", "lty")
  arrow.mode <- params("edge", "arrow.mode")
  edge.labels <- params("edge", "label")
  loop.angle <- params("edge", "loop.angle")
  edge.label.font <- params("edge", "label.font")
  edge.label.family <- params("edge", "label.family")
  edge.label.cex <- params("edge", "label.cex")
  edge.label.color <- params("edge", "label.color")
  edge.label.halo <- params("edge", "label.halo")
  edge.label.halo.width <- params("edge", "label.halo.width")
  elab.x <- params("edge", "label.x")
  elab.y <- params("edge", "label.y")
  arrow.size <- params("edge", "arrow.size")
  arrow.width <- params("edge", "arrow.width")
  curved <- params("edge", "curved")
  if (is.function(curved)) {
    curved <- curved(graph)
  }
  edge.style <- as.character(params("edge", "style"))
  i.valid_edge_styles <- c("auto", "straight", "arc", "elbow", "diagonal")
  bad.style <- setdiff(unique(edge.style), i.valid_edge_styles)
  if (length(bad.style) > 0) {
    cli::cli_abort(c(
      "Invalid {.arg edge.style} value{?s}: {.val {bad.style}}.",
      "i" = "Valid styles are {.val {i.valid_edge_styles}}."
    ))
  }

  layout <- i.postprocess.layout(params("plot", "layout"))
  if (nrow(layout) != vc) {
    cli::cli_abort(c(
      "The layout has {nrow(layout)} rows, but the graph has {vc} vertices.",
    "i" = "It is recommended to store the layout as x and y vertex attributes and not as a matrix graph attribute."))
  }
  margin <- params("plot", "margin")
  margin <- rep(margin, length.out = 4)
  rescale <- params("plot", "rescale")
  asp <- params("plot", "asp")
  frame.plot <- params("plot", "frame.plot")
  main <- params("plot", "main")
  sub <- params("plot", "sub")
  xlab <- params("plot", "xlab")
  ylab <- params("plot", "ylab")

  palette <- params("plot", "palette")

  if (!is.null(palette)) {
    old_palette <- palette(palette)
    on.exit(palette(old_palette), add = TRUE)
  }

  # the new style parameters can't do this yet
  arrow.mode <- i.get.arrow.mode(graph, arrow.mode)

  # igraph 3.0.0: per-element aesthetics must be length 1 or vcount()/ecount().
  # arrow.mode is excluded (its "a:" form reads a vertex attribute, so it can be
  # vcount-long); label.adj / pie / raster have non-per-element length semantics.
  i.check_aes_lengths(
    vertex = list(
      size = vertex.size,
      color = params("vertex", "color"),
      frame.color = params("vertex", "frame.color"),
      frame.width = params("vertex", "frame.width"),
      shape = shape,
      label = labels,
      label.color = label.color,
      label.cex = label.cex,
      label.dist = label.dist,
      label.degree = label.degree,
      label.angle = label.angle,
      label.font = label.font,
      label.family = label.family,
      label.halo = label.halo,
      label.halo.width = label.halo.width
    ),
    edge = list(
      color = edge.color,
      width = edge.width,
      lty = edge.lty,
      arrow.size = arrow.size,
      arrow.width = arrow.width,
      label = edge.labels,
      label.color = edge.label.color,
      label.cex = edge.label.cex,
      label.font = edge.label.font,
      label.family = edge.label.family,
      label.halo = edge.label.halo,
      label.halo.width = edge.label.halo.width
    ),
    vc = vc,
    ec = ecount(graph)
  )

  ################################################################
  ## create the plot
  if (rescale) {
    if (is.null(xlim)) {
      xlim <- c(-1, 1)
    }
    if (is.null(ylim)) {
      ylim <- c(-1, 1)
    }
    layout <- norm_coords(layout, -1, 1, -1, 1)
    fact <- (1 - vertex.size.scaling)
    maxv <- VERTEX_SIZE_SCALE * max(vertex.size)

    xlim <- c(
      xlim[1] - margin[2] - fact * maxv,
      xlim[2] + margin[4] + fact * maxv
    )
    ylim <- c(
      ylim[1] - margin[1] - fact * maxv,
      ylim[2] + margin[3] + fact * maxv
    )
  } else {
    if (is.null(xlim)) {
      xlim <- range(layout[, 1]) + c(-margin[2], margin[4])
    }
    if (is.null(ylim)) {
      ylim <- range(layout[, 2]) + c(-margin[1], margin[3])
    }
  }
  # When a scale legend is drawn, split the device into a plot region and a
  # guide region (device-relative, so it survives resizing). The graph is drawn
  # in the plot region; the guides are drawn into the guide region at the end.
  legend_fig <- NULL
  if (!add && !is.null(legend_side)) {
    legend_fig <- i.legend_fig(legend_side)
    old_par <- graphics::par(no.readonly = TRUE)
    on.exit(graphics::par(old_par), add = TRUE)
    graphics::par(fig = legend_fig$plot)
  }
  if (!add) {
    i.init_plot_canvas(
      xlim,
      ylim,
      xlab,
      ylab,
      axes,
      frame.plot,
      asp,
      main,
      sub
    )
  }

  ################################################################
  ## Rescaling vertices and updating params
  # Fold vertex.alpha into the vertex fill colour so the shapes pick it up via
  # the rebuilt params below (no-op when fully opaque).
  if (!all(vertex.alpha == 1)) {
    scaled$dots$vertex.color <- i.apply_alpha(
      rep(params("vertex", "color"), length.out = vc),
      vertex.alpha
    )
  }
  if (vertex.size.scaling) {
    newdots <- scaled$dots

    # vertex.size
    vertex.size <- i.rescale.vertex(
      vertex.size,
      minmax.relative.size = params("vertex", "relative.size")
    )
    newdots$vertex.size <- vertex.size

    # vertex.size2: Notice that in this case we need to ajust the scale
    # in two ways: (1) On the relative size of the axes, and (2) on the
    # relative size of vertex.size/vertex.size2

    scalefactor <- parusr <- par("usr")
    scalefactor <- (parusr[2] - parusr[1]) / (parusr[4] - parusr[3])
    if ("vertex.size2" %in% names(newdots)) {
      # If the user provided -vertex.size2-

      scalefactor <- scalefactor *
        (max(params("vertex", "size2"), na.rm = TRUE) /
          max(params("vertex", "size"), na.rm = TRUE))

      newdots$vertex.size2 <- i.rescale.vertex(
        params("vertex", "size2"),
        parusr[3:4] * scalefactor,
        params("vertex", "relative.size")
      )
    } else {
      # Otherwise use -vertex.size-
      newdots$vertex.size2 <- i.rescale.vertex(
        params("vertex", "size"),
        parusr[3:4] * scalefactor,
        params("vertex", "relative.size")
      )
    }

    params <- i.parse.plot.params(graph, newdots)
  } else {
    newdots <- scaled$dots
    newdots$vertex.size <- VERTEX_SIZE_SCALE * vertex.size
    newdots$vertex.size2 <- VERTEX_SIZE_SCALE * params("vertex", "size2")
    params <- i.parse.plot.params(graph, newdots)
    vertex.size <- VERTEX_SIZE_SCALE * vertex.size
  }
  ################################################################
  ## Mark vertex groups
  if (!is.list(mark.groups) && is.numeric(mark.groups)) {
    mark.groups <- list(mark.groups)
  }
  if (inherits(mark.groups, "communities")) {
    mark.groups <- communities(mark.groups)
  }

  mark.shape <- rep(mark.shape, length.out = length(mark.groups))
  mark.border <- rep(mark.border, length.out = length(mark.groups))
  mark.col <- rep(mark.col, length.out = length(mark.groups))
  mark.expand <- rep(mark.expand, length.out = length(mark.groups))
  mark.lwd <- rep(mark.lwd, length.out = length(mark.groups))

  for (g in seq_along(mark.groups)) {
    .members <- mark.groups[[g]]
    v <- V(graph)[.members]
    if (length(vertex.size) == 1) {
      vs <- vertex.size
    } else {
      vs <- rep(vertex.size, length.out = vcount(graph))[v]
    }
    igraph.polygon(
      layout[v, , drop = FALSE],
      vertex.size = vs,
      expand.by = mark.expand[g] / 200,
      shape = mark.shape[g],
      col = mark.col[g],
      border = mark.border[g],
      border.lwd = mark.lwd[g]
    )
  }

  ################################################################
  ## calculate position of arrow-heads
  el <- as_edgelist(graph, names = FALSE)
  loops.e <- which(el[, 1] == el[, 2])
  nonloops.e <- which(el[, 1] != el[, 2])
  loops.v <- el[, 1][loops.e]
  loop.labels <- edge.labels[loops.e]
  loop.labx <- if (is.null(elab.x)) {
    rep(NA, length(loops.e))
  } else {
    elab.x[loops.e]
  }
  loop.laby <- if (is.null(elab.y)) {
    rep(NA, length(loops.e))
  } else {
    elab.y[loops.e]
  }
  edge.labels <- edge.labels[nonloops.e]
  elab.x <- if (is.null(elab.x)) NULL else elab.x[nonloops.e]
  elab.y <- if (is.null(elab.y)) NULL else elab.y[nonloops.e]
  el <- el[nonloops.e, , drop = FALSE]

  edge.coords <- matrix(0, nrow = nrow(el), ncol = 4)
  edge.coords[, 1] <- layout[, 1][el[, 1]]
  edge.coords[, 2] <- layout[, 2][el[, 1]]
  edge.coords[, 3] <- layout[, 1][el[, 2]]
  edge.coords[, 4] <- layout[, 2][el[, 2]]
  if (length(unique(shape)) == 1) {
    ## same vertex shape for all vertices
    ec <- .igraph.shapes[[shape[1]]]$clip(
      edge.coords,
      el,
      params = params,
      end = "both"
    )
  } else {
    ## different vertex shapes, do it by "endpoint"
    shape <- rep(shape, length.out = vcount(graph))
    ec <- edge.coords
    ec[, 1:2] <- t(sapply(seq(length.out = nrow(el)), function(x) {
      .igraph.shapes[[shape[el[x, 1]]]]$clip(
        edge.coords[x, , drop = FALSE],
        el[x, , drop = FALSE],
        params = params,
        end = "from"
      )
    }))
    ec[, 3:4] <- t(sapply(seq(length.out = nrow(el)), function(x) {
      .igraph.shapes[[shape[el[x, 2]]]]$clip(
        edge.coords[x, , drop = FALSE],
        el[x, , drop = FALSE],
        params = params,
        end = "to"
      )
    }))
  }

  x0 <- ec[, 1]
  y0 <- ec[, 2]
  x1 <- ec[, 3]
  y1 <- ec[, 4]

  # Resolve the per-edge aesthetics into one table (length ecount),
  # then slice it by loop-edge / non-loop-edge index instead of repeating the
  # `if (length(x) > 1) x[idx]` idiom for every parameter.
  edge_aes <- i.edge_aes_table(
    color = edge.color,
    width = edge.width,
    lty = edge.lty,
    arrow.mode = arrow.mode,
    arrow.size = arrow.size,
    arrow.width = arrow.width,
    curved = curved,
    label.color = edge.label.color,
    label.family = edge.label.family,
    label.font = edge.label.font,
    label.cex = edge.label.cex,
    label.halo = edge.label.halo,
    label.halo.width = edge.label.halo.width,
    style = edge.style,
    alpha = edge.alpha,
    gradient = edge.gradient,
    n = ecount(graph)
  )

  ################################################################
  ## add the loop edges
  if (length(loops.e) > 0) {
    # vertex.size is vertex-scoped (indexed by the loop's vertex) and loop.angle
    # is nullable, so both are handled outside the edge aesthetic table.
    vs <- vertex.size
    if (length(vertex.size) > 1) {
      vs <- vs[loops.v]
    }
    la <- loop.angle
    if (length(loop.angle) > 1) {
      la <- la[loops.e]
    }

    loop_aes <- vctrs::vec_slice(edge_aes, loops.e)
    ec <- loop_aes$color
    ew <- loop_aes$width
    lty <- loop_aes$lty
    arr <- loop_aes$arrow.mode
    asize <- loop_aes$arrow.size
    aw <- loop_aes$arrow.width
    lcol <- loop_aes$label.color
    lfam <- loop_aes$label.family
    lfon <- loop_aes$label.font
    lcex <- loop_aes$label.cex
    lhalo <- loop_aes$label.halo
    lhalo.w <- loop_aes$label.halo.width

    # Place loops in the largest angular gap at each vertex (flower-petal style).
    loop_geo <- i.loop_angles(graph, layout, loops.v)
    la_dyn <- loop_geo$angles
    narrowing <- loop_geo$narrowing
    if (is.null(la)) {
      la <- rep(NA, length(loops.v))
    }

    la[is.na(la)] <- la_dyn[is.na(la)]

    adjusted_loop_size <- rep(loop.size, length(loops.v))

    if (length(vertex.size) == 1) {
      r_offset <- rep(vertex.size, length(loops.v))
    } else {
      r_offset <- vertex.size[loops.v]
    }
    xx0 <- layout[loops.v, 1] + cos(la) * r_offset
    yy0 <- layout[loops.v, 2] + sin(la) * r_offset

    mapply(
      i.draw.loop,
      xx0,
      yy0,
      color = ec,
      angle = -la,
      label = loop.labels,
      label.color = lcol,
      label.family = lfam,
      label.font = lfon,
      label.cex = lcex,
      label.halo = lhalo,
      label.halo.width = lhalo.w,
      lty = lty,
      width = ew,
      arr = arr,
      arrow.size = asize,
      arr.w = aw,
      lab.x = loop.labx,
      lab.y = loop.laby,
      loopSize = adjusted_loop_size,
      narrowing = narrowing
    )
  }

  ################################################################
  ## non-loop edges
  if (length(x0) != 0) {
    # Slice the edge aesthetic table to the non-loop edges; every column is now
    # length(nonloops.e), so the per-arrow-code branch can index by `valid`
    # directly. (This also fixes a former double-slice of `curved`.)
    nl_aes <- vctrs::vec_slice(edge_aes, nonloops.e)
    edge.color <- nl_aes$color
    edge.width <- nl_aes$width
    edge.lty <- nl_aes$lty
    arrow.mode <- nl_aes$arrow.mode
    arrow.size <- nl_aes$arrow.size
    arrow.width <- nl_aes$arrow.width
    curved <- nl_aes$curved
    edge.style <- nl_aes$style
    edge.gradient <- as.logical(nl_aes$gradient)

    # Gradient edges: shaft colour runs from the source vertex colour to the
    # target vertex colour; the arrowhead uses the target colour. Only touch the
    # colour vectors when a gradient is actually requested, so plain plots are
    # byte-identical.
    sh.col.e <- edge.color
    h.col.e <- edge.color
    col.to.e <- edge.color
    if (any(edge.gradient)) {
      to_hex <- function(x) {
        grDevices::rgb(t(grDevices::col2rgb(x, alpha = TRUE)), maxColorValue = 255)
      }
      ealpha <- nl_aes$alpha
      grad_from <- i.apply_alpha(to_hex(vcol_base[el[, 1]]), ealpha)
      grad_to <- i.apply_alpha(to_hex(vcol_base[el[, 2]]), ealpha)
      base_hex <- to_hex(edge.color)
      sh.col.e <- base_hex
      h.col.e <- base_hex
      col.to.e <- base_hex
      sh.col.e[edge.gradient] <- grad_from[edge.gradient]
      h.col.e[edge.gradient] <- grad_to[edge.gradient]
      col.to.e[edge.gradient] <- grad_to[edge.gradient]
    }

    if (length(unique(arrow.mode)) == 1) {
      lc <- igraph.Arrows(
        x0,
        y0,
        x1,
        y1,
        h.col = h.col.e,
        sh.col = sh.col.e,
        sh.lwd = edge.width,
        h.lwd = 1,
        open = FALSE,
        code = arrow.mode[1],
        sh.lty = edge.lty,
        h.lty = 1,
        size = arrow.size,
        width = arrow.width,
        curved = curved,
        style = edge.style,
        gradient = edge.gradient,
        col.to = col.to.e,
        ids = nonloops.e
      )
      lc.x <- lc$lab.x
      lc.y <- lc$lab.y
    } else {
      ## different kinds of arrows drawn separately as 'arrows' cannot
      ## handle a vector as the 'code' argument. Every aesthetic is already
      ## length(nonloops.e), so subset each by `valid` consistently.
      lc.x <- lc.y <- numeric(length(nonloops.e))
      for (code in 0:3) {
        valid <- arrow.mode == code
        if (!any(valid)) {
          next
        }
        lc <- igraph.Arrows(
          x0[valid],
          y0[valid],
          x1[valid],
          y1[valid],
          code = code,
          sh.col = sh.col.e[valid],
          h.col = h.col.e[valid],
          sh.lwd = edge.width[valid],
          h.lwd = 1,
          h.lty = 1,
          sh.lty = edge.lty[valid],
          open = FALSE,
          size = arrow.size[valid],
          width = arrow.width[valid],
          curved = curved[valid],
          style = edge.style[valid],
          gradient = edge.gradient[valid],
          col.to = col.to.e[valid],
          ids = nonloops.e[valid]
        )
        lc.x[valid] <- lc$lab.x
        lc.y[valid] <- lc$lab.y
      }
    }
    if (!is.null(elab.x)) {
      lc.x <- ifelse(is.na(elab.x), lc.x, elab.x)
    }
    if (!is.null(elab.y)) {
      lc.y <- ifelse(is.na(elab.y), lc.y, elab.y)
    }

    # Edge-label aesthetics come from the same non-loop slice (already recycled
    # to length(nonloops.e)).
    ecol <- nl_aes$label.color
    efam <- nl_aes$label.family
    efon <- nl_aes$label.font
    ecex <- nl_aes$label.cex
    ehalo <- nl_aes$label.halo
    ehalo.w <- nl_aes$label.halo.width

    invisible(mapply(
      function(x, y, label, col, family, font, cex, halo, halo.w) {
        i.r_text_halo(
          x,
          y,
          labels = label,
          col = col,
          family = family,
          font = font,
          cex = cex,
          halo = halo,
          halo.width = halo.w
        )
      },
      lc.x,
      lc.y,
      edge.labels,
      ecol,
      efam,
      efon,
      ecex,
      ehalo,
      ehalo.w
    ))
  }

  rm(x0, y0, x1, y1)

  ################################################################
  # add the vertices
  if (vc > 0) {
    vtitles <- if (!is.null(i.render_state$vertex_titles)) {
      i.render_state$vertex_titles
    } else if ("name" %in% vertex_attr_names(graph)) {
      as.character(V(graph)$name)
    } else {
      as.character(seq_len(vc))
    }
    i.r_group_begin("vertices", title = vtitles)
    if (length(unique(shape)) == 1) {
      .igraph.shapes[[shape[1]]]$plot(layout, params = params)
    } else {
      sapply(seq(length.out = vcount(graph)), function(x) {
        .igraph.shapes[[shape[x]]]$plot(
          layout[x, , drop = FALSE],
          v = x,
          params = params
        )
      })
    }
    i.r_group_end()
  }

  ################################################################
  # add the labels
  i.draw_vertex_labels(
    layout,
    labels,
    vertex.size,
    label.dist,
    label.degree,
    label.color,
    label.family,
    label.font,
    label.cex,
    label.angle,
    label.adj,
    repel = label.repel,
    label.halo = label.halo,
    label.halo.width = label.halo.width
  )

  ################################################################
  # draw legends / colorbars for any scale_*() aesthetics, in the guide region
  if (!is.null(legend_fig)) {
    graphics::par(fig = legend_fig$guide, new = TRUE)
    i.draw_guides_region(guides, legend_side)
  }

  invisible(NULL)
}


#' 3D plotting of graphs with OpenGL
#'
#' Using the `rgl` package, `rglplot()` plots a graph in 3D. The plot
#' can be zoomed, rotated, shifted, etc. but the coordinates of the vertices is
#' fixed.
#'
#' Note that `rglplot()` is considered to be highly experimental. It is not
#' very useful either. See [igraph.plotting] for the possible
#' arguments.
#'
#' @aliases rglplot.igraph
#' @param x The graph to plot.
#' @param \dots Additional arguments, see [igraph.plotting] for the
#'   details
#' @return `NULL`, invisibly.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [igraph.plotting], [plot.igraph()] for the 2D
#' version, [tkplot()] for interactive graph drawing in 2D.
#' @family plot
#' @export
#' @keywords graphs
#' @export
#' @examples
#'
#' g <- make_lattice(c(5, 5, 5))
#' coords <- layout_with_fr(g, dim = 3)
#'
#' @examplesIf interactive() && rlang::is_installed("rgl")
#' rglplot(g, layout = coords)
#'
rglplot <- function(x, ...) {
  UseMethod("rglplot", x)
}

#' @method rglplot igraph
#' @family plot
#' @export
rglplot.igraph <- function(x, ...) {
  graph <- x
  ensure_igraph(graph)

  create.edge <- function(v1, v2, r1, r2, ec, ew, am, as) {
    ## these could also be parameters:
    aw <- 0.005 * 3 * as # arrow width
    al <- 0.005 * 4 * as # arrow length

    dist <- sqrt(sum((v2 - v1)^2)) # distance of the centers

    if (am == 0) {
      edge <- rgl::qmesh3d(
        c(
          -ew / 2,
          -ew / 2,
          dist,
          1,
          ew / 2,
          -ew / 2,
          dist,
          1,
          ew / 2,
          ew / 2,
          dist,
          1,
          -ew / 2,
          ew / 2,
          dist,
          1,
          -ew / 2,
          -ew / 2,
          0,
          1,
          ew / 2,
          -ew / 2,
          0,
          1,
          ew / 2,
          ew / 2,
          0,
          1,
          -ew / 2,
          ew / 2,
          0,
          1
        ),
        c(
          1, 2, 3, 4, 5, 6, 7,
          8, 1, 2, 6, 5, 2, 3,
          7, 6, 3, 4, 8, 7, 4,
          1, 5, 8
        )
      )
    } else if (am == 1) {
      edge <- rgl::qmesh3d(
        c(
          -ew / 2,
          -ew / 2,
          dist,
          1,
          ew / 2,
          -ew / 2,
          dist,
          1,
          ew / 2,
          ew / 2,
          dist,
          1,
          -ew / 2,
          ew / 2,
          dist,
          1,
          -ew / 2,
          -ew / 2,
          al + r1,
          1,
          ew / 2,
          -ew / 2,
          al + r1,
          1,
          ew / 2,
          ew / 2,
          al + r1,
          1,
          -ew / 2,
          ew / 2,
          al + r1,
          1,
          -aw / 2,
          -aw / 2,
          al + r1,
          1,
          aw / 2,
          -aw / 2,
          al + r1,
          1,
          aw / 2,
          aw / 2,
          al + r1,
          1,
          -aw / 2,
          aw / 2,
          al + r1,
          1,
          0,
          0,
          r1,
          1
        ),
        c(
          1, 2, 3, 4, 5, 6, 7, 8,
          1, 2, 6, 5, 2, 3, 7, 6,
          3, 4, 8, 7, 4, 1, 5, 8,
          9, 10, 11, 12, 9, 12, 13, 13,
          9, 10, 13, 13, 10, 11, 13,
          13, 11, 12, 13, 13
        )
      )
    } else if (am == 2) {
      box <- dist - r2 - al
      edge <- rgl::qmesh3d(
        c(
          -ew / 2,
          -ew / 2,
          box,
          1,
          ew / 2,
          -ew / 2,
          box,
          1,
          ew / 2,
          ew / 2,
          box,
          1,
          -ew / 2,
          ew / 2,
          box,
          1,
          -ew / 2,
          -ew / 2,
          0,
          1,
          ew / 2,
          -ew / 2,
          0,
          1,
          ew / 2,
          ew / 2,
          0,
          1,
          -ew / 2,
          ew / 2,
          0,
          1,
          -aw / 2,
          -aw / 2,
          box,
          1,
          aw / 2,
          -aw / 2,
          box,
          1,
          aw / 2,
          aw / 2,
          box,
          1,
          -aw / 2,
          aw / 2,
          box,
          1,
          0,
          0,
          box + al,
          1
        ),
        c(
          1, 2, 3, 4, 5, 6, 7, 8,
          1, 2, 6, 5, 2, 3, 7, 6,
          3, 4, 8, 7, 4, 1, 5, 8, 9,
          10, 11, 12, 9, 12, 13, 13, 9,
          10, 13, 13, 10, 11, 13, 13, 11,
          12, 13, 13
        )
      )
    } else {
      edge <- rgl::qmesh3d(
        c(
          -ew / 2,
          -ew / 2,
          dist - al - r2,
          1,
          ew / 2,
          -ew / 2,
          dist - al - r2,
          1,
          ew / 2,
          ew / 2,
          dist - al - r2,
          1,
          -ew / 2,
          ew / 2,
          dist - al - r2,
          1,
          -ew / 2,
          -ew / 2,
          r1 + al,
          1,
          ew / 2,
          -ew / 2,
          r1 + al,
          1,
          ew / 2,
          ew / 2,
          r1 + al,
          1,
          -ew / 2,
          ew / 2,
          r1 + al,
          1,
          -aw / 2,
          -aw / 2,
          dist - al - r2,
          1,
          aw / 2,
          -aw / 2,
          dist - al - r2,
          1,
          aw / 2,
          aw / 2,
          dist - al - r2,
          1,
          -aw / 2,
          aw / 2,
          dist - al - r2,
          1,
          -aw / 2,
          -aw / 2,
          r1 + al,
          1,
          aw / 2,
          -aw / 2,
          r1 + al,
          1,
          aw / 2,
          aw / 2,
          r1 + al,
          1,
          -aw / 2,
          aw / 2,
          r1 + al,
          1,
          0,
          0,
          dist - r2,
          1,
          0,
          0,
          r1,
          1
        ),
        c(
          1, 2, 3, 4, 5, 6, 7,
          8, 1, 2, 6, 5, 2, 3,
          7, 6, 3, 4, 8, 7, 4,
          1, 5, 8, 9, 10, 11, 12,
          9, 12, 17, 17, 9, 10, 17,
          17, 10, 11, 17, 17, 11, 12,
          17, 17, 13, 14, 15, 16, 13,
          16, 18, 18, 13, 14, 18, 18,
          14, 15, 18, 18, 15, 16, 18, 18
        )
      )
    }

    ## rotate and shift it to its position
    phi <- -atan2(v2[2] - v1[2], v1[1] - v2[1]) - pi / 2
    psi <- acos((v2[3] - v1[3]) / dist)
    rot1 <- rbind(
      c(1, 0, 0),
      c(0, cos(psi), sin(psi)),
      c(0, -sin(psi), cos(psi))
    )
    rot2 <- rbind(
      c(cos(phi), sin(phi), 0),
      c(-sin(phi), cos(phi), 0),
      c(0, 0, 1)
    )
    rot <- rot1 %*% rot2
    edge <- rgl::transform3d(edge, rgl::rotationMatrix(matrix = rot))
    edge <- rgl::transform3d(edge, rgl::translationMatrix(v1[1], v1[2], v1[3]))

    ## we are ready
    rgl::shade3d(edge, col = ec)
  }

  create.loop <- function(v, r, ec, ew, am, la, la2, as) {
    aw <- 0.005 * 3 * as
    al <- 0.005 * 4 * as
    wi <- aw * 2 # size of the loop
    wi2 <- wi + aw - ew # size including the arrow heads
    hi <- al * 2 + ew * 2
    gap <- wi - 2 * ew

    if (am == 0) {
      edge <- rgl::qmesh3d(
        c(
          -wi / 2,
          -ew / 2,
          0,
          1,
          -gap / 2,
          -ew / 2,
          0,
          1,
          -gap / 2,
          ew / 2,
          0,
          1,
          -wi / 2,
          ew / 2,
          0,
          1,
          -wi / 2,
          -ew / 2,
          hi - ew + r,
          1,
          -gap / 2,
          -ew / 2,
          hi - ew + r,
          1,
          -gap / 2,
          ew / 2,
          hi - ew + r,
          1,
          -wi / 2,
          ew / 2,
          hi - ew + r,
          1,
          wi / 2,
          -ew / 2,
          0,
          1,
          gap / 2,
          -ew / 2,
          0,
          1,
          gap / 2,
          ew / 2,
          0,
          1,
          wi / 2,
          ew / 2,
          0,
          1,
          wi / 2,
          -ew / 2,
          hi - ew + r,
          1,
          gap / 2,
          -ew / 2,
          hi - ew + r,
          1,
          gap / 2,
          ew / 2,
          hi - ew + r,
          1,
          wi / 2,
          ew / 2,
          hi - ew + r,
          1,
          -wi / 2,
          -ew / 2,
          hi + r,
          1,
          -wi / 2,
          ew / 2,
          hi + r,
          1,
          wi / 2,
          -ew / 2,
          hi + r,
          1,
          wi / 2,
          ew / 2,
          hi + r,
          1
        ),
        c(
          1, 2, 3, 4, 5, 6, 7,
          8, 1, 2, 6, 5, 2, 3, 
          7, 6, 3, 4, 8, 7, 1, 4,
          18, 17, 9, 10, 11, 12, 13, 14,
          15, 16, 9, 10, 14, 13, 10, 11,
          15, 14, 11, 12, 16, 15, 9,
          12, 20, 19, 5, 13, 19, 17,
          17, 18, 20, 19, 8, 16, 20,
          18, 6, 7, 15, 14
        )
      )
    } else if (am == 1 || am == 2) {
      edge <- rgl::qmesh3d(
        c(
          -wi / 2,
          -ew / 2,
          r + al,
          1,
          -gap / 2,
          -ew / 2,
          r + al,
          1,
          -gap / 2,
          ew / 2,
          r + al,
          1,
          -wi / 2,
          ew / 2,
          r + al,
          1,
          -wi / 2,
          -ew / 2,
          hi - ew + r,
          1,
          -gap / 2,
          -ew / 2,
          hi - ew + r,
          1,
          -gap / 2,
          ew / 2,
          hi - ew + r,
          1,
          -wi / 2,
          ew / 2,
          hi - ew + r,
          1,
          wi / 2,
          -ew / 2,
          0,
          1,
          gap / 2,
          -ew / 2,
          0,
          1,
          gap / 2,
          ew / 2,
          0,
          1,
          wi / 2,
          ew / 2,
          0,
          1,
          wi / 2,
          -ew / 2,
          hi - ew + r,
          1,
          gap / 2,
          -ew / 2,
          hi - ew + r,
          1,
          gap / 2,
          ew / 2,
          hi - ew + r,
          1,
          wi / 2,
          ew / 2,
          hi - ew + r,
          1,
          -wi / 2,
          -ew / 2,
          hi + r,
          1,
          -wi / 2,
          ew / 2,
          hi + r,
          1,
          wi / 2,
          -ew / 2,
          hi + r,
          1,
          wi / 2,
          ew / 2,
          hi + r,
          1,
          # the arrow
          -wi2 / 2,
          -aw / 2,
          r + al,
          1,
          -wi2 / 2 + aw,
          -aw / 2,
          r + al,
          1,
          -wi2 / 2 + aw,
          aw / 2,
          r + al,
          1,
          -wi2 / 2,
          aw / 2,
          r + al,
          1,
          -wi2 / 2 + aw / 2,
          0,
          r,
          1
        ),
        c(
          1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 6,
          5, 2, 3, 7, 6, 3, 4, 8, 7, 1, 4,
          18, 17, 9, 10, 11, 12, 13, 14, 15, 
          16, 9, 10, 14, 13, 10, 11, 15, 14,
          11, 12, 16, 15, 9, 12, 20, 19, 5,
          13, 19, 17, 17, 18, 20, 19, 8, 16,
          20, 18, 6, 7, 15, 14, 
          # the arrow
          21, 22, 23, 24, 21, 22, 25, 25,
          22, 23, 25, 25, 23, 24, 25, 25,
          21, 24, 25, 25
        )
      )
    } else if (am == 3) {
      edge <- rgl::qmesh3d(
        c(
          -wi / 2,
          -ew / 2,
          r + al,
          1,
          -gap / 2,
          -ew / 2,
          r + al,
          1,
          -gap / 2,
          ew / 2,
          r + al,
          1,
          -wi / 2,
          ew / 2,
          r + al,
          1,
          -wi / 2,
          -ew / 2,
          hi - ew + r,
          1,
          -gap / 2,
          -ew / 2,
          hi - ew + r,
          1,
          -gap / 2,
          ew / 2,
          hi - ew + r,
          1,
          -wi / 2,
          ew / 2,
          hi - ew + r,
          1,
          wi / 2,
          -ew / 2,
          r + al,
          1,
          gap / 2,
          -ew / 2,
          r + al,
          1,
          gap / 2,
          ew / 2,
          r + al,
          1,
          wi / 2,
          ew / 2,
          r + al,
          1,
          wi / 2,
          -ew / 2,
          hi - ew + r,
          1,
          gap / 2,
          -ew / 2,
          hi - ew + r,
          1,
          gap / 2,
          ew / 2,
          hi - ew + r,
          1,
          wi / 2,
          ew / 2,
          hi - ew + r,
          1,
          -wi / 2,
          -ew / 2,
          hi + r,
          1,
          -wi / 2,
          ew / 2,
          hi + r,
          1,
          wi / 2,
          -ew / 2,
          hi + r,
          1,
          wi / 2,
          ew / 2,
          hi + r,
          1,
          # the arrows
          -wi2 / 2,
          -aw / 2,
          r + al,
          1,
          -wi2 / 2 + aw,
          -aw / 2,
          r + al,
          1,
          -wi2 / 2 + aw,
          aw / 2,
          r + al,
          1,
          -wi2 / 2,
          aw / 2,
          r + al,
          1,
          -wi2 / 2 + aw / 2,
          0,
          r,
          1,
          wi2 / 2,
          -aw / 2,
          r + al,
          1,
          wi2 / 2 - aw,
          -aw / 2,
          r + al,
          1,
          wi2 / 2 - aw,
          aw / 2,
          r + al,
          1,
          wi2 / 2,
          aw / 2,
          r + al,
          1,
          wi2 / 2 - aw / 2,
          0,
          r,
          1
        ),
        c(
          1, 2, 3, 4, 5, 6, 7, 8, 1,
          2, 6, 5, 2, 3, 7, 6, 3, 4,
          8, 7, 1, 4, 18, 17, 9, 10,
          11, 12, 13, 14, 15, 16, 9, 10,
          14, 13, 10, 11, 15, 14, 11, 
          12, 16, 15, 9, 12, 20, 19, 5,
          13, 19, 17, 17, 18, 20, 19, 8,
          16, 20, 18, 6, 7, 15, 14,
          # the arrows
          21, 22, 23, 24, 21, 22, 25, 25, 22,
          23, 25, 25, 23, 24, 25, 25, 21,
          24, 25, 25, 26, 27, 28, 29, 26, 27,
          30, 30, 27, 28, 30, 30, 28, 29, 30,
          30, 26, 29, 30, 30
        )
      )
    }

    # rotate and shift to its position
    rot1 <- rbind(
      c(1, 0, 0),
      c(0, cos(la2), sin(la2)),
      c(0, -sin(la2), cos(la2))
    )
    rot2 <- rbind(c(cos(la), sin(la), 0), c(-sin(la), cos(la), 0), c(0, 0, 1))
    rot <- rot1 %*% rot2
    edge <- rgl::transform3d(edge, rgl::rotationMatrix(matrix = rot))
    edge <- rgl::transform3d(edge, rgl::translationMatrix(v[1], v[2], v[3]))

    ## we are ready
    rgl::shade3d(edge, col = ec)
  }

  # Visual parameters
  params <- i.parse.plot.params(graph, list(...))
  labels <- params("vertex", "label")
  label.color <- params("vertex", "label.color")
  label.font <- params("vertex", "label.font")
  label.degree <- params("vertex", "label.degree")
  label.dist <- params("vertex", "label.dist")
  vertex.color <- params("vertex", "color")

  vertex.size <- params("vertex", "size")
  vertex.size.scaling <- params("vertex", "size.scaling")

  # Rescaling vertex size
  if (vertex.size.scaling) {
    vertex.size <- i.rescale.vertex(
      vertex.size,
      rgl::par3d("scale")[1:2] * c(-1, 1),
      params("vertex", "relative.size")
    )
  } else {
    vertex.size <- (1 / 200) * params("vertex", "size")
  }

  loop.angle <- params("edge", "loop.angle")
  loop.angle2 <- params("edge", "loop.angle2")

  edge.color <- params("edge", "color")
  edge.width <- (1 / 200) * params("edge", "width")
  edge.labels <- params("edge", "label")
  arrow.mode <- params("edge", "arrow.mode")
  arrow.size <- params("edge", "arrow.size")

  layout <- params("plot", "layout")
  rescale <- params("plot", "rescale")

  # the new style parameters can't do this yet
  arrow.mode <- i.get.arrow.mode(graph, arrow.mode)

  # norm layout to (-1, 1)
  if (ncol(layout) == 2) {
    layout <- cbind(layout, 0)
  }
  if (rescale) {
    layout <- norm_coords(layout, -1, 1, -1, 1, -1, 1)
  }

  # add the edges, the loops are handled separately
  el <- as_edgelist(graph, names = FALSE)

  # It is faster this way
  rgl::par3d(skipRedraw = TRUE)

  # edges first
  for (i in seq(length.out = nrow(el))) {
    from <- el[i, 1]
    to <- el[i, 2]
    v1 <- layout[from, ]
    v2 <- layout[to, ]
    am <- arrow.mode
    if (length(am) > 1) {
      am <- am[i]
    }
    ew <- edge.width
    if (length(ew) > 1) {
      ew <- ew[i]
    }
    ec <- edge.color
    if (length(ec) > 1) {
      ec <- ec[i]
    }
    r1 <- vertex.size
    if (length(r1) > 1) {
      r1 <- r1[from]
    }
    r2 <- vertex.size
    if (length(r2) > 1) {
      r2 <- r2[to]
    }

    if (from != to) {
      create.edge(v1, v2, r1, r2, ec, ew, am, arrow.size)
    } else {
      la <- loop.angle
      if (length(la) > 1) {
        la <- la[i]
      }
      la2 <- loop.angle2
      if (length(la2) > 1) {
        la2 <- la2[i]
      }
      create.loop(v1, r1, ec, ew, am, la, la2, arrow.size)
    }
  }

  # add the vertices
  if (length(vertex.size) == 1) {
    vertex.size <- rep(vertex.size, nrow(layout))
  }
  rgl::spheres3d(
    layout[, 1],
    layout[, 2],
    layout[, 3],
    radius = vertex.size,
    col = vertex.color
  )

  # add the labels
  labels[is.na(labels)] <- ""
  x <- layout[, 1] +
    label.dist * cos(-label.degree) * (vertex.size + 6 * 10 * log10(2)) / 200
  y <- layout[, 2] +
    label.dist * sin(-label.degree) * (vertex.size + 6 * 10 * log10(2)) / 200
  z <- layout[, 3]
  rgl::text3d(x, y, z, labels, col = label.color, adj = 0)

  edge.labels[is.na(edge.labels)] <- ""
  if (any(nzchar(edge.labels))) {
    x0 <- layout[, 1][el[, 1]]
    x1 <- layout[, 1][el[, 2]]
    y0 <- layout[, 2][el[, 1]]
    y1 <- layout[, 2][el[, 2]]
    z0 <- layout[, 3][el[, 1]]
    z1 <- layout[, 3][el[, 2]]
    rgl::text3d(
      (x0 + x1) / 2,
      (y0 + y1) / 2,
      (z0 + z1) / 2,
      edge.labels,
      col = label.color
    )
  }

  # draw everything
  rgl::par3d(skipRedraw = FALSE)

  invisible(NULL)
}

# This is taken from the IDPmisc package,
# slightly modified: code argument added

# Pure geometry: the outline of an arrowhead in polar coordinates
# (angle + radius from the tip), used by igraph.Arrows() to draw or outline the
# head. Depends only on scalar inputs, so it is testable without a device.
#   cin   arrow length, already scaled by the character size (par("cin"))
#   w     arrow width factor
#   delta line-width-dependent padding
i.arrowhead_shape <- function(cin, w, delta) {
  x <- sqrt(seq(0, cin^2, length.out = floor(35 * cin) + 2))
  x.arr <- c(-rev(x), -x)
  wx2 <- w * x^2
  y.arr <- c(-rev(wx2 + delta), wx2 + delta)
  list(
    deg.arr = c(atan2(y.arr, x.arr), NA),
    r.arr = c(sqrt(x.arr^2 + y.arr^2), NA)
  )
}

# Pure geometry: shaft segment endpoints for a single edge, pulled
# back from the vertices by `r.seg` at whichever end carries an arrowhead (per
# `code`) so the shaft does not poke through the head. `uin` is the
# inches-per-user-unit scale from 1/xyinch(). Returns sx1/sy1/sx2/sy2.
i.arrow_shaft_endpoints <- function(x1, y1, x2, y2, code, r.seg, uin) {
  theta1 <- atan2((y1 - y2) * uin[2], (x1 - x2) * uin[1])
  theta2 <- atan2((y2 - y1) * uin[2], (x2 - x1) * uin[1])
  x1d <- y1d <- x2d <- y2d <- 0
  if (code %in% c(1, 3)) {
    x2d <- r.seg * cos(theta2) / uin[1]
    y2d <- r.seg * sin(theta2) / uin[2]
  }
  if (code %in% c(2, 3)) {
    x1d <- r.seg * cos(theta1) / uin[1]
    y1d <- r.seg * sin(theta1) / uin[2]
  }
  list(sx1 = x1 + x1d, sy1 = y1 + y1d, sx2 = x2 + x2d, sy2 = y2 + y2d)
}

# Pure geometry: label anchor two thirds of the way along a straight
# edge from (x2, y2) toward (x1, y1).
i.edge_label_pos <- function(x1, y1, x2, y2) {
  phi <- atan2(y1 - y2, x1 - x2)
  r <- sqrt((x1 - x2)^2 + (y1 - y2)^2)
  # unname() the components: when the coordinates carry names (e.g. a named
  # vertex.size such as scale_size(degree(g)) propagates names through edge
  # clipping), `c(x = <named>, y = <named>)` would yield names like "x.Alice"
  # instead of "x"/"y", breaking the lab[["x"]] / lab[["y"]] lookups downstream.
  c(
    x = unname(x2 + 2 / 3 * r * cos(phi)),
    y = unname(y2 + 2 / 3 * r * sin(phi))
  )
}

# Geometry: the X-spline of a curved edge. The control point is offset
# from the edge midpoint perpendicular to the shaft by `lambda`. Returns the
# xspline() coordinate list (draw = FALSE; needs an active device).
i.curved_spline <- function(x1, y1, x2, y2, sx1, sy1, sx2, sy2, lambda) {
  midx <- (x1 + x2) / 2
  midy <- (y1 + y2) / 2
  spx <- midx - lambda * 1 / 2 * (sy2 - sy1)
  spy <- midy + lambda * 1 / 2 * (sx2 - sx1)
  xspline(
    x = c(sx1, spx, sx2),
    y = c(sy1, spy, sy2),
    shape = 1,
    draw = FALSE
  )
}

# Geometry: two-corner orthogonal ("elbow") path between two points.
# Leaves along the dominant axis (larger absolute delta), turns at the midpoint
# of that axis, crosses, then turns into the target. Returns list(x, y) of the
# four polyline vertices.
i.elbow_path <- function(x0, y0, x1, y1) {
  if (abs(x1 - x0) >= abs(y1 - y0)) {
    mid <- (x0 + x1) / 2
    list(x = c(x0, mid, mid, x1), y = c(y0, y0, y1, y1))
  } else {
    mid <- (y0 + y1) / 2
    list(x = c(x0, x0, x1, x1), y = c(y0, mid, mid, y1))
  }
}

# Geometry: smooth "diagonal" S-curve between two points, a cubic
# Bezier whose control points sit on the dominant axis so the curve leaves and
# enters along that axis. Returns list(x, y) sampled at `n` points.
i.diagonal_path <- function(x0, y0, x1, y1, n = 30) {
  if (abs(x1 - x0) >= abs(y1 - y0)) {
    mid <- (x0 + x1) / 2
    cp <- rbind(c(x0, y0), c(mid, y0), c(mid, y1), c(x1, y1))
  } else {
    mid <- (y0 + y1) / 2
    cp <- rbind(c(x0, y0), c(x0, mid), c(x1, mid), c(x1, y1))
  }
  p <- i.compute.bezier(cp, n)
  list(x = p[1, ], y = p[2, ])
}

# Apply a per-element alpha (transparency, in [0, 1]) to a colour vector by
# multiplying any existing alpha. A no-op when every alpha is 1, so the default
# leaves colours — and snapshots — byte-identical.
i.apply_alpha <- function(col, alpha) {
  if (length(col) == 0 || all(alpha == 1)) {
    return(col)
  }
  rgba <- grDevices::col2rgb(col, alpha = TRUE) / 255
  a <- rep(alpha, length.out = ncol(rgba))
  grDevices::rgb(rgba[1, ], rgba[2, ], rgba[3, ], alpha = rgba[4, ] * a)
}

# Draw a polyline (px, py) as a colour gradient from `col_from` to `col_to`:
# resample to `n` points by cumulative arc length, then draw the n-1 pieces with
# interpolated colours. Used for source->target edge gradients.
i.draw_gradient_path <- function(px, py, col_from, col_to, lwd, lty, n = 40) {
  d <- c(0, cumsum(sqrt(diff(px)^2 + diff(py)^2)))
  if (length(d) < 2 || max(d) == 0) {
    return(invisible(NULL))
  }
  at <- seq(0, max(d), length.out = n)
  rx <- stats::approx(d, px, at)$y
  ry <- stats::approx(d, py, at)$y
  ramp <- grDevices::colorRamp(c(col_from, col_to), alpha = TRUE)
  m <- ramp(seq(0, 1, length.out = n - 1)) # one RGBA row per segment
  cols <- grDevices::rgb(m[, 1], m[, 2], m[, 3], alpha = m[, 4], maxColorValue = 255)
  i.r_segments(rx[-n], ry[-n], rx[-1], ry[-1], col = cols, lwd = lwd, lty = lty)
  invisible(NULL)
}

#' @importFrom graphics par xyinch segments xspline lines polygon
# Vectorized and modular igraph.Arrows refactor
igraph.Arrows <- function(
  x1,
  y1,
  x2,
  y2,
  code = 2,
  size = 1,
  width = ARROW_WIDTH_FACTOR / par("cin")[2],
  open = TRUE,
  sh.adj = 0.1,
  sh.lwd = 1,
  sh.col = par("fg"),
  sh.lty = 1,
  h.col = sh.col,
  h.col.bo = sh.col,
  h.lwd = sh.lwd,
  h.lty = sh.lty,
  curved = FALSE,
  style = "auto",
  gradient = FALSE,
  col.to = sh.col,
  ids = NULL
) {
  n <- length(x1)

  recycle <- function(x) rep(x, length.out = n)

  x1 <- recycle(x1)
  y1 <- recycle(y1)
  x2 <- recycle(x2)
  y2 <- recycle(y2)
  size <- recycle(size)
  width <- recycle(width)
  curved <- recycle(curved)
  style <- recycle(as.character(style))
  gradient <- recycle(gradient)
  col.to <- recycle(col.to)
  sh.lwd <- recycle(sh.lwd)
  sh.col <- recycle(sh.col)
  sh.lty <- recycle(sh.lty)
  h.col <- recycle(h.col)
  h.col.bo <- recycle(h.col.bo)
  h.lwd <- recycle(h.lwd)
  h.lty <- recycle(h.lty)

  uin <- 1 / xyinch()

  label_x <- numeric(n)
  label_y <- numeric(n)

  for (i in seq_len(n)) {
    if (!is.null(ids)) {
      i.r_group_begin("edge", id = ids[i])
    }
    cin <- size[i] * par("cin")[2]
    w <- width[i] * (ARROW_WIDTH_FACTOR / cin)
    delta <- sqrt(h.lwd[i]) * par("cin")[2] * 0.005

    # Arrowhead shape (pure geometry, see i.arrowhead_shape)
    head <- i.arrowhead_shape(cin, w, delta)
    deg.arr <- head$deg.arr
    r.arr <- head$r.arr

    r.seg <- cin * sh.adj
    sh <- i.arrow_shaft_endpoints(x1[i], y1[i], x2[i], y2[i], code, r.seg, uin)
    sx1 <- sh$sx1
    sy1 <- sh$sy1
    sx2 <- sh$sx2
    sy2 <- sh$sy2

    eff_style <- style[i]
    if (eff_style == "auto") {
      eff_style <- if (!curved[i]) "straight" else "arc"
    }

    if (eff_style == "straight") {
      if (gradient[i]) {
        i.draw_gradient_path(
          c(sx1, sx2),
          c(sy1, sy2),
          sh.col[i],
          col.to[i],
          sh.lwd[i],
          sh.lty[i]
        )
      } else {
        i.r_segments(
          sx1,
          sy1,
          sx2,
          sy2,
          lwd = sh.lwd[i],
          col = sh.col[i],
          lty = sh.lty[i]
        )
      }
      lab <- i.edge_label_pos(x1[i], y1[i], x2[i], y2[i])
      label_x[i] <- lab[["x"]]
      label_y[i] <- lab[["y"]]
    } else if (eff_style == "arc") {
      lambda <- if (is.numeric(curved)) curved[i] else 0.5
      if (style[i] == "arc" && lambda == 0) {
        # an explicit arc on an otherwise-straight edge needs a strength
        lambda <- 0.3
      }
      spl <- i.curved_spline(
        x1[i],
        y1[i],
        x2[i],
        y2[i],
        sx1,
        sy1,
        sx2,
        sy2,
        lambda
      )
      if (gradient[i]) {
        i.draw_gradient_path(
          spl$x,
          spl$y,
          sh.col[i],
          col.to[i],
          sh.lwd[i],
          sh.lty[i]
        )
      } else {
        i.r_polyline(spl, col = sh.col[i], lwd = sh.lwd[i], lty = sh.lty[i])
      }
      label_x[i] <- spl$x[round(2 / 3 * length(spl$x))]
      label_y[i] <- spl$y[round(2 / 3 * length(spl$y))]

      if (code %in% c(2, 3)) {
        x1[i] <- spl$x[round(3 / 4 * length(spl$x))]
        y1[i] <- spl$y[round(3 / 4 * length(spl$y))]
      }
      if (code %in% c(1, 3)) {
        x2[i] <- spl$x[round(1 / 4 * length(spl$x))]
        y2[i] <- spl$y[round(1 / 4 * length(spl$y))]
      }
    } else {
      # elbow or diagonal: a polyline between the shaft endpoints
      path <- if (eff_style == "elbow") {
        i.elbow_path(sx1, sy1, sx2, sy2)
      } else {
        i.diagonal_path(sx1, sy1, sx2, sy2)
      }
      if (gradient[i]) {
        i.draw_gradient_path(
          path$x,
          path$y,
          sh.col[i],
          col.to[i],
          sh.lwd[i],
          sh.lty[i]
        )
      } else {
        i.r_polyline(path$x, path$y, col = sh.col[i], lwd = sh.lwd[i], lty = sh.lty[i])
      }
      np <- length(path$x)
      mid <- max(1L, round(np / 2))
      label_x[i] <- path$x[mid]
      label_y[i] <- path$y[mid]

      # arrowhead end-tangents: align the head with the path's final/first
      # segment (mirrors the arc branch's near-end reassignment)
      if (code %in% c(2, 3)) {
        x1[i] <- path$x[np - 1]
        y1[i] <- path$y[np - 1]
      }
      if (code %in% c(1, 3)) {
        x2[i] <- path$x[2]
        y2[i] <- path$y[2]
      }
    }

    draw_arrowhead <- function(px, py, theta) {
      px2 <- rep(px, length(deg.arr))
      py2 <- rep(py, length(deg.arr))
      ttheta <- rep(theta, length(deg.arr)) + deg.arr

      xhead <- px2 + r.arr * cos(ttheta) / uin[1]
      yhead <- py2 + r.arr * sin(ttheta) / uin[2]

      if (open) {
        i.r_polyline(xhead, yhead, col = h.col.bo[i], lwd = h.lwd[i], lty = h.lty[i])
      } else {
        i.r_polygon(
          xhead,
          yhead,
          col = h.col[i],
          lwd = h.lwd[i],
          border = h.col.bo[i],
          lty = h.lty[i]
        )
      }
    }

    if (code %in% c(2, 3)) {
      draw_arrowhead(
        x2[i],
        y2[i],
        atan2((y2[i] - y1[i]) * uin[2], (x2[i] - x1[i]) * uin[1])
      )
    }
    if (code %in% c(1, 3)) {
      draw_arrowhead(
        x1[i],
        y1[i],
        atan2((y1[i] - y2[i]) * uin[2], (x1[i] - x2[i]) * uin[1])
      )
    }
    if (!is.null(ids)) {
      i.r_group_end()
    }
  }

  list(lab.x = label_x, lab.y = label_y)
}

#' @importFrom graphics xspline
igraph.polygon <- function(
  points,
  vertex.size = 15 / 200,
  expand.by = 15 / 200,
  shape = 1 / 2,
  col = "#ff000033",
  border = NA,
  border.lwd = 1
) {
  by <- expand.by
  pp <- rbind(
    points,
    cbind(points[, 1] - vertex.size - by, points[, 2]),
    cbind(points[, 1] + vertex.size + by, points[, 2]),
    cbind(points[, 1], points[, 2] - vertex.size - by),
    cbind(points[, 1], points[, 2] + vertex.size + by)
  )

  cl <- convex_hull(pp)

  i.r_xspline(
    cl$rescoords,
    shape = shape,
    open = FALSE,
    col = col,
    border = border,
    lwd = border.lwd
  )
}
