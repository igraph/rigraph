# parse script ----
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

# parse ALL the package ----
scripts <- fs::dir_ls(here::here("R")) |>
  purrr::keep(~(.x != zzz_script)) |>
  purrr::map(parse_script)

parse_script_function_call <- function(script, script_name) {
  fns <- xml2::xml_find_all(script, ".//FUNCTION[text()='function']")
  is_fn_definition <- function(fn) {
    siblings <- fn |> xml2::xml_parent() |> xml2::xml_siblings()
    (length(siblings) == 2) && (xml2::xml_name(siblings[[2]]) == "LEFT_ASSIGN")
  }
  fns <- purrr::keep(fns, is_fn_definition)

  parse_function <- function(fn) {
    whole_definition <- fn |> xml2::xml_parent()|> xml2::xml_parent()
    line1 <- xml2::xml_attr(whole_definition, "line1")
    line2 <- xml2::xml_attr(whole_definition, "line2")
    name <- whole_definition |> xml2::xml_child() |> xml2::xml_text()

    usage_wrap <- xml2::xml_children(whole_definition)[[3]] |> xml2::xml_children()
    # TODO use XPath not numbers? although this should work?
    usage <- try(
      usage_wrap[3:(length(usage_wrap)-2)] |> xml2::xml_text() |> paste(collapse = " "),
silent =TRUE
          )
if (inherits(usage, "try-error")) browser()
    tibble::tibble(
      line1 = line1,
      line2 = line2,
      name = name,
      usage = usage
    )
  }
  script_df <- purrr::map_df(fns, parse_function)
  script_df$script_name <- script_name
  script_df
}

pkg_defs <- purrr::map2_df(scripts, names(scripts), parse_script_function_call)

# get function title from pkgdown ----
get_title <- function(fn_name) {
  rd_href <- pkgdown:::get_rd_from_help("igraph", fn_name)
  pkgdown:::extract_title(rd_href)
}


# treat calls ----
template <-
treat_call <- function(old, new) {
  # find where new is defined
}

# delete script ----
# fs::file_delete(zzz_script)
