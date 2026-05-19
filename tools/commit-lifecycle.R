# create a Rbuildignored, gitignored directory called 'lifecycle'

# lifecycle_dir <- here::here("lifecycle")
# dir.create(lifecycle_dir, showWarnings = FALSE)
#
# usethis::use_build_ignore("lifecycle")
# usethis::use_git_ignore("lifecycle")

# collect all functions changed from the commit messages on this branch, add items to `lifecycle/NEWS.md` which
# is `NEWS.md` with the edits — already done, lifecycle/NEWS.md exists

# reset mixed to right before the PR

# cli::cli_alert_info("Resetting to merge-base {substr(merge_base, 1, 7)}...")
# gert::git_reset_mixed(merge_base, repo = here::here())
# cli::cli_alert_success("Reset to merge-base")

# copy all changed files, except man/ and NAMESPACE which should be reset to their previous state,
# to 'lifecycle', use their version from main instead.

# changed <- gert::git_status(repo = here::here())$file
# r_changed <- changed[grepl("^R/", changed)]
# test_changed <- changed[grepl("^tests/", changed)]
#
# for (f in c(r_changed, test_changed)) {
#   dest_dir <- dirname(here::here("lifecycle", f))
#   dir.create(dest_dir, showWarnings = FALSE, recursive = TRUE)
#   file.copy(here::here(f), here::here("lifecycle", f), overwrite = TRUE)
# }
# cli::cli_alert_success("Saved {length(r_changed)} R files and {length(test_changed)} test files to lifecycle/")

# gert::git_reset_hard("main", repo = here::here())
# cli::cli_alert_success("Restored working tree to main (man/, NAMESPACE, R/ all from main)")

# rebase the branch on main

# gert::git_pull(repo = here::here(), remote = "origin", refspec = "main")
# cli::cli_alert_success("Pulled and fast-forwarded to main")

gert::git_fetch("origin", refspec = "refs/heads/main:refs/heads/main", repo = here::here())
gert::git_reset_mixed("main", repo = here::here())

usethis::use_build_ignore("lifecycle")
usethis::use_git_ignore("lifecycle")

gert::git_add(c("tools/commit-lifecycle.R", ".gitignore", ".Rbuildignore"), repo = here::here())
gert::git_commit("chore: add commit-lifecycle.R script", repo = here::here())
cli::cli_alert_success("Committed tools/commit-lifecycle.R")

# one commit per R script (copied back from the 'lifecycle' directory) + corresponding R test file if needed + run `document()` + run `test()`.

r_files <- list.files(here::here("lifecycle", "R"), full.names = FALSE)

for (stem in tools::file_path_sans_ext(r_files)) {
  r_file <- paste0("R/", stem, ".R")
  lifecycle_r <- here::here("lifecycle", r_file)

  file.copy(lifecycle_r, here::here(r_file), overwrite = TRUE)
  files_to_stage <- r_file

  lifecycle_test <- here::here("lifecycle", "tests", "testthat", paste0("test-", stem, ".R"))
  if (file.exists(lifecycle_test)) {
    dest_test <- here::here("tests", "testthat", paste0("test-", stem, ".R"))
    file.copy(lifecycle_test, dest_test, overwrite = TRUE)
    files_to_stage <- c(files_to_stage, paste0("tests/testthat/test-", stem, ".R"))

    lifecycle_snap <- here::here("lifecycle", "tests", "testthat", "_snaps", paste0(stem, ".md"))
    if (file.exists(lifecycle_snap)) {
      dest_snap <- here::here("tests", "testthat", "_snaps", paste0(stem, ".md"))
      file.copy(lifecycle_snap, dest_snap, overwrite = TRUE)
      files_to_stage <- c(files_to_stage, paste0("tests/testthat/_snaps/", stem, ".md"))
    }
  }

  devtools::document(quiet = TRUE)
  tryCatch(
    callr::r(
      function(pkg, filter) devtools::test(pkg = pkg, filter = filter, stop_on_failure = FALSE),
      args = list(pkg = here::here(), filter = stem)
    ),
    error = function(e) cli::cli_alert_warning("Tests errored for {stem}: {conditionMessage(e)}")
  )

  gert::git_add(c(files_to_stage, "man", "NAMESPACE"), repo = here::here())
  gert::git_commit(paste0("feat!: bump deprecated functions in R/", stem, ".R"), repo = here::here())
  cli::cli_alert_success("Committed {r_file}")
}

file.copy(here::here("lifecycle", "NEWS.md"), here::here("NEWS.md"), overwrite = TRUE)
gert::git_add("NEWS.md", repo = here::here())
gert::git_commit("chore: update NEWS.md for lifecycle bumps\n\n!NEWS", repo = here::here())
cli::cli_alert_success("Committed NEWS.md")

# R CMD check after all the commits

devtools::check()

# I will do the force pushing once I am happy.
