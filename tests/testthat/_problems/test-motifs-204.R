# Extracted from test-motifs.R:204

# test -------------------------------------------------------------------------
withr::local_seed(123)
g <- make_graph(~ A - B - C - A - D - E - F - D - C - F)
