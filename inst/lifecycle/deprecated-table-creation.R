# parse script ----
zzz_script <- "https://raw.githubusercontent.com/igraph/rigraph/e82993a8312e996ab54572048741f508d64467f1/R/zzz-deprecate.R"

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

deprecated_df <- purrr::map(deprecated_calls, tibblify_call)
deprecated_df <- do.call(rbind, deprecated_df)

deprecated_df[["new"]] <-
  purrr::map_chr(
    deprecated_df[["new"]],
    ~downlit::autolink(sprintf("igraph::%s", .x))
  )

readr::write_csv(
  deprecated_df,
  file.path('inst', 'lifecycle', 'deprecated.csv')
)
