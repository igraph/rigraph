# rSpectral modularity() now auto-uses the "weight" edge attribute
# Issue: rSpectral's stored test graphs carry a "weight" attribute. Previously
# modularity() ignored it unless weights = E(g)$weight was passed explicitly;
# now modularity() auto-detects and uses the attribute, changing the computed
# values and breaking baseline assertions.

library(igraph)

# A small graph with a weight attribute
g <- make_ring(5)
E(g)$weight <- c(1, 2, 3, 4, 5)

# Same membership, two different modularity calls
membership <- c(1, 1, 2, 2, 2)

# Old behaviour (ignored weights unless passed explicitly):
# the value below is what modularity() returned before the change
modularity(g, membership, weights = rep(1, ecount(g)))

# New behaviour (auto-detects $weight):
modularity(g, membership)

# These two now differ -- which is exactly what breaks rSpectral's tests.

# Root cause:
# - Around igraph 2.2.1.9004, modularity() was changed to use the "weight"
#   edge attribute automatically when present:
#     if (is.null(weights) && "weight" %in% edge_attr_names(graph)) {
#       weights <- E(graph)$weight
#     }
# - rSpectral's stored test graphs carry a "weight" attribute that was not
#   intended to be consumed by modularity().

# Assessment:
# - Behavioural change in igraph. Inadvertent semantics shift for callers
#   that did not intend to use weights. There is currently no clean
#   `weights = NA` opt-out.

# Recommendation:
# - For igraph (action required before notifying rSpectral): provide a clean
#   opt-out -- e.g. accept `weights = NA` to disable auto-detection -- and
#   document the contract change in NEWS.md.
# - For rSpectral (once an opt-out exists, or after igraph adjusts):
#     1. Determine whether the stored graphs were intended to carry $weight.
#     2. If not: g <- igraph::delete_edge_attr(g, "weight") before modularity()
#        and run igraph::upgrade_graph() on stored graph objects.
#     3. If yes: update the expected modularity baselines.

# Workaround that happens to disable auto-detection today (DO NOT recommend
# to downstream maintainers -- relies on implementation detail):
#   modularity(g, membership, weights = numeric())
