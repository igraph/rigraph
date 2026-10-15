# degreenet reedmolloy() fails through a defunct fallback method
# Issue: reedmolloy() retries via igraph::degree.sequence.game(method =
# "simple.no.multiple") whenever its first attempt with method = "vl" fails.
# That fallback value is defunct in dev igraph, so the retry loop never
# succeeds and reedmolloy reports its own error.

library(degreenet)
library(igraph)

set.seed(2)
s4 <- simpln(n = 100, v = c(-1, 1))
table(s4)
#>  1  2  3  4  5  6
#> 65 18  7  4  4  2

# Step 1: confirm the VL call deterministically fails on this sequence (this
# is NOT a regression -- VL only produces connected graphs, and s4's 65
# degree-1 vertices preclude a connected configuration in practice).
# Verified against CRAN igraph 2.3.1: 50/50 VL attempts errored.
res_vl <- try(sample_degseq(s4, method = "vl"), silent = TRUE)
cat("VL succeeded:", !inherits(res_vl, "try-error"), "\n")

# Step 2: the fallback path -- works on CRAN 2.3.1 (with a deprecation
# warning), but hard-errors on dev igraph.
# sample_degseq(s4, method = "simple.no.multiple")
# Error on dev:
# ! The `method` argument of `sample_degseq()` must be fast.heur.simple
#   instead of simple.no.multiple as of igraph 2.1.0.

# Step 3: proper replacement -- works on every igraph 2.x version.
g_new <- sample_degseq(s4, method = "fast.heur.simple")
vcount(g_new); ecount(g_new)

# Putting it together: reedmolloy(s4) succeeds on CRAN 2.3.1 because the
# fallback path produces a (warned) graph; it fails on dev igraph because
# the fallback is now defunct and .catchToList() converts the error into a
# retry, exhausting maxit and triggering reedmolloy's own error message.

# Root cause:
# - The lifecycle promotion of sample_degseq(method = "simple.no.multiple")
#   from deprecate_warn to deprecate_stop in #2634.

# Assessment:
# - Bug in degreenet -- depends on the obsolete fallback method name.

# Recommendation:
# - For degreenet: replace the fallback method with "fast.heur.simple".
#   Also rename degree.sequence.game() -> sample_degseq() and
#   get.edgelist() -> as_edgelist().
