#!/usr/bin/env Rscript
#
# Generate flir rules from the argument-migration registry (tools/migrations/).
#
# For each registry entry, writes one file `migrate-<when>-<fn>.yml` holding one
# rule per old positional slot that moved behind `...`. Each rule matches the
# argument R would have bound to that old formal and rewrites it to
# `<new name> = <value>`, in three cases:
#
# - passed by its old name, or by an abbreviation unique under `old`;
# - passed as the k-th unnamed argument of a call that is not piped;
# - passed as the (k-1)-th unnamed argument of a call on the right of `|>`, or
#   of `%>%` without a `.` placeholder.
#
# The positional cases only fire when the binding is decidable from syntax: no
# named argument that could take one of the old formals 1..k, no empty slot, no
# `...`. Every other call is left to the runtime recovery. See
# https://github.com/igraph/rigraph/issues/2933.
#
# Usage:
#   Rscript tools/generate-flir-rules.R [out_dir] [fn ...]
#
# `out_dir` defaults to inst/flir/rules. By default, rules are written for every
# function in the registry; list function names after `out_dir` to write rules
# for those functions only, e.g.
#   Rscript tools/generate-flir-rules.R out/ sample_gnp degree
#
# The YAML lives in tools/flir-rule.yml.mustache, rendered with whisker.

source(file.path("tools", "generate-migrations.R"))

# The names R binds to the formal `name` among `formals`: the full name, plus
# every abbreviation of it no other formal claims. `pmatch()` is called on each
# abbreviation alone: on a vector it would match them jointly, as in a call, and
# the exact match would take `name` away from the shorter ones.
names_that_bind_to <- function(name, formals) {
  abbreviations <- substring(name, 1, seq_len(nchar(name)))
  matched <- vapply(abbreviations, pmatch, integer(1), formals)
  abbreviations[matched %in% match(name, formals)]
}

# Every abbreviation of every name in `names`, the full names included.
all_abbreviations_of <- function(names) {
  unique(unlist(lapply(names, function(name) {
    substring(name, 1, seq_len(nchar(name)))
  })))
}

# A regex matching any of the names `x` in full, dots escaped.
regex_exactly_matching_any_of <- function(x) {
  paste0("^(", paste(gsub(".", "[.]", x, fixed = TRUE), collapse = "|"), ")$")
}

# A regex matching the function part of a call to `fn`, bare or `igraph::`.
regex_matching_call_to <- function(fn) {
  paste0("^(igraph:::?)?", gsub(".", "[.]", fn, fixed = TRUE), "$")
}

# The values the template fills in for the rule moving `old_name` to
# `new_name`.
template_values_for_rule <- function(entry, old_name, new_name) {
  position <- match(old_name, entry$old)
  # Writing the new name over itself would change nothing yet lint forever.
  names_to_rewrite <- setdiff(names_that_bind_to(old_name, entry$old), new_name)
  # A named argument that may bind to one of the old formals up to `position`
  # shifts the unnamed ones, so the positional branches must not fire.
  names_blocking_position <- all_abbreviations_of(entry$old[seq_len(position)])
  list(
    when = entry$when,
    fn = entry$fn,
    function_regex = regex_matching_call_to(entry$fn),
    old_name = old_name,
    new_name = new_name,
    names_to_rewrite_regex = if (length(names_to_rewrite)) {
      regex_exactly_matching_any_of(names_to_rewrite)
    } else {
      FALSE
    },
    names_blocking_position_regex = regex_exactly_matching_any_of(
      names_blocking_position
    ),
    position = position,
    # On the right of a pipe the first formal is filled by the left-hand side.
    position_after_pipe = if (position > 1L) position - 1L else FALSE
  )
}

# The rule file for one registry entry: one rule per old formal that moved
# behind `...`.
render_rule_file <- function(entry, template) {
  rules <- Map(
    function(old_name, new_name) {
      template_values_for_rule(entry, old_name, new_name)
    },
    entry$recover_old,
    entry$recover_new
  )
  for (i in seq_along(rules)) {
    rules[[i]]$is_first_rule <- i == 1L
  }
  whisker::whisker.render(template, list(rules = unname(rules)))
}

generate_flir_rules <- function(registry_path, out_dir, fns = NULL) {
  migrations <- load_migrations(registry_path)
  if (length(fns)) {
    unknown <- setdiff(fns, names(migrations))
    if (length(unknown)) {
      stop(
        "Not in the registry: ",
        paste(unknown, collapse = ", "),
        call. = FALSE
      )
    }
    migrations <- migrations[fns]
  }
  template <- paste(
    readLines(file.path("tools", "flir-rule.yml.mustache")),
    collapse = "\n"
  )
  dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
  for (entry in migrations) {
    if (!length(entry$recover_old)) {
      next
    }
    path <- file.path(
      out_dir,
      sprintf("migrate-%s-%s.yml", entry$when, entry$fn)
    )
    writeLines(render_rule_file(entry, template), path, sep = "")
    message("wrote ", path)
  }
}

if (sys.nframe() == 0L && !interactive()) {
  args <- commandArgs(trailingOnly = TRUE)
  out_dir <- if (length(args)) args[[1]] else file.path("inst", "flir", "rules")
  generate_flir_rules(migration_registry_files(), out_dir, args[-1])
}
