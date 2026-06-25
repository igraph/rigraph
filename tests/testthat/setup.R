# Pin print options for the whole test suite so output is deterministic and
# independent of the package defaults. `print.style = "classic"` keeps the
# historical `IGRAPH ... DNW-` output that most snapshots assert against; the
# cli-styled output is exercised explicitly in test-print-cli.R. `print.id`
# is pinned off because the 7-character graph id is non-deterministic.
igraph_options(print.style = "classic", print.id = FALSE)
