# Extracted from test-motifs.R:293

# test -------------------------------------------------------------------------
withr::local_seed(42)
g <- make_graph(~ A - B - C - A - D - E - F - D - C - F)
