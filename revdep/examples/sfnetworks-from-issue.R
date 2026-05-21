# sfnetworks all_shortest_paths() issue
# Issue: from parameter must specify exactly one vertex

library(igraph)

# Create a simple graph
g <- make_ring(5)

# This works - single vertex
paths1 <- all_shortest_paths(g, from = 1, to = 3)
length(paths1$res)

# This fails - multiple vertices in 'from'
# paths2 <- all_shortest_paths(g, from = c(1, 2), to = 3)
# Error: `from` must specify exactly one vertex

# Root cause:
# - igraph added stricter validation requiring exactly one vertex for 'from' parameter
# - sfnetworks passes multiple vertices to all_shortest_paths()
# - Previously may have used only the first vertex implicitly

# Assessment:
# - This is an intentional API tightening in igraph for safety and clarity
# - sfnetworks needs to handle multiple 'from' vertices explicitly
# - The function should iterate or be clear about using only the first vertex

# Recommendation for sfnetworks:
# - If only first vertex intended: from <- from[1]
# - If all vertices intended: lapply(from, function(f) all_shortest_paths(g, from = f, to = to))
# - Or provide clear warning/error about multiple vertices
