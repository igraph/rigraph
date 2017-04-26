as.lazy <- function(x, env = baseenv()) UseMethod("as.lazy")
as.lazy.lazy <- function(x, env = baseenv()) x
as.lazy.formula <- function(x, env = baseenv()) lazy_(x[[2]], environment(x))
as.lazy.character <- function(x, env = baseenv()) lazy_(parse(text = x)[[1]], env)
as.lazy.call <- function(x, env = baseenv()) lazy_(x, env)
as.lazy.name <- function(x, env = baseenv()) lazy_(x, env)
as.lazy.numeric <- function(x, env = baseenv()) {
  if (length(x) > 1) {
    warning("Truncating vector to length 1", call. = FALSE)
    x <- x[1]
  }
  lazy_(x, env)
}
as.lazy.logical <- as.lazy.numeric
as.lazy_dots <- function(x, env) UseMethod("as.lazy_dots")
as.lazy_dots.NULL <- function(x, env = baseenv()) {
  structure(list(), class = "lazy_dots")
}
as.lazy_dots.list <- function(x, env = baseenv()) {
  structure(lapply(x, as.lazy, env = env), class = "lazy_dots")
}
as.lazy_dots.name <- function(x, env = baseenv()) {
  structure(list(as.lazy(x, env)), class = "lazy_dots")
}
as.lazy_dots.formula <- as.lazy_dots.name
as.lazy_dots.call <- as.lazy_dots.name
as.lazy_dots.lazy <- function(x, env = baseenv()) {
  structure(list(x), class = "lazy_dots")
}
as.lazy_dots.character <- function(x, env = baseenv()) {
  structure(lapply(x, as.lazy, env = env), class = "lazy_dots")
}
as.lazy_dots.lazy_dots <- function(x, env = baseenv()) {
  x
}
all_dots <- function(.dots, ..., all_named = FALSE) {
  dots <- as.lazy_dots(list(...))
  if (!missing(.dots)) {
    dots2 <- as.lazy_dots(.dots)
    dots <- c(dots, dots2)
  }

  if (all_named) {
    dots <- auto_name(dots)
  }

  dots

}
lazy_eval <- function(x, data = NULL) {
  if (is.lazy_dots(x)) {
    return(lapply(x, lazy_eval, data = data))
  }

  x <- as.lazy(x)

  if (!is.null(data)) {
    eval(x$expr, data, x$env)
  } else {
    eval(x$expr, x$env, emptyenv())
  }
}
interp <- function(`_obj`, ..., .values) {
  UseMethod("interp")
}
interp.call <- function(`_obj`, ..., .values) {
  values <- all_values(.values, ...)

  substitute_(`_obj`, values)
}
interp.name <- function(`_obj`, ..., .values) {
  values <- all_values(.values, ...)

  substitute_(`_obj`, values)
}
interp.formula <- function(`_obj`, ..., .values) {
  values <- all_values(.values, ...)

  `_obj`[[2]] <- substitute_(`_obj`[[2]], values)
  `_obj`
}
interp.lazy <- function(`_obj`, ..., .values) {
  values <- all_values(.values, ...)

  `_obj`$expr <-  substitute_(`_obj`$expr, values)
  `_obj`
}
interp.character <- function(`_obj`, ..., .values) {
  values <- all_values(.values, ...)

  expr1 <- parse(text = `_obj`)[[1]]
  expr2 <- substitute_(expr1, values)
  deparse(expr2)
}
substitute_ <- function(x, env) {
  call <- substitute(substitute(x, env), list(x = x))
  eval(call)
}
all_values <- function(.values, ...) {
  if (missing(.values)) {
    values <- list(...)
  } else if (identical(.values, globalenv())) {
    # substitute doesn't want to replace in globalenv
    values <- as.list(globalenv())
  } else {
    values <- .values
  }
  # Replace lazy objects with their expressions
  is_lazy <- vapply(values, is.lazy, logical(1))
  values[is_lazy] <- lapply(values[is_lazy], `[[`, "expr")

  values
}
missing_arg <- function() {
  quote(expr = )
}
lazy_dots <- function(..., .follow_symbols = FALSE) {
  if (nargs() == 0 || (nargs() == 1 &&  ! missing(.follow_symbols))) {
    return(structure(list(), class = "lazy_dots"))
  }

  .Call(C_make_lazy_dots, environment(), .follow_symbols)
}
is.lazy_dots <- function(x) inherits(x, "lazy_dots")
`[.lazy_dots` <- function(x, i) {
  structure(NextMethod(), class = "lazy_dots")
}
`$<-.lazy_dots` <- function(x, i, value) {
  value <- as.lazy(value, parent.frame())
  x[[i]] <- value
  x
}
`[<-.lazy_dots` <- function(x, i, value) {
  value <- lapply(value, as.lazy, env = parent.frame())
  NextMethod()
}
c.lazy_dots <- function(..., recursive = FALSE) {
  structure(NextMethod(), class = "lazy_dots")
}
lazy_ <- function(expr, env) {
  stopifnot(is.call(expr) || is.name(expr) || is.atomic(expr))

  structure(list(expr = expr, env = env), class = "lazy")
}
lazy <- function(expr, env = parent.frame(), .follow_symbols = TRUE) {
  .Call(C_make_lazy, quote(expr), environment(), .follow_symbols)
}
is.lazy <- function(x) inherits(x, "lazy")
print.lazy <- function(x, ...) {
  code <- deparse(x$expr)
  if (length(code) > 1) {
    code <- paste(code[[1]], "...")
  }

  cat("<lazy>\n")
  cat("  expr: ", code, "\n", sep = "")
  cat("  env:  ", format(x$env), "\n", sep = "")
}
make_call <- function(fun, args) {
  stopifnot(is.call(fun) || is.name(fun))
  args <- as.lazy_dots(args)
  expr <- lapply(args, `[[`, "expr")

  lazy_(
    as.call(c(fun, expr)),
    common_env(args)
  )
}
common_env <- function(dots) {
  if (!is.list(dots)) stop("dots must be a list", call. = FALSE)
  if (length(dots) == 0) return(baseenv())

  dots <- as.lazy_dots(dots)
  env <- dots[[1]]$env
  if (length(dots) == 1) return(env)

  for (i in 2:length(dots)) {
    if (!identical(env, dots[[i]]$env)) {
      return(baseenv())
    }
  }
  env
}
eval_call <- function(fun, dots, env = parent.frame()) {

  vars <- paste0("x", seq_along(dots))
  names(vars) <- names(dots)

  # Create environment containing promises
  env <- new.env(parent = env)
  for(i in seq_along(dots)) {
    dot <- dots[[i]]

    assign_call <- substitute(
      delayedAssign(vars[i], expr, dot$env, assign.env = env),
      list(expr = dot$expr)
    )
    eval(assign_call)
  }

  args <- lapply(vars, as.symbol)
  call <- as.call(c(fun, args))

  eval(call, env)
}
auto_name <- function(x, max_width = 40) {
  names(x) <- auto_names(x, max_width = max_width)
  x
}
auto_names <- function(x, max_width = 40) {
  x <- as.lazy_dots(x)

  nms <- names(x) %||% rep("", length(x))

  missing <- nms == ""
  expr <- lapply(x[missing], `[[`, "expr")
  nms[missing] <- vapply(expr, deparse_trunc, width = max_width,
    FUN.VALUE = character(1), USE.NAMES = FALSE)

  nms
}
deparse_trunc <- function(x, width = getOption("width")) {
  if (is.symbol(x)) {
    return(as.character(x))
  }

  text <- deparse(x, width.cutoff = width)
  if (length(text) == 1 && nchar(text) < width) return(text)

  paste0(substr(text[1], 1, width - 3), "...")
}
promise_expr <- function(prom) {
  .Call(C_promise_expr_, prom)
}

promise_env <- function(prom) {
  .Call(C_promise_env_, prom)
}
as.lazy.promise <- function(x, ...) {
  lazy_(promise_expr(x), promise_env(x))
}
"%||%" <- function(x, y) if(is.null(x)) y else x
