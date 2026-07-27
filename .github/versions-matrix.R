list(
  # Lifecycle-deprecations-as-errors run: tests/testthat/setup-lifecycle.R
  # reacts to IGRAPH_LIFECYCLE_ERRORS=true by failing any test in which an
  # unasserted lifecycle deprecation fires. The flag travels through the
  # generic "env" matrix field, which the rcc-full job applies to the
  # environment of all steps.
  data.frame(
    os = "ubuntu-26.04",
    r = r_versions[[2]],
    env = "IGRAPH_LIFECYCLE_ERRORS=true",
    desc = "with lifecycle errors"
  )
)
