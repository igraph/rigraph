zzz_script <- here::here("R", "zzz-deprecate.R")

parse_script <- function(path) {
  path |>
    parse(keep.source = TRUE) |>
    xmlparsedata::xml_parse_data(pretty = TRUE) |>
    xml2::read_xml()
}

xml <- parse_script(zzz_script)

# extract all calls to deprecated()
deprecated_calls <- xml2::xml_find_all(
  xml,
  ".//SYMBOL_FUNCTION_CALL[text()='deprecated']"
)

tibblify_call <- function(deprecated_call) {
  args <- deprecated_call |>
    xml2::xml_parent() |>
    xml2::xml_siblings() |>
    purrr::keep(~xml2::xml_name(.x) == "expr")
  old <- xml2::xml_text(args[[1]])
  new <- xml2::xml_text(args[[2]])
  tibble::tibble(old = gsub('"', '', old), new = new)
}

deprecated_df <- purrr::map_df(deprecated_calls, tibblify_call)

detect_fun <- function(fun_name, lines) {
  file <- withr::local_tempfile()
  brio::write_lines(lines, file)
  xml <- parse_script(file)
  called_funs <- xml2::xml_find_all(xml, ".//SYMBOL_FUNCTION_CALL") |> xml2::xml_text()

  any(called_funs == fun_name)

}

topics <- pkgdown::as_pkgdown()[["topics"]]

treat_topic <- function(topic, deprecated_df) {
  message(topic)
  lines <- example(topic, character.only = TRUE, package = "igraph", give.lines = TRUE)

  no_example <- is.null(lines)
  if (no_example) {
    return(invisible())
  }

  deprecated_in_there <- deprecated_df[
    purrr::map_lgl(
      split(deprecated_df, seq(nrow(deprecated_df))),
      ~ detect_fun(.x[["old"]], lines)
    ),
  ]
  if (nrow(deprecated_in_there > 0)) {
    return(tibble::tibble(
      topic = topic,
      deprecated = toString(deprecated_in_there[["old"]])
    ))
  }

  NULL

}

df <- purrr::map_df(topics[["name"]], treat_topic, deprecated_df = deprecated_df)
# Update by hand, document(), R CMD build, re-run script to be sure
if (nrow(df) > 0) {
  View(df)
} else {
  message("All fixed! :-)")
}
