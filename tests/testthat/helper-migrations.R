# Keep the in-place ARG_HANDLE blocks in sync with the registry during
# development: regenerate them before the tests run so editing tools/migrations.R
# and re-running the tests refreshes the spliced code.
#
# tools/ is excluded from the built package (.Rbuildignore), so this is a no-op
# under `R CMD check` of the tarball; it only fires from a source checkout
# (devtools::test(), covr). The generator only rewrites a file when its block
# actually changes, so a clean tree stays clean. CI additionally guards against
# committed drift (see .github/workflows/custom/before-install).
local({
  registry <- testthat::test_path("..", "..", "tools", "migrations.R")
  generator <- testthat::test_path("..", "..", "tools", "generate-migrations.R")
  if (!file.exists(registry) || !file.exists(generator)) {
    return(invisible())
  }
  src_dir <- testthat::test_path("..", "..", "R")

  gen_env <- new.env()
  sys.source(generator, envir = gen_env)
  suppressMessages(gen_env$generate_migrations(registry, src_dir))
})
