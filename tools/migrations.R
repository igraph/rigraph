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
#   old   The pre-migration signature. Only its formal *names* and *order* are
#         read -- old default *values* are ignored. A formal whose default is a
#         **bare symbol** is the one exception: it declares a rename to that
#         name, e.g. `c = c_renamed` means the old `c` argument is the new
#         `c_renamed`. Formals without a symbol default keep their name.
#
#   new   The post-migration signature. Must contain exactly one `...`. The
#         non-`...` formals are the new-API arguments, in order; their defaults
#         become the function's defaults and the values the conflict check
#         compares against.
#
#   when  The version string passed to `lifecycle::deprecate_soft(when = )`.
#
#   Changing a default as part of a migration is fine: the new default lives in
#   `new` and is what the recovery uses; the old default is never consulted. The
#   only caveat is the bare-symbol convention above -- an old argument whose
#   genuine default is itself a bare symbol would be misread as a rename (rare;
#   wrap it, e.g. `(sym)`, or reintroduce an explicit rename field if it ever
#   bites).
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
  # --- real migrations -----------------------------------------------------
  # `attr` (a character edge-attribute name) is retired in favour of the more
  # capable `weights` argument. The old `attr` slot is renamed to `weights`
  # (the bare-symbol default below) and recovered positionally; named `attr =`
  # calls keep working via the surviving `attr = deprecated()` formal, handled
  # by resolve_edge_weights() in R/conversion.R.
  as_adjacency_matrix = list(
    old = function(graph, type, attr = weights, edges, names, sparse) {},
    new = function(
      graph,
      type = c("both", "upper", "lower"),
      ...,
      weights = NULL,
      names = TRUE,
      sparse = igraph_opt("sparsematrices"),
      edges = deprecated(),
      attr = deprecated()
    ) {},
    when = "3.0.0"
  ),

  as_biadjacency_matrix = list(
    old = function(graph, types, attr = weights, names, sparse) {},
    new = function(
      graph,
      types = NULL,
      ...,
      weights = NULL,
      names = TRUE,
      sparse = FALSE,
      attr = deprecated()
    ) {},
    when = "3.0.0"
  ),

  # --- real migrations -----------------------------------------------------
  # Dotted `*.attr.comb` arguments renamed to snake_case. The old dotted names
  # keep working (recovered from `...`) under a single soft-deprecation.
  simplify = list(
    old = function(
      graph,
      remove.multiple,
      remove.loops,
      edge.attr.comb = edge_attr_comb
    ) {},
    new = function(
      graph,
      remove.multiple = TRUE,
      remove.loops = TRUE,
      ...,
      edge_attr_comb = igraph_opt("edge_attr_comb")
    ) {},
    when = "3.0.0"
  ),
  as_undirected = list(
    old = function(graph, mode, edge.attr.comb = edge_attr_comb) {},
    new = function(
      graph,
      mode = c("collapse", "each", "mutual"),
      ...,
      edge_attr_comb = igraph_opt("edge_attr_comb")
    ) {},
    when = "3.0.0"
  ),
  contract = list(
    old = function(graph, mapping, vertex.attr.comb = vertex_attr_comb) {},
    new = function(
      graph,
      mapping,
      ...,
      vertex_attr_comb = igraph_opt("vertex_attr_comb")
    ) {},
    when = "3.0.0"
  ),

  # --- test fixture --------------------------------------------------------
  # Exercises the generator end-to-end without migrating a real function. The
  # arg names are chosen to cover every recovery path: two renames (`weight ->
  # weights`, `kind -> type`), a surviving arg (`directed`), unique
  # abbreviations (`kin`, `dir`) and an ambiguous one (`weig` matches both
  # `weight` and `weights`). Head args (`graph`, `n`) stay before `...` and are
  # matched by base R, including abbreviations like `gr =`. Consumed by
  # tests/testthat/test-migration-fixture.R.
  migration_fixture = list(
    old = function(graph, n, weight = weights, kind = type, directed) {},
    new = function(
      graph,
      n,
      ...,
      weights = NULL,
      type = "out",
      directed = FALSE
    ) {},
    when = "3.0.0"
  )
)
