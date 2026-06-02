# Test fixture for the in-place argument-migration generator (tools/migrations.R,
# tools/generate-migrations.R). `migration_fixture()` carries a generated
# ARG_HANDLE block that recovers a legacy call to its pre-3.0.0 signature
# f(a, b, c, d) -- now f(a, b, ..., c_renamed, d) with c renamed to c_renamed.
# It exists only to exercise the generator end-to-end; see
# tests/testthat/test-handle-args.R.

#' @noRd
migration_fixture <- function(a, b, ..., c_renamed = NULL, d = NULL) {
  # BEGIN GENERATED ARG_HANDLE: migration_fixture
  # Generated from tools/migrations.R by tools/generate-migrations.R -- do not edit.
  # Recovers a legacy call to the pre-migration signature; regenerate with
  # `Rscript tools/generate-migrations.R`.
  .arg_handle <- (function(dots, current) {
    if (length(dots) == 0L) {
      return(NULL)
    }
    recover_new <- c("c_renamed", "d")
    recover_old <- c("c", "d")
    match_names <- c("c", "c_renamed", "d")
    match_to <- c("c_renamed", "c_renamed", "d")
    defaults <- list(c_renamed = NULL, d = NULL)
    head_args <- c("a", "b")
    fn_name <- "migration_fixture"
    dot_names <- rlang::names2(dots)
    values <- list()
    rebound_old <- character()
    rebound_new <- character()
    pos <- 0L
    for (k in seq_along(dots)) {
      nm <- dot_names[[k]]
      if (nzchar(nm)) {
        # Named (possibly abbreviated): partial-match recoverable names.
        j <- charmatch(nm, match_names)
        if (is.na(j)) {
          cli::cli_abort(c(
            "Unexpected argument passed to {.fn {fn_name}}: {.arg {nm}}.",
            i = "Arguments after {.arg ...} must be spelled out in full."
          ))
        }
        if (j == 0L) {
          cli::cli_abort(
            "Argument {.arg {nm}} matches multiple arguments of {.fn {fn_name}}."
          )
        }
        new_name <- match_to[[j]]
        old_label <- match_names[[j]]
      } else {
        # Unnamed: recover by position into the next old slot past the head.
        pos <- pos + 1L
        if (pos > length(recover_new)) {
          cli::cli_abort("Too many arguments passed to {.fn {fn_name}}.")
        }
        new_name <- recover_new[[pos]]
        old_label <- recover_old[[pos]]
      }
      duplicated <- new_name %in% rebound_new
      has_default <- new_name %in% names(defaults)
      reassigned <- has_default &&
        !identical(current[[new_name]], defaults[[new_name]])
      if (duplicated || reassigned) {
        cli::cli_abort(c(
          "Argument {.arg {new_name}} of {.fn {fn_name}} was supplied more than once.",
          i = "Pass it exactly once, by its new name {.arg {new_name}}."
        ))
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
  })(list(...), list(c_renamed = c_renamed, d = d))
  if (!is.null(.arg_handle)) {
    list2env(.arg_handle$values, environment())
    lifecycle::deprecate_soft(
      "3.0.0",
      what = I(.arg_handle$what),
      details = .arg_handle$details
    )
  }
  # END GENERATED ARG_HANDLE

  list(a = a, b = b, c_renamed = c_renamed, d = d)
}
