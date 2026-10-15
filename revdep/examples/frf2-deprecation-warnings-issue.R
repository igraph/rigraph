# FrF2 deprecation warnings leak into .Rout.save
# Issue: FrF2 calls multiple deprecated igraph functions. The warnings appear
# in test output and diverge from the checked-in .Rout.save reference file,
# producing a NOTE.

library(igraph)

# All of the following emit deprecation warnings (not errors) on current dev igraph:

# graph.empty() -- deprecated 2.1.0 -> make_empty_graph()
g1 <- graph.empty(n = 5, directed = FALSE)

# add.edges() -- deprecated 2.0.0 -> add_edges()
g2 <- add.edges(g1, c(1, 2, 2, 3))

# independence.number() -- deprecated 2.0.0 -> ivs_size()
independence.number(g2)

# clique.number() -- deprecated 2.0.0 -> clique_num()
clique.number(g2)

# Working replacements (no warnings):
g1b <- make_empty_graph(n = 5, directed = FALSE)
g2b <- add_edges(g1b, c(1, 2, 2, 3))
ivs_size(g2b)
clique_num(g2b)

# Root cause:
# - None of these are defunct yet; they emit warnings
# - FrF2's tests diff their .Rout output against a checked-in .Rout.save;
#   any extra warning lines cause a "NOTE" from the diff

# Assessment:
# - Bug in FrF2 -- uses long-deprecated function names; will hard-fail when
#   any of these is promoted to defunct in a future lifecycle pass

# Recommendation:
# - For FrF2: rename to the current API
#   graph.empty()         -> make_empty_graph()
#   add.edges()           -> add_edges()
#   independence.number() -> ivs_size()
#   clique.number()       -> clique_num()
#   Then regenerate godolphintest.Rout.save (and any other .Rout.save files).
