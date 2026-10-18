#!/usr/bin/env Rscript
# Distribute the tests of the generated `*_impl()` functions
# over tests/testthat/test-aaa-<cat>.R,
# so that each test sits in the file mirroring R/aaa-<cat>.R,
# the file that defines its impl.
# R/aaa-<cat>.R is itself generated from tools/aaa-categories.yaml
# by tools/split-aaa-auto.R,
# so rerun this script after that one when an impl changes category.
#
# Reads every tests/testthat/test-aaa-*.R and tests/testthat/_snaps/aaa-*.md,
# and rewrites them:
#   - each top-level `test_that("<fn>_impl ...", ...)` block,
#     with the comment lines between it and the previous block,
#     moves byte-for-byte to the file of <fn>_impl's category,
#     keeping the order in which the blocks are read;
#   - each snapshot section moves to the snapshot file of its test,
#     in the order of the tests, the order testthat writes them in;
#   - every file starts with `header` below.
# Any other top-level code, or a comment after the last block, is an error,
# because it would have no file to move to.
# Shared helpers belong in tests/testthat/helper-*.R.
#
# Usage: Rscript tools/split-aaa-tests.R [--check]
# With --check, writes nothing, and fails if a rerun would change a file.

script_path <- (function() {
  args <- commandArgs(trailingOnly = FALSE)
  m <- grep("^--file=", args, value = TRUE)
  if (length(m)) sub("^--file=", "", m[1]) else "tools/split-aaa-tests.R"
})()
REPO <- normalizePath(file.path(dirname(script_path), ".."))
TEST_DIR <- file.path(REPO, "tests", "testthat")
SNAP_DIR <- file.path(TEST_DIR, "_snaps")
check <- "--check" %in% commandArgs(trailingOnly = TRUE)

header <- c(
  "# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?",
  "skip_on_cran()"
)

# ---- impl -> category, from the generated R/aaa-<cat>.R -----------------

impl_cat <- character()
for (path in list.files(
  file.path(REPO, "R"),
  "^aaa-.*\\.R$",
  full.names = TRUE
)) {
  cat <- sub("^aaa-(.*)\\.R$", "\\1", basename(path))
  exprs <- parse(path, keep.source = FALSE)
  for (e in exprs) {
    if (is.call(e) && identical(e[[1]], as.name("<-")) && is.name(e[[2]])) {
      name <- as.character(e[[2]])
      if (grepl("_impl$", name)) impl_cat[[name]] <- cat
    }
  }
}

# ---- read the test blocks ------------------------------------------------

test_files <- sort(list.files(TEST_DIR, "^test-aaa-.*\\.R$", full.names = TRUE))
blocks <- list()
for (path in test_files) {
  lines <- readLines(path, warn = FALSE)
  exprs <- parse(path, keep.source = TRUE)
  refs <- getSrcref(exprs)
  prev <- 0L
  for (i in seq_along(exprs)) {
    e <- exprs[[i]]
    # The lines after the previous expression,
    # comments and section banners, belong to this one.
    first <- prev + 1L
    last <- refs[[i]][3L]
    prev <- last
    while (first < last && !nzchar(trimws(lines[first]))) {
      first <- first + 1L
    }
    text <- lines[first:last]
    if (identical(e, quote(skip_on_cran()))) {
      if (!identical(text, header)) {
        stop(basename(path), ":", first, ": the header differs from `header`")
      }
      next
    }
    if (!is.call(e) || !identical(e[[1]], as.name("test_that"))) {
      stop(basename(path), ":", first, ": not a test_that() block")
    }
    desc <- e[[2]]
    fn <- sub("[^A-Za-z0-9_.].*$", "", desc)
    if (!fn %in% names(impl_cat)) {
      stop(
        basename(path),
        ":",
        first,
        ": `",
        desc,
        "` does not start with an impl defined in R/aaa-*.R"
      )
    }
    blocks[[length(blocks) + 1L]] <- list(
      desc = desc,
      cat = impl_cat[[fn]],
      text = text
    )
  }
  rest <- which(nzchar(trimws(lines[-seq_len(prev)]))) + prev
  if (length(rest)) {
    stop(
      basename(path),
      ":",
      rest[1],
      ": line after the last test_that() block"
    )
  }
}

# ---- read the snapshot sections -----------------------------------------

snap_files <- sort(list.files(SNAP_DIR, "^aaa-.*\\.md$", full.names = TRUE))
sections <- list()
for (path in snap_files) {
  lines <- readLines(path, warn = FALSE)
  starts <- grep("^# ", lines)
  ends <- c(starts[-1] - 1L, length(lines))
  for (j in seq_along(starts)) {
    name <- sub("^# ", "", lines[starts[j]])
    if (!is.null(sections[[name]])) {
      stop("snapshot section `", name, "` appears twice in _snaps/aaa-*.md")
    }
    sections[[name]] <- lines[starts[j]:ends[j]]
  }
}

# ---- compose the new files ----------------------------------------------

out <- list()
cats <- sort(unique(vapply(blocks, `[[`, "", "cat")))
for (cat in cats) {
  mine <- Filter(function(b) b$cat == cat, blocks)
  body <- unlist(lapply(mine, function(b) c("", b$text)))
  out[[file.path(TEST_DIR, paste0("test-aaa-", cat, ".R"))]] <- c(header, body)

  descs <- unique(vapply(mine, `[[`, "", "desc"))
  snaps <- unlist(
    sections[intersect(descs, names(sections))],
    use.names = FALSE
  )
  if (length(snaps)) {
    out[[file.path(SNAP_DIR, paste0("aaa-", cat, ".md"))]] <- snaps
  }
}

orphans <- setdiff(names(sections), vapply(blocks, `[[`, "", "desc"))
if (length(orphans)) {
  stop("snapshot sections without a test: ", paste(orphans, collapse = ", "))
}

# ---- write, or compare --------------------------------------------------

stale <- setdiff(c(test_files, snap_files), names(out))
changed <- names(out)[vapply(
  names(out),
  function(path) {
    !file.exists(path) || !identical(readLines(path, warn = FALSE), out[[path]])
  },
  logical(1)
)]
rel <- function(paths) sub(paste0(REPO, "/"), "", paths, fixed = TRUE)

if (check) {
  if (length(stale) || length(changed)) {
    message(
      "split-aaa-tests.R: these files are out of date, ",
      "run `Rscript tools/split-aaa-tests.R` and commit the result:\n  ",
      paste(rel(c(stale, changed)), collapse = "\n  ")
    )
    quit(status = 1)
  }
  message("split-aaa-tests.R: all ", length(blocks), " impl tests are in place")
} else {
  invisible(file.remove(stale))
  for (path in changed) {
    writeLines(out[[path]], path)
  }
  message(
    "split-aaa-tests.R: wrote ",
    length(changed),
    " and removed ",
    length(stale),
    " file(s); ",
    length(blocks),
    " tests in ",
    length(cats),
    " files"
  )
}
