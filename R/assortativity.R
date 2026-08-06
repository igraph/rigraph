#' Assortativity coefficient
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `assortativity.nominal()` was renamed to [assortativity_nominal()] to create a more
#' consistent API.
#' @inheritParams assortativity_nominal
#' @keywords internal
#' @export
assortativity.nominal <- function(
  graph,
  types,
  directed = TRUE,
  normalized = TRUE
) {
  # nocov start
  lifecycle::deprecate_warn(
    "2.0.0",
    "assortativity.nominal()",
    "assortativity_nominal()"
  )
  assortativity_nominal(
    graph = graph,
    types = types,
    directed = directed,
    normalized = normalized
  )
} # nocov end

#' Assortativity coefficient
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `assortativity.degree()` was renamed to [assortativity_degree()] to create a more
#' consistent API.
#' @inheritParams assortativity_degree
#' @keywords internal
#' @export
assortativity.degree <- function(graph, directed = TRUE) {
  # nocov start
  lifecycle::deprecate_warn(
    "2.0.0",
    "assortativity.degree()",
    "assortativity_degree()"
  )
  assortativity_degree(graph = graph, directed = directed)
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

#' Assortativity coefficient
#'
#' The assortativity coefficient is positive if similar vertices (based on some
#' external property) tend to connect to each, and negative otherwise.
#'
#' The assortativity coefficient measures the level of homophyly of the graph,
#' based on some vertex labeling or values assigned to vertices. If the
#' coefficient is high, that means that connected vertices tend to have the
#' same labels or similar assigned values.
#'
#' M.E.J. Newman defined two kinds of assortativity coefficients, the first one
#' is for categorical labels of vertices. `assortativity_nominal()`
#' calculates this measure. It is defined as
#'
#' \deqn{r=\frac{\sum_i e_{ii}-\sum_i a_i b_i}{1-\sum_i a_i b_i}}{
#' r=(sum(e(i,i), i) - sum(a(i)b(i), i)) / (1 - sum(a(i)b(i), i))}
#'
#' where \eqn{e_{ij}}{e(i,j)} is the fraction of edges connecting vertices of
#' type \eqn{i} and \eqn{j}, \eqn{a_i=\sum_j e_{ij}}{a(i)=sum(e(i,j), j)} and
#' \eqn{b_j=\sum_i e_{ij}}{b(j)=sum(e(i,j), i)}.
#'
#' The second assortativity variant is based on values assigned to the
#' vertices. `assortativity()` calculates this measure. It is defined as
#'
#' \deqn{r=\frac1{\sigma_q^2}\sum_{jk} jk(e_{jk}-q_j q_k)}{
#' sum(jk(e(j,k)-q(j)q(k)), j, k) / sigma(q)^2}
#'
#' for undirected graphs (\eqn{q_i=\sum_j e_{ij}}{q(i)=sum(e(i,j), j)}) and as
#'
#' \deqn{r=\frac1{\sigma_o\sigma_i}\sum_{jk}jk(e_{jk}-q_j^o q_k^i)}{
#' sum(jk(e(j,k)-qout(j)qin(k)), j, k) / sigma(qin) / sigma(qout) }
#'
#' for directed ones. Here \eqn{q_i^o=\sum_j e_{ij}}{qout(i)=sum(e(i,j), j)},
#' \eqn{q_i^i=\sum_j e_{ji}}{qin(i)=sum(e(j,i), j)}, moreover,
#' \eqn{\sigma_q}{\sigma(q)}, \eqn{\sigma_o}{\sigma(qout)} and
#' \eqn{\sigma_i}{\sigma(qin)} are the standard deviations of \eqn{q},
#' \eqn{q^o}{qout} and \eqn{q^i}{qin}, respectively.
#'
#' The reason of the difference is that in directed networks the relationship
#' is not symmetric, so it is possible to assign different values to the
#' outgoing and the incoming end of the edges.
#'
#' `assortativity_degree()` uses vertex degree as vertex values
#' and calls `assortativity()`.
#'
#' Undirected graphs are effectively treated as directed ones with all-reciprocal edges.
#' Thus, self-loops are taken into account twice in undirected graphs.
#'
#' @aliases assortativity
#' @param graph The input graph, it can be directed or undirected.
#' @param values The vertex values, these can be arbitrary numeric values.
#' @inheritParams rlang::args_dots_empty
#' @param values.in A second value vector to use for the incoming edges when
#'   calculating assortativity for a directed graph.
#'   Supply `NULL` here if
#'   you want to use the same values for outgoing and incoming edges.
#'   This
#'   argument is ignored (with a warning) if it is not `NULL` and undirected
#'   assortativity coefficient is being calculated.
#' @param directed Logical, whether to consider edge directions for
#'   directed graphs.
#'   This argument is ignored for undirected graphs.
#'   Supply
#'   `TRUE` here to do the natural thing, i.e. use directed version of the
#'   measure for directed graphs and the undirected version for undirected
#'   graphs.
#' @param normalized Logical, whether to compute the normalized assortativity.
#' The non-normalized nominal assortativity is identical to modularity.
#' The non-normalized value-based assortativity is simply the covariance of the
#' values at the two ends of edges.
#' @param types1,types2
#'   `r lifecycle::badge("deprecated")`
#'   Deprecated aliases for `values` and `values.in`, respectively.
#' @return A single real number.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @references M. E. J. Newman: Mixing patterns in networks, *Phys. Rev.
#' E* 67, 026126 (2003) <https://arxiv.org/abs/cond-mat/0209450>
#'
#' M. E. J. Newman: Assortative mixing in networks, *Phys. Rev. Lett.* 89,
#' 208701 (2002) <https://arxiv.org/abs/cond-mat/0205405>
#' @keywords graphs
#' @export
#' @examples
#'
#' # random network, close to zero
#' assortativity_degree(sample_gnp(10000, 3 / 10000))
#'
#' # BA model, tends to be dissortative
#' assortativity_degree(sample_pa(10000, m = 4))
assortativity <- function(
  graph,
  values,
  ...,
  values.in = NULL,
  directed = TRUE,
  normalized = TRUE,
  types1 = NULL,
  types2 = NULL
) {
  if (...length() > 0) {
    lifecycle::deprecate_warn(
      "1.6.0",
      "assortativity(... =)",
      details = "Arguments `values` and `values.in` must be named."
    )
    dots <- list(...)
    dots[["graph"]] <- graph
    if (!missing(types2)) {
      dots[["types2"]] <- types2
    }
    if (!missing(directed)) {
      dots[["directed"]] <- directed
    }
    if (missing(values)) {
      dots[["types1"]] <- types1
    } else {
      dots[["types1"]] <- values
    }
    return(inject(assortativity_legacy(!!!dots)))
  }

  if (missing(values)) {
    lifecycle::deprecate_warn(
      "1.6.0",
      "assortativity(types1 =)",
      "assortativity(values =)"
    )
    values <- types1
  }

  if (!is.null(types2)) {
    lifecycle::deprecate_warn(
      "1.6.0",
      "assortativity(types2 =)",
      "assortativity(values.in =)"
    )
    stopifnot(is.null(values.in))
    values.in <- types2
  }

  assortativity_impl(
    graph = graph,
    values = values,
    values_in = values.in,
    directed = directed,
    normalized = normalized
  )
}

assortativity_legacy <- function(
  graph,
  types1,
  types2 = NULL,
  directed = TRUE
) {
  assortativity_impl(
    graph = graph,
    values = types1,
    values_in = types2,
    directed = directed
  )
}

#' @param types Vector giving the vertex types. They as assumed to be integer
#'   numbers, starting with one. Non-integer values are converted to integers
#'   with [as.integer()]. Character vectors are converted to integers using
#'   [as.factor()].
#' @rdname assortativity
#' @inheritParams rlang::args_dots_empty
#' @export
assortativity_nominal <- function(
  graph,
  types,
  ...,
  directed = TRUE,
  normalized = TRUE
) {
  # BEGIN GENERATED ARG_HANDLE: assortativity_nominal, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    # Pre-3.0.0 signature: assortativity_nominal(graph, types, directed, normalized)
    .old_signature <- function(directed, normalized, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn assortativity_nominal}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn assortativity_nominal}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(directed)) base::list(directed = directed),
        if (!base::missing(normalized)) base::list(normalized = normalized)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(directed)) "directed",
        if (!base::missing(normalized)) "normalized"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn assortativity_nominal} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `assortativity_nominal()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  assortativity_nominal(", base::paste(base::c("graph", "types", .arg_names), collapse = ", "), ")"),
          i = base::paste0("Use instead:    assortativity_nominal(", base::paste(base::c("graph", "types", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  # Convert character types to factor then to integer for categorical data
  if (is.character(types)) {
    types <- as.integer(as.factor(types))
  }

  assortativity_nominal_impl(
    graph = graph,
    types = types,
    directed = directed,
    normalized = normalized
  )
}

#' @rdname assortativity
#' @inheritParams rlang::args_dots_empty
#' @export
assortativity_degree <- function(
  graph,
  ...,
  directed = TRUE
) {
  # BEGIN GENERATED ARG_HANDLE: assortativity_degree, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    # Pre-3.0.0 signature: assortativity_degree(graph, directed)
    .old_signature <- function(directed, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn assortativity_degree}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn assortativity_degree}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(directed)) base::list(directed = directed)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(directed)) "directed"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn assortativity_degree} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `assortativity_degree()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  assortativity_degree(", base::paste(base::c("graph", .arg_names), collapse = ", "), ")"),
          i = base::paste0("Use instead:    assortativity_degree(", base::paste(base::c("graph", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  assortativity_degree_impl(
    graph = graph,
    directed = directed
  )
}
