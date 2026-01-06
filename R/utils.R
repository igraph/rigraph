## -----------------------------------------------------------------------
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
## -----------------------------------------------------------------------

make_call <- function(f, ..., .args = list()) {
  if (is.character(f)) {
    f <- as.name(f)
  }
  as.call(c(f, ..., .args))
}

do_call <- function(f, ..., .args = list(), .env = parent.frame()) {
  f <- substitute(f)

  call <- make_call(f, ..., .args)
  eval(call, .env)
}

add_class <- function(x, class) {
  if (!inherits(x, class)) {
    class(x) <- c(class(x), class)
  }
  x
}

`%&&%` <- function(lhs, rhs) {
  lres <- withVisible(eval(lhs, envir = parent.frame()))
  if (!is.null(lres$value)) {
    eval(rhs, envir = parent.frame())
  } else {
    if (lres$visible) {
      lres$value
    } else {
      invisible(lres$value)
    }
  }
}

## Grab all arguments of the parent call, in a list

grab_args <- function() {
  envir <- parent.frame()
  func <- sys.function(-1)
  call <- sys.call(-1)
  dots <- match.call(func, call, expand.dots = FALSE)$...
  c(as.list(envir), dots)
}

capitalize <- function(x) {
  x <- tolower(x)
  substr(x, 1, 1) <- toupper(substr(x, 1, 1))
  x
}

address <- function(x) {
  .Call(Rx_igraph_address, x)
}

`%+%` <- function(x, y) {
  stopifnot(is.character(x), is.character(y))
  paste0(x, y)
}

chr <- as.character

drop_null <- function(x) {
  x[!sapply(x, is.null)]
}

# from https://github.com/r-lib/pkgdown/blob/c354aa7e5ea1f9936692494c28c89e5bdd31fc68/R/utils.R#L109
modify_list <- function(x, y) {
  if (is.null(y)) {
    return(x)
  }

  utils::modifyList(x, y)
}

# Parse igraph C error/warning messages in "At file:line : message" format
.parse_igraph_message <- function(msg) {
  # Parse "At file:line : message" format
  pattern <- "^At ([^:]+):(\\d+) : (.+)$"
  matches <- regexec(pattern, msg)

  if (matches[[1]][1] == -1) {
    # Fallback if parsing fails
    return(list(file = "", line = 0, message = msg))
  }

  captured <- regmatches(msg, matches)[[1]]
  list(
    file = captured[2],
    line = as.integer(captured[3]),
    message = captured[4]
  )
}

# Format igraph message with sentences on separate lines and source at the end
.format_igraph_message <- function(file, line, message) {
  # Remove vendor/cigraph/src/ prefix
  file <- sub("^vendor/cigraph/src/", "", file)

  # Split message into sentences (split on ". " but preserve the period)
  sentences <- strsplit(message, "(?<=\\.) ", perl = TRUE)[[1]]

  # Build formatted message
  if (length(sentences) > 0) {
    formatted <- paste0("x ", sentences[1])
    if (length(sentences) > 1) {
      for (i in 2:length(sentences)) {
        formatted <- paste0(formatted, "\n", sentences[i])
      }
    }
  } else {
    formatted <- paste0("x ", message)
  }

  # Add source line
  paste0(formatted, "\nSource: ", file, ":", line)
}

# Called from C to emit warnings with reformatted messages
.igraph_warning <- function(msg) {
  parsed <- .parse_igraph_message(msg)
  formatted <- .format_igraph_message(parsed$file, parsed$line, parsed$message)
  warning(formatted, call. = FALSE)
}

# Called from C to emit errors with reformatted messages
.igraph_error <- function(msg) {
  parsed <- .parse_igraph_message(msg)
  formatted <- .format_igraph_message(parsed$file, parsed$line, parsed$message)
  stop(formatted, call. = FALSE)
}
