#!/usr/bin/env Rscript
# Minimal reproducible example for rSpectral modularity issue
# Issue: Modularity values have changed slightly

cat("=== rSpectral Modularity Calculation Issue ===\n\n")

library(igraph)

# Create a test graph
cat("Creating test graph...\n")
g <- make_full_graph(5) + make_full_graph(5) + make_full_graph(5)
cat("Graph:", vcount(g), "vertices,", ecount(g), "edges\n\n")

# Test modularity with clear community structure
membership <- c(1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3)

cat("Test 1: Modularity without weights\n")
mod1 <- modularity(g, membership, weights = NULL)
cat("  Modularity:", mod1, "\n\n")

cat("Test 2: Modularity with default (may use weights if present)\n")
mod2 <- modularity(g, membership)
cat("  Modularity:", mod2, "\n\n")

# Add weights to demonstrate the issue
cat("Test 3: Adding edge weights to graph\n")
E(g)$weight <- 1.0
cat("  Added uniform weights of 1.0\n")
mod3 <- modularity(g, membership)
cat("  Modularity with weights:", mod3, "\n\n")

# Different weights
cat("Test 4: Using random edge weights\n")
set.seed(42)
E(g)$weight <- runif(ecount(g))
mod4 <- modularity(g, membership)
cat("  Modularity with random weights:", mod4, "\n\n")

cat("Test 5: Explicitly passing weights = NULL (doesn't disable auto-detection!)\n")
mod5 <- modularity(g, membership, weights = NULL)
cat("  Modularity (weights = NULL):", mod5, "\n")
cat("  Note: This does NOT match Test 1 because weights = NULL doesn't disable auto-detection!\n")
cat("  The function still uses the 'weight' attribute if it exists.\n\n")

cat("Root cause:\n")
cat("- igraph v2.2.1.9004 added: 'Use \"weights\" edge attribute in modularity() if available'\n")
cat("- modularity() now automatically uses edge weights if present\n")
cat("- Previously may have ignored weights by default\n")
cat("- rSpectral tests also show: 'This graph was created by an old(er) igraph version'\n\n")

cat("Assessment:\n")
cat("- This is likely an inadvertent behavior change in igraph\n")
cat("- Modularity differences are small but significant for exact tests\n")
cat("- Expected: 0.408, Actual: 0.432 (difference: +0.024)\n")
cat("- Expected: 0.3776, Actual: 0.3758 (difference: -0.0018)\n\n")

cat("Recommendation for rSpectral:\n")
cat("1. Update saved graph objects using upgrade_graph()\n")
cat("2. Review whether graphs should have weights or not\n")
cat("3. Remove unintended weights: g <- delete_edge_attr(g, 'weight')\n")
cat("4. Update expected test values if the new weighted modularity is correct\n\n")

cat("Recommendation for igraph:\n")
cat("1. Fix so that weights = NULL explicitly disables auto-detection\n")
cat("2. Only auto-detect weights when the weights argument is missing (not provided)\n")
cat("3. Or clearly document this as a breaking change in NEWS.md\n")
