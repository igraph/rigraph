# Shared helpers for the revdep2 workflow scripts.
# Sourced by plan.R, build.R, shard.R and collect.R; base R plus jsonlite only,
# so every job can use it before any heavyweight dependency is installed.

# ------------------------------------------------------------- environment --

`%||%` <- function(x, y) if (is.null(x)) y else x

env_chr <- function(name, default = "") {
  value <- Sys.getenv(name, unset = "")
  if (identical(value, "")) default else value
}

env_num <- function(name, default) {
  value <- suppressWarnings(as.numeric(env_chr(name)))
  if (length(value) != 1 || is.na(value)) default else value
}

env_flag <- function(name) {
  tolower(env_chr(name)) %in% c("1", "true", "yes")
}

inform <- function(...) {
  message(paste0(...))
}

now_utc <- function() {
  format(Sys.time(), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
}

# ------------------------------------------------------------------- JSON ----

write_json <- function(x, path) {
  jsonlite::write_json(x, path, auto_unbox = TRUE, digits = NA, null = "null")
}

read_json <- function(path, simplify = FALSE) {
  jsonlite::read_json(path, simplifyVector = simplify)
}

# --------------------------------------------------------- GitHub plumbing ----

# Append `name=value` to the job's outputs. Values must be single-line.
set_output <- function(name, value) {
  path <- Sys.getenv("GITHUB_OUTPUT")
  if (nzchar(path)) {
    cat(sprintf("%s=%s\n", name, value), file = path, append = TRUE)
  } else {
    inform("[output] ", name, "=", value)
  }
}

# Append markdown lines to the job summary, or echo them locally.
append_summary <- function(lines) {
  path <- Sys.getenv("GITHUB_STEP_SUMMARY")
  if (nzchar(path)) {
    cat(lines, file = path, sep = "\n", append = TRUE)
    cat("\n", file = path, append = TRUE)
  } else {
    cat(lines, sep = "\n")
    cat("\n")
  }
}

# A minimal pipe table so summaries do not need knitr.
md_table <- function(df) {
  esc <- function(x) gsub("|", "\\|", as.character(x), fixed = TRUE)
  header <- paste0("| ", paste(esc(names(df)), collapse = " | "), " |")
  rule <- paste0("|", paste(rep(" --- ", ncol(df)), collapse = "|"), "|")
  rows <- vapply(
    seq_len(nrow(df)),
    function(i) {
      paste0("| ", paste(esc(unlist(df[i, ])), collapse = " | "), " |")
    },
    character(1)
  )
  c(header, rule, rows)
}

# Strip ANSI escapes and carriage returns before quoting logs into markdown.
sanitize_log <- function(lines) {
  lines <- gsub("\r", "", lines, fixed = TRUE)
  gsub("\033\\[[0-9;?]*[a-zA-Z]", "", lines)
}

# Fence log text so that embedded triple backticks cannot break the summary.
md_details <- function(title, lines, max_lines = 80) {
  lines <- sanitize_log(lines)
  omitted <- character()
  if (length(lines) > max_lines) {
    omitted <- sprintf(
      "... (%d earlier lines omitted)",
      length(lines) - max_lines
    )
    lines <- utils::tail(lines, max_lines)
  }
  c(
    sprintf("<details><summary>%s</summary>", title),
    "",
    "````text",
    omitted,
    lines,
    "````",
    "",
    "</details>",
    ""
  )
}

# --------------------------------------------------------- gh and artifacts --

# The plan resolves donor runs through the API, and the preflight and the
# shards fetch artifacts off them. Everything here is an optimization: a
# missing gh, a token without `actions: read`, an expired artifact, a network
# hiccup -- all of them have to end as "reuse nothing", never as a failure.

gh_repo <- function() {
  env_chr("GITHUB_REPOSITORY")
}

gh_ok <- function() {
  nzchar(Sys.which("gh")) &&
    nzchar(env_chr("GH_TOKEN", env_chr("GITHUB_TOKEN")))
}

# `gh`, with its arguments quoted for the shell: system2() quotes the command
# but hands the arguments to `sh` as written, and these carry `?`, `&`, `|`,
# quotes and spaces. Unquoted, an API path ends at its first `&`, and what
# follows becomes a second command the shell cannot find.
#
# Every failure becomes NULL, including the ones system2() raises instead of
# returning: a command the shell cannot run exits 127, which `stdout = TRUE`
# turns into an R error rather than a status.
gh_lines <- function(...) {
  out <- tryCatch(
    suppressWarnings(
      system2("gh", shQuote(c(...)), stdout = TRUE, stderr = NULL)
    ),
    error = function(e) NULL
  )
  status <- attr(out, "status")
  if (is.null(out) || (!is.null(status) && status != 0)) NULL else out
}

# The unexpired artifacts of one run, as a named character vector of ids;
# empty when the run has none or when gh cannot say. One API call per run, so
# a walk over the run history calls this once per run and asks it everything.
run_artifacts <- function(run_id) {
  if (!gh_ok() || !nzchar(gh_repo())) {
    return(character())
  }
  out <- gh_lines(
    "api",
    sprintf(
      "repos/%s/actions/runs/%s/artifacts?per_page=100",
      gh_repo(),
      run_id
    ),
    "--jq",
    ".artifacts[] | select(.expired == false) | [.name, .id] | @tsv"
  )
  out <- out[nzchar(out)]
  if (length(out) == 0) {
    return(character())
  }
  parts <- strsplit(out, "\t", fixed = TRUE)
  stats::setNames(
    vapply(parts, function(p) p[[2]], character(1)),
    vapply(parts, function(p) p[[1]], character(1))
  )
}

# utils::unzip() refuses archives above 4 GB, which a library artifact reaches
# without trying; the system unzip has no such limit, so prefer it and keep
# the internal one for a runner without it.
unzip_into <- function(zip, dest) {
  dir.create(dest, recursive = TRUE, showWarnings = FALSE)
  if (nzchar(Sys.which("unzip"))) {
    status <- tryCatch(
      suppressWarnings(
        # Quoted: system2() quotes the command, but not the arguments.
        system2(
          "unzip",
          shQuote(c("-q", "-o", zip, "-d", dest)),
          stdout = NULL,
          stderr = NULL
        )
      ),
      error = function(e) 1L
    )
    return(identical(as.integer(status), 0L))
  }
  # A gh that wrote an error body instead of the artifact leaves something
  # that is not a zip; that is a missing artifact, not a usable one.
  extracted <- tryCatch(
    suppressWarnings(utils::unzip(zip, exdir = dest)),
    error = function(e) character()
  )
  length(extracted) > 0
}

# Download one artifact by id into a directory; NULL when it cannot be had.
fetch_artifact_id <- function(id, dest) {
  if (!gh_ok() || !nzchar(gh_repo())) {
    return(NULL)
  }
  zip <- tempfile(fileext = ".zip")
  # Quoted: system2() quotes the command, but not the arguments.
  args <- shQuote(c("api", sprintf("repos/%s/actions/artifacts/%s/zip", gh_repo(), id)))
  status <- tryCatch(
    suppressWarnings(system2("gh", args, stdout = zip, stderr = NULL)),
    error = function(e) 1L
  )
  if (!identical(as.integer(status), 0L) || !file.exists(zip)) {
    unlink(zip)
    return(NULL)
  }
  ok <- unzip_into(zip, dest)
  unlink(zip)
  if (ok) dest else NULL
}

# Fetch one named artifact of one run; NULL when the run does not have it, it
# has expired, or it cannot be downloaded.
fetch_artifact <- function(run_id, name, dest) {
  ids <- run_artifacts(run_id)
  id <- unname(ids[names(ids) == name])
  if (length(id) == 0) {
    return(NULL)
  }
  fetch_artifact_id(id[[1]], dest)
}

# ------------------------------------------------------ prebuilt libraries --

# A run's installed dependency library, carried to the next run as an
# artifact: one tar of the package directories, plus the index a later plan
# reads to decide which packages that run is good for.
#
# The tar is stored uncompressed on purpose -- upload-artifact zips what it
# uploads, and deflating a few gigabytes twice buys nothing. Packing the
# directories by name (rather than the library itself) keeps the member paths
# at `<package>/...`, which is what a partial extraction asks for.

# Package directories of `lib` that look installed, with their versions.
library_versions <- function(lib) {
  pkgs <- list.dirs(lib, full.names = FALSE, recursive = FALSE)
  pkgs <- pkgs[file.exists(file.path(lib, pkgs, "DESCRIPTION"))]
  versions <- vapply(
    pkgs,
    function(p) {
      tryCatch(
        unname(read.dcf(file.path(lib, p, "DESCRIPTION"), "Version")[1, 1]),
        error = function(e) NA_character_
      )
    },
    character(1)
  )
  versions[!is.na(versions)]
}

pack_library <- function(lib, dest, index_dest = NULL) {
  versions <- library_versions(lib)
  dir.create(dest, recursive = TRUE, showWarnings = FALSE)
  index <- list(
    run_id = env_chr("GITHUB_RUN_ID"),
    created_at = now_utc(),
    r_version = paste(
      R.version$major,
      sub("[.].*$", "", R.version$minor),
      sep = "."
    ),
    platform = R.version$platform,
    count = length(versions),
    packages = unname(Map(
      function(p, v) list(package = p, version = unname(v)),
      names(versions),
      versions
    ))
  )
  write_json(index, file.path(dest, "lib.json"))
  if (!is.null(index_dest)) {
    dir.create(index_dest, recursive = TRUE, showWarnings = FALSE)
    file.copy(
      file.path(dest, "lib.json"),
      file.path(index_dest, "lib.json"),
      overwrite = TRUE
    )
  }
  if (length(versions) == 0) {
    inform("Nothing to pack: ", lib, " holds no installed packages")
    return(character())
  }
  members <- tempfile("members-")
  writeLines(names(versions), members)
  on.exit(unlink(members))
  tarball <- file.path(dest, "library.tar")
  status <- system2(
    "tar",
    # Quoted: system2() quotes the command, but not the arguments.
    shQuote(c("-cf", tarball, "-C", lib, "-T", members))
  )
  if (!identical(as.integer(status), 0L) || !file.exists(tarball)) {
    inform("Packing ", lib, " failed; this run contributes no prebuilt library")
    unlink(tarball)
    return(character())
  }
  inform(
    "Packed ",
    length(versions),
    " package(s) into ",
    basename(tarball),
    " (",
    format(
      structure(file.size(tarball), class = "object_size"),
      units = "auto"
    ),
    ")"
  )
  names(versions)
}

# Unpack what earlier runs already built into `lib`, taking only the packages
# in `wanted` that are not there yet.
#
# The plan named the donor runs, youngest first, and which packages each one
# is good for; a younger donor always wins, and a donor that has nothing left
# to give is never downloaded. Whatever lands here is still handed to pak
# afterwards: the point is to skip *building* what has not changed, not to
# skip resolving it.
restore_prebuilt <- function(plan, lib, wanted) {
  donors <- plan$prebuilt$runs %||% list()
  wanted <- unique(unlist(wanted, use.names = FALSE))
  if (length(donors) == 0 || length(wanted) == 0) {
    return(character())
  }
  dir.create(lib, recursive = TRUE, showWarnings = FALSE)
  present <- function() {
    list.dirs(lib, full.names = FALSE, recursive = FALSE)
  }
  restored <- character()
  for (donor in donors) {
    run_id <- as.character(donor$run_id)
    # Whatever is in the library already stays, and so does anything this
    # session has loaded: a package must never be overwritten underneath the
    # driver that is using it. A younger donor has priority over an older one.
    take <- setdiff(
      intersect(unlist(donor$packages, use.names = FALSE), wanted),
      c(present(), loadedNamespaces())
    )
    if (length(take) == 0) {
      next
    }
    inform("Prebuilt: fetching ", length(take), " package(s) from run ", run_id)
    dir <- fetch_artifact(run_id, "revdep2-lib", tempfile("prebuilt-"))
    tarball <- if (is.null(dir)) NULL else file.path(dir, "library.tar")
    if (is.null(tarball) || !file.exists(tarball)) {
      inform("Prebuilt: run ", run_id, " no longer has a library artifact")
      unlink(dir, recursive = TRUE)
      next
    }
    members <- tempfile("members-")
    writeLines(take, members)
    # A member the index promised but the tar does not hold makes tar exit
    # non-zero after extracting the rest; what actually landed is the answer,
    # so the status is not consulted.
    system2(
      "tar",
      # Quoted: system2() quotes the command, but not the arguments.
      shQuote(c("-xf", tarball, "-C", lib, "-T", members)),
      stdout = NULL,
      stderr = NULL
    )
    unlink(c(dir, members), recursive = TRUE)
    got <- intersect(take, present())
    restored <- c(restored, got)
    inform("Prebuilt: restored ", length(got), " package(s) from run ", run_id)
  }
  # A half-extracted package directory is worse than none: drop anything
  # without a DESCRIPTION and let pak install it properly.
  broken <- restored[!file.exists(file.path(lib, restored, "DESCRIPTION"))]
  if (length(broken) > 0) {
    unlink(file.path(lib, broken), recursive = TRUE)
    inform("Prebuilt: discarded ", length(broken), " incomplete package(s)")
  }
  setdiff(restored, broken)
}

# ------------------------------------------------------------ CRAN metadata --

cran_repo <- function() {
  env_chr("REVDEP2_CRAN_MIRROR", "https://cloud.r-project.org")
}

# available.packages() for the canonical CRAN mirror, fetched once.
cran_db <- local({
  db <- NULL
  function() {
    if (is.null(db)) {
      inform("Fetching CRAN package metadata from ", cran_repo())
      db <<- utils::available.packages(
        repos = cran_repo(),
        filters = c("CRAN", "duplicates")
      )
    }
    db
  }
})

base_packages <- function() {
  rownames(utils::installed.packages(priority = c("base", "recommended")))
}

# The packages that must be installed to check `packages`: their hard
# dependencies and direct suggests, plus the recursive hard dependencies of
# all of those. One list per element of `packages`.
install_closure <- function(packages, db) {
  direct <- tools::package_dependencies(packages, db = db, which = "most")
  pool <- unique(unlist(direct, use.names = FALSE))
  pool <- intersect(pool, rownames(db))
  recursive <- tools::package_dependencies(
    pool,
    db = db,
    which = "strong",
    recursive = TRUE
  )
  lapply(direct, function(deps) {
    deps <- intersect(deps, rownames(db))
    full <- unique(c(deps, unlist(recursive[deps], use.names = FALSE)))
    sort(setdiff(intersect(full, rownames(db)), base_packages()))
  })
}

# Fingerprint of the *versions* of everything a check installs, from CRAN
# metadata. Two runs whose fingerprints agree resolved the same dependency
# tree, so an old-version check result can be carried from one to the other.
dep_fingerprint <- function(deps, db) {
  if (length(deps) == 0) {
    return("empty")
  }
  lines <- sort(paste(deps, db[deps, "Version"]))
  path <- tempfile("fingerprint-")
  on.exit(unlink(path))
  writeLines(lines, path)
  unname(tools::md5sum(path))
}

# ------------------------------------------------------------ result labels --

# Collapse an rcmdcheck comparison (or a failure shim) into the one word the
# manifest, the collector and the retry selection agree on.
#   ok           -- no new problems
#   newly_broken -- the dev version introduces problems the CRAN version lacks
#   failed       -- the check could not run to a comparable end (install
#                   failure, timeout, error before/around the check)
#   depfail      -- dependencies could not be installed, check not attempted
#   deferred     -- shard deadline hit before this package was checked
#   error        -- the shard driver itself broke on this package
classify_status <- function(status, new_issues) {
  if (status %in% c("+", "-")) {
    if (identical(status, "-") && new_issues > 0) "newly_broken" else "ok"
  } else {
    "failed"
  }
}

needs_recheck <- function(result) {
  !(result %in% c("ok"))
}
