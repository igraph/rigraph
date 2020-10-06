library(testthat)
library(igraph)

if (Sys.getenv("NOT_CRAN", "") == "true") test_check("igraph")
