# qgraph sample_degseq(method = "simple.no.multiple") defunct
# Issue: qgraph::smallworldness() calls the deprecated alias
# igraph::degree.sequence.game(deg.dist, method = "simple.no.multiple"),
# which now hard-errors because the "simple.no.multiple" method value is defunct.

library(igraph)

deg <- c(rep(2, 10))  # any graphical degree sequence

# Old call -- now defunct in igraph 2.1.0
# sample_degseq(deg, method = "simple.no.multiple")
# Error:
# ! The `method` argument of `sample_degseq()` must be fast.heur.simple
#   instead of simple.no.multiple as of igraph 2.1.0.

# Working replacement -- new method name
g <- sample_degseq(deg, method = "fast.heur.simple")
vcount(g); ecount(g)

# Root cause:
# - sample_degseq() had three legacy method values renamed in 2.1.0:
#   "simple"                    -> "configuration"
#   "simple.no.multiple"        -> "fast.heur.simple"
#   "simple.no.multiple.uniform"-> "configuration.simple"
# - All three advanced from deprecate_warn to deprecate_stop in #2634

# Assessment:
# - Bug in qgraph -- pinned to an obsolete method name

# Recommendation:
# - For qgraph: switch to method = "fast.heur.simple". Also rename the
#   deprecated alias degree.sequence.game() itself -> sample_degseq() to
#   silence the upstream warnings (watts.strogatz.game, average.path.length,
#   degree.sequence.game).
