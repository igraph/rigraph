
has_glpk <- function() {
  glpk <- TRUE
  tryCatch(
    cluster_optimal(make_ring(10)),
    error = function(e) glpk <<- FALSE
  )
  glpk
}

skip_if_no_glpk <- function() {
  if (!has_glpk()) skip("No GLPK library")
}
