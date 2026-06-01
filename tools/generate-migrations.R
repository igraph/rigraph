#!/usr/bin/env Rscript
#
# Generator for per-function argument-migration helpers.
#
# Reads the declarative registry in tools/migrations.R and, for each entry,
# emits one self-contained internal helper `handle_args_<fn>()` at
# R/handle-args-<fn>.R. The generated helpers recover legacy calls made against
# a function's pre-migration signature after `...` was inserted -- both
# positional values and (partially) named ones.
#
# Usage:
#   Rscript tools/generate-migrations.R
#
# The output is deterministic (entries sorted alphabetically by function name)
# and idempotent (running twice produces no diff). A testthat helper regenerates
# automatically when the registry is newer; CI fails on any uncommitted drift.
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

render_formals <- function(entry) {
  tail_fmls <- vapply(
    entry$tail,
    function(nm) {
      if (nm %in% names(entry$defaults)) {
        paste0(nm, " = ", entry$defaults[[nm]])
      } else {
        nm
      }
    },
    character(1)
  )
  c(entry$head, "...", tail_fmls, ".user_env = rlang::caller_env()")
}

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

render_migration <- function(entry) {
  fn <- entry$fn
  bindings_items <- paste0(entry$new_args, " = ", entry$new_args)

  header <- c(
    "# Generated by tools/generate-migrations.R from tools/migrations.R — do not edit by hand.",
    "# Regenerate with: Rscript tools/generate-migrations.R",
    "# (Excluded from `air` formatting via air.toml so this layout stays canonical.)",
    "#",
    paste0("# `", fn, "()` gained a `...` in its signature. A call written"),
    "# against the old signature lands its arguments in `...`; this helper",
    "# recovers them by position or by (partial) name, soft-deprecates the old",
    "# form, and returns the new-API bindings as a named list.",
    "#",
    "# `.user_env` is threaded into `lifecycle::deprecate_soft()` so the warning is",
    "# attributed to the user's call instead of being suppressed as",
    "# package-internal. Public callers must pass `.user_env = rlang::caller_env()`."
  )

  # One formal per line, matching rigraph's hand-written signatures. The file is
  # excluded from `air` (see air.toml) so this layout is canonical.
  fmls <- render_formals(entry)
  fmls_lines <- paste0("  ", fmls)
  fmls_lines[-length(fmls_lines)] <- paste0(
    fmls_lines[-length(fmls_lines)],
    ","
  )
  signature <- c(
    paste0("handle_args_", fn, " <- function("),
    fmls_lines,
    ") {"
  )

  body <- c(
    paste0("  bindings <- list(", paste(bindings_items, collapse = ", "), ")"),
    "",
    "  dots <- list(...)",
    "  if (length(dots) == 0L) {",
    "    return(bindings)",
    "  }",
    "",
    "  # Maps derived from the old/new signatures.",
    paste0("  recover_new <- ", render_chr_vec(entry$recover_new)),
    paste0("  recover_old <- ", render_chr_vec(entry$recover_old)),
    paste0("  match_names <- ", render_chr_vec(entry$match_names)),
    paste0("  match_to <- ", render_chr_vec(entry$match_to)),
    paste0("  defaults <- ", render_defaults_list(entry)),
    paste0("  head_args <- ", render_chr_vec(entry$head)),
    paste0("  fn_name <- \"", fn, "\""),
    "",
    "  dot_names <- rlang::names2(dots)",
    "  rebound_old <- character() # old labels, in the order encountered",
    "  rebound_new <- character() # resolved new names, same order",
    "  unknown <- character()",
    "  pos <- 0L",
    "",
    "  for (k in seq_along(dots)) {",
    "    nm <- dot_names[[k]]",
    "    if (nzchar(nm)) {",
    "      # Named (possibly abbreviated): partial-match against recoverable names.",
    "      j <- charmatch(nm, match_names)",
    "      if (is.na(j)) {",
    "        unknown <- c(unknown, nm)",
    "        next",
    "      }",
    "      if (j == 0L) {",
    "        cli::cli_abort(",
    "          \"Argument {.arg {nm}} matches multiple arguments of {.fn {fn_name}}.\",",
    "          call = .user_env",
    "        )",
    "      }",
    "      new_name <- match_to[[j]]",
    "      old_label <- match_names[[j]]",
    "    } else {",
    "      # Unnamed: recover by position into the next old slot beyond the head.",
    "      pos <- pos + 1L",
    "      if (pos > length(recover_new)) {",
    "        cli::cli_abort(",
    "          \"Too many arguments passed to {.fn {fn_name}}.\",",
    "          call = .user_env",
    "        )",
    "      }",
    "      new_name <- recover_new[[pos]]",
    "      old_label <- recover_old[[pos]]",
    "    }",
    "",
    "    # Conflict: the same new arg was already rebound, or was also supplied by",
    "    # its new keyword (i.e. differs from its formal default).",
    "    if (new_name %in% rebound_new ||",
    "      (new_name %in% names(defaults) &&",
    "        !identical(bindings[[new_name]], defaults[[new_name]]))) {",
    "      cli::cli_abort(",
    "        c(",
    "          \"Argument {.arg {new_name}} of {.fn {fn_name}} was supplied more than once.\",",
    "          i = \"Pass it exactly once, by its new name {.arg {new_name}}.\"",
    "        ),",
    "        call = .user_env",
    "      )",
    "    }",
    "",
    "    bindings[[new_name]] <- dots[[k]]",
    "    rebound_old <- c(rebound_old, old_label)",
    "    rebound_new <- c(rebound_new, new_name)",
    "  }",
    "",
    "  if (length(unknown)) {",
    "    cli::cli_abort(",
    "      c(",
    "        \"Unexpected argument(s) passed to {.fn {fn_name}}: {.arg {unknown}}.\",",
    "        i = \"Arguments after {.arg ...} must be spelled out in full.\"",
    "      ),",
    "      call = .user_env",
    "    )",
    "  }",
    "",
    "  # One consolidated soft-deprecation per call, showing the detected legacy",
    "  # call next to the recommended keyword form.",
    "  detected <- paste0(",
    "    fn_name, \"(\", paste(c(head_args, rebound_old), collapse = \", \"), \")\"",
    "  )",
    "  requested <- paste0(",
    "    fn_name, \"(\",",
    "    paste(c(head_args, paste0(rebound_new, \" = \")), collapse = \", \"),",
    "    \")\"",
    "  )",
    "  lifecycle::deprecate_soft(",
    paste0("    when = \"", entry$when, "\","),
    paste0("    what = I(paste0(\"Calling `\", fn_name, \"()` with positional or abbreviated arguments\")),"),
    "    details = c(",
    "      i = paste0(\"Detected call:  \", detected),",
    "      i = paste0(\"Use instead:    \", requested)",
    "    ),",
    "    user_env = .user_env",
    "  )",
    "",
    "  bindings",
    "}"
  )

  c(header, "", "#' @noRd", signature, body, "")
}

# ---- driver ----------------------------------------------------------------

generate_migrations <- function(registry_path, out_dir) {
  migrations <- load_migrations(registry_path)

  # Remove stale generated files first so deleted registry entries don't leave
  # orphaned helpers behind.
  stale <- list.files(
    out_dir,
    pattern = "^handle-args-.*\\.R$",
    full.names = TRUE
  )
  if (length(stale)) {
    file.remove(stale)
  }

  fns <- vapply(migrations, function(e) e$fn, character(1))
  migrations <- migrations[order(fns)]

  for (entry in migrations) {
    lines <- render_migration(entry)
    out_path <- file.path(out_dir, paste0("handle-args-", entry$fn, ".R"))
    writeLines(lines, out_path)
    message("wrote ", out_path)
  }
  message("generated ", length(migrations), " migration helper(s)")
  invisible(vapply(migrations, function(e) e$fn, character(1)))
}

# Run when invoked as a script (not when sourced for its functions).
if (sys.nframe() == 0L && !interactive()) {
  paths <- migration_paths()
  generate_migrations(paths$registry, paths$out_dir)
}
