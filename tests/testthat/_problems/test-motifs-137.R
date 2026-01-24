# Extracted from test-motifs.R:137

# test -------------------------------------------------------------------------
withr::local_seed(20041103)
g <- make_graph(~ A - B - C - A - D - E - F - D - C - F)
