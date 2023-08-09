cran_install <- function() {
  unlink("cran", recursive = TRUE)
  dir.create("cran")
  pak::pak("igraph", lib = "cran", dependencies = FALSE)
}
