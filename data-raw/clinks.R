## code to prepare `clinks` dataset goes here

index_url <- "https://igraph.org/c/html/latest/ix01.html"
index <- xml2::read_html(index_url)

entries <- xml2::xml_find_all(index, ".//dt")

handle_dt <- function(dt) {
  href <- xml2::xml_attr(xml2::xml_child(dt), "href")
  url <- sprintf("https://igraph.org/c/doc/%s", href)
  method <- sub(".*#", "", href)
  tibble::tibble(
    method = method,
    url = url
  )
}

clinks <- purrr::map_df(entries, handle_dt)

usethis::use_data(clinks, overwrite = TRUE, internal = TRUE)
