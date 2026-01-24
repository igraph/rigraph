# Extracted from test-motifs.R:254

# test -------------------------------------------------------------------------
withr::local_seed(123)
g <- make_graph(~ A - B - C - A)
