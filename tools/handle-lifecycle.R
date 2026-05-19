# For each R file still containing lifecycle::deprecate_soft or lifecycle::deprecate_warn:
# advance the level with regex, document, test (stop on error so you can fix),
# prompt to continue, add NEWS item, commit.

already_committed <- system2("git", c("diff", "--name-only", "main..HEAD"), stdout = TRUE)
already_committed <- basename(already_committed[grepl("^R/", already_committed)])

r_files <- sort(setdiff(
  list.files(here::here("R"), pattern = "\\.R$", full.names = FALSE),
  already_committed
))

for (f in r_files) {
  path <- here::here("R", f)
  lines <- readLines(path, warn = FALSE)

  has_soft <- any(grepl("lifecycle::deprecate_soft", lines, fixed = TRUE))
  has_warn <- any(grepl("lifecycle::deprecate_warn", lines, fixed = TRUE))

  if (!has_soft && !has_warn) next

  stem <- tools::file_path_sans_ext(f)
  cli::cli_alert_info("Processing R/{f}")

  # Extract function names before replacement for NEWS
  extract_fns <- function(lines, level) {
    hits <- grep(paste0("lifecycle::", level), lines, fixed = TRUE, value = TRUE)
    m <- regmatches(hits, regexpr(
      paste0('lifecycle::', level, '\\([^,]+,\\s*"([^("]+)\\('),
      hits, perl = TRUE
    ))
    sub(paste0('.*"'), "", m[nzchar(m)])
  }
  soft_fns <- extract_fns(lines, "deprecate_soft")
  warn_fns  <- extract_fns(lines, "deprecate_warn")

  # Advance: warn -> stop first to avoid double-replacement
  lines <- gsub("lifecycle::deprecate_warn", "lifecycle::deprecate_stop", lines, fixed = TRUE)
  lines <- gsub("lifecycle::deprecate_soft", "lifecycle::deprecate_warn", lines, fixed = TRUE)
  writeLines(lines, path)

  devtools::document(quiet = TRUE)

  # Tests — stop on failure so the user can fix
  if (file.exists(here::here("tests", "testthat", paste0("test-", stem, ".R")))) {
    callr::r(
      function(pkg, filter) devtools::test(pkg = pkg, filter = filter, stop_on_failure = TRUE),
      args = list(pkg = here::here(), filter = stem)
    )
  }

  answer <- readline(paste0("Tests passed for R/", f, ". Commit? [Enter = yes / n = stop] "))
  if (trimws(tolower(answer)) == "n") stop("Stopped at R/", f, ". Fix, then commit manually and re-run.")

  # Add NEWS items
  news_entries <- c(
    if (length(soft_fns) > 0)
      paste0("- `", soft_fns, "()` is now deprecated with a warning instead of a message."),
    if (length(warn_fns) > 0)
      paste0("- `", warn_fns, "()` is now defunct (errors instead of warning).")
  )

  news_lines <- readLines(here::here("NEWS.md"), warn = FALSE)
  depr_idx <- which(news_lines == "## Deprecated and defunct")

  if (length(depr_idx) > 0) {
    insert_pos <- depr_idx[[1]] + 2L
    new_news <- c(
      news_lines[seq_len(insert_pos - 1L)],
      news_entries,
      news_lines[seq(insert_pos, length(news_lines))]
    )
  } else {
    first_ver_idx <- which(grepl("^# igraph", news_lines))[[1]]
    new_news <- c(
      news_lines[seq_len(first_ver_idx)],
      "",
      "## Deprecated and defunct",
      "",
      news_entries,
      "",
      news_lines[seq(first_ver_idx + 1L, length(news_lines))]
    )
  }
  writeLines(new_news, here::here("NEWS.md"))

  commit_msg <- if (has_soft && has_warn) {
    paste0("feat!: bump deprecated functions in R/", f)
  } else if (has_soft) {
    paste0("feat!: bump deprecate_soft to deprecate_warn in R/", f)
  } else {
    paste0("feat!: bump deprecate_warn to deprecate_stop in R/", f)
  }

  gert::git_add(c(paste0("R/", f), "man", "NAMESPACE", "NEWS.md"), repo = here::here())
  gert::git_commit(commit_msg, repo = here::here())
  cli::cli_alert_success("Committed R/{f}")
}
