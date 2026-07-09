skip_if_no_glpk <- function() {
  if (!has_glpk()) skip("No GLPK library")
}

skip_if_no_graphml <- function() {
  if (!has_graphml()) skip("No GraphML support")
}

# Drop-in replacement for withr::local_seed() in tests.
# Sets the RNG seed (and optionally pins the RNG version via `rng_version`,
# e.g. "3.5.0") and restores the pre-call global RNG state when `.local_envir`
# exits (the current test_that block, or the enclosing helper function when
# called from one).
#
# Self-contained: it does its own save/restore, so it does not depend on withr's
# local_seed() (whose RNG-version/kind restore has had ordering regressions, see
# https://github.com/r-lib/withr/issues/167).
# withr::defer is used only as the deferral primitive; it fires reliably in both
# test blocks and function frames.
#
# The RNG version is pinned here rather than via a separate helper.
# Pairing a separate RNG-version helper (with its own deferred restore) alongside
# the seed restore ran the two restores in the wrong order and leaked the seed --
# e.g. restoring the kind after the seed discards the seed again.
# Folding the version pin into this one, correctly ordered restore point avoids
# that, so the seed never leaks.
igraph_local_seed <- function(
  seed,
  rng_version = NULL,
  # kind/normal.kind/sample.kind mirror set.seed()'s arguments of the same names.
  kind = NULL,
  normal.kind = NULL,
  sample.kind = NULL,
  .local_envir = parent.frame()
) {
  initial_kind <- RNGkind()
  initial_seed <- get0(".Random.seed", envir = globalenv(), inherits = FALSE)
  withr::defer(
    restore_rng_state(initial_kind, initial_seed),
    envir = .local_envir
  )

  if (!is.null(rng_version)) {
    # suppressWarnings: same "non-uniform 'Rounding' sampler used" note as in
    # restore_rng_state() -- RNGversion("3.5.0") selects that older sampler.
    suppressWarnings(RNGversion(rng_version))
  }

  set.seed(
    seed,
    kind = kind,
    normal.kind = normal.kind,
    sample.kind = sample.kind
  )

  # Return the previous seed invisibly, mirroring withr::local_dir()'s
  # and withr::local_locale()'s contract.
  # Interestingly, withr::local_seed() returns the new seed.
  invisible(initial_seed)
}

# Block form of igraph_local_seed(), mirroring withr::with_seed(): set the seed,
# evaluate `code`, then restore the previous global RNG state.
# `code` is a promise forced here -- after the seed is set -- and the seed is
# restored when this function returns, so the seeding is scoped to exactly the
# block.
# Use this (rather than igraph_local_seed) when a single test needs several
# independently seeded blocks with other code between them.
igraph_with_seed <- function(seed, code, rng_version = NULL, ...) {
  igraph_local_seed(seed, rng_version = rng_version, ...)
  code
}

# Restore the global RNG state (kind + .Random.seed) to a previously captured
# snapshot.
# `kind` is the result of RNGkind() and `state` is .Random.seed before the seed
# was set (or NULL if no RNG had been used yet).
# The kind is restored first -- changing the RNG kind discards .Random.seed --
# so that the seed assignment is the final word and the state round-trips exactly.
restore_rng_state <- function(kind, state) {
  # suppressWarnings: restoring an older sampler (e.g. the "Rounding"
  # sample.kind that RNGversion("3.5.0") selects) otherwise emits R's
  # "non-uniform 'Rounding' sampler used" note.
  # We're only putting back a state that was already in effect, so the note is
  # noise.
  suppressWarnings(do.call(RNGkind, as.list(kind)))
  if (is.null(state)) {
    if (exists(".Random.seed", envir = globalenv(), inherits = FALSE)) {
      rm(".Random.seed", envir = globalenv())
    }
  } else {
    assign(".Random.seed", state, envir = globalenv())
  }
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
