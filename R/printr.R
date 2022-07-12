
#' Create a printer callback function
#'
#' A printer callback function is a function can performs the actual
#' printing. It has a number of subcommands, that are called by
#' the \code{printer} package, in a form \preformatted{
#'     printer_callback("subcommand", argument1, argument2, ...)
#' } See the examples below.
#'
#' The subcommands:
#'
#' \describe{
#'   \item{\code{length}}{The length of the data to print, the number of
#'     items, in natural units. E.g. for a list of objects, it is the
#'     number of objects.}
#'   \item{\code{min_width}}{TODO}
#'   \item{\code{width}}{Width of one item, if \code{no} items will be
#'     printed. TODO}
#'   \item{\code{print}}{Argument: \code{no}. Do the actual printing,
#'     print \code{no} items.}
#'   \item{\code{done}}{TODO}
#' }
#'
#' @param fun The function to use as a printer callback function.
#' @family printer callbacks
#' @export

printer_callback <- function(fun) {

  if (!is.function(fun)) warning("'fun' is not a function")
  add_class(fun, "printer_callback")
}

#' Is this a printer callback?
#'
#' @param x An R object.
#' @family printer callbacks
#' @export

is_printer_callback <- function(x) {
  inherits(x, "printer_callback")
}

print_header <- function(header) {
  print_head_foot(header)
}


print_footer <- function(footer) {
  print_head_foot(footer)
}

print_head_foot <- function(head_foot) {
  if (is.function(head_foot)) head_foot() else cat(head_foot)
}

#' Print the only the head of an R object
#'
#' @param x The object to print, or a callback function. See
#'   \code{\link{printer_callback}} for details.
#' @param max_lines Maximum number of lines to print, \emph{not}
#'   including the header and the footer.
#' @param header The header, if a function, then it will be called,
#'   otherwise printed using \code{cat}.
#' @param footer The footer, if a function, then it will be called,
#'   otherwise printed using \code{cat}.
#' @param omitted_footer Footer that is only printed if anything
#'   is omitted from the printout. If a function, then it will be called,
#'   otherwise printed using \code{cat}.
#' @param ... Extra arguments to pass to \code{print()}.
#' @return \code{x}, invisibly.
#'
#' @export

head_print <- function(x, max_lines = 20, header = "", footer = "",
                       omitted_footer = "", ...) {
  if (is_printer_callback(x)) {
    head_print_callback(x, max_lines, header, footer, omitted_footer, ...)
  } else {
    head_print_object(x, max_lines, header, footer, omitted_footer, ...)
  }
  invisible(x)
}

head_print_object <- function(x, max_lines, header, footer, omitted_footer,
                              print_fun = print, ...) {

  print_header(header)

  cout <- capture.output(print_fun(x, ...))
  cout_no <- min(length(cout), max_lines)
  cat(cout[seq_len(cout_no)], sep = "\n")

  print_footer(footer)

  if (cout_no < length(cout)) print_footer(omitted_footer)

  invisible(c(lines = length(cout), printed = cout_no))
}

#' @importFrom utils tail

head_print_callback <- function(x, max_lines, header, footer,
                                omitted_footer, ...) {

  ## Header
  print_header(header)

  len <- x("length")
  minw <- x("min_width")
  ow <- getOption("width", 80)

  ## Max number of items we can print. This is an upper bound.
  can_max <- min(floor(ow / minw) * max_lines, len)
  if (can_max == 0) { return() }

  ## Width of item if we print up to this
  cm <- x("width", no = can_max)

  ## How many rows we need if we print up to a certain point
  no_rows <- ceiling(cm * seq_along(cm) /(ow - 4) )

  ## So how many items should we print?
  no <- tail(which(no_rows <= max_lines), 1)
  if (is.null(no) || length(no) < 1 || is.na(no)) no <- len

  cat_pern <- function(..., sep = "\n") cat(..., sep = sep)

  ## Format them, and print
  out_lines <- head_print_object(
    x("print", no = no, ...), print_fun = cat_pern, max_lines = max_lines,
    header = "", footer = "", omitted_footer = ""
  )

  done_stat <- c(tried_items = no, tried_lines = out_lines[["lines"]],
                 printed_lines = out_lines[["printed"]])

  if (done_stat["tried_items"] < len ||
      done_stat["printed_lines"] < done_stat["tried_lines"]) {
    print_footer(omitted_footer)
  }

  x("done", done_stat)

  ## Footer
  print_footer(footer)
}

#' Indent a printout
#'
#' @param ... Passed to the printing function.
#' @param .indent Character scalar, indent the printout with this.
#' @param .printer The printing function, defaults to \code{print}.
#' @return The first element in \code{...}, invisibly.
#'
#' @export

indent_print <- function(..., .indent = " ", .printer = print) {

  if (length(.indent) != 1) stop(".indent must be a scalar")
  
  opt <- options(width = getOption("width") - nchar(.indent))
  on.exit(options(opt), add = TRUE)

  cout <- capture.output(.printer(...))
  if (length(cout)) {
    cout <- paste0(.indent, cout)
    cat(cout, sep = "\n")
  }

  invisible(list(...)[[1]])
}

#' Better printing of R packages
#'
#' This package provides better printing of R packages.
#'
#' @docType package
#' @name printr
NULL

add_class <- function(x, class) {

  if (!inherits(x, class)) {
    class(x) <- c(class(x), class)
  }
  x
}
