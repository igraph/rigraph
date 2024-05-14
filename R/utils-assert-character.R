assert_character <- function(x, name = "name") {
  if (!inherits(x, "character")) {
    cli::cli_abort("{.arg {name}} must be a character, not {.obj_type_friendly {x}}.")
  }
}
