# Test fixture for the in-place argument-migration generator (tools/migrations.R,
# tools/generate-migrations.R). `migration_fixture()` carries a generated
# ARG_HANDLE block that recovers a legacy call to its pre-3.0.0 signature
# f(graph, n, weight, kind, directed) -- now
# f(graph, n, ..., weights, type, directed), with `weight` renamed to `weights`
# and `kind` to `type` (`directed` survives unchanged). The names are chosen so
# the tests can exercise two renames, unique and ambiguous abbreviations, and
# base-R matching of the head args (`graph`, `n`). It exists only to exercise the
# generator end-to-end; see tests/testthat/test-migration-fixture.R.

#' @noRd
migration_fixture <- function(
  graph,
  n,
  ...,
  weights = NULL,
  type = "out",
  directed = FALSE
) {
  # BEGIN GENERATED ARG_HANDLE: migration_fixture, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    # Pre-3.0.0 signature: migration_fixture(graph, n, weight, kind, directed)
    .old_signature <- function(weight, kind, directed, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn migration_fixture}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn migration_fixture}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(weight)) base::list(weights = weight),
        if (!base::missing(kind)) base::list(type = kind),
        if (!base::missing(directed)) base::list(directed = directed)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(weights)) "weights",
        if (!base::missing(type)) "type",
        if (!base::missing(directed)) "directed"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn migration_fixture} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `migration_fixture()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  migration_fixture(", base::paste(base::c("graph", "n", base::c(weights = "weight", type = "kind", directed = "directed")[.arg_names]), collapse = ", "), ")"),
          i = base::paste0("Use instead:    migration_fixture(", base::paste(base::c("graph", "n", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  list(
    graph = graph,
    n = n,
    weights = weights,
    type = type,
    directed = directed
  )
}

# Second fixture: head/recoverable prefix overlaps. `dim` (recoverable) is a
# strict prefix of the head arg `dimvector`, and the head arg `p` is a strict
# prefix of the recoverable `permutation` -- the two shapes that
# make_lattice()- and sample_correlated_gnp_pair()-style signatures hit. The
# generated block gains a `.arg_forbidden` guard that rejects the forbidden
# prefixes (`d`, `di`) when legacy arguments in `...` engage recovery; with
# empty dots they bind the head arg via plain partial matching.
migration_fixture_prefix <- function(
  dimvector,
  p,
  ...,
  dim = NULL,
  permutation = NULL
) {
  # BEGIN GENERATED ARG_HANDLE: migration_fixture_prefix, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    .arg_forbidden <- base::intersect(base::names(base::sys.call()), base::c("d", "di"))
    if (base::length(.arg_forbidden) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_forbidden)}} matches multiple formal arguments of {.fn migration_fixture_prefix}.", i = "Spell out the full argument name."))
    # Pre-3.0.0 signature: migration_fixture_prefix(dimvector, p, dim, permutation)
    .old_signature <- function(dim, permutation, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn migration_fixture_prefix}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn migration_fixture_prefix}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(dim)) base::list(dim = dim),
        if (!base::missing(permutation)) base::list(permutation = permutation)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(dim)) "dim",
        if (!base::missing(permutation)) "permutation"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn migration_fixture_prefix} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `migration_fixture_prefix()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  migration_fixture_prefix(", base::paste(base::c("dimvector", "p", .arg_names), collapse = ", "), ")"),
          i = base::paste0("Use instead:    migration_fixture_prefix(", base::paste(base::c("dimvector", "p", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  list(
    dimvector = dimvector,
    p = p,
    dim = dim,
    permutation = permutation
  )
}

# Third fixture: the two hazards a generated block faces in a real function
# body. `names` and `c` are argument names, so the block's own calls would
# resolve to them unless every call is namespace-qualified -- and a *missing*
# formal is worse than a shadowing one, since R forces the promise while looking
# for a function of that name. `attr` was renamed to `weights` while a
# deprecated `attr` formal stayed behind, so `attr =` binds that formal while
# its abbreviations (`a`, `at`, `att`) could mean either and are rejected. This
# is the as_adjacency_matrix()/as_biadjacency_matrix() shape.
migration_fixture_shadow <- function(
  graph,
  ...,
  weights = NULL,
  names = TRUE,
  c = NULL,
  attr = deprecated()
) {
  # BEGIN GENERATED ARG_HANDLE: migration_fixture_shadow, do not edit, see tools/generate-migrations.R
  # fmt: skip
  if (...length() > 0L) {
    .arg_ambiguous <- base::intersect(base::names(base::substitute(...())), base::c("a", "at", "att"))
    if (base::length(.arg_ambiguous) > 0L) cli::cli_abort("Argument {.arg {(.arg_ambiguous[[1L]])}} matches multiple arguments of {.fn migration_fixture_shadow}.")
    # Pre-3.0.0 signature: migration_fixture_shadow(graph, attr, names, c)
    .old_signature <- function(attr, names, c, ...) {
      if (...length() > 0L) {
        .arg_extra <- base::names(base::substitute(...()))
        .arg_extra <- .arg_extra[base::nzchar(.arg_extra)]
        if (base::length(.arg_extra) == 0L) cli::cli_abort("Too many arguments passed to {.fn migration_fixture_shadow}.", call = base::parent.frame())
        cli::cli_abort(base::c("Unexpected argument passed to {.fn migration_fixture_shadow}: {.arg {(.arg_extra)}}.", i = "Arguments after {.arg ...} must be spelled out in full."), call = base::parent.frame())
      }
      base::c(
        if (!base::missing(attr)) base::list(weights = attr),
        if (!base::missing(names)) base::list(names = names),
        if (!base::missing(c)) base::list(c = c)
      )
    }
    .arg_handle <- .old_signature(...)
    if (base::length(.arg_handle) > 0L) {
      .arg_names <- base::names(.arg_handle)
      .arg_conflict <- base::intersect(.arg_names, base::c(
        if (!base::missing(weights)) "weights",
        if (!base::missing(names)) "names",
        if (!base::missing(c)) "c"
      ))
      if (base::length(.arg_conflict) > 0L) cli::cli_abort(base::c("Argument {.arg {(.arg_conflict)}} of {.fn migration_fixture_shadow} was supplied more than once.", i = "Pass it exactly once, by its new name {.arg {(.arg_conflict)}}."))
      base::list2env(.arg_handle, base::environment())
      lifecycle::deprecate_soft(
        "3.0.0",
        what = base::I("Calling `migration_fixture_shadow()` with positional or abbreviated arguments"),
        details = base::c(
          i = base::paste0("Detected call:  migration_fixture_shadow(", base::paste(base::c("graph", base::c(weights = "attr", names = "names", c = "c")[.arg_names]), collapse = ", "), ")"),
          i = base::paste0("Use instead:    migration_fixture_shadow(", base::paste(base::c("graph", base::paste0(.arg_names, " = ")), collapse = ", "), ")")
        )
      )
    }
  }
  # END GENERATED ARG_HANDLE

  list(graph = graph, weights = weights, names = names, c = c, attr = attr)
}
