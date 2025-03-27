deprecated_df <- readr::read_csv(
  system.file('lifecycle', 'deprecated.csv', package = "igraph"),
  show_col_types = FALSE
)

flag <- function(old) {
  old_str <- gsub("\\.", "\\\\.", old)
  # https://stackoverflow.com/a/45802423
  no <- system(sprintf("grep -R '%s(' R  | wc -l", old_str), intern = TRUE)

  if (no > 2) cli::cli_abort(old)
}


exceptions <- c(
  # their names are part of longer function names
  "ba.game", "barabasi.game", "cited.type.game", "clusters", "evcent",
  "preference.game", "shortest.paths",
  # false positives
  "graph.edgelist", "graph.graphdb", "graph.lattice", "independent.vertex.sets",
  # tackled elsewhere/enough
  "is.directed", "graph"
)
purrr::walk(setdiff(deprecated_df$old, exceptions), flag)
