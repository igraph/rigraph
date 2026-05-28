# tidygraph bfs(father = ) defunct argument
# Issue: tidygraph's map_bfs* / map_dfs* family pass `father = TRUE` to
# igraph::bfs() / dfs(), which became defunct in igraph 2.2.0.

library(igraph)

g <- make_tree(10, children = 2, mode = "out")

# Old call -- now defunct in igraph 2.2.0
# bfs(g, root = 1, father = TRUE)
# Error:
# ! The `father` argument of `bfs()` was deprecated in igraph 2.2.0 and is
#   now defunct.
# i Please use the `parent` argument instead.

# Working replacement
res <- bfs(g, root = 1, parent = TRUE)
res$parent

# Same change applies to dfs()
res2 <- dfs(g, root = 1, parent = TRUE)
res2$parent

# Root cause:
# - bfs(father = ) and dfs(father = ) were deprecated in igraph 2.2.0
# - Both advanced from deprecate_warn to deprecate_stop in #2634
# - tidygraph's internal helper bfs_df() still uses `father = TRUE`

# Assessment:
# - Intentional API rename in igraph
# - tidygraph is the root of the visible cascade -- dci, ggraph, scistreer
#   all funnel through tidygraph::map_bfs*

# Recommendation:
# - For tidygraph: rename `father` -> `parent` in every igraph::bfs() and
#   igraph::dfs() call, and update any code that reads `$father` from the
#   result to read `$parent` instead.
