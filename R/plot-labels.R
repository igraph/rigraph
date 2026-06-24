#   IGraph R package
#   Copyright (C) 2003-2012  Gabor Csardi <csardi.gabor@gmail.com>
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
###################################################################

# Label decluttering (feature F6): a helper that keeps only the most prominent
# labels and blanks the rest with NA. Because plot.igraph() omits NA labels,
# the result can be passed straight to a label argument, e.g.
# plot(g, vertex.label = label_top(degree(g), n = 10)).

#' Keep only the most prominent labels
#'
#' `label_top()` returns a label vector with `NA` everywhere except the entries
#' that rank highest by `by`. Because [plot.igraph()] omits `NA` labels, this is
#' a convenient way to declutter dense graphs by labelling only the most
#' important vertices (or edges). Pass it to a label argument, e.g.
#' `plot(g, vertex.label = label_top(degree(g), n = 10))`.
#'
#' To label everything above a fixed cutoff instead of a fixed count, you do not
#' need this helper: `ifelse(metric > cutoff, labels, NA)` works directly.
#'
#' @param by A numeric vector of scores to rank by, e.g. `degree(g)` or
#'   `betweenness(g)`. One score per vertex (or edge).
#' @param n Number of labels to keep (the top `n` by `by`). Give either `n` or
#'   `prop`, not both. If neither is given, all labels are kept.
#' @param prop Proportion of labels to keep, between 0 and 1; rounded up. Give
#'   either `n` or `prop`, not both.
#' @param labels The labels to thin. Defaults to `names(by)` if present,
#'   otherwise the integer positions. Must have the same length as `by`.
#' @param decreasing Logical; if `TRUE` (the default) the highest `by` values
#'   are kept, otherwise the lowest.
#' @return A character vector the same length as `by`, with `NA` in the
#'   positions that are not kept.
#' @examples
#' g <- make_ring(10)
#' plot(g, vertex.label = label_top(degree(g), n = 3))
#' @export
label_top <- function(
  by,
  n = NULL,
  prop = NULL,
  labels = NULL,
  decreasing = TRUE
) {
  if (!is.numeric(by)) {
    cli::cli_abort("{.arg by} must be a numeric vector.")
  }
  if (!is.null(n) && !is.null(prop)) {
    cli::cli_abort("Give either {.arg n} or {.arg prop}, not both.")
  }

  labels <- labels %||% names(by) %||% as.character(seq_along(by))
  if (length(labels) != length(by)) {
    cli::cli_abort("{.arg labels} must have the same length as {.arg by}.")
  }

  k <- if (!is.null(n)) {
    as.integer(n)
  } else if (!is.null(prop)) {
    if (prop < 0 || prop > 1) {
      cli::cli_abort("{.arg prop} must be between 0 and 1.")
    }
    as.integer(ceiling(prop * length(by)))
  } else {
    length(by)
  }

  keep <- rank(
    if (decreasing) -by else by,
    ties.method = "min",
    na.last = TRUE
  ) <=
    k
  out <- as.character(labels)
  out[!keep] <- NA_character_
  out
}
