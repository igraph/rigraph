# Call a function the user passed as an argument, as if they had called it
# themselves.
#
# lifecycle attributes a deprecation to the caller of the deprecated function.
# When igraph calls a function the user handed it, that caller is an igraph
# frame: `deprecate_soft()` then says nothing at all, and `deprecate_warn()`
# blames igraph and asks the user to report a bug against it. Neither tells the
# user that the function they chose is on its way out, which is what they need
# to hear before the deprecation becomes hard.
#
# `bfs()`, `dfs()`, `arpack()` and `cluster_leading_eigen()` already evaluate
# their callback in the environment they were called from, through their `rho`
# and `env` arguments, and are attributed correctly because of it. These
# helpers extend that treatment to the remaining function arguments, without an
# argument to pass in and thread through.
call_user_callback <- function(fn, ...) {
  as_user_callback(fn)(...)
}

# `fn`, wrapped so that it is called from the environment igraph was called
# from. Anything but a function, `NULL` included, is returned unchanged.
#
# Use this for a function that igraph hands on -- to the C layer, or to a later
# call -- rather than calls itself; the environment is the one current when the
# function was passed, which is where the user chose it.
as_user_callback <- function(fn) {
  if (!is.function(fn)) {
    return(fn)
  }

  # The wrapper is enclosed in a child of the user's environment, so that `fn`
  # sees a caller that belongs to the user rather than to igraph. lifecycle
  # asks `topenv()` who that caller is, and `topenv()` looks through the child.
  rlang::new_function(
    args = rlang::pairlist2(... = ),
    body = quote(fn(...)),
    env = rlang::env(igraph_user_env(), fn = fn)
  )
}

# The environment igraph was called from: the innermost caller that does not
# belong to igraph itself.
#
# Walking the caller chain keeps this independent of how deeply a function
# argument is passed on inside igraph before it is called, which a fixed
# `rlang::caller_env(n)` would have to track. Callers must not reach this
# through a functional such as `lapply()`, whose frame would end the walk in
# place of the user's.
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
