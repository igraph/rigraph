# ECoL hub.score() defunct
# Issue: ECoL:::c.Hubs() calls igraph::hub.score(graph), defunct in igraph 2.0.0.

library(igraph)

g <- sample_gnp(20, 0.2, directed = TRUE)

# Old call -- now defunct
# hub.score(g)
# Error:
# ! `hub.score()` was deprecated in igraph 2.0.0 and is now defunct.
# i Please use `hits_scores()` instead.

# Working replacement
scores <- hits_scores(g)
str(scores$hub)
str(scores$authority)

# Root cause:
# - hub.score() and authority.score() were deprecated in igraph 2.0.0,
#   both replaced by hits_scores() which returns hub and authority together
# - Both advanced from deprecate_warn to deprecate_stop in #2634

# Assessment:
# - Bug in ECoL -- uses a function name deprecated for the entire 2.x series

# Recommendation:
# - For ECoL: replace `igraph::hub.score(graph)` with
#   `igraph::hits_scores(graph)$hub`. If authority.score() is used elsewhere,
#   replace with `hits_scores(graph)$authority`.
