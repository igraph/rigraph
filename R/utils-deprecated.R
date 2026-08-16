# Signal the deprecation of a function that was passed as an argument.
#
# Many igraph functions take another function as an argument and call it on the
# user's behalf, for instance the `layout` argument of `plot.igraph()` or the
# `clip` and `plot` arguments of `add_shape()`.
# lifecycle attributes a deprecation to whoever called the deprecated function,
# and that caller is igraph itself here, not the user: `deprecate_soft()`
# therefore stays silent, and `deprecate_warn()` blames igraph and asks the
# user to report a bug against it.
# Either way the user never learns that the function they passed is deprecated,
# until the deprecation becomes hard and the call fails outright.
#
# `check_deprecated_function()` inspects `fn` before it is called and replays
# its deprecation against the environment igraph was called from, so that a
# deprecated function is reported the same way whether the user calls it
# themselves or hands it to igraph.
#
# The deprecation is replayed with the same signaller and the same message as
# the original, which keeps lifecycle's deduplication working: the deprecation
# `fn` signals when it is subsequently called is recognized as the one already
# reported here, and is not repeated.
#
# Anything but a deprecated function, `NULL` included, is left alone.
# Returns `fn`, invisibly.
check_deprecated_function <- function(fn) {
  deprecation <- function_deprecation(fn)

  if (!is.null(deprecation)) {
    replay_deprecation(deprecation, env = environment(fn))
  }

  invisible(fn)
}

# The deprecation a function signals for itself, as the `signaller` name and
# the `when`, `what`, `with` and `details` arguments it passes, or NULL if `fn`
# is not a deprecated function.
#
# Only unconditional, function-level deprecations are found, that is, a
# `lifecycle::deprecate_*()` call among the statements of the body of `fn`
# whose `what` names `fn` itself. A deprecation nested deeper in the body is
# conditional on the arguments of the call -- it deprecates an argument or one
# of its values, not the function -- and only the call itself can tell whether
# it applies.
function_deprecation <- function(fn) {
  if (!is.function(fn) || is.primitive(fn)) {
    return(NULL)
  }

  # Functions that live outside a package cannot be deprecated with lifecycle:
  # it derives the package to name in the message from the environment.
  ns <- topenv(environment(fn))
  if (!isNamespace(ns)) {
    return(NULL)
  }

  for (statement in body_statements(fn)) {
    deprecation <- as_deprecation(statement)
    if (!is.null(deprecation) && deprecates(deprecation, fn, ns)) {
      return(deprecation)
    }
  }

  NULL
}

body_statements <- function(fn) {
  body <- body(fn)
  if (rlang::is_call(body, "{")) as.list(body)[-1] else list(body)
}

deprecation_signallers <- c(
  "deprecate_soft",
  "deprecate_warn",
  "deprecate_stop"
)

# The deprecation described by a call, or NULL if it is not a
# `lifecycle::deprecate_*()` call with constant arguments.
as_deprecation <- function(statement) {
  if (!is.call(statement)) {
    return(NULL)
  }

  signaller <- statement[[1]]
  if (rlang::is_call(signaller, "::")) {
    if (!identical(signaller[[2]], quote(lifecycle))) {
      return(NULL)
    }
    signaller <- signaller[[3]]
  }
  if (!rlang::is_symbol(signaller)) {
    return(NULL)
  }

  signaller <- rlang::as_string(signaller)
  if (!signaller %in% deprecation_signallers) {
    return(NULL)
  }

  # A call that does not fit the signature is none of lifecycle's, whatever it
  # is named.
  statement <- tryCatch(
    match.call(
      definition = utils::getFromNamespace(signaller, "lifecycle"),
      call = statement
    ),
    error = function(e) NULL
  )
  if (is.null(statement)) {
    return(NULL)
  }

  arguments <- lapply(
    stats::setNames(nm = c("when", "what", "with", "details")),
    function(name) constant_value(statement[[name]])
  )
  # A deprecation whose message is assembled at run time cannot be replayed
  # from the body alone.
  if (any(vapply(arguments, identical, logical(1), y = not_constant))) {
    return(NULL)
  }

  c(list(signaller = signaller), arguments)
}

# Distinguishable from every constant, so that an argument that is absent
# (`with` and `details` are optional) is not mistaken for one that could not be
# evaluated.
not_constant <- new.env(parent = emptyenv())

constant_value <- function(expr) {
  # Evaluating in the base environment resolves literals and calls such as
  # `c("one", "other")`, and fails for anything that depends on the state of
  # the deprecated function.
  tryCatch(eval(expr, baseenv()), error = function(e) not_constant)
}

# Does a deprecation found in the body of `fn` deprecate `fn` as a whole?
deprecates <- function(deprecation, fn, ns) {
  what <- deprecation$what
  if (!rlang::is_string(what)) {
    return(FALSE)
  }

  # Function-level deprecations spell the function out as a call without
  # arguments, e.g. "layout.circle()"; argument-level ones name the argument
  # inside the parentheses, e.g. "bfs(father = )".
  if (!grepl("^[^(]+\\(\\)$", what)) {
    return(FALSE)
  }
  name <- sub("\\(\\)$", "", what)
  name <- sub("^.*::", "", name)

  # Guard against a wrapper that signals the deprecation of some *other*
  # function, e.g. of the one it is the replacement for.
  deprecated <- get0(name, envir = ns, inherits = FALSE)
  is.null(deprecated) || identical(deprecated, fn)
}

replay_deprecation <- function(deprecation, env) {
  user_env <- igraph_user_env()

  switch(
    deprecation$signaller,
    deprecate_soft = lifecycle::deprecate_soft(
      when = deprecation$when,
      what = deprecation$what,
      with = deprecation$with,
      details = deprecation$details,
      env = env,
      user_env = user_env
    ),
    deprecate_warn = lifecycle::deprecate_warn(
      when = deprecation$when,
      what = deprecation$what,
      with = deprecation$with,
      details = deprecation$details,
      env = env,
      user_env = user_env
    ),
    deprecate_stop = lifecycle::deprecate_stop(
      when = deprecation$when,
      what = deprecation$what,
      with = deprecation$with,
      details = deprecation$details,
      env = env
    )
  )
}

# The environment igraph was called from: the innermost caller that does not
# belong to igraph itself.
#
# lifecycle needs it to tell a deprecation the user is responsible for from one
# that happens behind their back, and to name the package to blame in the
# latter case. Walking the caller chain keeps this independent of how deeply a
# deprecated argument is passed on inside igraph before it is looked at, which
# a fixed `rlang::caller_env(n)` would have to track. Callers must not reach
# the check through a functional such as `lapply()`, whose frame would end the
# walk in place of the user's.
igraph_user_env <- function() {
  ns <- topenv(environment(igraph_user_env))

  generation <- 1L
  repeat {
    env <- parent.frame(generation)
    # parent.frame() bottoms out at the global environment, so the walk
    # terminates there even if every frame belongs to igraph.
    if (identical(env, globalenv()) || !identical(topenv(env), ns)) {
      return(env)
    }
    generation <- generation + 1L
  }
}
