# The flavored builds ship this package under a different name,
# and scripts/flavor.patch is what renames it.
# This test fails when the name is hard-coded somewhere the patch does not
# rewrite.
# scripts/flavor-package-name.R explains the rules and holds the scan itself,
# so that it can also run against a plain checkout.
#
# The scan needs the sources and scripts/flavor.patch,
# so it only runs from a checkout.
# `R CMD check` works from a built tarball, which has neither, and skips.

# The package source root, or NA when the sources are not around.
flavor_source_root <- function() {
  root <- normalizePath(test_path("..", ".."), mustWork = FALSE)
  if (file.exists(file.path(root, "scripts", "flavor-package-name.R"))) {
    root
  } else {
    NA_character_
  }
}

test_that("the package name is hard-coded only where scripts/flavor.patch rewrites it", {
  root <- flavor_source_root()
  skip_if(is.na(root), "Not running from the package source tree.")

  source(file.path(root, "scripts", "flavor-package-name.R"), local = TRUE)

  expect_equal(flavor_package_name_offenders(root), character())
})

test_that("the scan finds the package name, but not the S3 class", {
  source_root <- flavor_source_root()
  skip_if(is.na(source_root), "Not running from the package source tree.")

  # The mainline name, assembled from two pieces,
  # so that this file does not trip the scan it tests.
  mainline <- paste0("i", "graph")
  root <- withr::local_tempdir()
  dir.create(file.path(root, "R"))
  dir.create(file.path(root, "src"))
  dir.create(file.path(root, "scripts"))
  dir.create(file.path(root, "tests"))
  writeLines(
    c(
      sprintf('f <- function(x) inherits(x, "%s")', mainline),
      sprintf("g <- function() %s::make_ring(3)", mainline),
      sprintf('h <- function() asNamespace("%s")', mainline),
      sprintf('structure(list(), class = "%s")', mainline),
      sprintf("k <- function() requireNamespace('%s')", mainline)
    ),
    file.path(root, "R", "a.R")
  )
  writeLines(
    c(
      sprintf('SEXP l1 = PROTECT(Rf_install("%s"));', mainline),
      sprintf('rho = R_getRegisteredNamespace("%s");', mainline)
    ),
    file.path(root, "src", "a.c")
  )
  writeLines(
    c("library(testthat)", sprintf("library(%s)", mainline)),
    file.path(root, "tests", "testthat.R")
  )
  # A patch that renames the attach call in tests/testthat.R, and nothing else.
  writeLines(
    c(
      "diff --git a/tests/testthat.R b/tests/testthat.R",
      "--- a/tests/testthat.R",
      "+++ b/tests/testthat.R",
      "@@ -1,2 +1,2 @@",
      " library(testthat)",
      sprintf("-library(%s)", mainline),
      sprintf("+library(%s.1.3)", mainline)
    ),
    file.path(root, "scripts", "flavor.patch")
  )

  source(
    file.path(source_root, "scripts", "flavor-package-name.R"),
    local = TRUE
  )

  expect_equal(
    flavor_package_name_offenders(root),
    c(
      sprintf("R/a.R:2: g <- function() %s::make_ring(3)", mainline),
      sprintf('R/a.R:3: h <- function() asNamespace("%s")', mainline),
      sprintf("R/a.R:5: k <- function() requireNamespace('%s')", mainline),
      sprintf('src/a.c:2: rho = R_getRegisteredNamespace("%s");', mainline)
    )
  )
})

test_that("no file still carries the mainline name that scripts/flavor.patch renames", {
  root <- flavor_source_root()
  skip_if(is.na(root), "Not running from the package source tree.")

  source(file.path(root, "scripts", "flavor-package-name.R"), local = TRUE)

  expect_equal(flavor_unflavored_paths(root), character())
})

test_that("no README tells a reader to install the mainline package", {
  root <- flavor_source_root()
  skip_if(is.na(root), "Not running from the package source tree.")

  source(file.path(root, "scripts", "flavor-package-name.R"), local = TRUE)

  expect_equal(flavor_mainline_readme_offenders(root), character())
})

test_that("scripts/flavor.patch applies to the unflavored tree", {
  root <- flavor_source_root()
  skip_if(is.na(root), "Not running from the package source tree.")

  source(file.path(root, "scripts", "flavor-package-name.R"), local = TRUE)

  expect_equal(flavor_patch_failures(root), character())
})

test_that("both halves of the cpp11 binding carry this flavor's prefix", {
  root <- flavor_source_root()
  skip_if(is.na(root), "Not running from the package source tree.")

  source(file.path(root, "scripts", "flavor-package-name.R"), local = TRUE)

  expect_equal(flavor_binding_prefix_offenders(root), character())
})

test_that("the cpp11 binding prefix follows the flavor's package name", {
  source_root <- flavor_source_root()
  skip_if(is.na(source_root), "Not running from the package source tree.")

  root <- withr::local_tempdir()
  dir.create(file.path(root, "R"))
  writeLines("Package: igraph.2.0.dev", file.path(root, "DESCRIPTION"))
  writeLines(
    c(
      "getsphere <- function() {",
      "  .Call(`_igraph_2_0_dev_getsphere`)",
      "}",
      "igraph_hcass2 <- function() {",
      "  .Call(`_igraph_igraph_hcass2`)",
      "}"
    ),
    file.path(root, "R", "cpp11.R")
  )

  source(
    file.path(source_root, "scripts", "flavor-package-name.R"),
    local = TRUE
  )

  expect_equal(flavor_binding_prefix(root), "_igraph_2_0_dev_")
  expect_equal(
    flavor_binding_prefix_offenders(root),
    "R/cpp11.R:5: .Call(`_igraph_igraph_hcass2`)"
  )
})
