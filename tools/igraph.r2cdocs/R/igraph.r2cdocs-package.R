#' @keywords internal
"_PACKAGE"

## usethis namespace: start
#' @import rlang
## usethis namespace: end
NULL

.onLoad <- function(libname, pkgname) {
  treesitter_graph <<- memoise::memoise(.treesitter_graph)
  igraph_c_version <<- memoise::memoise(.igraph_c_version)
  c_links <<- memoise::memoise(.c_links)
}
