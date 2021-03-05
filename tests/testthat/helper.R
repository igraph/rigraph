
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

with_rng_version <- function(version, expr) {
  orig <- RNGkind()
  on.exit(do.call(RNGkind, as.list(orig)), add = TRUE)
  suppressWarnings(RNGversion(version))
  expr
}

local_rng_version <- function(version, .local_envir = parent.frame()) {
  orig <- RNGkind()
  withr::defer(do.call(RNGkind, as.list(orig)), envir = .local_envir)
  suppressWarnings(RNGversion(version))
  orig
}

expect_that <- function(object, condition, info = NULL, label = NULL) {
  suppressWarnings(
    condition(object)
  )
}
