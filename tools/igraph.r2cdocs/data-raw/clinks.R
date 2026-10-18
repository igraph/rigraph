# Writes the link table for one release of the C manual
# to inst/clinks/<version>.csv, where the roclet looks for it.
#
# The table comes from the manual's index,
# by default the one igraph.org publishes for that release.
# The release tarball of the C library carries the same file
# as doc/html/ix01.html, which serves where igraph.org cannot be reached.
#
# Usage, from the root of this package:
#
#   Rscript data-raw/clinks.R <version> [<path or URL of ix01.html>]

args <- commandArgs(trailingOnly = TRUE)
if (!length(args) %in% 1:2) {
  stop(
    "Usage: Rscript data-raw/clinks.R <version> [<path or URL of ix01.html>]"
  )
}

version <- args[[1]]
index_url <- if (length(args) == 2) {
  args[[2]]
} else {
  sprintf("https://igraph.org/c/html/%s/ix01.html", version)
}

index <- xml2::read_html(index_url)
entries <- xml2::xml_find_all(index, ".//dt")
href <- vapply(
  entries,
  \(dt) xml2::xml_attr(xml2::xml_child(dt), "href"),
  character(1)
)

clinks <- data.frame(
  method = sub(".*#", "", href),
  url = sprintf("https://igraph.org/c/html/%s/%s", version, href)
)

dir.create(file.path("inst", "clinks"), recursive = TRUE, showWarnings = FALSE)
utils::write.csv(
  clinks,
  file.path("inst", "clinks", paste0(version, ".csv")),
  row.names = FALSE
)
