# Extracted from test-operators.R:1314

# prequel ----------------------------------------------------------------------
unique_tests <- list(
  list(1:5, 1:5),
  list(c(1, 1, 2:5), 1:5),
  list(c(1, 1, 1, 1), 1),
  list(c(1, 2, 2, 2), 1:2),
  list(c(2, 2, 1, 1), 2:1),
  list(c(1, 2, 1, 2), 1:2),
  list(c(), c())
)

# test -------------------------------------------------------------------------
g <- make_full_graph(3)
mg <- mycielskian(g, 1)
