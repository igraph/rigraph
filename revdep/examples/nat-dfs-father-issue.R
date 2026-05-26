# nat dfs(father = ) defunct argument
# Issue: nat::as.seglist.igraph() calls igraph::dfs(x, father = TRUE),
# which became defunct in igraph 2.2.0.

library(igraph)

g <- make_tree(10, children = 2, mode = "out")

# Mirrors the call in nat:::as.seglist.igraph -- now defunct
# dfs(g, root = 1, father = TRUE, mode = "all")
# Error:
# ! The `father` argument of `dfs()` was deprecated in igraph 2.2.0 and is
#   now defunct.
# i Please use the `parent` argument instead.

# Working replacement
res <- dfs(g, root = 1, parent = TRUE, mode = "all")
res$parent

# Root cause:
# - dfs(father = ) was deprecated in igraph 2.2.0
# - Advanced from deprecate_warn to deprecate_stop in #2634
# - nat:::as.seglist.igraph() still calls dfs(x, root = origin, father = TRUE, mode = "all")

# Assessment:
# - Direct caller (not a cascade), intentional API rename in igraph

# Recommendation:
# - For nat: change `father = TRUE` to `parent = TRUE` in as.seglist.igraph()
#   and update consumers of `res$father` to read `res$parent` instead.
