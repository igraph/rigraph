# checked neighbors(graph, v, mode) positional deprecation
# Issue: checked:::deduplicate_task_graph() calls
# igraph::neighbors(g, i, "out"), passing `mode` positionally. Since the
# optional arguments moved behind `...`, that call is soft-deprecated and
# warns. checked's tests are snapshot tests, so 315 warnings turn into a
# test failure -- the package itself still works.

library(igraph)

g <- make_ring(4, directed = TRUE)

# Old call -- soft-deprecated for 3.0.0, warns under testthat
neighbors(g, 1, "out")

# Working replacement -- name the argument
neighbors(g, 1, mode = "out")

# Root cause:
# - neighbors() is now neighbors(graph, v, ..., mode = ...); everything after
#   `...` has to be named. The generated argument handler recovers the old
#   positional call and warns through lifecycle::deprecate_soft().
# - deprecate_soft() is quiet in ordinary use and loud where it matters for a
#   maintainer: under testthat, and in code run directly at the prompt. That
#   is why this surfaces as a test failure rather than a user-visible warning.

# Assessment:
# - Not a bug in checked -- the call is correct today and deprecated for
#   3.0.0. It is a one-word fix that also silences the warning for their users.

# Recommendation:
# - For checked: `neighbors(g, i, mode = "out")` in deduplicate_task_graph().
#   The same rule applies to any other igraph call passing an optional
#   argument positionally.
