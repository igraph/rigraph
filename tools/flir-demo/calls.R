# Old-style calls to igraph functions whose arguments moved behind `...` in
# igraph 3.0.0. Each comment says what the rules should do with the call.

library(igraph)
library(magrittr)

g <- make_ring(10)

# degree(): old formals graph, v, mode, loops, normalized

# by position: mode, loops and normalized all get named
degree(g, V(g), "out", FALSE, TRUE)
# by position, only mode
degree(g, 1:3, "in")
# by an abbreviation of the old name
degree(g, mo = "out", lo = FALSE)
# already new style: left alone
degree(g, mode = "out")
# piped: the graph comes from the left-hand side
g |> degree(V(g), "out")
g %>% degree(V(g), "out")
# magrittr with a `.` placeholder: the graph is not first, so positions are
# as written
g %>% degree(., V(.), "out")

# Left to the runtime recovery, not rewritten by position:
# a named argument shifts the unnamed ones
degree(g, v = 1:3, "out", TRUE)
# an empty slot
degree(g, , "out")
# `...` of a wrapper
my_degree <- function(...) degree(g, ..., "out")

# sample_gnp(): old formals n, p, directed, loops
sample_gnp(10, 0.2, TRUE, FALSE)
sample_gnp(10, 0.2, dir = TRUE)

# simplify(): old formals graph, remove.multiple, remove.loops, edge.attr.comb
# edge.attr.comb is renamed edge_attr_combine
simplify(g, TRUE, TRUE, "first")
simplify(g, edge.attr.comb = "sum")
igraph::simplify(g, edge.attr = "sum")

# clique_size_counts(): old formals graph, min, max, maximal
clique_size_counts(g, 2, 4, TRUE)
# `mi` binds to min, `max` to max, `maxi` to maximal
clique_size_counts(g, mi = 2, max = 4, maxi = TRUE)
# `ma` is ambiguous between max and maximal: an error in R, left alone
clique_size_counts(g, ma = 4)
