# vkR igraph::get.edge missing
# Issue: vkR references igraph::get.edge, which has been removed.

library(igraph)

g <- make_ring(5)

# Old call -- function has been removed
# igraph::get.edge(g, 1)
# Error: 'get.edge' is not an exported object from 'namespace:igraph'

# Working replacement
ends(g, 1)        # endpoints of edge 1
ends(g, 1:3)      # ends() is vectorised over edges

# Root cause:
# - get.edge() was hard-deprecated and is now removed
# - Replacement is ends(graph, es) which is vectorised
# - vkR still references igraph::get.edge somewhere -- R CMD check surfaces it
#   as `Missing or unexported object: 'igraph::get.edge'`

# Assessment:
# - Bug in vkR -- references a function that no longer exists
# - Surfaces as a WARNING (in `checking dependencies in R code`); will become
#   an error if/when the affected code path is exercised.

# Recommendation:
# - For vkR: replace igraph::get.edge(graph, e) with igraph::ends(graph, e).
#   Note that ends() accepts vectors of edges and returns an n x 2 matrix,
#   so single-edge callers may need to extract the first row.
