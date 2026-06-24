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

###################################################################
# Recording renderer + SVG writer (feature F5, phase 2)
###################################################################

# Canonicalise a colour vector to "#RRGGBBAA" hex (resolving palette indices and
# names against the active device), keeping NA as NA. Self-contained output.
i.col_to_hex <- function(col) {
  if (is.null(col)) {
    return(NA_character_)
  }
  out <- rep(NA_character_, length(col))
  ok <- !is.na(col)
  if (any(ok)) {
    m <- grDevices::col2rgb(col[ok], alpha = TRUE)
    out[ok] <- grDevices::rgb(m[1, ], m[2, ], m[3, ], m[4, ], maxColorValue = 255)
  }
  out
}

# A renderer that records primitives into a backend-neutral draw list instead of
# drawing. init_canvas still sets up the coordinate system on the (offscreen)
# device so geometry that reads par("usr")/xyinch() resolves correctly; nothing
# else is drawn. Colours are canonicalised to hex at record time. The current
# group (set by group_begin/end) is attached to each primitive.
i.renderer_record <- function() {
  st <- new.env(parent = emptyenv())
  st$prims <- list()
  st$canvas <- NULL
  st$group <- NULL
  add <- function(p) {
    p$group <- st$group
    st$prims[[length(st$prims) + 1L]] <- p
  }
  base <- i.renderer_base()
  list(
    .state = st,
    init_canvas = function(xlim, ylim, xlab, ylab, axes, frame.plot, asp, main, sub) {
      # establish the coordinate system (discarded device); record the range
      base$init_canvas(xlim, ylim, "", "", FALSE, FALSE, asp, "", "")
      st$canvas <- list(usr = graphics::par("usr"))
    },
    segments = function(x0, y0, x1, y1, col = NA, lwd = 1, lty = 1) {
      add(list(type = "segments", x0 = x0, y0 = y0, x1 = x1, y1 = y1,
               col = i.col_to_hex(col), lwd = lwd))
    },
    polyline = function(x, y = NULL, col = NA, lwd = 1, lty = 1) {
      xy <- grDevices::xy.coords(x, y)
      add(list(type = "polyline", x = xy$x, y = xy$y, col = i.col_to_hex(col), lwd = lwd))
    },
    polygon = function(x, y = NULL, col = NA, border = NULL, lwd = 1, lty = 1,
                       density = NULL, angle = 45, ...) {
      xy <- grDevices::xy.coords(x, y)
      add(list(type = "polygon", x = xy$x, y = xy$y, col = i.col_to_hex(col),
               border = i.col_to_hex(border), lwd = lwd))
    },
    xspline = function(x, y = NULL, shape, open, col = NA, border = NA, lwd = 1) {
      pts <- grDevices::xspline(x, y, shape = shape, open = open, draw = FALSE)
      add(list(type = "polygon", x = pts$x, y = pts$y, col = i.col_to_hex(col),
               border = i.col_to_hex(border), lwd = lwd))
    },
    text = function(x, y, labels, col = NA, family = "", font = 1, cex = 1,
                    srt = 0, adj = NULL) {
      add(list(type = "text", x = x, y = y, labels = labels,
               col = i.col_to_hex(col), cex = cex, srt = srt, adj = adj))
    },
    symbols = function(kind, x, y, dim, bg = NA, fg = NA, lwd = 1) {
      add(list(type = "symbols", kind = kind, x = x, y = y, dim = dim,
               bg = i.col_to_hex(bg), fg = i.col_to_hex(fg), lwd = lwd))
    },
    raster = function(image, xleft, ybottom, xright, ytop) {
      add(list(type = "raster", xleft = xleft, ybottom = ybottom,
               xright = xright, ytop = ytop))
    },
    group_begin = function(type, id = NULL, title = NULL) {
      st$group <- list(type = type, id = id, title = title)
    },
    group_end = function() {
      st$group <- NULL
    }
  )
}

# ---- SVG writer -------------------------------------------------------------

i.svg_attr_esc <- function(x) {
  x <- gsub("&", "&amp;", x, fixed = TRUE)
  x <- gsub("<", "&lt;", x, fixed = TRUE)
  x <- gsub(">", "&gt;", x, fixed = TRUE)
  gsub("'", "&apos;", x, fixed = TRUE)
}

# SVG colour + opacity from an "#RRGGBBAA" hex; returns c(fill, opacity).
i.svg_col <- function(hex) {
  if (length(hex) == 0 || is.na(hex)) {
    return(c("none", "1"))
  }
  if (nchar(hex) >= 9) {
    a <- strtoi(substr(hex, 8, 9), 16L) / 255
    c(substr(hex, 1, 7), format(round(a, 3)))
  } else {
    c(hex, "1")
  }
}

# Build an SVG document string from a recorded draw list. `wpx`/`hpx` are the
# pixel canvas size; primitives (in user coords) are mapped via the recorded
# usr range with the y axis flipped. Vertices get per-element ids/titles; edges
# are wrapped per-edge group; everything else is grouped by phase.
i.svg_from_record <- function(state, wpx, hpx) {
  usr <- state$canvas$usr
  if (is.null(usr)) {
    usr <- c(-1, 1, -1, 1)
  }
  sxr <- wpx / (usr[2] - usr[1])
  syr <- hpx / (usr[4] - usr[3])
  X <- function(x) (x - usr[1]) * sxr
  Y <- function(y) hpx - (y - usr[3]) * syr
  S <- function(s) s * sxr # user-length -> px (asp == 1)

  pts_str <- function(x, y) paste(sprintf("%.2f,%.2f", X(x), Y(y)), collapse = " ")
  stroke <- function(hex, lwd) {
    sc <- i.svg_col(hex)
    sprintf("stroke='%s' stroke-opacity='%s' stroke-width='%.2f'", sc[1], sc[2], max(lwd, 0.1))
  }
  fillattr <- function(hex) {
    fc <- i.svg_col(hex)
    sprintf("fill='%s' fill-opacity='%s'", fc[1], fc[2])
  }

  one <- function(p, vtitle) {
    # returns a character vector of SVG element strings
    switch(
      p$type,
      segments = {
        n <- length(p$x0)
        col <- rep(p$col, length.out = n)
        vapply(seq_len(n), function(k) {
          sprintf(
            "<line x1='%.2f' y1='%.2f' x2='%.2f' y2='%.2f' %s fill='none'/>",
            X(p$x0[k]), Y(p$y0[k]), X(p$x1[k]), Y(p$y1[k]),
            stroke(col[k], p$lwd)
          )
        }, character(1))
      },
      polyline = sprintf(
        "<polyline points='%s' fill='none' %s/>",
        pts_str(p$x, p$y), stroke(p$col, p$lwd)
      ),
      polygon = sprintf(
        "<polygon points='%s' %s %s/>",
        pts_str(p$x, p$y), fillattr(p$col), stroke(p$border, p$lwd)
      ),
      text = {
        n <- length(p$x)
        col <- rep(p$col, length.out = n)
        adj <- if (is.null(p$adj)) 0.5 else p$adj[1]
        anchor <- c("start", "middle", "end")[findInterval(adj, c(-Inf, 0.25, 0.75, Inf))]
        fc <- i.svg_col(col[1])
        lab <- as.character(p$labels)
        keep <- which(!is.na(lab) & nzchar(lab)) # base skips NA/empty labels
        vapply(keep, function(k) {
          rot <- if (p$srt != 0) sprintf(" transform='rotate(%.2f %.2f %.2f)'", -p$srt, X(p$x[k]), Y(p$y[k])) else ""
          sprintf(
            "<text x='%.2f' y='%.2f' font-size='%.1f' text-anchor='%s' dominant-baseline='central' fill='%s' fill-opacity='%s'%s>%s</text>",
            X(p$x[k]), Y(p$y[k]), p$cex * 12, anchor, fc[1], fc[2], rot,
            i.svg_attr_esc(lab[k])
          )
        }, character(1))
      },
      symbols = {
        n <- length(p$x)
        bg <- rep(p$bg, length.out = n)
        fg <- rep(p$fg, length.out = n)
        out <- character(n)
        for (k in seq_len(n)) {
          idattr <- ""
          if (!is.null(vtitle)) {
            kk <- vtitle$counter
            idattr <- sprintf(" id='vertex-%d'", kk)
            ttl <- if (!is.null(vtitle$titles)) sprintf("<title>%s</title>", i.svg_attr_esc(vtitle$titles[kk])) else ""
            vtitle$counter <- kk + 1L
          } else {
            ttl <- ""
          }
          shp <- if (p$kind == "circles") {
            sprintf("<circle cx='%.2f' cy='%.2f' r='%.2f' %s %s/>",
                    X(p$x[k]), Y(p$y[k]), S(p$dim[k]), fillattr(bg[k]), stroke(fg[k], p$lwd))
          } else if (p$kind == "squares") {
            h <- p$dim[k] / 2
            sprintf("<rect x='%.2f' y='%.2f' width='%.2f' height='%.2f' %s %s/>",
                    X(p$x[k] - h), Y(p$y[k] + h), S(p$dim[k]), S(p$dim[k]), fillattr(bg[k]), stroke(fg[k], p$lwd))
          } else {
            # rectangles: dim is n x 2 (full width, height)
            w <- if (is.matrix(p$dim)) p$dim[k, 1] else p$dim[1]
            hh <- if (is.matrix(p$dim)) p$dim[k, 2] else p$dim[2]
            sprintf("<rect x='%.2f' y='%.2f' width='%.2f' height='%.2f' %s %s/>",
                    X(p$x[k] - w / 2), Y(p$y[k] + hh / 2), S(w), S(hh), fillattr(bg[k]), stroke(fg[k], p$lwd))
          }
          out[k] <- paste0(if (nzchar(idattr)) sprintf("<g%s>%s%s</g>", idattr, ttl, shp) else shp)
        }
        out
      },
      raster = sprintf(
        # v1 placeholder for sphere/raster shapes
        "<rect x='%.2f' y='%.2f' width='%.2f' height='%.2f' fill='#cccccc' stroke='#888888'/>",
        X(p$xleft), Y(p$ytop), S(p$xright - p$xleft), S(p$ytop - p$ybottom)
      ),
      character(0)
    )
  }

  body <- character(0)
  prims <- state$prims
  cur_key <- NA_character_
  open_g <- FALSE
  vtitle <- NULL # environment-like tracker for vertex ids within a vertices group

  group_key <- function(g) if (is.null(g)) "" else paste0(g$type, ":", if (is.null(g$id)) "" else g$id)

  for (p in prims) {
    g <- p$group
    key <- group_key(g)
    if (!identical(key, cur_key)) {
      if (open_g) {
        body <- c(body, "</g>")
        open_g <- FALSE
      }
      vtitle <- NULL
      if (!is.null(g)) {
        if (identical(g$type, "vertices")) {
          body <- c(body, "<g class='igraph-vertices'>")
          vtitle <- new.env(parent = emptyenv())
          vtitle$counter <- 1L
          vtitle$titles <- g$title
        } else if (identical(g$type, "edge")) {
          ttl <- if (!is.null(g$title)) sprintf("<title>%s</title>", i.svg_attr_esc(as.character(g$title))) else ""
          body <- c(body, sprintf("<g id='edge-%s' class='igraph-edge'>%s", as.character(g$id), ttl))
        } else {
          body <- c(body, sprintf("<g class='igraph-%s'>", g$type))
        }
        open_g <- TRUE
      }
      cur_key <- key
    }
    body <- c(body, one(p, vtitle))
  }
  if (open_g) {
    body <- c(body, "</g>")
  }

  c(
    sprintf("<svg xmlns='http://www.w3.org/2000/svg' width='%d' height='%d' viewBox='0 0 %d %d'>", wpx, hpx, wpx, hpx),
    "<rect width='100%' height='100%' fill='white'/>",
    body,
    "</svg>"
  )
}

#' Render a graph to SVG
#'
#' `as_svg()` draws a graph to a standalone SVG string using the same geometry
#' as [plot.igraph()], but emits per-vertex `<g id="vertex-N">` groups with
#' `<title>` tooltips (and per-edge groups), giving lightweight interactivity
#' (hover) with no JavaScript. It accepts the usual plotting parameters via
#' `...`.
#'
#' Vertices, edges (all styles), arrowheads, labels, mark groups and pie shapes
#' are rendered; `sphere`/`raster` vertex shapes are drawn as a placeholder box
#' in this version.
#'
#' @param graph The graph to plot.
#' @param file Optional path to write the SVG to. If `NULL` (default) the SVG
#'   string is returned invisibly.
#' @param width,height Size in inches (the SVG is `width*72` x `height*72` px).
#' @param tooltips Optional vertex attribute name to use for the `<title>`
#'   tooltips; defaults to the vertex `name` attribute (or vertex index).
#' @param ... Further plotting parameters passed to [plot.igraph()].
#' @return The SVG string, invisibly (also written to `file` if given).
#' @export
as_svg <- function(graph, file = NULL, width = 7, height = 7, tooltips = NULL, ...) {
  ensure_igraph(graph)

  titles <- if (!is.null(tooltips)) {
    as.character(vertex_attr(graph, tooltips))
  } else if ("name" %in% vertex_attr_names(graph)) {
    as.character(V(graph)$name)
  } else {
    as.character(seq_len(vcount(graph)))
  }

  rec <- i.renderer_record()
  grDevices::pdf(NULL, width = width, height = height)
  on.exit(grDevices::dev.off(), add = TRUE)
  i.with_renderer(rec, {
    i.render_state$vertex_titles <- titles
    on.exit(i.render_state$vertex_titles <- NULL, add = TRUE)
    plot(graph, ...)
  })

  svg <- i.svg_from_record(rec$.state, wpx = round(width * 72), hpx = round(height * 72))
  svg <- paste(svg, collapse = "\n")
  if (!is.null(file)) {
    writeLines(svg, file)
  }
  invisible(svg)
}
