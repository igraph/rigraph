# https://github.com/r-lib/pkgdown/blob/66477c0dbb4f4925ec872cf64d5eaa316cc70bac/R/rd.R#L49C1-L58C1
set_classes <- function(rd) {
  if (is.list(rd)) {
    rd[] <- lapply(rd, set_classes)
  }
  set_class(rd)
}

# https://github.com/r-lib/pkgdown/blob/66477c0dbb4f4925ec872cf64d5eaa316cc70bac/R/rd.R#L49C1-L58C1
set_class <- function(x) {
  structure(
    x,
    class = c(attr(x, "class"), tag(x), "tag"),
    Rd_tag = NULL,
    srcref = NULL,
    macros = NULL
  )
}

tag <- function(x) {
  tag <- attr(x, "Rd_tag")
  if (is.null(tag)) return()

  gsub("\\", "tag_", tag, fixed = TRUE)
}

rd_files <- fs::dir_ls("man", glob = "*.Rd")

rd_file <- function(path) {
  # this path uses itemize correctly
  if (path == "man/ego.Rd") {
    return(TRUE)
  }
  rd <- set_classes(tools::parse_Rd(path, encoding = "UTF-8"))

  return_value <- purrr::keep(rd, inherits, "tag_value")

  if (length(return_value) == 0) {
    return(TRUE)
  }

  describe <- purrr::keep(unlist(return_value, recursive = FALSE), inherits, "tag_describe")
  items <- c(
    purrr::keep(unlist(return_value, recursive = FALSE), inherits, "tag_item"),
    purrr::keep(unlist(unlist(return_value, recursive = FALSE), recursive = FALSE), inherits, "tag_item")
  )

  if (length(items) > 0 && length(describe) == 0) {
    cli::cli_abort(path)
  }
}

purrr::walk(rd_files, rd_file)