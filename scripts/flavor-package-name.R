# Guard for the flavor rename.
#
# Every flavor but the mainline one ships this package under a different name:
# `scripts/flavor.sh` applies `scripts/flavor.patch`, which renames `igraph` to
# `igraph.dev`, and so on. See handbook/branches/flavors/README.md.
#
# Every hard-coded `igraph::`, `igraph:::`, `"igraph"`, or `library(igraph)` that
# the patch does not rewrite keeps pointing at the mainline package in those
# builds -- silently, and usually only noticed by a user.
# `flavor_package_name_offenders()` returns every such occurrence, so a new one
# has to be dealt with deliberately:
#
# * in R code, ask for the name at run time with `get_package_name()` or
#   `get_package_env()` (R/package.R);
# * in the C glue, use the namespace `.onLoad()` hands over
#   (`Rx_igraph_set_namespace()` in src/rinterface_extra.c);
# * to reach the package from a subprocess, pass `get_package_name()` in and
#   resolve it there with `asNamespace()`, rather than attaching it by name;
# * in messages and docs, do not qualify our own objects with `igraph::`;
# * if the literal names something else that happens to be spelled the same --
#   the S3 class every graph carries, say -- add its shape to
#   `flavor_legitimate_spellings` below, or write it in two pieces, as
#   `paste0("i", "graph")`, so it reads as what it is;
# * otherwise teach `scripts/flavor.patch` to rewrite it.
#
# The scan covers the R-level surface -- `R/`, `man/`, `tests/`, the vignettes
# R CMD build ships, and `README.md` -- plus the C and C++ glue in `src/`.
# In the glue only the quoted form is checked: `igraph_` there is the C
# library's prefix, which has nothing to do with the R package name.
# Vendored sources under `src/vendor/` and testthat snapshots are left alone.
#
# Base R only, and no reliance on the package being loaded, so that CI can run
# this against a plain checkout (see .github/workflows/custom/after-install).
# `tests/testthat/test-flavor-package-name.R` wraps it for `testthat::test_local()`;
# that test cannot carry the check on its own, because `R CMD check` runs the
# tests from a built tarball, where neither the sources nor this directory
# (`.Rbuildignore`d) exist.

# The lines `scripts/flavor.patch` rewrites, as a list of trimmed source lines keyed
# by the path they are rewritten in. These are exactly the occurrences the flavor
# rename already accounts for.
flavor_patched_lines <- function(patch_file) {
  lines <- readLines(patch_file, warn = FALSE)
  patched <- list()
  path <- NA_character_

  for (line in lines) {
    if (grepl("^diff --git a/", line)) {
      path <- sub("^diff --git a/(.*) b/.*$", "\\1", line)
    } else if (!is.na(path) && grepl("^-", line) && !grepl("^---", line)) {
      patched[[path]] <- c(patched[[path]], trimws(substring(line, 2)))
    }
  }

  patched
}

# Paths under `subdir` matching `pattern`, relative to the package root.
flavor_dir <- function(root, subdir, pattern) {
  file.path(
    subdir,
    dir(file.path(root, subdir), pattern = pattern, recursive = TRUE)
  )
}

# The spellings of `igraph` that do not name the package, as regular
# expressions. A scanned line has every match of these removed before it is
# searched, so a line that also names the package is still caught.
flavor_legitimate_spellings <- c(
  # The S3 class of a graph, which a flavor keeps: graphs move freely between
  # `igraph` and its flavors, and `igraphdata` ships them.
  '(inherits|expect_s3_class)[(][^()]*, *"igraph"[)]',
  'class *= *"igraph"',
  'class[(][^()]*[)] *<- *"igraph"',
  'SET_CLASS[(][^;]*Rf_mkChar[(]"igraph"[)]',
  # The binding in a graph's environment that holds the pointer to the C graph.
  'Rf_install[(]"igraph"[)]',
  # An instruction to install the mainline package from CRAN, which is what
  # the vignettes give: it names that package, not this one.
  "install[.]packages[(][\"']igraph[\"'][)]",
  # The cache of the C manual's link tables (R/roxygen-cdocs.R), which
  # describe the C library and so serve every flavor.
  'R_user_dir[(]"igraph", "cache"[)]'
)

# The files to scan, as paths relative to `root`, each named by the pattern that
# applies to it.
flavor_scanned_files <- function(root) {
  # `vignettes/articles/` is `.Rbuildignore`d: pkgdown renders it for the
  # mainline site, and no flavor ships or builds it.
  vignettes <- flavor_dir(root, "vignettes", "[.]([Rr]|[Rr]md|qmd)$")
  vignettes <- vignettes[
    !startsWith(vignettes, paste0(file.path("vignettes", "articles"), "/"))
  ]

  # `README.md` is the front page GitHub renders for a branch, flavored ones
  # included, and the patch rewrites its install instructions. The other
  # top-level Markdown files are about the mainline package -- its history in
  # `NEWS.md`, how to work on it in `CONTRIBUTING.md` -- and a flavor shares
  # them unchanged.
  readme <- if (file.exists(file.path(root, "README.md"))) "README.md"

  r_level <- c(
    flavor_dir(root, "R", "[.]R$"),
    flavor_dir(root, "man", "[.]Rd$"),
    flavor_dir(root, "tests", "[.]R$"),
    vignettes,
    readme
  )

  glue <- flavor_dir(root, "src", "[.](c|h|cpp|hpp)$")
  # `src/vendor/` holds the vendored C library and its dependencies. They have
  # an upstream of their own and none is renamed by a flavor, so a hit there
  # would be somebody else's spelling of the word.
  glue <- glue[!startsWith(glue, paste0(file.path("src", "vendor"), "/"))]

  # `library(igraph)` and `require(igraph)` name the package without quoting it
  # and without `::`, so the two other patterns walk straight past them. Every
  # other way of naming a package -- `requireNamespace()`, `loadNamespace()`,
  # `::` -- spells it as a string or as a qualifier and is already covered.
  patterns <- c(
    rep(
      "igraph:::?|[\"']igraph[\"']|(library|require)[(]igraph[)]",
      length(r_level)
    ),
    rep('"igraph"', length(glue))
  )
  names(patterns) <- c(r_level, glue)
  patterns
}

# Every hard-coded occurrence of the package name that `scripts/flavor.patch` does
# not rewrite, as `path:line: content` strings. Empty when all is well.
flavor_package_name_offenders <- function(root = ".") {
  patched <- flavor_patched_lines(file.path(root, "scripts", "flavor.patch"))
  scanned <- flavor_scanned_files(root)

  offenders <- character()

  for (i in seq_along(scanned)) {
    path <- names(scanned)[[i]]
    lines <- readLines(file.path(root, path), warn = FALSE)
    stripped <- lines
    for (legitimate in flavor_legitimate_spellings) {
      stripped <- gsub(legitimate, "", stripped)
    }

    for (hit in grep(scanned[[i]], stripped)) {
      line <- trimws(lines[[hit]])
      if (line %in% patched[[path]]) {
        next
      }
      offenders <- c(offenders, paste0(path, ":", hit, ": ", line))
    }
  }

  offenders
}

# The package name DESCRIPTION declares: `igraph` on the mainline flavor, the
# flavor's own name on a series.
flavor_declared_package <- function(root) {
  sub(
    "^Package: +",
    "",
    grep(
      "^Package: ",
      readLines(file.path(root, "DESCRIPTION"), warn = FALSE),
      value = TRUE
    )[[1]]
  )
}

# Every reason `scripts/flavor.patch` would not apply to this checkout, as the
# lines `git apply --check` prints. Empty when the patch applies.
#
# The content scan keys on the lines the patch removes, so it stays green while
# the text *around* a renamed line drifts -- and a hunk whose context has
# drifted no longer applies, which `scripts/flavor.sh` would otherwise discover
# only when the next series is seeded. This is the check that sees it in the
# change that causes it.
#
# Empty on a flavored checkout: the patch has been applied there and is not
# expected to apply again.
flavor_patch_failures <- function(root = ".") {
  if (flavor_declared_package(root) != "igraph") {
    return(character())
  }

  old <- setwd(root)
  on.exit(setwd(old))
  out <- suppressWarnings(system2(
    "git",
    c("apply", "--check", file.path("scripts", "flavor.patch")),
    stdout = TRUE,
    stderr = TRUE
  ))
  status <- attr(out, "status")
  if (is.null(status) || status == 0) {
    character()
  } else {
    as.character(out)
  }
}

# The paths `scripts/flavor.patch` renames, as mainline names relative to the
# package root. A file the patch renames carries the package name in its *name*
# rather than in its contents, so the scan above cannot see it.
flavor_renamed_paths <- function(patch_file) {
  lines <- readLines(patch_file, warn = FALSE)
  sub("^rename from ", "", lines[grepl("^rename from ", lines)])
}

# Every file that still carries the mainline name on a flavored checkout.
#
# `scripts/flavor.patch` renames these, and it runs once, when a series is
# seeded. A commit that adds such a file on `main` and is then ported onto a
# flavored series (.claude/skills/series-loop/SKILL.md stage 4) brings the mainline
# name with it, and nothing rewrites it afterwards. The file is then simply not
# read: `src/igraph-win.def` on an `igraph.dev` build is not the export list R's
# `share/make/winshlib.mk` looks for, so the Windows link falls back to
# exporting every symbol of every object; `src/igraph_types.hpp` is not the
# header `cpp11::cpp_register()` includes for `igraph.dev`.
#
# Empty on the mainline flavor, where the mainline name is the right one.
flavor_unflavored_paths <- function(root = ".") {
  package <- flavor_declared_package(root)
  if (package == "igraph") {
    return(character())
  }

  renamed <- flavor_renamed_paths(file.path(root, "scripts", "flavor.patch"))
  renamed[file.exists(file.path(root, renamed))]
}

# The READMEs a flavored checkout must not leave pointing at the mainline
# package, as paths relative to the package root.
flavor_readmes <- "README.md"

# Every place a README still tells a reader to install the mainline package, on
# a checkout that is not the mainline flavor.
#
# `scripts/flavor.sh` rewrites the install instructions once, when the series
# is seeded. After that `README.md` is an ordinary tracked file, and a `main`
# commit touching it is cherry-picked onto the series whole
# (.claude/skills/series-loop/SKILL.md stage 4), which lands mainline text on a
# flavored branch. `README.md` is the front page GitHub renders, so the first
# thing a reader is told there is to install a package these sources do not
# build.
#
# The content scan cannot see this: the mainline install calls are exactly the
# lines the patch removes, so it reads them as accounted for wherever they are.
#
# Only the install calls are checked, and only against the mainline name: the
# README also mentions `igraph/rigraph` and the igraph project itself, neither
# of which the rename touches.
#
# Empty on the mainline flavor, where the mainline name is the right one.
flavor_mainline_readme_offenders <- function(root = ".") {
  package <- flavor_declared_package(root)
  if (package == "igraph") {
    return(character())
  }

  offenders <- character()

  for (path in flavor_readmes) {
    file <- file.path(root, path)
    if (!file.exists(file)) {
      next
    }
    lines <- readLines(file, warn = FALSE)

    for (hit in grep("install\\.packages\\([\"']igraph[\"']", lines)) {
      offenders <- c(
        offenders,
        paste0(path, ":", hit, ": ", trimws(lines[[hit]]))
      )
    }
  }

  offenders
}

# The two halves of the cpp11 binding, and the one flavored name they have to
# agree on.
flavor_binding_files <- c("R/cpp11.R", "src/cpp11.cpp")

# The `.Call()` prefix cpp11 derives from `Package:`, with every dot replaced:
# `igraph` gives `_igraph_`, `igraph.dev` gives `_igraph_dev_`.
flavor_binding_prefix <- function(root) {
  paste0("_", gsub(".", "_", flavor_declared_package(root), fixed = TRUE), "_")
}

# Every entry point in `R/cpp11.R` whose `.Call()` name does not carry this
# flavor's prefix, as `path:line: source`. Empty when the two halves agree.
#
# `cpp11::cpp_register()` writes both halves from `Package:`, so they agree
# whenever the binding was generated here. They come apart when a commit of
# `main` that adds a `[[cpp11::register]]` entry point is cherry-picked onto a
# flavored series (.claude/skills/series-loop/SKILL.md stage 4): the hunk in
# `src/cpp11.cpp` conflicts, because its context carries the flavored prefix,
# and gets resolved -- while the hunk in `R/cpp11.R` applies cleanly and keeps
# `main`'s unflavored name. The commit then installs and fails every test that
# calls the entry point with `object '_igraph_<name>' not found`, which names
# neither the flavor nor the port. Regenerating the binding is the fix.
#
# Only the cpp11 entry points carry the prefix. The hand-written `R_igraph_*`
# and `Rx_igraph_*` routines are registered under their own names, which a
# flavor does not change.
flavor_binding_prefix_offenders <- function(root = ".") {
  prefix <- flavor_binding_prefix(root)
  path <- "R/cpp11.R"
  file <- file.path(root, path)
  if (!file.exists(file)) {
    return(character())
  }

  lines <- readLines(file, warn = FALSE)
  hits <- grep("\\.Call\\(`[^`]+`", lines)
  names <- sub("^.*\\.Call\\(`([^`]+)`.*$", "\\1", lines[hits])
  bad <- hits[!startsWith(names, prefix)]
  if (length(bad) == 0) {
    return(character())
  }

  paste0(path, ":", bad, ": ", trimws(lines[bad]))
}
