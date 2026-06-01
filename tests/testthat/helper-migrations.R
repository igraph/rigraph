# Keep the generated argument-migration helpers (R/handle-args-*.R) in sync with
# the registry during development: when tools/migrations.R or the generator is
# newer than the generated files, regenerate them before the tests run.
#
# tools/ is excluded from the built package (.Rbuildignore), so this is a no-op
# under `R CMD check` of the tarball; it only fires from a source checkout
# (devtools::test(), covr). CI additionally guards against committed drift with
# a `git diff` step in the rcc workflow.
local({
  registry <- testthat::test_path("..", "..", "tools", "migrations.R")
  generator <- testthat::test_path("..", "..", "tools", "generate-migrations.R")
  if (!file.exists(registry) || !file.exists(generator)) {
    return(invisible())
  }

  out_dir <- testthat::test_path("..", "..", "R")
  generated <- list.files(
    out_dir,
    pattern = "^handle-args-.*\\.R$",
    full.names = TRUE
  )

  sources_mtime <- max(file.mtime(c(registry, generator)))
  fresh <- length(generated) > 0 && all(file.mtime(generated) >= sources_mtime)
  if (fresh) {
    return(invisible())
  }

  gen_env <- new.env()
  sys.source(generator, envir = gen_env)
  suppressMessages(gen_env$generate_migrations(registry, out_dir))
})
