make_closure <- function(fun, ...) {
  data <- list(...)
  mapply(assign, names(data), data, MoreArgs = list(pos = environment()))
  environment(fun) <- environment()
  fun
}

has_glpk <- make_closure(glpk = NULL, \() {
  if (is.null(glpk)) {
    glpk <<- tryCatch(
      {
        cluster_optimal(make_ring(10))
        TRUE
      },
      error = \(e) FALSE
    )
  }
  glpk
})

has_graphml <- make_closure(graphml = NULL, \() {
  if (is.null(graphml)) {
    graphml <<- tryCatch(
      {
        read_graph(
          rawConnection(charToRaw("<graphml><graph></graph></graphml>")),
          format = "graphml"
        )
        TRUE
      },
      error = \(e) FALSE
    )
  }
  graphml
})
