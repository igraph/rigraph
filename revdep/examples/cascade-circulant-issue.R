# Cascade namespace collision issue
# Issue: Warning when loading both igraph and magic packages

library(igraph)

# igraph now exports circulant() as a constructor alias
"circulant" %in% ls("package:igraph")

# The preferred way is to use make_circulant() directly
g <- make_circulant(10, c(1, 3))
vcount(g)
ecount(g)

# Root cause:
# - igraph added make_circulant() and constructor alias circulant() in v2.2.1.9003
# - magic package also has a circulant() function for creating circulant matrices
# - When both packages are loaded, there's a namespace collision
# - This produces: Warning: replacing previous import 'igraph::circulant' by 'magic::circulant'

# Assessment:
# - This is an inadvertent behavior change in igraph
# - The circulant() function is primarily a constructor alias
# - Users should use make_circulant() directly
# - Cascade package can resolve by explicitly importing magic::circulant in NAMESPACE
