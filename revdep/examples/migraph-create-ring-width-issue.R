# migraph create_ring(width = ) deprecation surfacing as test failure
# Issue: a migraph tutorial test asserts that no code expression emits a
# warning; `migraph::create_ring(32, width = 2)` now emits an igraph
# deprecation warning, breaking the assertion.
#
# Note: create_ring() is migraph's own wrapper; it internally calls into
# igraph and the deprecation originates from there. Without reading the
# migraph source we can't pin down the exact igraph function involved --
# it is most likely a call to a layout/constructor argument that was
# deprecated in a recent igraph release.

# Reproducer requires migraph:
# install.packages("migraph")
# library(migraph)
# w <- NULL
# withCallingHandlers(
#   {
#     rg <- create_ring(32, width = 2)
#   },
#   warning = function(c) { w <<- c; invokeRestart("muffleWarning") }
# )
# w  # On dev igraph: a <lifecycle_warning_deprecated/...> condition
#    # On CRAN igraph 2.3.1: NULL

# Assessment:
# - Bug in migraph -- its create_ring() passes an argument or calls an
#   igraph function whose argument/value is deprecated.
# - The failure is visible only because migraph's tutorial test asserts no
#   warning.

# Recommendation:
# - For migraph: read the warning message produced by
#     create_ring(32, width = 2)
#   under dev igraph to identify the deprecated argument or function it is
#   relaying. Then either switch the internal implementation to the current
#   API, or change how `width = 2` is interpreted to avoid the deprecated
#   path.
# - If the deprecation comes from an igraph constructor used with width-like
#   semantics, the canonical replacement is typically
#     make_lattice(length = N, dim = 1, circular = TRUE, nei = W)
#   for a "thicker ring" of order W.
