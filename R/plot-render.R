#   IGraph R package
#   Copyright (C) 2003-2012  Gabor Csardi <csardi.gabor@gmail.com>
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
###################################################################

# Stage-3 rendering indirection (feature F5).
#
# Drawing code emits primitives through the i.r_*() dispatchers instead of
# calling base graphics directly. The dispatchers forward to the "current"
# renderer, a small list of closures held in i.render_state. The default base
# renderer simply calls the corresponding base-graphics function, so on-screen
# output is unchanged. A recording / SVG renderer (added in a later step) can
# capture the same primitive stream to build a backend-neutral draw list.

i.render_state <- new.env(parent = emptyenv())
i.render_state$cur <- NULL

# The base renderer: each method draws with the matching base-graphics call.
i.renderer_base <- function() {
  list(
    init_canvas = function(
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
      graphics::plot(
        0,
        0,
        type = "n",
        xlab = xlab,
        ylab = ylab,
        xlim = xlim,
        ylim = ylim,
        axes = axes,
        frame.plot = ifelse(is.null(frame.plot), axes, frame.plot),
        asp = asp,
        main = main,
        sub = sub
      )
    },
    segments = function(x0, y0, x1, y1, col = graphics::par("fg"), lwd = 1, lty = 1) {
      graphics::segments(x0, y0, x1, y1, col = col, lwd = lwd, lty = lty)
    },
    polyline = function(x, y = NULL, col = graphics::par("fg"), lwd = 1, lty = 1) {
      graphics::lines(x, y, col = col, lwd = lwd, lty = lty)
    },
    polygon = function(
      x,
      y,
      col = NA,
      border = NULL,
      lwd = 1,
      lty = 1,
      density = NULL,
      angle = 45,
      ...
    ) {
      graphics::polygon(
        x,
        y,
        col = col,
        border = border,
        lwd = lwd,
        lty = lty,
        density = density,
        angle = angle,
        ...
      )
    },
    xspline = function(x, y = NULL, shape, open, col, border, lwd) {
      graphics::xspline(
        x,
        y,
        shape = shape,
        open = open,
        col = col,
        border = border,
        lwd = lwd
      )
    },
    text = function(x, y, labels, col, family, font, cex, srt = 0, adj = NULL) {
      graphics::text(
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
    },
    # One symbols() call. `kind` is "circles", "squares" or "rectangles"; `dim`
    # is the matching size spec (vector, or 2-column matrix for rectangles).
    symbols = function(kind, x, y, dim, bg, fg, lwd) {
      args <- list(
        x = x,
        y = y,
        bg = bg,
        fg = fg,
        lwd = lwd,
        add = TRUE,
        inches = FALSE
      )
      args[[kind]] <- dim
      do.call(graphics::symbols, args)
    },
    raster = function(image, xleft, ybottom, xright, ytop) {
      graphics::rasterImage(image, xleft, ybottom, xright, ytop)
    },
    # Grouping hooks for backends that tag elements (e.g. SVG ids); the base
    # renderer ignores them.
    group_begin = function(type, id, title = NULL) invisible(NULL),
    group_end = function() invisible(NULL)
  )
}

# The current renderer, defaulting to base on first use.
i.cur_renderer <- function() {
  if (is.null(i.render_state$cur)) {
    i.render_state$cur <- i.renderer_base()
  }
  i.render_state$cur
}

# Evaluate `expr` with `renderer` installed as the current renderer.
i.with_renderer <- function(renderer, expr) {
  old <- i.render_state$cur
  i.render_state$cur <- renderer
  on.exit(i.render_state$cur <- old, add = TRUE)
  force(expr)
}

# --- dispatchers -------------------------------------------------------------
i.r_init_canvas <- function(...) i.cur_renderer()$init_canvas(...)
i.r_segments <- function(...) i.cur_renderer()$segments(...)
i.r_polyline <- function(...) i.cur_renderer()$polyline(...)
i.r_polygon <- function(...) i.cur_renderer()$polygon(...)
i.r_xspline <- function(...) i.cur_renderer()$xspline(...)
i.r_text <- function(...) i.cur_renderer()$text(...)
i.r_symbols <- function(...) i.cur_renderer()$symbols(...)
i.r_raster <- function(...) i.cur_renderer()$raster(...)
i.r_group_begin <- function(...) i.cur_renderer()$group_begin(...)
i.r_group_end <- function(...) i.cur_renderer()$group_end(...)
