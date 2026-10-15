#'   Is a degree sequence graphical?
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.graphical.degree.sequence()` was renamed to [is_graphical()] to create a more
#' consistent API.
#' @inheritParams is_graphical
#' @keywords internal
#' @export
is.graphical.degree.sequence <- function(
  out.deg,
  in.deg = NULL,
  allowed.edge.types = c("simple", "loops", "multi", "all")
) {
  # nocov start
  lifecycle::deprecate_warn(
    "2.0.0",
    "is.graphical.degree.sequence()",
    "is_graphical()"
  )
  is_graphical(
    out.deg = out.deg,
    in.deg = in.deg,
    allowed.edge.types = allowed.edge.types
  )
} # nocov end

#' Check if a degree sequence is valid for a multi-graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `is.degree.sequence()` was renamed to [is_degseq()] to create a more
#' consistent API.
#' @inheritParams is_degseq
#' @keywords internal
#' @export
is.degree.sequence <- function(out.deg, in.deg = NULL) {
  # nocov start
  lifecycle::deprecate_warn("2.0.0", "is.degree.sequence()", "is_degseq()")
  is_degseq(out.deg = out.deg, in.deg = in.deg)
} # nocov end

## -----------------------------------------------------------------------
##
##   IGraph R package
##   Copyright (C) 2015  Gabor Csardi <csardi.gabor@gmail.com>
##   334 Harvard street, Cambridge, MA 02139 USA
##
##   This program is free software; you can redistribute it and/or modify
##   it under the terms of the GNU General Public License as published by
##   the Free Software Foundation; either version 2 of the License, or
##   (at your option) any later version.
##
##   This program is distributed in the hope that it will be useful,
##   but WITHOUT ANY WARRANTY; without even the implied warranty of
##   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##   GNU General Public License for more details.
##
##   You should have received a copy of the GNU General Public License
##   along with this program; if not, write to the Free Software
##   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
##   02110-1301 USA
##
## -----------------------------------------------------------------------

#' Check if a degree sequence is valid for a multi-graph
#'
#' `is_degseq()` checks whether the given vertex degrees (in- and
#' out-degrees for directed graphs) can be realized by a graph. Note that the
#' graph does not have to be simple, it may contain loop and multiple edges.
#' For undirected graphs, it also checks whether the sum of degrees is even.
#' For directed graphs, the function checks whether the lengths of the two
#' degree vectors are equal and whether their sums are also equal. These are
#' known sufficient and necessary conditions for a degree sequence to be valid.
#'
#' @aliases is_degseq
#' @param out_deg Integer vector, the degree sequence for undirected graphs, or
#'   the out-degree sequence for directed graphs.
#' @param out.deg `r lifecycle::badge("deprecated")` Use `out_deg` instead.
#' @param in_deg `NULL` or an integer vector. For undirected graphs, it
#'   should be `NULL`. For directed graphs it specifies the in-degrees.
#' @param in.deg `r lifecycle::badge("deprecated")` Use `in_deg` instead.
#' @return A logical scalar.
#' @author Tamás Nepusz \email{ntamas@@gmail.com} and Szabolcs Horvát \email{szhorvat@gmail.com}
#' @references Z Király, Recognizing graphic degree sequences and generating
#' all realizations. TR-2011-11, Egerváry Research Group, H-1117, Budapest,
#' Hungary. ISSN 1587-4451 (2012).
#'
#' B. Cloteaux, Is This for Real? Fast Graphicality Testing, *Comput. Sci. Eng.* 17, 91 (2015).
#'
#' A. Berger, A note on the characterization of digraphic sequences, *Discrete Math.* 314, 38 (2014).
#'
#' G. Cairns and S. Mendan, Degree Sequence for Graphs with Loops (2013).
#'
#' @keywords graphs
#'
#' @family graphical degree sequences
#' @examples
#' g <- sample_gnp(100, 2 / 100)
#' is_degseq(degree(g))
#' is_graphical(degree(g))
#' @export
is_degseq <- function(
  out_deg,
  in_deg = NULL,
  out.deg = deprecated(),
  in.deg = deprecated()
) {
  if (lifecycle::is_present(in.deg)) {
    if (!missing(in_deg)) {
      cli::cli_abort(c(
        "Argument {.arg in_deg} of {.fn is_degseq} was supplied more than once.",
        i = "It was also supplied via its legacy name {.arg in.deg}."
      ))
    }
    lifecycle::deprecate_soft(
      "3.0.0",
      "is_degseq(in.deg = )",
      "is_degseq(in_deg = )"
    )
    in_deg <- in.deg
  }

  if (lifecycle::is_present(out.deg)) {
    if (!missing(out_deg)) {
      cli::cli_abort(c(
        "Argument {.arg out_deg} of {.fn is_degseq} was supplied more than once.",
        i = "It was also supplied via its legacy name {.arg out.deg}."
      ))
    }
    lifecycle::deprecate_soft(
      "3.0.0",
      "is_degseq(out.deg = )",
      "is_degseq(out_deg = )"
    )
    out_deg <- out.deg
  }

  is_graphical(out_deg, in_deg, allowed_edge_types = "all")
}

#' Is a degree sequence graphical?
#'
#' Determine whether the given vertex degrees (in- and out-degrees for
#' directed graphs) can be realized by a graph.
#'
#' The classical concept of graphicality assumes simple graphs. This function
#' can perform the check also when self-loops, multi-edges, or both are allowed
#' in the graph.
#'
#' @param out_deg Integer vector, the degree sequence for undirected graphs, or
#'   the out-degree sequence for directed graphs.
#' @param out.deg `r lifecycle::badge("deprecated")` Use `out_deg` instead.
#' @param in_deg `NULL` or an integer vector. For undirected graphs, it
#'   should be `NULL`. For directed graphs it specifies the in-degrees.
#' @param in.deg `r lifecycle::badge("deprecated")` Use `in_deg` instead.
#' @inheritParams rlang::args_dots_empty
#' @param allowed_edge_types The allowed edge types in the graph. \sQuote{simple}
#'   means that neither loop nor multiple edges are allowed (i.e. the graph must be
#'   simple). \sQuote{loops} means that loop edges are allowed but mutiple edges
#'   are not. \sQuote{multi} means that multiple edges are allowed but loop edges
#'   are not. \sQuote{all} means that both loop edges and multiple edges are
#'   allowed.
#' @return A logical scalar.
#' @author Tamás Nepusz \email{ntamas@@gmail.com}
#' @references Hakimi SL: On the realizability of a set of integers as degrees
#' of the vertices of a simple graph. *J SIAM Appl Math* 10:496-506, 1962.
#'
#' PL Erdős, I Miklós and Z Toroczkai: A simple Havel-Hakimi type algorithm to
#' realize graphical degree sequences of directed graphs.  *The Electronic
#' Journal of Combinatorics* 17(1):R66, 2010.
#' @keywords graphs
#'
#' @family graphical degree sequences
#' @examples
#' g <- sample_gnp(100, 2 / 100)
#' is_degseq(degree(g))
#' is_graphical(degree(g))
#' @export
is_graphical <- function(
  out_deg,
  in_deg = NULL,
  ...,
  allowed_edge_types = c("simple", "loops", "multi", "all"),
  out.deg = deprecated(),
  in.deg = deprecated()
) {
  # BEGIN GENERATED ARG_HANDLE: is_graphical, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    .arg_forbidden <- base::intersect(base::names(base::sys.call()), base::c("i", "in", "o", "ou", "out"))
    if (base::length(.arg_forbidden) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_forbidden)}} matches multiple formal arguments of {.fn is_graphical}.", i = "Spell out the full argument name."))
    # Pre-3.0.0 signature: is_graphical(out.deg, in.deg, allowed.edge.types)
    .old_signature <- function(allowed.edge.types, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn is_graphical}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn is_graphical}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(allowed.edge.types)) base::list(allowed_edge_types = allowed.edge.types)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(allowed_edge_types)) "allowed_edge_types"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn is_graphical} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `is_graphical()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  is_graphical(", base::paste(base::c("out_deg", "in_deg", base::c(allowed_edge_types = "allowed.edge.types")[.arg_names]), collapse = ", "), ")"),
          i = base::paste0("Use instead:    is_graphical(", base::paste(base::c("out_deg", "in_deg", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  if (lifecycle::is_present(in.deg)) {
    if (!missing(in_deg)) {
      cli::cli_abort(c(
        "Argument {.arg in_deg} of {.fn is_graphical} was supplied more than once.",
        i = "It was also supplied via its legacy name {.arg in.deg}."
      ))
    }
    lifecycle::deprecate_soft(
      "3.0.0",
      "is_graphical(in.deg = )",
      "is_graphical(in_deg = )"
    )
    in_deg <- in.deg
  }

  if (lifecycle::is_present(out.deg)) {
    if (!missing(out_deg)) {
      cli::cli_abort(c(
        "Argument {.arg out_deg} of {.fn is_graphical} was supplied more than once.",
        i = "It was also supplied via its legacy name {.arg out.deg}."
      ))
    }
    lifecycle::deprecate_soft(
      "3.0.0",
      "is_graphical(out.deg = )",
      "is_graphical(out_deg = )"
    )
    out_deg <- out.deg
  }

  is_graphical_impl(
    out_deg = out_deg,
    in_deg = in_deg,
    allowed_edge_types = allowed_edge_types
  )
}
