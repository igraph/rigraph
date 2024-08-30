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
  # TODO: error if there's no url
  # we can use igraph_ or not
  url <- clinks$url[clinks$method %in% c(x$value, sprintf("igraph_%s", x$value))]

  paste0(
    "\\section{Related C docs}{\n",
    "\\itemize{\n",
    sprintf("\\href{%s}{%s}", url, x$value),
    "}\n",
    "}\n"
  )
}


#' @export
cdocs_roclet <- function() {
  roxygen2::roclet("cdocs")
}

