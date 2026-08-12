#!/usr/bin/env Rscript
#
# Generator for in-place argument-migration code.
#
# Reads the declarative registry in tools/migrations.R and splices recovery code
# directly into each migrated function body, between the markers
#
#   # BEGIN GENERATED ARG_HANDLE: <fn>
#   # END GENERATED ARG_HANDLE
#
# The spliced block recovers a legacy call to the pre-migration signature (after
# `...` was inserted) -- both positional values and (partially) named ones -- and
# emits a single soft-deprecation. There is no handler function and no caller-env
# threading: the `lifecycle::deprecate_soft()` call sits directly in the host
# function, so its default `user_env` already resolves to the user's frame.
#
# Usage:
#   Rscript tools/generate-migrations.R
#
# If a registry entry has no marker pair anywhere yet, one is injected at the
# very beginning of the function's body (with a warning) instead of leaving
# the migration unwired -- move it by hand afterwards if a later placement
# reads better, then re-run the generator.
#
# Output is deterministic and idempotent (running twice produces no diff) and is
# laid out exactly as `air` formats it, so the host files stay clean. A testthat
# helper regenerates automatically when the registry is newer; CI fails on any
# uncommitted drift.
#
# Base R only -- no package needs to be loaded to run this.

# ---- locate paths relative to this script --------------------------------

migration_paths <- function() {
  # When run via `Rscript tools/generate-migrations.R`, the working directory is
  # the package root.
  root <- getwd()
  list(
    registry = file.path(root, "tools", "migrations.R"),
    out_dir = file.path(root, "R")
  )
}

# ---- registry loading + normalisation --------------------------------------

load_migrations <- function(registry_path) {
  env <- new.env(parent = baseenv())
  sys.source(registry_path, envir = env, keep.source = FALSE)
  if (!exists("migrations", envir = env, inherits = FALSE)) {
    stop(
      "`",
      registry_path,
      "` must define a `migrations` list.",
      call. = FALSE
    )
  }
  migrations <- get("migrations", envir = env)
  fns <- names(migrations)
  if (is.null(fns) || any(!nzchar(fns))) {
    stop("`migrations` must be a list named by function.", call. = FALSE)
  }
  Map(normalise_migration, fns, migrations)
}

# Deparse a formal's default, force-safely. A formal with no default holds R's
# "missing argument" sentinel, which errors the moment it is forced (e.g. by
# `is.symbol()`); `deparse()` tolerates it and yields "". So we deparse first to
# detect missingness, and only inspect the value once we know it is present.
default_expr <- function(fmls, nm) {
  paste(deparse(fmls[[nm]], width.cutoff = 500L), collapse = " ")
}

# Turn one registry entry (with `old`/`new` as function objects) into the flat
# structure the renderer consumes.
normalise_migration <- function(fn, entry) {
  for (field in c("old", "new")) {
    if (!is.function(entry[[field]])) {
      stop(
        "Migration `",
        fn,
        "`: `",
        field,
        "` must be a function.",
        call. = FALSE
      )
    }
  }
  entry$fn <- fn
  entry$when <- entry$when %||% "3.0.0"

  old_fmls <- formals(entry$old)
  new_fmls <- formals(entry$new)

  old_names_raw <- names(old_fmls)
  old_dots_idx <- which(old_names_raw == "...")
  # `old` may itself carry `...` -- this migration is not the function's
  # first: an earlier migration already made the names past it keyword-only,
  # so they were never positionally callable and must stay recoverable by
  # (partial) name only, never folded into the positional recovery below.
  if (length(old_dots_idx) == 1L) {
    old_positional <- old_names_raw[seq_len(old_dots_idx - 1L)]
    old_keyword_only <- old_names_raw[(old_dots_idx + 1L):length(old_names_raw)]
  } else {
    old_positional <- old_names_raw
    old_keyword_only <- character(0)
  }
  entry$old <- old_positional
  entry$new <- names(new_fmls)

  if (sum(entry$new == "...") != 1L) {
    stop(
      "Migration `",
      fn,
      "`: `new` must contain exactly one `...`.",
      call. = FALSE
    )
  }

  # Renames: an old formal whose default is a bare symbol points at its new name.
  renames <- character(0)
  for (nm in c(old_positional, old_keyword_only)) {
    if (!nzchar(default_expr(old_fmls, nm))) {
      next
    } # no default -> no rename
    default <- old_fmls[[nm]] # safe to force now that we know it is present
    if (is.symbol(default)) {
      renames[[nm]] <- as.character(default)
    }
  }
  entry$renames <- renames

  # Defaults of the new-API args, deparsed back to expressions.
  defaults <- list()
  for (nm in entry$new) {
    if (nm == "...") {
      next
    }
    expr <- default_expr(new_fmls, nm)
    if (nzchar(expr)) {
      defaults[[nm]] <- expr
    }
  }
  entry$defaults <- defaults

  dots_idx <- which(entry$new == "...")
  entry$head <- entry$new[seq_len(dots_idx - 1L)]
  entry$tail <- if (dots_idx < length(entry$new)) {
    entry$new[(dots_idx + 1L):length(entry$new)]
  } else {
    character(0)
  }
  entry$new_args <- c(entry$head, entry$tail)

  if (length(entry$old) < length(entry$head)) {
    stop(
      "Migration `",
      fn,
      "`: `old` is shorter than the head args of `new`.",
      call. = FALSE
    )
  }
  # Old positional slots beyond the head are recovered by position.
  entry$recover_old <- if (length(entry$old) > length(entry$head)) {
    entry$old[(length(entry$head) + 1L):length(entry$old)]
  } else {
    character(0)
  }
  entry$recover_new <- vapply(
    entry$recover_old,
    function(nm) {
      if (nm %in% names(entry$renames)) entry$renames[[nm]] else nm
    },
    character(1),
    USE.NAMES = FALSE
  )

  # Old names already past `old`'s own `...` map through the same renames, but
  # -- unlike `recover_old`/`recover_new` -- never drive positional recovery.
  keyword_only_new <- vapply(
    old_keyword_only,
    function(nm) {
      if (nm %in% names(entry$renames)) entry$renames[[nm]] else nm
    },
    character(1),
    USE.NAMES = FALSE
  )

  bad <- setdiff(c(entry$recover_new, keyword_only_new), entry$tail)
  if (length(bad)) {
    stop(
      "Migration `",
      fn,
      "`: recovered slot(s) ",
      paste(bad, collapse = ", "),
      " do not appear after `...` in `new`.",
      call. = FALSE
    )
  }

  # Names recoverable from `...`: renamed-away old names (no longer formals) plus
  # the new tail names (so abbreviations of the new args are matched too). Each
  # entry records where it resolves in the new API.
  renamed <- entry$recover_old != entry$recover_new
  keyword_renamed <- old_keyword_only != keyword_only_new
  entry$match_names <- c(
    entry$recover_old[renamed],
    old_keyword_only[keyword_renamed],
    entry$tail
  )
  entry$match_to <- c(
    entry$recover_new[renamed],
    keyword_only_new[keyword_renamed],
    entry$tail
  )

  entry
}

`%||%` <- function(x, y) if (is.null(x)) y else x

# ---- rendering -------------------------------------------------------------

# Quote each element of a character vector for emission as a literal `c(...)`.
quote_items <- function(x) {
  if (length(x) == 0L) {
    return(character(0))
  }
  paste0('"', x, '"')
}

# Render one `name = ctor(items)` argument of the migrate_recover_args() call,
# laid out exactly as `air` (line-width 80) formats it: kept on one line when it
# fits, otherwise wrapped one item per line. `splice_blocks()` prepends 2 spaces
# of indentation to every block line, so the fit test accounts for that; the
# call's own args sit at 4 spaces (final 6) and wrapped items at 6 (final 8).
# `empty` is the literal emitted for zero items (e.g. "character(0)", "list()").
render_call_arg <- function(name, ctor, items, empty, trailing = ",") {
  arg_indent <- strrep(" ", 4L)
  if (length(items) == 0L) {
    return(paste0(arg_indent, name, " = ", empty, trailing))
  }
  one_line <- paste0(
    arg_indent,
    name,
    " = ",
    ctor,
    "(",
    paste(items, collapse = ", "),
    ")",
    trailing
  )
  if (nchar(one_line) + 2L <= 80L) {
    return(one_line)
  }
  item_indent <- strrep(" ", 6L)
  n <- length(items)
  c(
    paste0(arg_indent, name, " = ", ctor, "("),
    paste0(item_indent, items[-n], ","),
    paste0(item_indent, items[[n]]),
    paste0(arg_indent, ")", trailing)
  )
}

# Render the inline ARG_HANDLE block spliced into a function body between the
# markers. It is laid out exactly as `air` formats it so regeneration leaves no
# drift in the (hand-written) host file.
#
# Shape: the per-function configuration is passed to `migrate_recover_args()`
# (a hand-written, debuggable helper) which returns the recovered values plus the
# deprecation message parts. The host frame then assigns the recovered values
# over its own locals and emits a single `lifecycle::deprecate_soft()`. Because
# that call sits directly in the host function, its default `user_env`
# (caller_env(2)) resolves to the user's frame -- no `.user_env` threading needed.
#
# The whole thing is guarded by `...length() > 0L` so the common path (a correct
# new-API call with nothing in `...`) skips the helper call entirely.
render_arg_handle <- function(entry) {
  keep <- intersect(entry$tail, names(entry$defaults))
  default_items <- vapply(
    keep,
    function(nm) paste0(nm, " = ", entry$defaults[[nm]]),
    character(1),
    USE.NAMES = FALSE
  )
  c(
    "if (...length() > 0L) {",
    "  .arg_handle <- migrate_recover_args(",
    "    list(...),",
    render_call_arg("current", "list", paste0(keep, " = ", keep), "list()"),
    render_call_arg("recover_new", "c", quote_items(entry$recover_new), "character(0)"),
    render_call_arg("recover_old", "c", quote_items(entry$recover_old), "character(0)"),
    render_call_arg("match_names", "c", quote_items(entry$match_names), "character(0)"),
    render_call_arg("match_to", "c", quote_items(entry$match_to), "character(0)"),
    render_call_arg("defaults", "list", default_items, "list()"),
    render_call_arg("head_args", "c", quote_items(entry$head), "character(0)"),
    paste0("    fn_name = \"", entry$fn, "\""),
    "  )",
    "  list2env(.arg_handle$values, environment())",
    "  lifecycle::deprecate_soft(",
    paste0("    \"", entry$when, "\","),
    "    what = I(.arg_handle$what),",
    "    details = .arg_handle$details",
    "  )",
    "}"
  )
}

# ---- splicing into source files --------------------------------------------

# The function name is captured up to the first non-identifier char, so the
# BEGIN marker may carry a trailing note, e.g.
#   # BEGIN GENERATED ARG_HANDLE: foo, do not edit, see tools/generate-migrations.R
begin_re <- "^([\t ]*)#\\s*BEGIN GENERATED ARG_HANDLE:\\s*([A-Za-z0-9._]+)"
end_re <- "^[\t ]*#\\s*END GENERATED ARG_HANDLE\\s*$"

# Replace the content between each ARG_HANDLE marker pair with freshly rendered
# code, preserving the markers and the indentation of the BEGIN marker. Returns
# the new line vector and the function names whose blocks were filled.
splice_blocks <- function(lines, by_fn) {
  out <- character()
  filled <- character()
  i <- 1L
  n <- length(lines)
  while (i <= n) {
    m <- regmatches(lines[[i]], regexec(begin_re, lines[[i]]))[[1]]
    if (length(m) == 0L) {
      out <- c(out, lines[[i]])
      i <- i + 1L
      next
    }
    indent <- m[[2]]
    fn <- m[[3]]
    # find the matching END
    j <- i + 1L
    while (j <= n && !grepl(end_re, lines[[j]])) {
      j <- j + 1L
    }
    if (j > n) {
      stop(
        "Unterminated `# BEGIN GENERATED ARG_HANDLE: ",
        fn,
        "` block.",
        call. = FALSE
      )
    }
    if (is.null(by_fn[[fn]])) {
      stop(
        "ARG_HANDLE marker for `",
        fn,
        "` has no entry in the migration registry.",
        call. = FALSE
      )
    }
    block <- render_arg_handle(by_fn[[fn]])
    block <- ifelse(nzchar(block), paste0(indent, block), block)
    out <- c(out, lines[[i]], block, lines[[j]])
    filled <- c(filled, fn)
    i <- j + 1L
  }
  list(lines = out, filled = filled)
}

# ---- injecting a block when no marker exists -------------------------------

# Escape a function name for literal use inside a regex. Registry names are
# always identifiers (`[A-Za-z0-9._]+`, per `begin_re` above), so `.` is the
# only metacharacter that can occur.
regex_escape <- function(x) {
  gsub(".", "\\.", x, fixed = TRUE)
}

# A registry entry with no `# BEGIN GENERATED ARG_HANDLE` marker anywhere
# would otherwise stay silently unwired -- easy to miss when adding a new
# migration, since the generator would just warn and move on. Instead, locate
# the function's definition (`<fn> <- function(`) and inject a freshly
# rendered block right after the opening `{` of its body: the safest default,
# since it then runs before anything else touches the (possibly still-legacy)
# arguments. It is very likely not the *best* spot -- an early argument-check
# such as `ensure_igraph()` usually reads better before it -- so the caller
# always pairs this with a warning asking for a manual look. Returns NULL
# (added nothing) if `fn`'s definition is not in `lines`.
inject_block <- function(lines, fn, entry) {
  def_re <- paste0("^", regex_escape(fn), "\\s*<-\\s*function\\s*\\(")
  idx <- which(grepl(def_re, lines))
  if (length(idx) == 0L) {
    return(NULL)
  }
  i <- idx[[1]]

  # Walk forward from the definition, tracking paren depth, to the line where
  # the signature's closing `)` brings it back to zero -- this spans however
  # many lines the (possibly multi-line, `air`-formatted) signature takes.
  depth <- 0L
  j <- i
  repeat {
    ch <- strsplit(lines[[j]], "", fixed = TRUE)[[1]]
    depth <- depth + sum(ch == "(") - sum(ch == ")")
    if (depth <= 0L) {
      break
    }
    j <- j + 1L
    if (j > length(lines)) {
      stop(
        "Could not find the end of `",
        fn,
        "`'s signature while injecting an ARG_HANDLE block.",
        call. = FALSE
      )
    }
  }

  # The body's opening `{` is usually on the same line as that closing `)`
  # (`air`'s style); scan forward otherwise.
  while (!grepl("{", lines[[j]], fixed = TRUE)) {
    j <- j + 1L
    if (j > length(lines)) {
      stop(
        "Could not find the opening `{` of `",
        fn,
        "`'s body while injecting an ARG_HANDLE block.",
        call. = FALSE
      )
    }
  }
  brace_pos <- regexpr("{", lines[[j]], fixed = TRUE)[[1]]
  before <- substring(lines[[j]], 1L, brace_pos)
  after <- substring(lines[[j]], brace_pos + 1L)

  block <- c(
    paste0(
      "  # BEGIN GENERATED ARG_HANDLE: ",
      fn,
      ", do not edit, see tools/generate-migrations.R"
    ),
    paste0("  ", render_arg_handle(entry)),
    "  # END GENERATED ARG_HANDLE"
  )

  c(
    lines[seq_len(j - 1L)],
    before,
    block,
    if (nzchar(after)) after,
    if (j < length(lines)) lines[(j + 1L):length(lines)]
  )
}

# ---- driver ----------------------------------------------------------------

generate_migrations <- function(registry_path, src_dir) {
  migrations <- load_migrations(registry_path)
  by_fn <- stats::setNames(
    migrations,
    vapply(migrations, function(e) e$fn, character(1))
  )

  files <- list.files(src_dir, pattern = "\\.R$", full.names = TRUE)
  orig_lines <- stats::setNames(lapply(files, readLines, warn = FALSE), files)
  file_lines <- orig_lines
  filled <- character()

  for (f in files) {
    lines <- file_lines[[f]]
    if (!any(grepl(begin_re, lines))) {
      next
    }
    res <- splice_blocks(lines, by_fn)
    file_lines[[f]] <- res$lines
    filled <- c(filled, res$filled)
  }

  # Entries that never had a marker: inject one rather than leave them unwired.
  missing <- setdiff(names(by_fn), filled)
  for (fn in missing) {
    for (f in files) {
      new_lines <- inject_block(file_lines[[f]], fn, by_fn[[fn]])
      if (is.null(new_lines)) {
        next
      }
      file_lines[[f]] <- new_lines
      filled <- c(filled, fn)
      warning(
        paste0(
          "No `# BEGIN GENERATED ARG_HANDLE` marker found for `",
          fn,
          "`; injected one at the very beginning of its body in ",
          f,
          ". An early argument-checking guard usually belongs before it -- ",
          "review the placement, then re-run the generator."
        ),
        call. = FALSE
      )
      break
    }
  }

  for (f in files) {
    if (!identical(file_lines[[f]], orig_lines[[f]])) {
      writeLines(file_lines[[f]], f)
      message("updated ", f)
    }
  }

  still_missing <- setdiff(names(by_fn), filled)
  if (length(still_missing)) {
    warning(
      "No `# BEGIN GENERATED ARG_HANDLE` marker found for: ",
      paste(still_missing, collapse = ", "),
      ", and no matching `<fn> <- function(` definition to inject one into.",
      call. = FALSE
    )
  }
  message("filled ", length(filled), " ARG_HANDLE block(s)")
  invisible(filled)
}

# Run when invoked as a script (not when sourced for its functions).
if (sys.nframe() == 0L && !interactive()) {
  paths <- migration_paths()
  generate_migrations(paths$registry, paths$out_dir)
}
