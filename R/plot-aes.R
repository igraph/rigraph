#   IGraph R package
#   Copyright (C) 2003-2012  Gabor Csardi <csardi.gabor@gmail.com>
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
###################################################################

# Stage 1 of the plotting pipeline: turn resolved plotting parameters into a
# typed, rectangular aesthetic table so that downstream code can slice it by
# vertex/edge index instead of re-implementing the
# `if (length(x) > 1) x[idx]` idiom for every parameter.
#
# Aesthetic resolution itself (the precedence chain
# argument > graph attribute > igraph option > default) still lives in
# `i.parse.plot.params()`; this layer only packages the already-resolved values.

# Build an aesthetic table from a named list of columns, each recycled to `n`
# rows. Recycling uses `rep(length.out = n)` to match the historical (lenient)
# plotting behavior; downstream consumers (`mapply()`, `igraph.Arrows()`) recycle
# their arguments anyway, so a length-1 column behaves identically whether it is
# kept scalar or expanded here.
#
# Returns a vctrs data frame, which is type-stable (no factor coercion) and can
# be subset with `vctrs::vec_slice()`.
i.aes_table <- function(cols, n) {
  cols <- lapply(cols, function(x) rep(x, length.out = n))
  vctrs::new_data_frame(cols, n = as.integer(n))
}

# Edge aesthetic table for the per-edge visual properties that are subset by
# edge index when drawing loop vs. non-loop edges. `loop.angle` (nullable) and
# vertex-scoped properties are handled separately by the caller.
i.edge_aes_table <- function(
  color,
  width,
  lty,
  arrow.mode,
  arrow.size,
  curved,
  label.color,
  label.family,
  label.font,
  label.cex,
  n
) {
  i.aes_table(
    list(
      color = color,
      width = width,
      lty = lty,
      arrow.mode = arrow.mode,
      arrow.size = arrow.size,
      curved = curved,
      label.color = label.color,
      label.family = label.family,
      label.font = label.font,
      label.cex = label.cex
    ),
    n = n
  )
}
