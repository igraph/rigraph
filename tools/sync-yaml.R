library(dplyr)
library(purrr)

lines_r <- brio::read_file("tools/stimulus/functions-R.yaml")

split_r <- strsplit(
  lines_r,
  "\n(?=((?:#.*|)\n)+igraph_.*:\n(?:(?:[ #].*|)\n)*\n+)",
  perl = TRUE
)[[1]]

proper_r <- grepl("^\nigraph_", split_r)

r <- tibble(proper = proper_r, split = split_r) |>
  mutate(id = cumsum(lag(proper, default = FALSE))) |>
  summarize(.by = id, text_r = paste(split, collapse = "\n")) |>
  transmute(
    name = gsub(".*\n(igraph[^:]+):.*", "\\1", text_r),
    text_r
  )

map(r$text_r, grep, pattern = "\nigraph") |>
  lengths() |>
  unique()

lines_c <- paste0(
  brio::read_file("src/vendor/cigraph/interfaces/functions.yaml"),
  "\n"
)

split_c <- strsplit(
  lines_c,
  "\n(?=((?:#.*|)\n)+igraph_.*:\n(?:(?:[ #].*|)\n)*\n+)",
  perl = TRUE
)[[1]]

proper_c <- grepl("^\nigraph_", split_c)

c <- tibble(proper = proper_c, split = split_c) |>
  mutate(id = cumsum(lag(proper, default = FALSE))) |>
  summarize(.by = id, text_c = paste(split, collapse = "\n")) |>
  transmute(
    name = gsub(".*\n(igraph[^:]+):.*", "\\1", text_c),
    text_c
  )

map(c$text_c, grep, pattern = "\nigraph") |>
  lengths() |>
  unique()

# Remove unused
semi_join(r, c) |>
  pull() |>
  paste(collapse = "\n") |>
  brio::write_file("tools/stimulus/functions-R.yaml")

# Reorder in C order
inner_join(c, r) |>
  pull() |>
  paste(collapse = "\n") |>
  brio::write_file("tools/stimulus/functions-R.yaml")

# Add new
left_join(c, r) |>
  mutate(text_r = coalesce(text_r, gsub("(:).*$", "\\1", text_c))) |>
  pull() |>
  paste(collapse = "\n") |>
  brio::write_file("tools/stimulus/functions-R.yaml")
