#' @rdname as_phylo
#' @title as_phylo
#' @description `r lifecycle::badge("deprecated")`
#'
#' `as_phylo` methods were renamed `as.phylo`
#' for more consistency with other R methods.
#'
#' @export
#' @param x object to be coerced
#' @inheritParams ape::as.phylo
#' @keywords internal
as_phylo <- function(x, ...) {
  lifecycle::deprecate_warn(
    "2.0.0",
    "ape::as.phylo()"
  )
  check_installed("ape", "for using `as.phylo()`")
  UseMethod("as.phylo")
}
