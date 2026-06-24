#   IGraph R package
#   Copyright (C) 2003-2012  Gabor Csardi <csardi.gabor@gmail.com>
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
###################################################################

# Scales (feature F1): map a data vector to a plotting aesthetic (colour or
# size) AND record a "guide" describing the mapping, so that plot.igraph() can
# draw a matching legend or colorbar. A scale is passed to an existing argument,
# e.g. plot(g, vertex.color = scale_color(V(g)$type)).

new_igraph_scale <- function(values, guide) {
  structure(list(values = values, guide = guide), class = "igraph_scale")
}

is_igraph_scale <- function(x) inherits(x, "igraph_scale")

#' Map data to a colour aesthetic with an automatic legend
#'
#' `scale_color()` (alias `scale_colour()`) maps a data vector to vertex or edge
#' colours and records the mapping so that [plot.igraph()] draws a matching
#' guide. Pass it to a colour argument, e.g.
#' `plot(g, vertex.color = scale_color(V(g)$group))`.
#'
#' A non-numeric `x` (factor, character, logical) produces a discrete mapping
#' and a categorical legend; a numeric `x` produces a continuous mapping (a
#' colour ramp) and a colorbar.
#'
#' @param x The data vector to map. Its length must be 1 or the number of
#'   vertices/edges of the graph it is used with.
#' @param palette Colours to map to. For discrete `x`, a vector of colours (one
#'   per level, recycled); defaults to [categorical_pal()]. For numeric `x`, the
#'   anchor colours of the ramp; defaults to [sequential_pal()].
#' @param na.value Colour used for `NA` entries in `x`.
#' @param name Optional guide title; defaults to the name of the argument the
#'   scale is assigned to (e.g. `"vertex.color"`).
#' @return An `igraph_scale` object.
#' @family scales
#' @export
scale_color <- function(x, palette = NULL, na.value = "grey70", name = NULL) {
  n <- length(x)
  na <- is.na(x)

  if (is.numeric(x)) {
    ramp_cols <- if (is.null(palette)) sequential_pal(9) else palette
    rng <- range(x, na.rm = TRUE)
    norm <- if (diff(rng) == 0) {
      rep(0.5, n)
    } else {
      (x - rng[1]) / (rng[2] - rng[1])
    }
    vals <- rep(na.value, n)
    if (any(!na)) {
      m <- grDevices::colorRamp(ramp_cols)(norm[!na])
      vals[!na] <- grDevices::rgb(m[, 1], m[, 2], m[, 3], maxColorValue = 255)
    }
    guide <- list(
      aesthetic = "color",
      type = "continuous",
      name = name,
      limits = rng,
      ramp = ramp_cols
    )
  } else {
    xc <- as.character(x)
    levels <- if (is.factor(x)) {
      lv <- levels(x)
      lv[lv %in% xc]
    } else {
      sort(unique(xc[!na]))
    }
    cols <- if (is.null(palette)) categorical_pal(length(levels)) else palette
    cols <- rep(cols, length.out = length(levels))
    map <- stats::setNames(cols, levels)
    vals <- unname(map[xc])
    vals[is.na(vals)] <- na.value
    guide <- list(
      aesthetic = "color",
      type = "discrete",
      name = name,
      labels = levels,
      colors = cols
    )
  }

  new_igraph_scale(vals, guide)
}

#' @rdname scale_color
#' @export
scale_colour <- scale_color

#' Map data to a size aesthetic with an automatic legend
#'
#' `scale_size()` linearly maps a numeric data vector to a size range (suitable
#' for `vertex.size` or `edge.width`) and records the mapping so that
#' [plot.igraph()] draws a matching size legend. Pass it to a size argument,
#' e.g. `plot(g, vertex.size = scale_size(degree(g)))`.
#'
#' @param x A numeric data vector to map. Its length must be 1 or the number of
#'   vertices/edges of the graph it is used with.
#' @param range Numeric length-2 vector giving the output size range.
#' @param na.value Size used for `NA` entries in `x`.
#' @param name Optional guide title; defaults to the argument name.
#' @param trans Optional transformation applied to `x` before rescaling, given
#'   as a function or its name (e.g. `"sqrt"`, `"log"`).
#' @return An `igraph_scale` object.
#' @family scales
#' @export
scale_size <- function(
  x,
  range = c(2, 15),
  na.value = NA,
  name = NULL,
  trans = NULL
) {
  if (!is.numeric(x)) {
    cli::cli_abort("{.arg x} must be numeric for {.fn scale_size}.")
  }
  n <- length(x)
  na <- is.na(x)
  tfun <- if (is.null(trans)) identity else match.fun(trans)
  xt <- tfun(x)
  rng <- range(xt, na.rm = TRUE)

  rescale <- function(v) {
    if (diff(rng) == 0) {
      rep(mean(range), length(v))
    } else {
      (v - rng[1]) / (rng[2] - rng[1]) * (range[2] - range[1]) + range[1]
    }
  }

  vals <- rescale(xt)
  vals[na] <- na.value

  breaks <- pretty(x[!na], n = 3)
  breaks <- breaks[breaks >= min(x, na.rm = TRUE) & breaks <= max(x, na.rm = TRUE)]
  guide <- list(
    aesthetic = "size",
    type = "discrete",
    name = name,
    labels = as.character(breaks),
    sizes = rescale(tfun(breaks))
  )

  new_igraph_scale(vals, guide)
}

# Replace any igraph_scale arguments in `dots` with their resolved `values`, and
# collect the guides (titling each with the argument name unless the scale set a
# name). Must run before i.parse.plot.params(), whose rep() recycling would strip
# the scale class/attributes.
i.apply_scales <- function(dots) {
  guides <- list()
  for (nm in names(dots)) {
    val <- dots[[nm]]
    if (is_igraph_scale(val)) {
      guide <- val$guide
      if (is.null(guide$name)) {
        guide$name <- nm
      }
      guides[[length(guides) + 1L]] <- guide
      dots[[nm]] <- val$values
    }
  }
  list(dots = dots, guides = guides)
}

# Draw all collected guides, stacking them from a corner. `legend` is TRUE
# (default corner) or a position keyword like "bottomleft".
i.draw_guides <- function(guides, legend) {
  pos <- if (is.character(legend)) legend[1] else "topright"
  old <- graphics::par(xpd = TRUE)
  on.exit(graphics::par(old), add = TRUE)

  anchor <- NULL # NULL => place by keyword; else c(x_left, y_top)
  gap <- 0.04 * diff(graphics::par("usr")[3:4])
  for (g in guides) {
    rect <- i.draw_one_guide(g, pos, anchor)
    anchor <- c(rect$left, rect$top - rect$h - gap)
  }
  invisible(NULL)
}

# Draw a single guide and return its bounding rectangle as list(left, top, w, h)
# in user coordinates, so the caller can stack the next one beneath it.
i.draw_one_guide <- function(g, pos, anchor) {
  if (g$type == "continuous") {
    return(i.draw_colorbar(g, pos, anchor))
  }

  args <- list(
    legend = g$labels,
    title = g$name,
    pch = 21,
    bty = "n"
  )
  if (g$aesthetic == "color") {
    args$pt.bg <- g$colors
    args$pt.cex <- 1.8
  } else {
    args$pt.bg <- "grey70"
    args$pt.cex <- i.size_to_cex(g$sizes)
  }
  if (is.null(anchor)) {
    args <- c(list(x = pos), args)
  } else {
    args <- c(list(x = anchor[1], y = anchor[2]), args)
  }
  lg <- do.call(graphics::legend, args)
  lg$rect
}

# Translate plotting sizes (vertex.size / edge.width scale) to a legend point
# cex. Sizes are normalised to a legible cex range; the legend is indicative,
# not a pixel-exact match to the drawn vertices (which use device units).
i.size_to_cex <- function(sizes) {
  if (length(sizes) == 0 || all(!is.finite(sizes))) {
    return(1.5)
  }
  mx <- max(sizes, na.rm = TRUE)
  if (mx <= 0) {
    return(rep(1.5, length(sizes)))
  }
  0.8 + 2.2 * (sizes / mx)
}

# Draw a continuous colour guide (colorbar) anchored at a corner. Returns its
# bounding rectangle for stacking.
i.draw_colorbar <- function(g, pos, anchor) {
  usr <- graphics::par("usr")
  w <- 0.04 * diff(usr[1:2])
  h <- 0.30 * diff(usr[3:4])
  pad <- 0.03 * diff(usr[1:2])
  gap_lbl <- 0.01 * diff(usr[1:2])

  # Measure tick labels + title so the whole group can be right-anchored and
  # nothing is clipped at the plot edge regardless of device width.
  labs <- format(g$limits, digits = 3)
  label_w <- max(graphics::strwidth(labs, cex = 0.8)) + gap_lbl
  title_w <- if (is.null(g$name)) 0 else graphics::strwidth(g$name)
  title_h <- if (is.null(g$name)) 0 else 0.05 * diff(usr[3:4])
  group_w <- max(w + label_w, title_w)

  if (!is.null(anchor)) {
    left <- anchor[1]
    top <- anchor[2]
  } else {
    right_side <- grepl("right", pos)
    top_side <- !grepl("bottom", pos)
    # On the right, set the group's right edge (bar + labels / title) at the
    # plot edge so labels and title stay inside.
    left <- if (right_side) usr[2] - pad - group_w else usr[1] + pad
    top <- if (top_side) usr[4] - pad - title_h else usr[3] + pad + h
  }

  nseg <- 50
  ys <- seq(top - h, top, length.out = nseg + 1)
  ramp <- grDevices::colorRamp(g$ramp)
  cols <- grDevices::rgb(
    ramp(seq(0, 1, length.out = nseg)),
    maxColorValue = 255
  )
  graphics::rect(
    left,
    ys[-(nseg + 1)],
    left + w,
    ys[-1],
    col = cols,
    border = NA
  )
  graphics::rect(left, top - h, left + w, top, border = "grey40")
  graphics::text(
    left + w + gap_lbl,
    c(top - h, top),
    labels = labs,
    adj = c(0, 0.5),
    cex = 0.8
  )
  if (!is.null(g$name)) {
    graphics::text(left, top + title_h, labels = g$name, adj = c(0, 0))
  }

  list(left = left, top = top + title_h, w = group_w, h = h + title_h)
}
