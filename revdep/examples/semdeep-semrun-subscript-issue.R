# SEMdeep SEMml(algo = "sem") -- subscript out of bounds [NEEDS TRIAGE]
# Issue: the SEMml() example fails at the algo = "sem" step with
#   Error in x[, ii] : subscript out of bounds
#   Calls: SEMml ... model.frame.default -> na.omit -> na.omit.data.frame
# The failing call is SEMgraph::SEMrun(dag, data, algo = "cggm"); no igraph
# function is on the backtrace, so this is a silent change in what igraph
# returns rather than a lifecycle error.
#
# Unlike the other examples here this one is NOT reduced to an igraph call
# yet -- it needs SEMgraph (and therefore Bioconductor's graph/Rgraphviz),
# which is why the .md beside it carries the check log rather than reprex
# output.

library(SEMgraph)
library(igraph)

# SEMml()'s own preprocessing, up to the call that fails
ig <- alsData$graph
data <- transformData(alsData$exprs)$data

nodes <- colnames(data)[colnames(data) %in% V(ig)$name]
graph <- induced_subgraph(ig, vids = which(V(ig)$name %in% nodes))
dag <- graph2dag(graph, data, bap = FALSE)
data <- data[, V(dag)$name]

# SEMdeep::SEMml(..., algo = "sem") does exactly this:
fit <- SEMrun(dag, data = data, algo = "cggm")

# Or, from the package itself:
# set.seed(123)
# train <- sample(1:nrow(data), 0.5 * nrow(data))
# SEMml(alsData$graph, data[train, ], algo = "sem")

# Triage notes -- what to compare between CRAN igraph and the dev version,
# since the error is a column subscript running past the end of a data frame:
#   vcount(dag); ecount(dag)
#   V(dag)$name                      # names and their order
#   setdiff(V(dag)$name, colnames(data))
#   igraph::degree(dag, mode = "in") # SEMml() splits Vx/Vy on this
#   is_dag(dag)
# A graph2dag() that now drops, renames or reorders vertices would produce
# exactly this failure downstream.

# Assessment:
# - Not yet traced to a specific igraph change. It is the same shape as
#   SEMgraph's own open item in #2646 (subscript out of bounds in
#   buildLevels()), and SEMdeep Depends on SEMgraph, so one cause may explain
#   both.

# Recommendation:
# - Bisect against the ellipsis-move PRs (#2757-#2778, #2784) before
#   contacting the maintainer: the shape of the failure -- a silently
#   different result with no warning -- is what a positional argument no
#   longer binding where it used to looks like.
