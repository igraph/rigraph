# Capture `...` for the recovery layer without tripping over empty arguments.
#
# A call may leave an argument slot empty -- a trailing comma
# (`f(x, mode = "out", )`) or a skipped positional slot, which is what
# magrittr produces for `x %>% f(., , directed = FALSE)`. Under the old
# signatures those empty slots matched a formal by position and simply left it
# missing, so the formal's default applied. Now that the optional arguments sit
# behind `...`, the empty slot lands in `...` instead, where `list(...)` forces
# it and errors with "argument is missing, with no default" (#2646).
#
# So collect the supplied dots only, and remember where each one sat among the
# unnamed slots: an empty slot still consumed a formal under the old signature,
# so `f(g, , 5)` must recover `5` into the *second* recoverable argument, not
# the first. `pos` carries that ordinal (NA for named dots, which recover by
# name); `values` holds just the supplied ones.
#
# `substitute(...())` yields the unevaluated dot expressions -- an empty slot
# shows up as the empty symbol -- so missing-ness is decided without forcing
# anything. Only the supplied slots are then forced, via `...elt()`.

#' @noRd
migrate_capture_dots <- function(env = parent.frame()) {
  exprs <- as.list(eval(quote(substitute(...())), env))
  if (length(exprs) == 0L) {
    return(list(values = list(), pos = integer(0)))
  }

  # `quote(expr = )` is inlined rather than bound to a local: evaluating a
  # variable that holds the empty symbol is itself a "argument is missing"
  # error, so it must never be looked up by name.
  supplied <- !vapply(exprs, identical, logical(1), quote(expr = ))
  if (!any(supplied)) {
    # Nothing but empty slots: the formals keep their defaults, exactly as
    # under the old signature. No recovery, and no deprecation warning.
    return(list(values = list(), pos = integer(0)))
  }

  nms <- rlang::names2(exprs)
  unnamed <- !nzchar(nms)
  # Ordinal among the unnamed slots, counting the empty ones.
  ordinal <- cumsum(unnamed)
  ordinal[!unnamed] <- NA_integer_

  idx <- which(supplied)
  values <- lapply(idx, function(k) eval(call("...elt", k), env))
  if (any(nzchar(nms[idx]))) {
    # Left unnamed when no dot was tagged, matching what `list(...)` produced.
    names(values) <- nms[idx]
  }
  list(values = values, pos = as.integer(ordinal[idx]))
}

# Runtime helper behind the generated `# ... ARG_HANDLE` blocks (see
# tools/migrations.R, tools/generate-migrations.R). Hand-written and tested
# directly -- the generated blocks only carry the per-function configuration and
# call this. Kept a plain function (not an inline closure) so it is easy to step
# through in a debugger.
#
# `dots` is the `migrate_capture_dots()` result -- `$values` (supplied dots
# only) and `$pos` (their ordinal among the unnamed slots).
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
  dot_pos <- dots$pos
  dots <- dots$values
  if (length(dots) == 0L) {
    return(NULL)
  }

  dot_names <- rlang::names2(dots)
  values <- list()
  rebound_old <- character()
  rebound_new <- character()
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
      # Unnamed: recover by position into the old slot this one sat in, past
      # the head. Empty slots were dropped but still count towards the
      # ordinal, so a skipped slot shifts the later positionals along.
      pos <- dot_pos[[k]]
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
