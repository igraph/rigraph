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
  entry$old <- names(old_fmls)
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
  for (nm in entry$old) {
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

  bad <- setdiff(entry$recover_new, entry$tail)
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
  entry$match_names <- c(entry$recover_old[renamed], entry$tail)
  entry$match_to <- c(entry$recover_new[renamed], entry$tail)

  entry
}

`%||%` <- function(x, y) if (is.null(x)) y else x

# ---- rendering -------------------------------------------------------------

render_chr_vec <- function(x) {
  if (length(x) == 0L) {
    return("character(0)")
  }
  paste0("c(", paste0('"', x, '"', collapse = ", "), ")")
}

render_defaults_list <- function(entry) {
  keep <- intersect(entry$tail, names(entry$defaults))
  if (length(keep) == 0L) {
    return("list()")
  }
  items <- vapply(
    keep,
    function(nm) {
      paste0(nm, " = ", entry$defaults[[nm]])
    },
    character(1)
  )
  paste0("list(", paste(items, collapse = ", "), ")")
}

# The new-API args (with defaults) whose current value we pass to the matcher for
# conflict detection -- i.e. the recoverable args that have a formal default.
render_current_list <- function(entry) {
  keep <- intersect(entry$tail, names(entry$defaults))
  if (length(keep) == 0L) {
    return("list()")
  }
  paste0("list(", paste0(keep, " = ", keep, collapse = ", "), ")")
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
  c(
    "if (...length() > 0L) {",
    "  .arg_handle <- migrate_recover_args(",
    "    list(...),",
    paste0("    current = ", render_current_list(entry), ","),
    paste0("    recover_new = ", render_chr_vec(entry$recover_new), ","),
    paste0("    recover_old = ", render_chr_vec(entry$recover_old), ","),
    paste0("    match_names = ", render_chr_vec(entry$match_names), ","),
    paste0("    match_to = ", render_chr_vec(entry$match_to), ","),
    paste0("    defaults = ", render_defaults_list(entry), ","),
    paste0("    head_args = ", render_chr_vec(entry$head), ","),
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

# ---- driver ----------------------------------------------------------------

generate_migrations <- function(registry_path, src_dir) {
  migrations <- load_migrations(registry_path)
  by_fn <- stats::setNames(
    migrations,
    vapply(migrations, function(e) e$fn, character(1))
  )

  files <- list.files(src_dir, pattern = "\\.R$", full.names = TRUE)
  filled <- character()
  for (f in files) {
    lines <- readLines(f, warn = FALSE)
    if (!any(grepl(begin_re, lines))) {
      next
    }
    res <- splice_blocks(lines, by_fn)
    filled <- c(filled, res$filled)
    if (!identical(res$lines, lines)) {
      writeLines(res$lines, f)
      message("updated ", f)
    }
  }

  missing <- setdiff(names(by_fn), filled)
  if (length(missing)) {
    warning(
      "No `# BEGIN GENERATED ARG_HANDLE` marker found for: ",
      paste(missing, collapse = ", "),
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
