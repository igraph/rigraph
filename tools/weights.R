library(igraph)
library(tidyverse)

# https://seankross.com/2021/02/25/Analyzing-R-Function-Arguments.html
args_data <- tibble(Package = "package:igraph") %>%
  mutate(Function = list(lsf.str(Package))) %>%
  unnest(Function) %>%
  mutate(Function = as.character(Function)) %>%
  mutate(
    Arg = map(
      Function,
      compose(args, as.list, names, ~ keep(.x, nzchar), .dir = "forward")
    )
  ) %>%
  unnest(Arg, keep_empty = TRUE)

dplyr::filter(args_data, Arg == "weights") |>
  dplyr::mutate(deprecated = grepl("\\.", Function)) |>
  dplyr::mutate(arg_def = "") |>
  dplyr::mutate(notes = "") |>
  dplyr::arrange(deprecated) |>
  knitr::kable()
