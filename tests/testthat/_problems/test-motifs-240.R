# Extracted from test-motifs.R:240

# test -------------------------------------------------------------------------
withr::local_seed(123)
g <- make_graph(~ A - B - C - A - D - E - F - D - C - F)
