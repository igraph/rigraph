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



#' Run package tests
#'
#' Runs all package tests.
#'
#' The `testthat` package is needed to run all tests. The location tests
#' themselves can be extracted from the package via `system.file("tests",
#' package="igraph")`.
#'
#' This function simply calls the `test_dir` function from the
#' `testthat` package on the test directory.
#'
#' @return Whatever is returned by `test_dir` from the `testthat`
#'   package.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @keywords graphs
#' @family test
#' @export
igraph_test <- function() {
  do.call(require, list("testthat"))
  tdir <- system.file("tests", package = "igraph")
  do.call("test_dir", list(tdir))
}

#' Run package tests
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `igraphtest()` was renamed to `igraph_test()` to create a more
#' consistent API.
#'
#' @keywords internal
#' @export
igraphtest <- function() { # nocov start
   lifecycle::deprecate_soft("1.6.0", "igraphtest()", "igraph_test()")
   igraph_test()
} # nocov end


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
#' @family test
#' @export
#' @examples
#'
#' ## Compare to the package version
#' packageDescription("igraph")$Version
#' igraph_version()
#'
igraph_version <- function() {
  unname(asNamespace("igraph")$.__NAMESPACE__.$spec["version"])
}

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
   lifecycle::deprecate_soft("1.6.0", "igraph.version()", "igraph_version()")
   igraph_version()
} # nocov end

checkpkg <- function(package_file, args = character()) {
  package_file <- as.character(package_file)
  args <- as.character(args)
  do.call(":::", list("tools", ".check_packages"))(c(package_file, args))
}
