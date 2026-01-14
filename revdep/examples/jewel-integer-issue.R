#!/usr/bin/env Rscript
# Minimal reproducible example for jewel integer validation issue
# Issue: rewire_impl now strictly validates that n is an integer

cat("=== jewel Integer Validation Issue ===\n\n")

library(igraph)

# Create a simple graph for testing
g <- make_ring(10)
cat("Created test graph:", vcount(g), "vertices,", ecount(g), "edges\n\n")

# Test 1: Integer value (should work)
cat("Test 1: Using integer value (100)\n")
tryCatch({
  result <- rewire(g, keeping_degseq(niter = 100))
  cat("✓ SUCCESS: Integer value works\n")
  cat("  Result:", vcount(result), "vertices,", ecount(result), "edges\n\n")
}, error = function(e) {
  cat("✗ FAILED:", conditionMessage(e), "\n\n")
})

# Test 2: Non-integer value (will fail)
cat("Test 2: Using non-integer value (2.45)\n")
tryCatch({
  result <- rewire(g, keeping_degseq(niter = 2.45))
  cat("✓ SUCCESS: Non-integer value works\n")
  cat("  Result:", vcount(result), "vertices,", ecount(result), "edges\n\n")
}, error = function(e) {
  cat("✗ FAILED:", conditionMessage(e), "\n\n")
})

# Test 3: Computed value (simulating jewel package scenario)
cat("Test 3: Using computed value (p * 0.05 where p = 49)\n")
p <- 49
niter <- p * 0.05  # = 2.45
cat("  Computed niter =", niter, "\n")
tryCatch({
  result <- rewire(g, keeping_degseq(niter = niter))
  cat("✓ SUCCESS: Computed value works\n")
  cat("  Result:", vcount(result), "vertices,", ecount(result), "edges\n\n")
}, error = function(e) {
  cat("✗ FAILED:", conditionMessage(e), "\n\n")
})

# Test 4: Workaround using as.integer (should work)
cat("Test 4: Using as.integer() workaround\n")
cat("  Computed niter =", niter, "-> as.integer(niter) =", as.integer(niter), "\n")
tryCatch({
  result <- rewire(g, keeping_degseq(niter = as.integer(niter)))
  cat("✓ SUCCESS: Integer conversion works\n")
  cat("  Result:", vcount(result), "vertices,", ecount(result), "edges\n\n")
}, error = function(e) {
  cat("✗ FAILED:", conditionMessage(e), "\n\n")
})

cat("Root cause:\n")
cat("- rewire_impl() converts n with as.numeric(), preserving fractional parts\n")
cat("- C code in rinterface_extra.c now strictly validates integer values\n")
cat("- Previously may have silently truncated, now explicitly rejects\n\n")

cat("Assessment:\n")
cat("- This uncovered a bug in the jewel package\n")
cat("- niter should logically be an integer (number of iterations)\n")
cat("- jewel should use ceiling(), floor(), or round() on computed niter\n\n")

cat("Recommendation:\n")
cat("- Fix in jewel: niter <- ceiling(p * 0.05)\n")
cat("- OR fix in igraph for backward compatibility:\n")
cat("  Add as.integer() in rewire_keeping_degseq() before calling rewire_impl()\n")
