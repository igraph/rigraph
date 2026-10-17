#!/usr/bin/env Rscript

# Writes the table of deprecated and defunct dotted function names,
# such as `graph.adjacency()`, into the leaf that owns them:
# handbook/usage/dotted-names/README.md.
# The table replaces the lines between its BEGIN and END markers.
#
# Usage, from the package root:
#   Rscript tools/dotted-names.R
#
# A row comes from the lifecycle::deprecate_*() call through which a function
# in R/ deprecates itself, or from a dotted alias bound to such a function.
# Plain base R, so that it runs without the package installed.

page <- "handbook/usage/dotted-names/README.md"
begin <- "<!-- BEGIN GENERATED: tools/dotted-names.R -->"
end <- "<!-- END GENERATED: tools/dotted-names.R -->"

# The leading arguments shared by lifecycle's deprecate_soft(),
# deprecate_warn() and deprecate_stop(), for match.call().
signature <- function(when, what, with = NULL, details = NULL, id = NULL, ...) {
  NULL
}

is_assignment <- function(e) {
  is.call(e) &&
    is.name(e[[1]]) &&
    as.character(e[[1]]) %in% c("<-", "=") &&
    is.name(e[[2]])
}

# Every deprecation call in `expr` that names `fn` itself.
self_deprecations <- function(expr, fn) {
  if (!is.call(expr)) {
    return(list())
  }
  out <- list()
  head <- paste(deparse(expr[[1]]), collapse = "")
  verb <- sub("^(lifecycle::)?deprecate_", "", head)
  if (verb %in% c("soft", "warn", "stop")) {
    call <- match.call(signature, expr)
    if (identical(call$what, paste0(fn, "()"))) {
      out <- list(list(
        verb = verb,
        when = call$when,
        with = call$with,
        details = call$details
      ))
    }
  }
  for (e in as.list(expr)) {
    if (!missing(e)) out <- c(out, self_deprecations(e, fn))
  }
  out
}

code <- function(x) paste0("`", x, "`")

# What to call instead: `with`, or the `details` string where it names the
# replacement more precisely, as similarity.dice()'s does.
replacement <- function(calls) {
  with <- unique(unlist(lapply(calls, `[[`, "with")))
  details <- unique(unlist(lapply(calls, function(x) {
    if (is.character(x$details)) x$details
  })))
  text <- if (length(with)) paste(code(with), collapse = " or ") else ""
  for (d in details) {
    d <- sub("[.]$", "", d)
    parsed <- tryCatch(str2lang(d), error = function(e) NULL)
    if (is.call(parsed)) {
      text <- code(d)
    } else if (grepl("^Use ", d)) {
      text <- gsub(
        "([A-Za-z_][A-Za-z0-9._]*\\(\\))",
        "`\\1`",
        sub("^Use ", "", d)
      )
    } else {
      text <- paste(text, d)
    }
  }
  text
}

state <- function(calls) {
  verbs <- unique(vapply(calls, `[[`, "", "verb"))
  labels <- c(soft = "soft-deprecated", warn = "deprecated", stop = "defunct")
  paste(labels[verbs], collapse = ", ")
}

since <- function(calls) {
  paste(unique(vapply(calls, `[[`, "", "when")), collapse = ", ")
}

deprecated <- list()
aliases <- character()
for (file in sort(list.files("R", pattern = "[.]R$", full.names = TRUE))) {
  for (e in parse(file, keep.source = FALSE)) {
    if (!is_assignment(e)) {
      next
    }
    fn <- as.character(e[[2]])
    if (is.name(e[[3]])) {
      aliases[[fn]] <- as.character(e[[3]])
      next
    }
    calls <- self_deprecations(e[[3]], fn)
    if (length(calls)) deprecated[[fn]] <- calls
  }
}

aliases <- aliases[aliases %in% names(deprecated)]
rows <- c(deprecated, lapply(aliases, function(target) deprecated[[target]]))
rows <- rows[grepl(".", names(rows), fixed = TRUE)]
rows <- rows[order(names(rows), method = "radix")]

table <- c(
  "| Dotted name | Use instead | State | Deprecated in |",
  "|---|---|---|---|",
  sprintf(
    "| %s | %s | %s | %s |",
    code(paste0(names(rows), "()")),
    vapply(rows, replacement, ""),
    vapply(rows, state, ""),
    vapply(rows, since, "")
  )
)

lines <- readLines(page)
from <- match(begin, lines)
to <- match(end, lines)
stopifnot(!is.na(from), !is.na(to), from < to)
writeLines(
  c(lines[seq_len(from)], "", table, "", lines[to:length(lines)]),
  page
)
message(length(rows), " dotted names written to ", page)
