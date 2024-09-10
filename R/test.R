#' Query igraph's version string
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `igraph.version()` was renamed to `igraph_version()` to create a more
#' consistent API.
#'
#' @keywords internal
#' @export
igraph.version <- function() { # nocov start
  lifecycle::deprecate_soft("2.0.0", "igraph.version()", "igraph_version()")
  igraph_version()
} # nocov end
#   IGraph R package
#   Copyright (C) 2005-2013  Gabor Csardi <csardi.gabor@gmail.com>
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

# R_igraph_vers -----------------------------------------------------------------------

#' Query igraph's version string
#'
#' Returns the package version.
#'
#' The igraph version string is always the same as the version of the R package.
#'
#' @return A character scalar, the igraph version string.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @keywords graphs
#' @keywords internal
#' @export
#' @examples
#'
#' ## Compare to the package version
#' packageDescription("igraph")$Version
#' igraph_version()
#'
igraph_version <- function() {
  # Better than packageVersion("igraph") because it uses the loaded package
  # and is independent of .libPaths()
  getNamespaceInfo("igraph", "spec")[["version"]]
}
