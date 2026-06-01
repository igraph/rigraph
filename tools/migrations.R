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
# ---------------------------------------------------------------------------
# Entry schema (a named list per migration):
#
#   fn       Character scalar. Name of the public function being migrated.
#            The generated helper is `handle_args_<fn>()`.
#
#   old      Character vector. The positional argument order *before* the
#            migration, e.g. c("graph", "types", "attr", "names", "sparse").
#
#   new      Character vector. The positional order *after* the migration,
#            including the literal "..." marker showing where dots were
#            inserted, e.g.
#            c("graph", "types", "...", "weights", "attr", "names", "sparse").
#            The non-"..." names are the new-API formals, in order.
#
#   renames  Named character vector mapping old name -> new name, for the
#            arguments that were renamed. Args that kept their name are omitted.
#            e.g. c(attr = "weights"). Default: character(0) (pure reorder/none).
#
#   defaults Named list mapping new-API arg name -> a *string* holding the R
#            expression used as that arg's formal default. Args present here get
#            `= <expr>` in the generated signature; args absent are required
#            (no default). The default value is also what the helper compares
#            against (via identical()) to decide whether the user explicitly
#            passed a keyword that would conflict with a recovered positional.
#            e.g. list(weights = "NULL", attr = "lifecycle::deprecated()").
#
#   when     Character scalar. The version string passed to
#            `lifecycle::deprecate_soft(when = )`, e.g. "3.0.0".
#
# ---------------------------------------------------------------------------
# Known limitations (documented, not handled -- see tools/README.md):
#
#   * Removed args: if a migration deletes an old positional slot rather than
#     renaming it, a legacy positional call silently rebinds to the wrong new
#     slot. The generator assumes every old slot beyond the head survives.
#   * Reordered args: the generator assumes the new signature preserves the
#     relative order of surviving old args (insertions and renames only).
#   * Partial matching: pre-`...` R let `f(g, att = "x")` partial-match `attrs`.
#     Post-insertion, partial names fall into `...` and are treated as unknown
#     named extras (the strict `check_dots_empty()` path), never recovered.
#
# These are acceptable because the migrations planned for 3.0.0 are pure
# renames with no removals or reorderings.
# ---------------------------------------------------------------------------

migrations <- list(
  # No real package function is migrated yet. Real entries are added by the
  # branch that consumes this infrastructure (see tools/README.md). Example of
  # the shape a real entry will take:
  #
  # list(
  #   fn       = "as_biadjacency_matrix",
  #   old      = c("graph", "types", "attr", "names", "sparse"),
  #   new      = c("graph", "types", "...", "weights", "attr", "names", "sparse"),
  #   renames  = c(attr = "weights"),
  #   defaults = list(
  #     weights = "NULL",
  #     attr    = "lifecycle::deprecated()",
  #     names   = "TRUE",
  #     sparse  = "FALSE"
  #   ),
  #   when     = "3.0.0"
  # ),

  # --- test fixture --------------------------------------------------------
  # Exercises the generator end-to-end without migrating a real function.
  # Old signature: f(a, b, c, d); new: f(a, b, ..., c_renamed, d) with c renamed
  # to c_renamed. Consumed by tests/testthat/test-handle-args.R.
  list(
    fn = "migration_fixture",
    old = c("a", "b", "c", "d"),
    new = c("a", "b", "...", "c_renamed", "d"),
    renames = c(c = "c_renamed"),
    defaults = list(c_renamed = "NULL", d = "NULL"),
    when = "3.0.0"
  )
)
