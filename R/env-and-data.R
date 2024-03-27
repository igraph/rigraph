#' `.data` and `.env` pronouns
#'
#' @description
#'
#' The `.data` and `.env` pronouns make it explicit where to look up attribute
#' names when indexing `V(g)` or `E(g)`, i.e. the vertex or edge sequence of a
#' graph. These pronouns are inspired by `.data` and `.env` in `rlang` - thanks
#' to Michał Bojanowski for bringing these to our attention.
#'
#' The rules are simple:
#'
#' * `.data` retrieves attributes from the graph whose vertex or edge sequence
#'   is being evaluated.
#' * `.env` retrieves variables from the calling environment.
#'
#' Note that `.data` and `.env` are injected dynamically into the environment
#' where the indexing expressions are evaluated; you cannot get access to these
#' objects outside the context of an indexing expression. To avoid warnings
#' printed by `R CMD check` when code containing `.data` and `.env` is checked,
#' you can import `.data` and `.env` from `igraph` if needed. Alternatively,
#' you can declare them explicitly with `utils::globalVariables()` to silence
#' the warnings.
#'
#' @name dot-data
#' @aliases dot-env
#' @format NULL
#' @usage NULL
#' @family env-and-data
#' @export
#' @md
.data <- rlang::.data

#' @rdname dot-data
#' @format NULL
#' @usage NULL
#' @family env-and-data
#' @export
.env <- rlang::.env
