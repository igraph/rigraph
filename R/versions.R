## ----------------------------------------------------------------------
##
##   IGraph R package
##   Copyright (C) 2014  Gabor Csardi <csardi.gabor@gmail.com>
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
## ----------------------------------------------------------------------

# format versions
ver_0_1_1 <- 0L # 0.1.1
ver_0_4 <- 1L # 0.4
ver_0_7_999 <- 2L # 0.7.999
ver_0_8 <- 3L # 0.8
ver_1_5_0 <- 4L # 1.5.0
pkg_graph_version <- ver_1_5_0

#' igraph data structure versions
#'
#' igraph's internal data representation changes sometimes between
#' versions. This means that it is not always possible to use igraph objects
#' that were created (and possibly saved to a file) with an older
#' igraph version.
#'
#' `graph_version()` queries the current data format,
#' or the data format of a possibly older igraph graph.
#'
#' [upgrade_graph()] can convert an older data format
#' to the current one.
#'
#' @param graph The input graph. If it is missing, then
#'   the version number of the current data format is returned.
#' @return An integer scalar.
#'
#' @seealso upgrade_graph to convert the data format of a graph.
#' @family versions
#' @export
graph_version <- function(graph) {
  if (missing(graph)) {
    return(pkg_graph_version)
  }

  # Don't call is_igraph() here to avoid recursion
  stopifnot(inherits(graph, "igraph"))

  .Call(R_igraph_graph_version, graph)
}

#' igraph data structure versions
#'
#' igraph's internal data representation changes sometimes between
#' versions. This means that it is not possible to use igraph objects
#' that were created (and possibly saved to a file) with an older
#' igraph version.
#'
#' [graph_version()] queries the current data format,
#' or the data format of a possibly older igraph graph.
#'
#' `upgrade_graph()` can convert an older data format
#' to the current one.
#'
#' @param graph The input graph.
#' @return The graph in the current format.
#'
#' @seealso graph_version to check the current data format version
#' or the version of a graph.
#' @family versions
#' @export
upgrade_graph <- function(graph) {
  # Don't call is_igraph() here to avoid recursion
  stopifnot(inherits(graph, "igraph"))

  g_ver <- graph_version(graph)
  p_ver <- graph_version()

  if (g_ver == p_ver) {
    return(graph)
  }

  if (g_ver > p_ver) {
    stop(
      "Don't know how to downgrade graph from version ",
      g_ver,
      " to ",
      p_ver
    )
  }

  # g_ver < p_ver
  if (g_ver == ver_0_4) {
    .Call(R_igraph_add_env, graph)
  } else if (g_ver == ver_0_7_999) {
    # Not observed in the wild
    .Call(R_igraph_add_myid_to_env, graph)
    .Call(R_igraph_add_version_to_env, graph)
  } else if (g_ver == ver_0_8) {
    .Call(R_igraph_add_version_to_env, graph)
    graph <- unclass(graph)
    graph[igraph_t_idx_oi:igraph_t_idx_is] <- list(NULL)
    class(graph) <- "igraph"

    # Calling for side effect: error if R_SEXP_to_igraph() fails, create native igraph,
    # update "me" element of environment
    V(graph)

    graph
  } else {
    stop("Don't know how to upgrade graph from version ", g_ver, " to ", p_ver)
  }
}

## Check that the version is the latest

warn_version <- function(graph) {
  # Calling for side effect: error if R_SEXP_to_igraph() fails
  # Don't call vcount_impl() to avoid recursion
  .Call(R_igraph_vcount, graph)

  # graph_version() calls is_igraph(), but that function must call warn_version() for safety
  their_version <- .Call(R_igraph_graph_version, graph)

  if (pkg_graph_version == their_version) {
    return(FALSE)
  }

  if (pkg_graph_version > their_version) {
    cli::cli_inform(c(
      "This graph was created by an old(er) igraph version.",
      i = "Call {.fun igraph::upgrade_graph} on it to use with the current igraph version.",
      "For now we convert it on the fly..."
    ))

    # In-place upgrade:
    # - The igraph element in the igraph_t_idx_env component will be added
    #   transparently because it's missing.
    # - The components igraph_t_idx_oi, igraph_t_idx_ii, igraph_t_idx_os,
    #   igraph_t_idx_is are ignored, but we can't do much about the contents.
    #   Users will have to call upgrade_graph(), but this is what the message
    #   is about.
    if (pkg_graph_version <= ver_1_5_0) {
      .Call(R_igraph_add_version_to_env, graph)
    }
    return(TRUE)
  }

  stop(
    "This graph was created by a new(er) igraph version. Please install the latest version of igraph and try again."
  )
}

oldpredecessors <- function() {
  c(
    "1.5.0" = "1.4.3",
    "1.0.0" = "0.7.1",
    "0.6" = "0.5.5-4",
    "0.5" = "0.4.5",
    "0.2" = "0.1.2",
    "0.1.1" = NA
  )
}

oldsamples <- function() {
  list(
    "1.5.0" = oldsample_1_5_0(),
    "1.0.0" = oldsample_1_0_0(),
    "0.6" = oldsample_0_6(),
    "0.5" = oldsample_0_5(),
    "0.2" = oldsample_0_2(),
    "0.1.1" = oldsample_0_1_1()
  )
}

clear_native_ptr <- function(g) {
  gx <- unclass(g)
  gx[[igraph_t_idx_env]]$igraph <- NULL
  g
}

#' Query igraph's version string
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `igraph.version()` was renamed to [`igraph_version()`] to create a more
#' consistent API.
#'
#' @keywords internal
#' @export
igraph.version <- function() {
  # nocov start
  lifecycle::deprecate_soft("2.0.0", "igraph.version()", "igraph_version()")
  igraph_version()
} # nocov end


# R_igraph_vers -----------------------------------------------------------------------

#' Query igraph's version string
#'
#' Returns the R package version,
#' prints the R package version and C library version.
#'
#'#' @return A character scalar, the igraph version string.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @keywords graphs
#' @keywords internal
#' @export
#' @examples
#' igraph_version()
#'
igraph_version <- function(software = c("R", "C")) {
  r_version <- getNamespaceInfo("igraph", "spec")[["version"]]

  version <- structure(
    r_version,
    class = c("igraph_version", class(r_version)),
    c_version = c_version()
  )

  invisible(version)
}

#' @export
print.igraph_version <- function(x, ...) {
  writeLines(paste0("R version: ", x))
  writeLines(paste0("C version: ", attr(x, "c_version")))
  invisible(x)
}

c_version <- function() {
  version_impl()[["version_string"]]
}
