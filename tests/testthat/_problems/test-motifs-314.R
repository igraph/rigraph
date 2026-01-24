# Extracted from test-motifs.R:314

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "igraph", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
withr::local_seed(42)
g <- make_graph(~ A - B - C - A - D - E - F - D - C - F)
motif_data <- list()
motifs(g, 3, callback = function(vids, isoclass) {
    motif_data[[length(motif_data) + 1]] <<- list(
      vids = vids,
      isoclass = isoclass
    )
    TRUE
  })
expect_snapshot({
    cat("Number of motifs found:", length(motif_data), "\n")
    cat("Sample motif 1:\n")
    print(motif_data[[1]])
    if (length(motif_data) > 1) {
      cat("Sample motif 2:\n")
      print(motif_data[[2]])
    }
  })
