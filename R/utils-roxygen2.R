#' @importFrom roxygen2 roxy_tag_parse
#' @importFrom roxygen2 roxy_tag_rd
NULL

#' @export
roxy_tag_parse.roxy_tag_cdocs <- function(x) {
  roxygen2::tag_value(x)
}

#' @export
roxy_tag_rd.roxy_tag_cdocs <- function(x, base_path, env) {
  roxygen2::rd_section("cdocs", x$val)
}

#' @export
format.rd_section_cdocs <- function(x, ...) {
  paste0(
    "\\section{Related C docs}{\n",
    "\\itemize{\n",
  present_cdocs_link(x[["value"]]),
    "}\n",
    "}\n"
  )
}

present_cdocs_link <- function(value) {

  format_cdocs_single_link <- function(x, clinks) {
  # we can use igraph_ or not
    df <- clinks[clinks$method %in% c(x, sprintf("igraph_%s", x)),]
    if (nrow(df) == 0) {
      cli::cli_warn("Can't find C entry for {x}!")
    }
    sprintf("\\item \\href{%s}{%s}", df$url, df$method)
  }

  strings <- map_chr(value, format_cdocs_single_link, clinks = clinks)

  paste(strings, collapse = "\n")
}

#' @export
merge.rd_section_cdocs <- function(x, y, ...) {
  stopifnot(identical(class(x), class(y)))

  dedup <- unique(c(x$value, y$value))

 format.rd_section_cdocs(x = list(value = dedup))
}

#' @export
cdocs_roclet <- function() {
  roxygen2::roclet("cdocs")
}

