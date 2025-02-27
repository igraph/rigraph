#' Parameters for the igraph package
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `igraph.options()` was renamed to `igraph_options()` to create a more
#' consistent API.
#' @inheritParams igraph_options
#' @keywords internal
#' @export
igraph.options <- function(...) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "igraph.options()", "igraph_options()")
  igraph_i_options(...)
} # nocov end

#' Parameters for the igraph package
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `getIgraphOpt()` was renamed to `igraph_opt()` to create a more
#' consistent API.
#' @inheritParams igraph_opt
#' @keywords internal
#' @export
getIgraphOpt <- function(x, default = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "getIgraphOpt()", "igraph_opt()")

  if (missing(default)) {
    get_config(paste0("igraph::", x), .igraph.pars[[x]])
  } else {
    get_config(paste0("igraph::", x), default)
  }
} # nocov end

#   IGraph R package
#   Copyright (C) 2005-2012  Gabor Csardi <csardi.gabor@gmail.com>
#   334 Harvard street, Cambridge, MA 02139 USA
#
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

.igraph.pars <- list(
  "print.vertex.attributes" = FALSE,
  "print.edge.attributes" = FALSE,
  "print.graph.attributes" = FALSE,
  "verbose" = FALSE,
  "vertex.attr.comb" = list(name = "concat", "ignore"),
  "edge.attr.comb" = list(weight = "sum", name = "concat", "ignore"),
  "sparsematrices" = TRUE,
  "add.params" = TRUE,
  "add.vertex.names" = TRUE,
  "dend.plot.type" = "auto",
  "print.full" = "auto",
  "annotate.plot" = FALSE,
  "auto.print.lines" = 10,
  "return.vs.es" = TRUE,
  "print.id" = TRUE
)

igraph.pars.set.verbose <- function(verbose) {
  if (is.logical(verbose)) {
    .Call(R_igraph_set_verbose, verbose)
  } else if (is.character(verbose)) {
    if (!verbose %in% c("tk", "tkconsole")) {
      cli::cli_abort("Unknown {.arg verbose} value.")
    }
    if (verbose %in% c("tk", "tkconsole")) {
      if (!capabilities()[["X11"]]) {
        cli::cli_abort("X11 not available.")
      }
      if (!requireNamespace("tcltk", quietly = TRUE)) {
        cli::cli_abort("tcltk package not available.")
      }
    }
    .Call(R_igraph_set_verbose, TRUE)
  } else {
    cli::cli_abort("{.arg verbose} should be a logical or character scalar.")
  }
  verbose
}

igraph.pars.callbacks <- list("verbose" = igraph.pars.set.verbose)

## This is based on 'sm.options' in the 'sm' package

#' Parameters for the igraph package
#'
#' igraph has some parameters which (usually) affect the behavior of many
#' functions. These can be set for the whole session via `igraph_options()`.
#'
#' The parameter values set via a call to the `igraph_options()` function
#' will remain in effect for the rest of the session, affecting the subsequent
#' behaviour of the other functions of the `igraph` package for which the
#' given parameters are relevant.
#'
#' This offers the possibility of customizing the functioning of the
#' `igraph` package, for instance by insertions of appropriate calls to
#' `igraph_options()` in a load hook for package \pkg{igraph}.
#'
#' The currently used parameters in alphabetical order:
#' \describe{
#'   \item{add.params}{Logical scalar, whether to add model
#'     parameter to the graphs that are created by the various
#'     graph constructors. By default it is `TRUE`.}
#'   \item{add.vertex.names}{Logical scalar, whether to add
#'     vertex names to node level indices, like degree, betweenness
#'     scores, etc. By default it is `TRUE`.}
#'   \item{annotate.plot}{Logical scalar, whether to annotate igraph
#'     plots with the graph's name (`name` graph attribute, if
#'     present) as `main`, and with the number of vertices and edges
#'     as `xlab`. Defaults to `FALSE`.}
#'   \item{dend.plot.type}{The plotting function to use when plotting
#'     community structure dendrograms via
#'     [plot_dendrogram()]}. Possible values are \sQuote{auto} (the
#'     default), \sQuote{phylo}, \sQuote{hclust} and
#'     \sQuote{dendrogram}. See [plot_dendrogram()] for details.
#'   \item{edge.attr.comb}{Specifies what to do with the edge
#'     attributes if the graph is modified. The default value is
#'     `list(weight="sum", name="concat", "ignore")`. See
#'     [attribute.combination()] for details on this.}
#'   \item{print.edge.attributes}{Logical constant, whether to print edge
#'     attributes when printing graphs. Defaults to `FALSE`.}
#'   \item{print.full}{Logical scalar, whether [print.igraph()]
#'     should show the graph structure as well, or only a summary of the
#'     graph.}
#'   \item{print.graph.attributes}{Logical constant, whether to print
#'     graph attributes when printing graphs. Defaults to `FALSE`.}
#'   \item{print.vertex.attributes}{Logical constant, whether to print
#'     vertex attributes when printing graphs. Defaults to `FALSE`.}
#'   \item{return.vs.es}{Whether functions that return a set or sequence
#'     of vertices/edges should return formal vertex/edge sequence
#'     objects. This option was introduced in igraph version 1.0.0 and
#'     defaults to TRUE. If your package requires the old behavior,
#'     you can set it to FALSE in the `.onLoad` function of
#'     your package, without affecting other packages.}
#'   \item{sparsematrices}{Whether to use the `Matrix` package for
#'     (sparse) matrices. It is recommended, if the user works with
#'     larger graphs.}
#'   \item{verbose}{Logical constant, whether igraph functions should
#'     talk more than minimal. E.g. if `TRUE` then some functions
#'     will use progress bars while computing. Defaults to `FALSE`.}
#'   \item{vertex.attr.comb}{Specifies what to do with the vertex
#'     attributes if the graph is modified. The default value is
#'     `list(name="concat", "ignore")` See
#'     [attribute.combination()] for details on this.}
#' }
#'
#' @aliases igraph_options igraph_opt
#' @param \dots A list may be given as the only argument, or any number of
#'   arguments may be in the `name=value` form, or no argument at all may be
#'   given. See the Value and Details sections for explanation.
#' @param x A character string holding an option name.
#' @param default If the specified option is not set in the options list, this
#'   value is returned. This facilitates retrieving an option and checking
#'   whether it is set and setting it separately if not.
#' @return `igraph_options()` returns a list with the old values of the
#'   updated parameters, invisibly. Without any arguments, it returns the
#'   values of all options.
#'
#'   For `igraph_opt()`, the current value set for option `x`, or
#'   `NULL` if the option is unset.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso `igraph_options()` is similar to [options()] and
#' `igraph_opt()` is similar to [getOption()].
#' @keywords graphs
#' @examples
#'
#' oldval <- igraph_opt("verbose")
#' igraph_options(verbose = TRUE)
#' layout_with_kk(make_ring(10))
#' igraph_options(verbose = oldval)
#'
#' oldval <- igraph_options(verbose = TRUE, sparsematrices = FALSE)
#' make_ring(10)[]
#' igraph_options(oldval)
#' igraph_opt("verbose")
#'
#' @export
#' @family igraph options
#' @importFrom pkgconfig set_config_in get_config
igraph_options <- function(...) {
  igraph_i_options(...)
}

igraph_i_options <- function(..., .in = parent.frame()) {
  if (nargs() == 0) {
    return(get_all_options())
  }

  ## Short notation
  temp <- list(...)
  if (length(temp) == 1 && is.null(names(temp))) {
    arg <- temp[[1]]
    switch(mode(arg),
      list = temp <- arg,
      character = return(.igraph.pars[arg]),
      cli::cli_abort("invalid argument: {arg}.")
    )
  }
  if (length(temp) == 0) {
    return(get_all_options())
  }

  ## Callbacks
  n <- names(temp)
  if (is.null(n)) cli::cli_abort("options must be given by name.")
  cb <- intersect(names(igraph.pars.callbacks), n)
  for (cn in cb) {
    temp[[cn]] <- igraph.pars.callbacks[[cn]](temp[[cn]])
  }

  ## Old values
  old <- lapply(names(temp), igraph_opt)
  names(old) <- names(temp)

  ## Set them
  names(temp) <- paste0("igraph::", names(temp))
  do.call(set_config_in, c(temp, list(.in = .in)))
  invisible(old)
}

local_igraph_options <- function(..., .in = parent.frame()) {
  old <- igraph_options(..., .in = .in)
  withr::defer(rlang::inject(igraph_options(!!!old)), envir = .in)
  invisible()
}

#' @importFrom pkgconfig set_config get_config
get_all_options <- function() {
  res <- lapply(names(.igraph.pars), function(n) {
    nn <- paste0("igraph::", n)
    get_config(nn, fallback = .igraph.pars[[n]])
  })

  names(res) <- names(.igraph.pars)
  res
}

#' @rdname igraph_options
#' @export
igraph_opt <- function(x, default = NULL) {
  if (missing(default)) {
    get_config(paste0("igraph::", x), .igraph.pars[[x]])
  } else {
    get_config(paste0("igraph::", x), default)
  }
}


#' Run code with a temporary igraph options setting
#'
#' @param options A named list of the options to change.
#' @param code The code to run.
#' @return The result of the `code`.
#'
#' @export
#' @family igraph options
#' @examples
#' with_igraph_opt(
#'   list(sparsematrices = FALSE),
#'   make_ring(10)[]
#' )
#' igraph_opt("sparsematrices")
with_igraph_opt <- function(options, code) {
  on.exit(igraph_options(old))
  old <- igraph_options(options)
  force(code)
}
