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

# Reserve outer-margin space (par("mar"), in text lines) on the legend side, so
# guides are drawn outside the plotting box rather than over the graph. Width
# (left/right) scales with the longest label/title; height (top/bottom) is a
# fixed allowance for one horizontal row plus a title.
i.legend_reserve_mar <- function(mar, side, guides) {
  idx <- switch(side, bottom = 1L, left = 2L, top = 3L, right = 4L)
  if (side %in% c("right", "left")) {
    maxchar <- max(vapply(
      guides,
      function(g) {
        labs <- if (g$type == "continuous") {
          format(g$limits, digits = 3)
        } else {
          g$labels
        }
        max(nchar(c(labs, if (is.null(g$name)) "" else g$name)), 0L)
      },
      numeric(1)
    ))
    mar[idx] <- max(mar[idx], 3 + 0.65 * maxchar)
  } else {
    mar[idx] <- max(mar[idx], 5)
  }
  mar
}

# Draw all guides in the reserved margin on `side`. left/right stack vertically;
# top/bottom lay each guide's entries out in a row (horiz = TRUE) and stack
# guides left-to-right.
i.draw_guides <- function(guides, side) {
  usr <- graphics::par("usr")
  old <- graphics::par(xpd = NA)
  on.exit(graphics::par(old), add = TRUE)

  horiz <- side %in% c("top", "bottom")
  xr <- diff(usr[1:2])
  yr <- diff(usr[3:4])
  offx <- 0.04 * xr
  offy <- 0.06 * yr

  spec <- switch(
    side,
    right = list(x = usr[2] + offx, y = usr[4], xjust = 0, yjust = 1),
    left = list(x = usr[1] - offx, y = usr[4], xjust = 1, yjust = 1),
    top = list(x = usr[1], y = usr[4] + offy, xjust = 0, yjust = 0),
    bottom = list(x = usr[1], y = usr[3] - offy, xjust = 0, yjust = 1)
  )
  gap <- 0.03 * (if (horiz) xr else yr)

  for (g in guides) {
    rect <- i.draw_one_guide(g, spec, horiz)
    if (horiz) {
      spec$x <- rect$left + rect$w + gap
    } else {
      spec$y <- rect$top - rect$h - gap
    }
  }
  invisible(NULL)
}

# Draw one guide at the anchor/justification in `spec`; return list(left, top,
# w, h) for stacking.
i.draw_one_guide <- function(g, spec, horiz) {
  if (g$type == "continuous") {
    return(i.draw_colorbar(g, spec, horiz))
  }
  args <- list(
    x = spec$x,
    y = spec$y,
    xjust = spec$xjust,
    yjust = spec$yjust,
    legend = g$labels,
    title = g$name,
    pch = 21,
    bty = "n",
    horiz = horiz
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

# Continuous colour guide. Vertical bar for left/right, horizontal bar for
# top/bottom. `spec` gives the anchor (x, y) and justification (matching
# graphics::legend); returns the box rect for stacking.
i.draw_colorbar <- function(g, spec, horiz) {
  usr <- graphics::par("usr")
  xr <- diff(usr[1:2])
  yr <- diff(usr[3:4])
  labs <- format(g$limits, digits = 3)
  fill <- grDevices::rgb(
    grDevices::colorRamp(g$ramp)(seq(0, 1, length.out = 50)),
    maxColorValue = 255
  )
  line_h <- 1.4 * graphics::strheight("M")
  title_h <- if (is.null(g$name)) 0 else line_h

  if (horiz) {
    barw <- 0.25 * xr
    barh <- 0.04 * yr
    w <- barw
    h <- barh + line_h + title_h
    left <- spec$x - spec$xjust * w
    top <- spec$y + (1 - spec$yjust) * h
    bar_top <- top - title_h
    xs <- seq(left, left + barw, length.out = 51)
    graphics::rect(xs[-51], bar_top - barh, xs[-1], bar_top, col = fill, border = NA)
    graphics::rect(left, bar_top - barh, left + barw, bar_top, border = "grey40")
    ylab <- bar_top - barh - 0.2 * line_h
    graphics::text(left, ylab, labs[1], adj = c(0, 1), cex = 0.8)
    graphics::text(left + barw, ylab, labs[2], adj = c(1, 1), cex = 0.8)
    if (!is.null(g$name)) {
      graphics::text(left, top, labels = g$name, adj = c(0, 1))
    }
  } else {
    barw <- 0.03 * xr
    barh <- 0.25 * yr
    label_w <- max(graphics::strwidth(labs, cex = 0.8)) + 0.01 * xr
    w <- barw + label_w
    h <- barh + title_h
    left <- spec$x - spec$xjust * w
    top <- spec$y + (1 - spec$yjust) * h
    bar_top <- top - title_h
    ys <- seq(bar_top - barh, bar_top, length.out = 51)
    graphics::rect(left, ys[-51], left + barw, ys[-1], col = fill, border = NA)
    graphics::rect(left, bar_top - barh, left + barw, bar_top, border = "grey40")
    graphics::text(
      left + barw + 0.01 * xr,
      c(bar_top - barh, bar_top),
      labels = labs,
      adj = c(0, 0.5),
      cex = 0.8
    )
    if (!is.null(g$name)) {
      graphics::text(left, top, labels = g$name, adj = c(0, 1))
    }
  }
  list(left = left, top = top, w = w, h = h)
}
