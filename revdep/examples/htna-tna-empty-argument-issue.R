# htna: empty argument in `...` -- igraph regression, already fixed
# Issue: htna's tests call tna::estimate_cs(), which reaches
# tna:::as.igraph.matrix() -> igraph::graph_from_adjacency_matrix(). That call
# ends in a trailing comma, so an empty argument lands in `...`. In the
# ellipsis-move refactoring that reached migrate_recover_args() and errored
# with "argument is missing, with no default".
#
# This is an igraph bug, not an htna or tna one, and the current development
# version handles it -- the script below runs clean. It is kept as the
# regression reproducer.

library(igraph)

m <- matrix(c(0, 1, 1, 0), 2, dimnames = list(c("a", "b"), c("a", "b")))

# tna:::as.igraph.matrix(), reduced -- note the trailing comma
tna_shape <- function(x, mode = "directed", ...) {
  igraph::graph_from_adjacency_matrix(
    adjmatrix = x,
    mode = mode,
    weighted = TRUE,
  )
}
tna_shape(m)

# The other form from the same class of failure: a skipped positional slot
graph_from_data_frame(data.frame(from = "a", to = "b"), , directed = FALSE)

# Root cause:
# - Moving the optional arguments behind `...` made every call with an empty
#   argument reach the migration handler, where forcing dots[[k]] errored.
# - Fixed by skipping missing dots; both forms above now work.

# Assessment:
# - Ours, not theirs. Same root cause as tna, lagdynamics, modelbpp and
#   NetSci in #2646, all tagged [IGRAPH BUG].

# Recommendation:
# - Nothing to send upstream. Re-check htna and tna against the current dev
#   version to confirm they are green again; a trailing comma is legal R and
#   igraph has to accept it.
