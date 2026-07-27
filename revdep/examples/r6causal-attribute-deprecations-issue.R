# R6causal install-time attribute setter deprecation warnings
# Issue: R6causal calls deprecated igraph attribute getters/setters at package
# load time, producing significant warnings during install and a WARNING from
# R CMD check `checking whether package can be installed`.

library(igraph)

g <- make_ring(5)

# All three are deprecated (warn only -- not yet defunct):

# set.edge.attribute() -- deprecated 2.0.0 -> set_edge_attr()
g <- set.edge.attribute(g, "weight", value = 1:5)

# induced.subgraph() -- deprecated 2.0.0 -> induced_subgraph()
sub <- induced.subgraph(g, 1:3)

# get.vertex.attribute() -- deprecated 2.0.0 -> vertex_attr()
get.vertex.attribute(sub, "name")

# Working replacements:
g2 <- make_ring(5)
g2 <- set_edge_attr(g2, "weight", value = 1:5)
sub2 <- induced_subgraph(g2, 1:3)
vertex_attr(sub2, "name")

# Root cause:
# - All three were deprecated in igraph 2.0.0
# - Still emit warnings (not yet defunct), but R CMD check escalates the
#   warnings to a package-install WARNING when they appear during .onLoad
#   or otherwise at package-build time

# Assessment:
# - Bug in R6causal -- replace with current API names; will hard-fail when
#   any of these is promoted to defunct in a future lifecycle pass

# Recommendation:
# - For R6causal:
#   set.edge.attribute()   -> set_edge_attr()
#   induced.subgraph()     -> induced_subgraph()
#   get.vertex.attribute() -> vertex_attr()
