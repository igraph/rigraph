# cranly eigen_centrality(scale = ) defunct
# Issue: cranly:::summary.cranly_network() calls
# igraph::eigen_centrality(cranly_graph, scale = FALSE), defunct since 2.1.1.

library(igraph)

g <- sample_gnp(20, 0.3)

# Old call -- now defunct in igraph 2.1.1
# eigen_centrality(g, scale = FALSE)
# Error:
# ! The `scale` argument of `eigen_centrality()` always as if TRUE as of
#   igraph 2.1.1.
# i Normalization is always performed

# Working replacement
res <- eigen_centrality(g)
str(res$vector)

# If raw (un-normalized) values are needed, rescale manually after the call
# (e.g. multiply by some reference value)

# Root cause:
# - eigen_centrality(scale = ) was deprecated in 2.1.1 (#1543); normalization
#   is now mandatory
# - Advanced from deprecate_warn to deprecate_stop in #2634

# Assessment:
# - Bug in cranly -- relies on an argument whose effect has been removed

# Recommendation:
# - For cranly: drop the `scale = FALSE` argument. If un-normalized values
#   are genuinely needed downstream, scale them manually afterwards.
