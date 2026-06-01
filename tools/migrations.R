# Migration registry: the single source of truth for argument-signature
# migrations that insert `...` and soft-deprecate the old positional form.
#
# This file is read by tools/generate-migrations.R, which turns each entry into
# an internal `handle_args_<fn>()` helper at R/handle-args-<fn>.R. Do NOT edit
# the generated R/handle-args-*.R files by hand -- edit this registry and
# regenerate:
#
#   Rscript tools/generate-migrations.R
#
# (A testthat helper also regenerates them automatically when this file is newer
# than the generated helpers; see tests/testthat/helper-migrations.R.)
#
# ---------------------------------------------------------------------------
# Entry schema
#
# `migrations` is a list named by function. Each entry declares the function's
# signature *before* and *after* the migration as literal R function objects --
# renames and defaults are read straight off their formals:
#
#   <fn> = list(
#     old  = function(<old positional signature>) {},
#     new  = function(<new signature, including `...`>) {},
#     when = "<lifecycle version>"
#   )
#
#   old   The pre-migration signature. The *order* of its formals is the old
#         positional order. A formal whose default is a **bare symbol** declares
#         a rename to that name, e.g. `c = c_renamed` means the old `c` argument
#         is the new `c_renamed`. Formals without a symbol default keep their
#         name.
#
#   new   The post-migration signature. Must contain exactly one `...`. The
#         non-`...` formals are the new-API arguments, in order; their defaults
#         become the generated helper's defaults (and the values the conflict
#         check compares against).
#
#   when  The version string passed to `lifecycle::deprecate_soft(when = )`.
#
# ---------------------------------------------------------------------------
# How recovery maps old calls onto the new signature
#
#   * Arguments *before* `...` in `new` ("head" args) bind positionally as
#     before; they must keep their relative order and names.
#   * Old positional slots *beyond* the head are recovered from `...`: an
#     unnamed value is mapped by position, a (possibly abbreviated) name by
#     partial match. Renamed-away old names and abbreviations of the new names
#     are both recovered, all under one soft-deprecation.
#
# To reorder or drop an argument, place it *after* `...` in `new`. It then
# becomes keyword-only and is recovered by (partial) name rather than by
# position, side-stepping the position math entirely.
# ---------------------------------------------------------------------------

migrations <- list(
  # No real package function is migrated yet. Real entries are added by the
  # branch that consumes this infrastructure (see tools/README.md). Example of
  # the shape a real entry will take (old `attr` renamed to `weights`):
  #
  # as_biadjacency_matrix = list(
  #   old  = function(graph, types, attr = weights, names, sparse) {},
  #   new  = function(graph, types, ..., weights = NULL,
  #                   attr = lifecycle::deprecated(), names = TRUE,
  #                   sparse = FALSE) {},
  #   when = "3.0.0"
  # ),

  # --- test fixture --------------------------------------------------------
  # Exercises the generator end-to-end without migrating a real function.
  # Old signature f(a, b, c, d); new f(a, b, ..., c_renamed, d) with c renamed
  # to c_renamed. Consumed by tests/testthat/test-handle-args.R.
  migration_fixture = list(
    old = function(a, b, c = c_renamed, d) {},
    new = function(a, b, ..., c_renamed = NULL, d = NULL) {},
    when = "3.0.0"
  )
)
