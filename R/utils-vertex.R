check_vertex <- function(arg, call = rlang::caller_env()) {
  arg_name <- rlang::caller_arg(arg)
  ok <- 0 ==
    (exit_code <- .standalone_types_check_dot_call(
      ffi_standalone_check_number_1.0.7,
      x = arg,
      allow_decimal = FALSE,
      min = 0,
      max = NULL,
      allow_infinite = FALSE,
      allow_na = FALSE,
      allow_null = FALSE
    ))

  if (!ok) {
    cli::cli_abort(
      "Can't find vertex corresponding to {.arg {arg_name}}."
    )
  }
}
