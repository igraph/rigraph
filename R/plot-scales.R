#   IGraph R package
#   Copyright (C) 2003-2012  Gabor Csardi <csardi.gabor@gmail.com>
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
###################################################################

# Scales: map a data vector to a plotting aesthetic (colour or size) AND record
# a "guide" describing the mapping, so that plot.igraph() can
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


# Map the `legend` argument to a margin side. TRUE -> "right"; "right"/"left"/
# "top"/"bottom" are used directly; corner keywords map to the nearest side.
# Returns NULL when there is nothing to draw.
i.legend_side <- function(legend, guides) {
  if (isFALSE(legend) || length(guides) == 0) {
    return(NULL)
  }
  if (isTRUE(legend)) {
    return("right")
  }
  pos <- as.character(legend)[1]
  if (pos %in% c("right", "left", "top", "bottom")) {
    return(pos)
  }
  if (grepl("left", pos)) {
    return("left")
  }
  if (grepl("right", pos)) {
    return("right")
  }
  if (grepl("top", pos)) {
    return("top")
  }
  if (grepl("bottom", pos)) {
    return("bottom")
  }
  "right"
}

# Split the device into a plot region and a guide region, as device-relative
# (NDC) fractions for par("fig"). Using fig regions (rather than data-coordinate
# offsets) keeps the guide put and correctly sized when the device is resized.
i.legend_fig <- function(side) {
  frac_v <- 0.22 # width fraction for a left/right guide
  frac_h <- 0.18 # height fraction for a top/bottom guide
  switch(
    side,
    right = list(plot = c(0, 1 - frac_v, 0, 1), guide = c(1 - frac_v, 1, 0, 1)),
    left = list(plot = c(frac_v, 1, 0, 1), guide = c(0, frac_v, 0, 1)),
    top = list(plot = c(0, 1, 0, 1 - frac_h), guide = c(0, 1, 1 - frac_h, 1)),
    bottom = list(plot = c(0, 1, frac_h, 1), guide = c(0, 1, 0, frac_h))
  )
}

# Draw the guides in the current figure region (set by the caller via par(fig)).
# A fresh [0, 1] x [0, 1] window is set up and the guides are centred in it:
# stacked vertically for left/right, laid out in a row for top/bottom (with each
# guide's own entries arranged horizontally).
i.draw_guides_region <- function(guides, side) {
  graphics::par(mar = c(0.4, 0.4, 0.4, 0.4))
  graphics::plot.new()
  graphics::plot.window(xlim = c(0, 1), ylim = c(0, 1))
  graphics::par(xpd = NA)

  horiz <- side %in% c("top", "bottom")
  # Measure each guide first so the whole stack can be centred.
  rects <- lapply(guides, function(g) {
    i.guide_draw(g, 0.5, 0.5, 0.5, 0.5, horiz, plot = FALSE)
  })
  gap <- 0.04

  if (horiz) {
    ws <- vapply(rects, function(r) r$w, numeric(1))
    total <- sum(ws) + gap * max(0, length(guides) - 1)
    x <- 0.5 - total / 2
    for (i in seq_along(guides)) {
      i.guide_draw(guides[[i]], x, 0.5, 0, 0.5, horiz = TRUE, plot = TRUE)
      x <- x + ws[i] + gap
    }
  } else {
    hs <- vapply(rects, function(r) r$h, numeric(1))
    total <- sum(hs) + gap * max(0, length(guides) - 1)
    y <- 0.5 + total / 2
    for (i in seq_along(guides)) {
      i.guide_draw(guides[[i]], 0.5, y, 0.5, 1, horiz = FALSE, plot = TRUE)
      y <- y - hs[i] - gap
    }
  }
  invisible(NULL)
}

# Draw (or, with plot = FALSE, just measure) one guide at the given anchor and
# justification. Returns list(left, top, w, h) in the current user coordinates.
i.guide_draw <- function(g, x, y, xjust, yjust, horiz, plot) {
  if (g$type == "continuous") {
    return(i.colorbar(g, x, y, xjust, yjust, horiz, plot))
  }
  args <- list(
    x = x,
    y = y,
    xjust = xjust,
    yjust = yjust,
    legend = g$labels,
    title = g$name,
    pch = 21,
    bty = "n",
    horiz = horiz,
    plot = plot
  )
  if (g$aesthetic == "color") {
    args$pt.bg <- g$colors
    args$pt.cex <- 1.8
  } else {
    args$pt.bg <- "grey70"
    args$pt.cex <- i.size_to_cex(g$sizes)
  }
  do.call(graphics::legend, args)$rect
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

# Continuous colour guide (colorbar), in the current [0, 1] guide window.
# Vertical bar for left/right, horizontal bar for top/bottom. `plot = FALSE`
# measures only. Returns list(left, top, w, h).
i.colorbar <- function(g, x, y, xjust, yjust, horiz, plot) {
  labs <- format(g$limits, digits = 3)
  fill <- grDevices::rgb(
    grDevices::colorRamp(g$ramp)(seq(0, 1, length.out = 50)),
    maxColorValue = 255
  )
  lh <- 1.2 * graphics::strheight("M")
  title_h <- if (is.null(g$name)) 0 else lh

  if (horiz) {
    barw <- 0.5
    barh <- 0.12
    w <- barw
    h <- barh + lh + title_h
  } else {
    barw <- 0.12
    label_w <- max(graphics::strwidth(labs, cex = 0.8)) + 0.02
    barh <- 0.5
    w <- barw + label_w
    h <- barh + title_h
  }
  left <- x - xjust * w
  top <- y + (1 - yjust) * h

  if (plot) {
    bar_top <- top - title_h
    if (horiz) {
      xs <- seq(left, left + barw, length.out = 51)
      graphics::rect(xs[-51], bar_top - barh, xs[-1], bar_top, col = fill, border = NA)
      graphics::rect(left, bar_top - barh, left + barw, bar_top, border = "grey40")
      ylab <- bar_top - barh - 0.2 * lh
      graphics::text(left, ylab, labs[1], adj = c(0, 1), cex = 0.8)
      graphics::text(left + barw, ylab, labs[2], adj = c(1, 1), cex = 0.8)
      if (!is.null(g$name)) {
        graphics::text(left + barw / 2, top, g$name, adj = c(0.5, 1))
      }
    } else {
      ys <- seq(bar_top - barh, bar_top, length.out = 51)
      graphics::rect(left, ys[-51], left + barw, ys[-1], col = fill, border = NA)
      graphics::rect(left, bar_top - barh, left + barw, bar_top, border = "grey40")
      graphics::text(
        left + barw + 0.02,
        c(bar_top - barh, bar_top),
        labels = labs,
        adj = c(0, 0.5),
        cex = 0.8
      )
      if (!is.null(g$name)) {
        graphics::text(left, top, g$name, adj = c(0, 1))
      }
    }
  }
  list(left = left, top = top, w = w, h = h)
}
