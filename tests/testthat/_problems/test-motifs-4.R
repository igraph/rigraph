# Extracted from test-motifs.R:4

# test -------------------------------------------------------------------------
withr::local_seed(123)
gnp <- sample_gnp(10000, 4 / 10000, directed = TRUE)
