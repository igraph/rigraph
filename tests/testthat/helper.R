skip_if_no_glpk <- function() {
  if (!has_glpk()) skip("No GLPK library")
}

skip_if_no_graphml <- function() {
  if (!has_graphml()) skip("No GraphML support")
}

local_rng_version <- function(version, .local_envir = parent.frame()) {
  orig <- RNGkind()
  withr::defer(do.call(RNGkind, as.list(orig)), envir = .local_envir)
  suppressWarnings(RNGversion(version))
  orig
}

# Restore the global RNG state (kind + .Random.seed) to a previously captured
# snapshot. `kind` is the result of RNGkind() and `state` is .Random.seed before
# the seed was set (or NULL if no RNG had been used yet). The kind is restored
# first -- changing the RNG kind discards .Random.seed -- so that the seed
# assignment is the final word and the state round-trips exactly.
restore_rng_state <- function(kind, state) {
  do.call(RNGkind, as.list(kind))
  if (is.null(state)) {
    if (exists(".Random.seed", envir = globalenv(), inherits = FALSE)) {
      rm(".Random.seed", envir = globalenv())
    }
  } else {
    assign(".Random.seed", state, envir = globalenv())
  }
}

# Drop-in replacement for withr::local_seed() in tests. Sets the RNG seed (and
# optionally pins the RNG version via `rng_version`, e.g. "3.5.0") and restores
# the pre-call global RNG state when `.local_envir` exits (the current test_that
# block, or the enclosing helper function when called from one). Self-contained:
# it does its own save/restore, so it does not depend on withr's local_seed().
# withr::defer is used only as the deferral primitive (it fires reliably in both
# test blocks and function frames). Folding the version pin in here -- rather
# than pairing a separate RNG-version helper with its own deferred restore --
# keeps a single, correctly ordered restore point, so the seed never leaks.
igraph_local_seed <- function(
  seed,
  rng_version = NULL,
  kind = NULL,
  normal.kind = NULL,
  sample.kind = NULL,
  .local_envir = parent.frame()
) {
  old_kind <- RNGkind()
  old_seed <- get0(".Random.seed", envir = globalenv(), inherits = FALSE)
  withr::defer(restore_rng_state(old_kind, old_seed), envir = .local_envir)

  if (!is.null(rng_version)) {
    suppressWarnings(RNGversion(rng_version))
  }

  set.seed(
    seed,
    kind = kind,
    normal.kind = normal.kind,
    sample.kind = sample.kind
  )

  invisible(old_seed)
}

expect_isomorphic <- function(g1, g2, ...) {
  expect_true(isomorphic(g1, g2, ...))
}

expect_not_isomorphic <- function(g1, g2, ...) {
  expect_false(isomorphic(g1, g2, ...))
}

expect_vcount <- function(graph, expected, ...) {
  expect_equal(object = vcount(graph), expected = expected, ...)
}

expect_ecount <- function(graph, expected, ...) {
  expect_equal(object = ecount(graph), expected = expected, ...)
}

expect_identical_graphs <- function(g1, g2, ...) {
  expect_true(identical_graphs(g1, g2, ...))
}

expect_not_identical_graphs <- function(g1, g2, ...) {
  expect_false(identical_graphs(g1, g2, ...))
}

scrub_igraph_file_paths <- function(y) {
  # Scrub file name and line number from error/warning messages
  # Handles "Source: filename:linenumber" and "At path/to/file:line :" patterns
  # The "At" pattern may have an optional space before the final colon
  y <- gsub("Source: [^:]+:(\\d+|xx|<linenumber>)", "Source: <file>:<line>", y)
  y <- gsub("At [^:]+:(\\d+|xx) ?:", "At <file>:<line>:", y)
  y
}

expect_snapshot_igraph_error <- function(x, ...) {
  inject(expect_snapshot(
    {{ x }},
    error = TRUE,
    transform = scrub_igraph_file_paths,
    ...
  ))
}

expect_snapshot_igraph <- function(x, ...) {
  inject(expect_snapshot(
    {{ x }},
    transform = scrub_igraph_file_paths,
    ...
  ))
}
