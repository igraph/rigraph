#!/usr/bin/env Rscript
# Minimal reproducible example for Cascade namespace collision issue
# Issue: Warning when loading both igraph and magic packages

cat("=== Cascade Namespace Collision Issue ===\n\n")

# Load igraph (which now exports circulant)
library(igraph)
cat("Loaded igraph\n")
cat("igraph exports circulant:", "circulant" %in% ls("package:igraph"), "\n\n")

# Show that igraph::circulant exists as a constructor spec
cat("igraph::circulant is exported as a constructor spec\n")
cat("It is meant to be used with make_graph(), but make_graph() is deprecated\n")
cat("Example: make_graph(circulant(10, c(1, 3)))\n\n")

# Demonstrate the preferred way
cat("Preferred way (using make_circulant directly):\n")
g2 <- make_circulant(10, c(1, 3))
cat("Created graph with make_circulant:", vcount(g2), "vertices,", ecount(g2), "edges\n\n")

# Simulate what happens when magic package is loaded
cat("Attempting to demonstrate namespace collision:\n")
cat("If the magic package were loaded, it would show:\n")
cat("  Warning: replacing previous import 'igraph::circulant' by 'magic::circulant'\n\n")

cat("Root cause:\n")
cat("- igraph added make_circulant() and its constructor alias circulant() in v2.2.1.9003\n")
cat("- magic package also has a circulant() function for creating circulant matrices\n")
cat("- When both packages are loaded, there's a namespace collision\n\n")

cat("Assessment:\n")
cat("- This is an inadvertent behavior change in igraph\n")
cat("- The circulant() function is primarily a constructor alias\n")
cat("- Users should use make_circulant() directly\n")
cat("- Cascade package can resolve by explicitly importing magic::circulant\n")
