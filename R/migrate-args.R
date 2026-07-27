# Runtime helper behind the generated `# ... ARG_HANDLE` blocks (see
# tools/migrations.R, tools/generate-migrations.R). Hand-written and tested
# directly -- the generated blocks only carry the per-function configuration and
# call this. Kept a plain function (not an inline closure) so it is easy to step
# through in a debugger.
#
# Pure: it inspects `dots` against the supplied maps and returns the recovered
# values plus the deprecation message parts, or NULL when there is nothing to
# recover. It never touches an environment and never emits the deprecation
# itself -- the caller assigns the values into its own frame and calls
# `lifecycle::deprecate_soft()` inline, so the warning is attributed correctly
# without any caller-env plumbing.

#' @noRd
migrate_recover_args <- function(
  dots,
  current,
  recover_new,
  recover_old,
  match_names,
  match_to,
  defaults,
  head_args,
  fn_name,
  call = rlang::caller_env()
) {
  if (length(dots) == 0L) {
    return(NULL)
  }

  dot_names <- rlang::names2(dots)
  values <- list()
  rebound_old <- character()
  rebound_new <- character()
  pos <- 0L
  for (k in seq_along(dots)) {
    nm <- dot_names[[k]]
    if (nzchar(nm)) {
      # Named (possibly abbreviated): partial-match the recoverable names.
      j <- charmatch(nm, match_names)
      if (is.na(j)) {
        cli::cli_abort(
          c(
            "Unexpected argument passed to {.fn {fn_name}}: {.arg {nm}}.",
            i = "Arguments after {.arg ...} must be spelled out in full."
          ),
          call = call
        )
      }
      if (j == 0L) {
        cli::cli_abort(
          "Argument {.arg {nm}} matches multiple arguments of {.fn {fn_name}}.",
          call = call
        )
      }
      new_name <- match_to[[j]]
      old_label <- match_names[[j]]
    } else {
      # Unnamed: recover by position into the next old slot past the head.
      pos <- pos + 1L
      if (pos > length(recover_new)) {
        cli::cli_abort(
          "Too many arguments passed to {.fn {fn_name}}.",
          call = call
        )
      }
      new_name <- recover_new[[pos]]
      old_label <- recover_old[[pos]]
    }

    duplicated <- new_name %in% rebound_new
    has_default <- new_name %in% names(defaults)
    reassigned <- has_default &&
      !identical(current[[new_name]], defaults[[new_name]])
    if (duplicated || reassigned) {
      cli::cli_abort(
        c(
          "Argument {.arg {new_name}} of {.fn {fn_name}} was supplied more than once.",
          i = "Pass it exactly once, by its new name {.arg {new_name}}."
        ),
        call = call
      )
    }

    values[[new_name]] <- dots[[k]]
    rebound_old <- c(rebound_old, old_label)
    rebound_new <- c(rebound_new, new_name)
  }

  detected <- paste0(
    fn_name,
    "(",
    paste(c(head_args, rebound_old), collapse = ", "),
    ")"
  )
  requested <- paste0(
    fn_name,
    "(",
    paste(c(head_args, paste0(rebound_new, " = ")), collapse = ", "),
    ")"
  )
  list(
    values = values,
    what = paste0(
      "Calling `",
      fn_name,
      "()` with positional or abbreviated arguments"
    ),
    details = c(
      i = paste0("Detected call:  ", detected),
      i = paste0("Use instead:    ", requested)
    )
  )
}

# Runtime guard for head/recoverable prefix overlaps. A supplied tag that is
# a strict prefix of a head arg *and* of a recoverable name was ambiguous --
# an error -- under the old signature; base R partial matching now binds it
# to the head arg before the recovery layer can see it. On its own that is
# accepted: previously broken code that now works in a well-defined, silent
# way is not a problem. What must not happen is that same tag combined with
# legacy arguments in `...`: the tag steals the head slot, positionals shift
# into the wrong formals, and the recovery layer would rescue a never-valid
# call behind a soft-deprecation warning. The generator enumerates those
# tags per function (`forbidden_tags`) and the ARG_HANDLE block calls this
# as the first statement inside its recovery gate -- i.e. only ever when
# `...` is non-empty and recovery is about to engage -- so exactly that
# combination is rejected.

#' @noRd
migrate_check_call_tags <- function(
  call,
  forbidden,
  fn_name,
  env = rlang::caller_env()
) {
  bad <- intersect(names(call), forbidden)
  if (length(bad) == 0L) {
    return(invisible(NULL))
  }
  cli::cli_abort(
    c(
      "Argument {.arg {bad}} matches multiple formal arguments of {.fn {fn_name}}.",
      i = "Spell out the full argument name."
    ),
    call = env
  )
}
