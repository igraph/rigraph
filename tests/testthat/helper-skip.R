# Skip while the vendored igraph C library predates `version`, the engine that
# brings back what the test asks for.
#
# The gate a series puts on a test `main` has where its engine is older than the
# one the test was written against, instead of deleting or rewriting the test:
# it names where the test runs again, so the suite re-arms itself there without
# a restore that a replay could lose
# (.claude/skills/series-loop/SKILL.md, stage 2). One line, inside the
# `test_that()` body, so `scripts/series-tests.sh` can read the version off it.
skip_if_engine_before <- function(version, why) {
  engine <- version_impl()$version_string
  if (engine_before(engine, version)) {
    skip(paste0("Engine ", engine, " predates ", version, ": ", why))
  }
}

# Does `engine` predate `version`?
#
# igraph's CMake writes `git describe --tags` into the version: a release is
# `X.Y.Z`, and `X.Y.Z-N-g<sha>` is N commits past it, so it follows `X.Y.Z` and
# precedes the next release. A string that is not a version predates nothing,
# so a gate that cannot be read lets its test run rather than hiding it.
# `scripts/series-tests.sh` reads gates the same way.
engine_before <- function(engine, version) {
  parse <- function(x) {
    m <- regmatches(
      x,
      regexec("^([0-9]+[.][0-9]+[.][0-9]+)(-([0-9]+)-g[0-9a-f]+)?$", x)
    )[[1]]
    if (length(m) == 0) {
      return(NULL)
    }
    list(
      base = package_version(m[[2]]),
      n = if (nzchar(m[[4]])) as.numeric(m[[4]]) else 0
    )
  }
  e <- parse(engine)
  v <- parse(version)
  if (is.null(e) || is.null(v)) {
    return(FALSE)
  }
  if (e$base != v$base) {
    return(e$base < v$base)
  }
  e$n < v$n
}
