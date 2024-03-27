library(tidyverse)

fs::dir_ls("revdep/cloud.noindex/aca814a4-3c75-4496-ac24-1761eb50ad8b", glob = "*/*/*.Rcheck/00check.log", recurse = TRUE) |>
  fs::file_info() |>
  mutate(rcheck = fs::path_file(fs::path_dir(path))) |>
  summarize(.by = rcheck, modification_time = max(modification_time)) |>
  arrange(modification_time) |>
  transmute(
    count = row_number(),
    rate = count / n(),
    duration = hms::as_hms(modification_time - min(modification_time))
  ) |>
  ggplot(aes(x = duration, y = count)) +
  geom_line()
