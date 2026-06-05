#!/usr/bin/env Rscript

# Enforce the documentation convention "ID" / "IDs" (not "id" / "ids") in
# *prose*, while leaving code untouched. The igraph docs decision is that the
# concept is written "ID(s)" in manual-page text, but lowercase stays wherever
# the token is code: argument names, runnable examples, and \code{}/`...` spans.
#
# This scans roxygen source in R/ (not the regenerated man/*.Rd) and reports
# every bare lowercase "id"/"ids" (and stray title-case "Id"/"Ids") that
# survives once code contexts are stripped out. Exits non-zero when anything is
# found, so it can gate CI.
#
# Usage:
#   Rscript tools/check-id-casing.R            # scans R/
#   Rscript tools/check-id-casing.R R vignettes
#
# It is deliberately plain base R (no package deps) so it runs in a bare CI
# step before the package is installed.

args <- commandArgs(trailingOnly = TRUE)
roots <- if (length(args) > 0) args else "R"

# Roxygen tags whose value is an identifier / markup, not prose: skip the whole
# line. (@param/@field/@slot are handled separately - they have a leading
# identifier followed by a prose description.)
identifier_tags <- c(
  "name", "rdname", "aliases", "family", "keywords", "concept",
  "usage", "docType", "encoding", "useDynLib", "import", "importFrom",
  "importClassesFrom", "importMethodsFrom", "export", "exportClass",
  "exportMethod", "exportS3Method", "rawNamespace", "S3method",
  "inheritParams", "inherit", "inheritDotParams", "inheritSection",
  "template", "templateVar", "includeRmd", "eval", "evalRd", "evalNamespace",
  "backref", "order", "md", "noMd", "noRd", "format", "source"
)

# Strip everything that counts as "code" from a line of prose, so the leftover
# is only natural-language text we should hold to the ID(s) convention.
strip_code <- function(x) {
  # backtick spans: `foo_bar()`
  x <- gsub("`[^`]*`", " ", x, perl = TRUE)
  # \href{url}{text}: drop the URL, keep the visible (prose) text
  x <- gsub("\\\\href\\{[^}]*\\}\\{([^}]*)\\}", " \\1 ", x, perl = TRUE)
  # \link[=target]{text} / \link{text}: identifier target, drop entirely
  x <- gsub("\\\\link(\\[[^]]*\\])?\\{[^}]*\\}", " ", x, perl = TRUE)
  # single-argument code/markup commands whose braces hold code or identifiers
  code_cmds <- paste(
    c(
      "code", "verb", "eqn", "deqn", "preformatted", "samp", "kbd", "file",
      "pkg", "env", "command", "option", "var", "url", "email", "method",
      "S4method", "linkS4class", "dontrun", "donttest", "dontshow", "Sexpr"
    ),
    collapse = "|"
  )
  x <- gsub(
    sprintf("\\\\(%s)\\{[^}]*\\}", code_cmds), " ", x,
    perl = TRUE
  )
  x
}

# Words that violate the convention once code is stripped: lowercase id/ids and
# the title-case Id/Ids. "ID"/"IDs" are correct and never flagged.
bad_word <- "\\b(id|ids|Id|Ids)\\b"

scan_file <- function(path) {
  lines <- readLines(path, warn = FALSE, encoding = "UTF-8")
  findings <- list()

  in_roxygen <- FALSE
  in_examples <- FALSE
  in_fence <- FALSE
  # brace depth inside an open, multi-line \preformatted{ ... } block (used by
  # manual `@section Examples:` blocks, which are code, not prose)
  pre_depth <- 0L

  count_braces <- function(s) {
    nchar(gsub("[^{]", "", s)) - nchar(gsub("[^}]", "", s))
  }

  for (i in seq_along(lines)) {
    line <- lines[[i]]
    is_roxygen <- grepl("^\\s*#'", line, perl = TRUE)

    if (!is_roxygen) {
      # leaving (or between) roxygen blocks resets per-block state
      in_roxygen <- FALSE
      in_examples <- FALSE
      in_fence <- FALSE
      pre_depth <- 0L
      next
    }
    in_roxygen <- TRUE

    # content after the leading  #'
    content <- sub("^\\s*#'\\s?", "", line, perl = TRUE)

    # markdown fenced code block: ```{r} ... ``` is runnable code, not prose
    if (grepl("^\\s*```", content, perl = TRUE)) {
      in_fence <- !in_fence
      next
    }
    if (in_fence) {
      next
    }

    # already inside a multi-line \preformatted block: all code, just track depth
    if (pre_depth > 0L) {
      pre_depth <- pre_depth + count_braces(content)
      next
    }

    # tag at the start of this line, if any
    tag <- NA_character_
    m <- regmatches(content, regexec("^@(\\w+)", content, perl = TRUE))[[1]]
    if (length(m) == 2) {
      tag <- m[[2]]
    }

    # @examples / @examplesIf open a code block that runs until the next tag
    if (!is.na(tag)) {
      in_examples <- tag %in% c("examples", "examplesIf")
    }
    if (in_examples) {
      next
    }

    if (!is.na(tag) && tag %in% identifier_tags) {
      next
    }

    text <- content

    # @param / @field / @slot: drop the leading identifier token(s), keep the
    # description. Names may be comma-separated (e.g. @param from,to ...).
    if (!is.na(tag) && tag %in% c("param", "field", "slot")) {
      text <- sub("^@\\w+\\s+\\S+", " ", text, perl = TRUE)
    } else if (!is.na(tag)) {
      # any other prose-bearing tag: drop just the @tag token
      text <- sub("^@\\w+", " ", text, perl = TRUE)
    }

    text <- strip_code(text)

    # an unbalanced \preformatted{ opens a multi-line code block: prose before
    # it still counts, everything from it onward is code
    pre_open <- regexpr("\\\\preformatted\\{", text, perl = TRUE)
    if (pre_open != -1L) {
      after <- substring(text, pre_open)
      pre_depth <- count_braces(after)
      text <- substring(text, 1, pre_open - 1L)
    }

    if (grepl(bad_word, text, perl = TRUE)) {
      hits <- regmatches(text, gregexpr(bad_word, text, perl = TRUE))[[1]]
      findings[[length(findings) + 1]] <- list(
        line = i,
        words = unique(hits),
        src = trimws(line)
      )
    }
  }

  findings
}

r_files <- character()
for (root in roots) {
  if (!dir.exists(root)) {
    next
  }
  r_files <- c(
    r_files,
    list.files(root, pattern = "\\.[Rr]$", recursive = TRUE, full.names = TRUE)
  )
}
r_files <- sort(unique(r_files))

total <- 0L
n_files <- 0L
for (path in r_files) {
  findings <- scan_file(path)
  if (length(findings) == 0) {
    next
  }
  n_files <- n_files + 1L
  cat(sprintf("\n%s\n", path))
  for (f in findings) {
    total <- total + length(f$words)
    cat(sprintf(
      "  %s:%d  [%s]  %s\n",
      path, f$line, paste(f$words, collapse = ", "), f$src
    ))
  }
}

cat(sprintf(
  "\n%s: %d prose occurrence(s) of lowercase id/ids across %d file(s).\n",
  if (total == 0) "OK" else "FAIL",
  total,
  n_files
))
cat("Convention: write \"ID\"/\"IDs\" in documentation prose. Lowercase only\n")
cat("for argument names, runnable @examples, and code in `...` / \\code{}.\n")

if (total > 0) {
  quit(status = 1L)
}
