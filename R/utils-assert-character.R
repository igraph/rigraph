assert_character <- function(x, name = "name", call = rlang::caller_env()) {
  check_string(
    x,
    arg = name,
    call = call
  )
}
