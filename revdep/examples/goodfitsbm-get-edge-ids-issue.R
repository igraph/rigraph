# GoodFitSBM get_edge_ids() matrix orientation defunct
# Issue: GoodFitSBM:::Get.Induced.Subgraph() calls igraph::get.edge.ids(g, pairs)
# where `pairs` is a 2 x n matrix. Since igraph 2.1.5, the matrix form must be
# n x 2; the old orientation is now defunct.

library(igraph)

g <- make_ring(6)

# Old (2 x n) orientation -- now defunct
# pairs_old <- matrix(c(1, 2,
#                       2, 3,
#                       3, 4), nrow = 2)
# get_edge_ids(g, pairs_old)
# Error:
# ! The `vp` argument of `get_edge_ids()` supplied as a matrix should be a
#   n times 2 matrix, not 2 times n as of igraph 2.1.5.
# i either transpose the matrix with t() or convert it to a data.frame with
#   two columns.

# Working replacement -- n x 2 matrix
pairs <- matrix(c(1, 2,
                  2, 3,
                  3, 4), ncol = 2, byrow = TRUE)
get_edge_ids(g, pairs)

# Alternative: a 2-column data frame works too
get_edge_ids(g, as.data.frame(pairs))

# Or just a flat vertex-pair vector
get_edge_ids(g, c(1, 2, 2, 3, 3, 4))

# Root cause:
# - The matrix-form `vp` argument orientation was corrected in igraph 2.1.5
#   (deprecation warning then); now defunct via #2634
# - GoodFitSBM constructs `pairs` in the old 2 x n orientation

# Assessment:
# - Bug in GoodFitSBM -- passes the matrix in the no-longer-accepted orientation

# Recommendation:
# - For GoodFitSBM: transpose with t() before the call, or pass a 2-column
#   data frame, or flatten the matrix to a vector. Also rename the deprecated
#   alias get.edge.ids() -> get_edge_ids().
