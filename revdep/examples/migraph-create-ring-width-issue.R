# migraph create_ring(32, width = 2) deprecation surfacing as test failure
#
# Failure surface: migraph (tutorial test asserts no warning).
# Upstream owner: manynet -- create_ring() is defined in manynet (which
# migraph Depends on), and the deprecation originates inside manynet's
# implementation, not in migraph code.
#
# Reference: https://github.com/stocnet/manynet/blob/main/R/make_create.R

# manynet::create_ring(32, width = 2) internally:
#   igraph::make_ring(32, directed = FALSE)
#   manynet::as_matrix(...)                       # uses igraph::as_adjacency_matrix()
#   igraph::graph_from_adjacency_matrix(out, "undirected")
#
# Reproducer (requires manynet):
# install.packages("manynet")
# library(manynet)
# w <- NULL
# withCallingHandlers(
#   rg <- create_ring(32, width = 2),
#   warning = function(c) { w <<- c; invokeRestart("muffleWarning") }
# )
# w
# - Against manynet 2.0.1 + CRAN igraph 2.3.1: NULL (no warning)
# - Against dev igraph: unknown -- not yet verified

# Status:
# - Against latest CRAN manynet (2.0.1) + CRAN igraph, the call runs cleanly.
# - manynet 2.0.0 reworked as_matrix.igraph() and other internals; the warning
#   path may already be gone.
# - Cannot reproduce against dev igraph from this environment without a local
#   build.

# Recommendation:
# - Re-confirm on the next revdep run.
# - If the warning still fires against dev igraph, identify the specific call
#   in manynet's create_ring -> as_matrix -> graph_from_adjacency_matrix chain
#   that is deprecated, and fix it in manynet (not migraph).
