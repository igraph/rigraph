# Make snapshot output independent of the package name.
#
# Every flavor but the mainline one ships under a different name,
# `igraph.dev` and so on (scripts/flavor.sh),
# and whatever names the package at run time carries that name into its output:
# lifecycle says a function "was deprecated in igraph.dev 2.1.0",
# and rlang reports an internal error "detected in the igraph.dev package".
#
# `scripts/flavor.patch` deliberately does not rewrite `tests/testthat/_snaps/`,
# so a snapshot recorded on one flavor can never match another.
# Rewriting the recorded output instead would still leave the file wrong for
# whichever flavor recorded it.
# So the tests change, and only for the flavor:
# the snapshots whose output names the package normalize it at capture time,
# by going through `expect_snapshot_igraph()` or `expect_snapshot_igraph_error()`
# (helper.R), which apply `transform_package_name()`.
# It replaces the running package's name with the mainline one,
# so every flavor records the same text, which the mainline records as before.
#
# The mainline name is assembled from two pieces on purpose.
# Spelled out, it would be an offender for scripts/flavor-package-name.R,
# and rewriting it is exactly what must not happen here:
# this literal is the normalization target, not a reference to the package.
transform_package_name <- function(x) {
  mainline <- paste0("i", "graph")
  name <- get_package_name()
  if (identical(name, mainline)) {
    return(x)
  }
  gsub(name, mainline, x, fixed = TRUE)
}
