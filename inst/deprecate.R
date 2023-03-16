script <- here::here("R", "zzz-deprecate.R")
p <- parse(
  file = script,
  keep.source = TRUE
  )

xml <- p |>
  xmlparsedata::xml_parse_data(pretty = TRUE) |>
  xml2::read_xml()

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
