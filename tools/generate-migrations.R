#!/usr/bin/env Rscript
#
# Generator for in-place argument-migration code.
#
# Reads the declarative registry entries from the per-topic files in
# tools/migrations/ (a legacy single-file tools/migrations.R is still honoured
# if present, easing older branches over the transition) and splices recovery
# code directly into each migrated function body, between the markers
#
#   # BEGIN GENERATED ARG_HANDLE: <fn>
#   # END GENERATED ARG_HANDLE
#
# The spliced block recovers a legacy call to the pre-migration signature (after
# `...` was inserted) -- both positional values and (partially) named ones -- and
# emits a single soft-deprecation. There is no handler function and no runtime
# matcher: the block declares the old signature as a local `.old_signature()` and
# matches `...` against it, so base R does the matching, and everything else is
# written out per argument. The `lifecycle::deprecate_soft()` call sits directly
# in the host function, so its default `user_env` resolves to the user's frame.
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
    registry = migration_registry_files(root),
    out_dir = file.path(root, "R")
  )
}

# All registry sources: the legacy single file plus every file in
# tools/migrations/, one per topic. Sorted for a deterministic load order.
migration_registry_files <- function(root = getwd()) {
  legacy <- file.path(root, "tools", "migrations.R")
  topical <- sort(list.files(
    file.path(root, "tools", "migrations"),
    pattern = "\\.[rR]$",
    full.names = TRUE
  ))
  c(if (file.exists(legacy)) legacy, topical)
}

# ---- registry loading + normalisation --------------------------------------

load_migrations <- function(registry_path) {
  loaded <- lapply(registry_path, load_migration_file)
  migrations <- do.call(c, c(loaded, list(list())))
  fns <- names(migrations)
  dup <- unique(fns[duplicated(fns)])
  if (length(dup)) {
    stop(
      "Duplicate migration entr",
      if (length(dup) == 1L) "y" else "ies",
      " across registry files: ",
      paste(dup, collapse = ", "),
      call. = FALSE
    )
  }
  Map(normalise_migration, fns, migrations)
}

load_migration_file <- function(path) {
  env <- new.env(parent = baseenv())
  sys.source(path, envir = env, keep.source = FALSE)
  if (!exists("migrations", envir = env, inherits = FALSE)) {
    stop(
      "`",
      path,
      "` must define a `migrations` list.",
      call. = FALSE
    )
  }
  migrations <- get("migrations", envir = env)
  if (length(migrations) == 0L) {
    return(list())
  }
  fns <- names(migrations)
  if (is.null(fns) || any(!nzchar(fns))) {
    stop(
      "`",
      path,
      "`: `migrations` must be a list named by function.",
      call. = FALSE
    )
  }
  migrations
}

# Deparse a formal's default, force-safely. A formal with no default holds R's
# "missing argument" sentinel, which errors the moment it is forced (e.g. by
# `is.symbol()`); `deparse()` tolerates it and yields "". So we deparse first to
# detect missingness, and only inspect the value once we know it is present.
default_expr <- function(fmls, nm) {
  space_binary_slash(
    paste(deparse(fmls[[nm]], width.cutoff = 500L), collapse = " ")
  )
}

# air formats binary `/` with surrounding spaces, but deparse() emits `x/y`,
# which would make the spliced blocks fail the idempotency check against the
# air-formatted sources. Reinsert the spaces token-aware, so slashes inside
# string literals (e.g. URLs) stay untouched.
space_binary_slash <- function(text) {
  if (!grepl("/", text, fixed = TRUE)) {
    return(text)
  }
  pd <- tryCatch(
    utils::getParseData(parse(text = text, keep.source = TRUE)),
    error = function(e) NULL
  )
  if (is.null(pd)) {
    return(text)
  }
  cols <- pd$col1[pd$terminal & pd$token == "'/'"]
  if (length(cols) == 0L) {
    return(text)
  }
  chars <- strsplit(text, "", fixed = TRUE)[[1]]
  chars[cols] <- " / "
  gsub("[ ]+/[ ]+", " / ", paste(chars, collapse = ""))
}

# ---- constant-default rule --------------------------------------------------
#
# Defaults in migrated (`new`) signatures must be *constant expressions*:
# literals, NULL/TRUE/FALSE/NA*/Inf/NaN, `c()`/`list()` of constants, a typed
# empty vector (`integer()`, `numeric()`, ...), a unary sign, or the
# `deprecated()` sentinel. Anything else -- option lookups, `V(graph)`,
# cross-references to other arguments, RNG draws, `rep()`, ... -- is evaluated
# lazily at an unpredictable time, invites forcing hazards in the recovery
# machinery, and hides the real default from the signature. There is no escape
# hatch: express a complex default as `NULL` and resolve it in the body after
# all arguments are available.

is_constant_default <- function(expr) {
  if (is.null(expr)) {
    return(TRUE)
  }
  if (is.atomic(expr)) {
    return(TRUE)
  }
  if (is.symbol(expr)) {
    # TRUE/FALSE/NULL/NA/Inf/NaN parse as literals, not symbols; any symbol
    # here references an argument or a global -- not constant. (T/F included.)
    return(FALSE)
  }
  if (is.call(expr)) {
    head <- expr[[1]]
    if (is.call(head)) {
      # namespaced sentinel: lifecycle::deprecated()
      return(
        length(expr) == 1L &&
          identical(head, quote(lifecycle::deprecated))
      )
    }
    if (!is.symbol(head)) {
      return(FALSE)
    }
    fn <- as.character(head)
    if (fn %in% c("c", "list", "(")) {
      args <- as.list(expr)[-1]
      return(all(vapply(args, is_constant_default, logical(1))))
    }
    empty_ctors <- c(
      "logical",
      "integer",
      "numeric",
      "double",
      "complex",
      "character",
      "raw"
    )
    if (fn %in% empty_ctors && length(expr) == 1L) {
      # A typed empty vector is a literal: the canonical spelling of an
      # empty-sequence default (`c()` would be NULL in disguise).
      return(TRUE)
    }
    if (fn %in% c("+", "-") && length(expr) == 2L) {
      return(is_constant_default(expr[[2]]))
    }
    if (fn == "deprecated" && length(expr) == 1L) {
      return(TRUE)
    }
    return(FALSE)
  }
  FALSE
}

check_constant_defaults <- function(fn, new_fmls) {
  flagged <- character(0)
  for (nm in names(new_fmls)) {
    if (nm == "...") {
      next
    }
    if (!nzchar(default_expr(new_fmls, nm))) {
      next
    } # no default
    if (!is_constant_default(new_fmls[[nm]])) {
      flagged <- c(flagged, nm)
    }
  }
  if (length(flagged)) {
    stop(
      "Migration `",
      fn,
      "`: non-constant default(s) for ",
      paste0("`", flagged, "`", collapse = ", "),
      ".\nDeclare the formal as `NULL` and resolve it in the body after all\n",
      "arguments are available (see tools/migrations/README.md).",
      call. = FALSE
    )
  }
  invisible(TRUE)
}

# Turn one registry entry (with `old`/`new` as function objects) into the flat
# structure the renderer consumes.
normalise_migration <- function(fn, entry) {
  if (!is.null(entry$nonconst_defaults)) {
    stop(
      "Migration `",
      fn,
      "`: `nonconst_defaults` is not supported; defaults must be constant\n",
      "expressions (declare the formal as `NULL` and resolve it in the body).",
      call. = FALSE
    )
  }
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
  check_constant_defaults(fn, new_fmls)
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

  # Head args are matched by base R *before* `...`, with base R partial
  # matching, so they are resolved before the recovery layer ever runs.
  # Prefix overlaps between head args and recoverable names therefore need
  # care, but almost all of them are safe for previously-valid calls, because
  # *exact* matching beats partial matching and runs across all formals:
  #
  # - A full tail name binds its post-`...` formal exactly (head `typeof`
  #   never swallows a supplied `type =` when `type` is a formal).
  # - An abbreviation longer than the head arg is no prefix of it, falls
  #   through to `...`, and is recovered with the deprecation.
  # - The head arg itself keeps its exact-match meaning from the old
  #   signature.
  #
  # Two hazards remain:
  #
  # 1. A *renamed-away* old name that is a prefix of (or equal to) a head
  #    arg is fatal: it is no longer a formal, so a valid legacy call like
  #    `f(weight = )` would silently partial-match into the head arg instead
  #    of reaching recovery. No runtime guard can help; reject at generation
  #    time.
  # 2. A *strict prefix* of a head arg that also prefixes a recoverable name
  #    was ambiguous -- an error -- under the old signature, but now binds
  #    the head arg via ordinary partial matching. On its own that is
  #    accepted: previously broken code that now works in a well-defined,
  #    silent way is not a problem. It is hazardous only in combination
  #    with legacy arguments in `...`: the tag steals the head slot,
  #    positionals shift into the wrong formals, and the recovery layer
  #    would rescue a never-valid call behind a soft-deprecation warning.
  #    Those *forbidden prefixes* are enumerable: emit a guard inside the
  #    recovery gate, so the tag is
  #    rejected only when `...` is non-empty. Tags that prefix two head
  #    args stay out of the list -- base R still errors on those by itself.
  renamed_old <- entry$recover_old[renamed]
  fatal <- character(0)
  for (h in entry$head) {
    for (r in renamed_old) {
      if (startsWith(h, r)) {
        fatal <- c(fatal, paste0("`", r, "` -> `", h, "`"))
      }
    }
  }
  if (length(fatal)) {
    stop(
      "Migration `",
      fn,
      "`: renamed-away old name(s) are prefixes of head arg(s): ",
      paste(unique(fatal), collapse = ", "),
      ". A legacy call using the old name would silently bind the head ",
      "arg. Pick a different head split.",
      call. = FALSE
    )
  }

  tags <- character(0)
  for (h in entry$head) {
    if (nchar(h) < 2L) {
      next
    }
    for (len in seq_len(nchar(h) - 1L)) {
      s <- substr(h, 1L, len)
      if (!any(startsWith(entry$match_names, s))) {
        next
      }
      # exact matching wins: a tag spelling out any formal is never misrouted
      if (s %in% entry$new) {
        next
      }
      # a tag prefixing two head args is an R error already, not a silent bind
      if (sum(startsWith(entry$head, s)) > 1L) {
        next
      }
      tags <- c(tags, s)
    }
  }
  entry$forbidden_tags <- sort(unique(tags))

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

# Abbreviations that were ambiguous under the pre-migration matcher: proper
# prefixes matching more than one of the old and new names at once. Base R only
# ever sees the old names in `.old_signature()`, so it would resolve some of
# these silently (e.g. `at` for `as_adjacency_matrix(attr =)`, which the
# migration renamed to `weights` while a deprecated `attr` formal remains) and
# reject the rest with a message that does not name the argument. The block
# tests the dot tags against this list first, so both keep the message they had.
ambiguous_tags <- function(entry) {
  names <- entry$match_names
  if (length(names) == 0L) {
    return(character(0))
  }
  prefixes <- unique(unlist(lapply(names, function(nm) {
    if (nchar(nm) > 1L) {
      substring(nm, 1L, seq_len(nchar(nm) - 1L))
    } else {
      character(0)
    }
  })))
  prefixes <- setdiff(prefixes, names)
  prefixes[vapply(
    prefixes,
    function(p) {
      j <- charmatch(p, names)
      !is.na(j) && j == 0L
    },
    logical(1)
  )]
}

# `base::c("a", "b")`, or `base::character(0)` for nothing.
render_vector <- function(items) {
  if (length(items) == 0L) {
    return("base::character(0)")
  }
  paste0("base::c(", paste(items, collapse = ", "), ")")
}

# Render the inline ARG_HANDLE block spliced into a function body between the
# markers.
#
# Shape: the recovery is written out in full, per function, with no runtime
# matcher behind it. `.old_signature()` carries the pre-migration tail formals
# and `...` is matched against it -- so base R's own argument matching does the
# recovery, exactly as it did before the migration: positionally, by partial
# name, and leaving an empty argument slot (a trailing comma, or magrittr's
# `f(., , x = 1)`) missing while it still consumes its position (#2646). Each
# recoverable argument then gets one unrolled `if (!base::missing(<old>))` line,
# so what a call does to its arguments is readable in the function itself.
#
# `.old_signature()` takes a trailing `...` of its own so that an unknown or
# surplus argument lands there instead of tripping base R's "unused argument";
# it is reported with the same message the runtime matcher used to produce. The
# tags are read off `substitute(...())`, which forces nothing -- a surplus slot
# may be empty.
#
# An argument supplied both ways -- recovered out of `...`, and passed under its
# new name past `...` -- is rejected the same unrolled way, one `base::missing()`
# per recoverable argument in the *host* frame. `missing()` answers "was this
# passed" directly, so the block needs neither the defaults nor a comparison
# against them, and an argument passed its own default value is caught too.
#
# Every call is written `base::`-qualified (`cli::`, `lifecycle::` for the rest).
# The block is spliced into someone else's function body, where a formal may be
# named `names` or `c` -- and a *missing* formal is worse than a shadowing one,
# since R forces the promise while looking for a function to call and reports
# `argument "names" is missing`. Qualifying unconditionally keeps every block the
# same shape instead of making it depend on the signature. Operators (`$`, `[[`,
# `&&`, `>`) and `...length()` are left alone: they cannot be shadowed by a
# formal.
#
# The whole thing is guarded by `...length() > 0L` so the common path (a correct
# new-API call with nothing in `...`) skips it entirely, and the deprecation is
# additionally gated on something having been recovered -- a `...` of nothing but
# empty slots leaves the formals at their defaults and must not warn.
#
# The block opens with `# fmt: skip` so `air` leaves it alone: the layout is this
# generator's, which buys back the vertical space the unrolling costs and drops
# the code that used to predict how `air` would wrap.
# Both guards below read argument *names* and never look at the values, which
# made them the one place an empty slot still diverged from the pre-migration
# behaviour: `as_adjacency_matrix(make_ring(4), a = )` errors with "matches
# multiple arguments" on the dev version and returns a 4x4 matrix on 2.3.3. An
# empty slot supplies nothing, so it cannot be ambiguous between two arguments
# and cannot conflict with a formal -- the old signature would have matched it
# by position and left the formal missing. `.old_signature()` already gets this
# right, via `base::missing()`; the guards run before it and did not.
#
# The empty slot is the empty symbol, which is a symbol whose name is the empty
# string. `Filter()` keeps this to one expression, which matters because the
# block is `# fmt: skip` and every line of it is already long.
drop_empty_slots <- function(expr) {
  paste0(
    "base::Filter(function(.x) !(base::is.symbol(.x) && !base::nzchar(base::as.character(.x))), ",
    expr,
    ")"
  )
}

render_arg_handle <- function(entry) {
  fn <- entry$fn
  old <- entry$recover_old
  new <- entry$recover_new

  guards <- character(0)
  if (length(entry$forbidden_tags)) {
    guards <- c(
      guards,
      paste0(
        "  .arg_forbidden <- base::intersect(base::names(",
        drop_empty_slots("base::as.list(base::sys.call())[-1L]"),
        "), ",
        render_vector(quote_items(entry$forbidden_tags)),
        ")"
      ),
      paste0(
        "  if (base::length(.arg_forbidden) > 0L) cli::cli_abort(base::c(\"Argument {.arg {(.arg_forbidden)}} matches multiple formal arguments of {.fn ",
        fn,
        "}.\", i = \"Spell out the full argument name.\"))"
      )
    )
  }
  ambiguous <- ambiguous_tags(entry)
  if (length(ambiguous)) {
    guards <- c(
      guards,
      paste0(
        "  .arg_ambiguous <- base::intersect(base::names(",
        drop_empty_slots("base::as.list(base::substitute(...()))"),
        "), ",
        render_vector(quote_items(ambiguous)),
        ")"
      ),
      paste0(
        "  if (base::length(.arg_ambiguous) > 0L) cli::cli_abort(\"Argument {.arg {(.arg_ambiguous[[1L]])}} matches multiple arguments of {.fn ",
        fn,
        "}.\")"
      )
    )
  }

  # `detected` shows what the call looked like under the old signature, so a
  # renamed argument is listed under its old name.
  detected <- if (identical(old, new)) {
    ".arg_names"
  } else {
    paste0(
      render_vector(paste0(new, " = \"", old, "\"")),
      "[.arg_names]"
    )
  }
  in_call <- function(items) {
    paste0(
      "base::paste(",
      render_vector(c(quote_items(entry$head), items)),
      ", collapse = \", \")"
    )
  }

  c(
    "# fmt: skip",
    "if (...length() > 0L) {",
    guards,
    paste0(
      "  # Pre-",
      entry$when,
      " signature: ",
      fn,
      "(",
      paste(entry$old, collapse = ", "),
      ")"
    ),
    paste0(
      "  .old_signature <- function(",
      paste(c(old, "..."), collapse = ", "),
      ") {"
    ),
    "    if (...length() > 0L) {",
    "      .arg_extra <- base::names(base::substitute(...()))",
    "      .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]",
    paste0(
      "      if (base::length(.arg_extra) == 0L) cli::cli_abort(\"Too many arguments passed to {.fn ",
      fn,
      "}.\", call = base::parent.frame())"
    ),
    paste0(
      "      cli::cli_abort(base::c(\"Unexpected argument passed to {.fn ",
      fn,
      "}: {.arg {(.arg_extra)}}.\", i = \"Arguments after {.arg ...} must be spelled out in full.\"), call = base::parent.frame())"
    ),
    "    }",
    "    base::c(",
    paste0(
      "      if (!base::missing(",
      old,
      ")) base::list(",
      new,
      " = ",
      old,
      ")",
      c(rep(",", length(old) - 1L), "")
    ),
    "    )",
    "  }",
    "  .arg_handle <- .old_signature(...)",
    "  if (base::length(.arg_handle) > 0L) {",
    "    .arg_names <- base::names(.arg_handle)",
    "    .arg_conflict <- base::intersect(.arg_names, base::c(",
    paste0(
      "      if (!base::missing(",
      new,
      ")) \"",
      new,
      "\"",
      c(rep(",", length(new) - 1L), "")
    ),
    "    ))",
    paste0(
      "    if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c(\"Argument {.arg {(.arg_conflict)}} of {.fn ",
      fn,
      "} was supplied more than once.\", i = \"Pass it exactly once, by its new name {.arg {(.arg_conflict)}}.\"))"
    ),
    "    base::list2env(.arg_handle, base::environment())",
    "    lifecycle::deprecate_soft(",
    paste0("      \"", entry$when, "\","),
    paste0(
      "      what = base::I(\"Calling `",
      fn,
      "()` with positional or abbreviated arguments\"),"
    ),
    "      details = base::c(",
    paste0(
      "        i = base::paste0(\"Detected call:  ",
      fn,
      "(\", ",
      in_call(detected),
      ", \")\"),"
    ),
    paste0(
      "        i = base::paste0(\"Use instead:    ",
      fn,
      "(\", ",
      in_call("base::paste0(.arg_names, \" = \")"),
      ", \")\")"
    ),
    "      )",
    "    )",
    "  }",
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
