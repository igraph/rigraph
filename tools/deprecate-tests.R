# parse script ----
zzz_script <- withr::local_tempfile()
curl::curl_download(
  url = "https://raw.githubusercontent.com/igraph/rigraph/62c80b042dc30f5f7601f7d337218460d5a9b7d9/R/zzz-deprecate.R",
  destfile = zzz_script
)

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
    purrr::keep(~ xml2::xml_name(.x) == "expr")
  old <- xml2::xml_text(args[[1]])
  new <- xml2::xml_text(args[[2]])
  tibble::tibble(old = gsub('"', '', old), new = new)
}

deprecated_df <- purrr::map_df(deprecated_calls, tibblify_call)

# parse main scripts ----

test_scripts <- fs::dir_ls(here::here("R"), glob = "*.R")

fix_test_script <- function(test_script, deprecated_df) {
  test_lines <- brio::read_lines(test_script)

  look_for_one <- function(test_lines, old_name, new_name) {
    old_name <- sub("\\.", "\\\\.", old_name)

    test_lines <- gsub(
      sprintf("^%s\\(", old_name),
      sprintf("%s(", new_name),
      test_lines,
      perl = TRUE
    )
    test_lines <- gsub(
      sprintf(" %s\\(", old_name),
      sprintf(" %s(", new_name),
      test_lines,
      perl = TRUE
    )
    test_lines <- gsub(
      sprintf("\\(%s\\(", old_name),
      sprintf("(%s(", new_name),
      test_lines,
      perl = TRUE
    )
  }

  test_lines <- purrr::reduce2(
    deprecated_df$old,
    deprecated_df$new,
    \(test_lines, old_name, new_name)
      look_for_one(test_lines, old_name, new_name),
    .init = test_lines
  )

  brio::write_lines(test_lines, test_script)
}

purrr::walk(test_scripts, fix_test_script, deprecated_df = deprecated_df)


# parse test scripts ----

test_scripts <- fs::dir_ls(here::here("tests", "testthat"), glob = "*.R")

fix_test_script <- function(test_script, deprecated_df) {
  test_lines <- brio::read_lines(test_script)

  look_for_one <- function(test_lines, old_name, new_name) {
    old_name <- sub("\\.", "\\\\.", old_name)

    test_lines <- gsub(
      sprintf("^%s\\(", old_name),
      sprintf("%s(", new_name),
      test_lines,
      perl = TRUE
    )
    test_lines <- gsub(
      sprintf(" %s\\(", old_name),
      sprintf(" %s(", new_name),
      test_lines,
      perl = TRUE
    )
    test_lines <- gsub(
      sprintf("\\(%s\\(", old_name),
      sprintf("(%s(", new_name),
      test_lines,
      perl = TRUE
    )
  }

  test_lines <- purrr::reduce2(
    deprecated_df$old,
    deprecated_df$new,
    \(test_lines, old_name, new_name)
      look_for_one(test_lines, old_name, new_name),
    .init = test_lines
  )

  brio::write_lines(test_lines, test_script)
}

purrr::walk(test_scripts, fix_test_script, deprecated_df = deprecated_df)
