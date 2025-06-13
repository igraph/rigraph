rd_files <- fs::dir_ls("man", glob = "*.Rd")

title_from_p <- function(p) {
  sub("\\:.*", "", xml2::xml_text(p))
}

parse <- function(rd_file) {
  print(rd_file)
  html_file <- withr::local_tempfile()
  tools::Rd2HTML(rd_file, out = html_file)
  html <- xml2::read_html(html_file)
  # remove examples as I could not make the Xpath work with  and not(following-sibling::h3)
  examples <- xml2::xml_find_first(
    html,
    "//p[preceding-sibling::h3[text()='Examples']]"
  )
  xml2::xml_remove(examples)
  see_also <- xml2::xml_find_all(
    html,
    "//p[preceding-sibling::h3[text()='See Also']]"
  )
  if (length(see_also) <= 1) {
    return()
  }
  titles <- purrr::map_chr(see_also, title_from_p)
  if (any(duplicated(titles))) browser()
}

purrr::walk(rd_files, parse)
