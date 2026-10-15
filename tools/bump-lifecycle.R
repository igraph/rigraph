library(treesitter)
library(treesitter.r)

# --- Reset to baseline (undo any previous partial run) ---
# .claude/settings.local.json is untracked, so git reset --hard leaves it alone.
# This script is tracked, so we save and restore it across the reset.
local({
  baseline <- "fb68fc60b2e673a2994885ed454dbbaca709096c"
  script_path <- here::here("tools", "bump-lifecycle.R")
  saved <- readLines(script_path, warn = FALSE)
  cli::cli_alert_info("Resetting to {substr(baseline, 1L, 7L)} ...")
  system2("git", c("-C", here::here(), "reset", "--hard", baseline))
  writeLines(saved, script_path)
  cli::cli_alert_success("Restored tools/bump-lifecycle.R")
})

lang <- treesitter.r::language()

# deprecate_soft / deprecate_warn / deprecate_stop are all 14 chars — same length,
# so substr<-() replacement never shifts line/column positions.
next_level <- c(
  deprecate_soft = "deprecate_warn",
  deprecate_warn = "deprecate_stop"
)

# Uncomment to inspect node types for a sample expression:
# text <- 'lifecycle::deprecate_soft("1.0.0", "foo()")'
# node_show_s_expression(tree_root_node(parser_parse(parser(lang), text)))

# --- tree navigation helpers ---

fn_to_call <- function(fn_node) {
  # "deprecate_X" identifier -> namespace_operator -> call
  node_parent(node_parent(fn_node))
}

# A pure shim is a function whose body contains exactly one statement: the deprecate_stop() call.
is_pure_shim <- function(fn_node) {
  call_node <- fn_to_call(fn_node)
  body_node <- node_parent(call_node) # braced_expression (the { } body)
  fn_def_node <- node_parent(body_node) # function_definition
  asgn_node <- node_parent(fn_def_node) # binary_operator (<-)

  if (node_type(fn_def_node) != "function_definition") {
    return(FALSE)
  }
  if (node_type(asgn_node) != "binary_operator") {
    return(FALSE)
  }
  length(node_named_children(body_node)) == 1L
}

get_asgn_node <- function(fn_node) {
  node_parent(node_parent(node_parent(fn_to_call(fn_node))))
}

get_fn_name <- function(fn_node) {
  node_text(node_named_children(get_asgn_node(fn_node))[[1L]])
}

# Returns TRUE if fn_name appears as an identifier in any R file other than current_path.
# Used to protect shims that are still referenced internally.
is_referenced_elsewhere <- function(fn_name, current_path) {
  escaped <- gsub("([.^$|*+?(){}\\[\\]])", "\\\\\\1", fn_name)
  pattern <- paste0("(?<![A-Za-z0-9._])", escaped, "(?![A-Za-z0-9._])")
  other_files <- setdiff(r_files, current_path)
  any(vapply(
    other_files,
    function(f) {
      any(grepl(pattern, readLines(f, warn = FALSE), perl = TRUE))
    },
    logical(1)
  ))
}

# Scan backwards from first_fn_line (1-indexed) past blank lines and roxygen #' lines.
preceding_doc_range <- function(lines, first_fn_line) {
  i <- first_fn_line - 1L
  while (i >= 1L && grepl("^\\s*(#'.*)?$", lines[i])) {
    i <- i - 1L
  }
  if (i + 1L > first_fn_line - 1L) {
    integer(0L)
  } else {
    seq(i + 1L, first_fn_line - 1L)
  }
}

# --- test helpers ---

# Add `error = TRUE` to the expect_snapshot() call at row_1indexed in test_file.
add_error_true <- function(test_file, row_1indexed) {
  if (!file.exists(test_file)) {
    return(invisible(FALSE))
  }
  lines <- readLines(test_file, warn = FALSE)
  text <- paste(lines, collapse = "\n")
  root <- tree_root_node(parser_parse(parser(lang), text))

  q <- query(
    lang,
    '(call function: (identifier) @fn (#eq? @fn "expect_snapshot"))'
  )
  caps <- query_captures(q, root)
  fn_nodes <- caps$node[caps$name == "fn"]

  for (fn in fn_nodes) {
    if (point_row(node_start_point(fn)) + 1L != row_1indexed) {
      next
    }

    call_node <- node_parent(fn)
    args_node <- Filter(
      \(n) node_type(n) == "arguments",
      node_children(call_node)
    )
    if (length(args_node) == 0L) {
      next
    }
    args_node <- args_node[[1L]]

    if (grepl("error\\s*=\\s*TRUE", node_text(args_node))) {
      return(invisible(FALSE))
    }

    # Insert `error = TRUE, ` right after the opening `(`
    open_row <- point_row(node_start_point(args_node)) + 1L
    open_col <- point_column(node_start_point(args_node)) + 1L
    line <- lines[open_row]
    lines[open_row] <- paste0(
      substr(line, 1L, open_col),
      "error = TRUE, ",
      substr(line, open_col + 1L, nchar(line))
    )
    writeLines(lines, test_file)
    return(invisible(TRUE))
  }
  invisible(FALSE)
}

# Patch expect_snapshot() calls for lifecycle errors found by run_one().
# failures: list of {msg, src_file, line} returned from the callr subprocess.
fix_lifecycle_snapshot_failures <- function(failures, root) {
  fixed <- FALSE
  for (f in failures) {
    if (!grepl("lifecycle_error_deprecated|defunctError|defunct", f$msg)) {
      next
    }
    src_file <- f$src_file
    line <- f$line
    if (is.null(src_file) || is.null(line) || is.na(line)) {
      next
    }
    file_path <- if (file.exists(src_file)) {
      src_file
    } else {
      file.path(root, "tests", "testthat", basename(src_file))
    }
    if (!file.exists(file_path)) {
      next
    }
    if (add_error_true(file_path, line)) fixed <- TRUE
  }
  fixed
}

# --- test runner ---

# Accumulates {commit, tests} pairs for changes that left tests failing.
unresolved_failures <- list()
n_commits <- 0L

# Returns character vector of still-failing test names (empty if all pass).
run_tests <- function(path) {
  src_name <- fs::path_ext_remove(fs::path_file(path))
  test_file <- here::here("tests", "testthat", paste0("test-", src_name, ".R"))
  if (!file.exists(test_file)) {
    return(character(0))
  }

  root <- here::here()

  # Each call runs in a fresh subprocess — no memory accumulation in the main session.
  run_one <- function(update_snapshots = FALSE) {
    callr::r(
      function(root, src_name, update_snapshots) {
        if (update_snapshots) {
          options(testthat.snapshot.update = TRUE)
        }
        result <- testthat::test_local(
          root,
          filter = src_name,
          stop_on_failure = FALSE,
          reporter = "minimal"
        )
        df <- as.data.frame(result)
        failures <- list()
        for (fr in result) {
          for (exp in fr) {
            if (!inherits(exp, c("expectation_failure", "expectation_error"))) {
              next
            }
            msg <- tryCatch(conditionMessage(exp), error = function(e) "")
            srcref <- tryCatch(exp$srcref, error = function(e) NULL)
            src_file <- tryCatch(
              attr(srcref, "srcfile")$filename,
              error = function(e) NULL
            )
            line <- tryCatch(as.integer(srcref)[1L], error = function(e) {
              NA_integer_
            })
            failures[[length(failures) + 1L]] <- list(
              msg = msg,
              src_file = src_file,
              line = line
            )
          }
        }
        list(
          n_fail = sum(df$failed, na.rm = TRUE) + sum(df$error, na.rm = TRUE),
          bad_tests = df$test[df$failed + df$error > 0L],
          failures = failures
        )
      },
      args = list(
        root = root,
        src_name = src_name,
        update_snapshots = update_snapshots
      )
    )
  }

  out <- run_one()

  if (out$n_fail > 0L && fix_lifecycle_snapshot_failures(out$failures, root)) {
    out <- run_one()
  }

  if (out$n_fail > 0L) {
    out <- run_one(update_snapshots = TRUE)
    if (out$n_fail > 0L) {
      bad <- out$bad_tests
      cli::cli_alert_warning(
        "{out$n_fail} test(s) still failing after snapshot update (need manual fixes): {paste(bad, collapse = ', ')}"
      )
      return(bad)
    }
  }

  character(0)
}

commit_change <- function(path, msg) {
  bad <- run_tests(path)
  if (length(bad) > 0L) {
    unresolved_failures[[length(unresolved_failures) + 1L]] <<- list(
      commit = msg,
      tests = bad
    )
  }
  gert::git_add(fs::path_rel(path, here::here()))
  # Stage any modified test or snapshot files produced during the test run
  status <- gert::git_status()
  extra <- status$file[startsWith(status$file, "tests/") & !status$staged]
  if (length(extra) > 0L) {
    gert::git_add(extra)
  }
  gert::git_commit(msg)
  n_commits <<- n_commits + 1L
}

write_unresolved_report <- function() {
  if (length(unresolved_failures) == 0L) {
    return(invisible(NULL))
  }
  out <- here::here("lifecycle-TODO.md")
  lines <- c(
    "# lifecycle bump — unresolved test failures",
    "",
    paste0(
      "These commits were made but left tests failing that need manual fixes ",
      "(tests call deprecated functions expecting a result, not an error):"
    ),
    ""
  )
  for (item in unresolved_failures) {
    lines <- c(
      lines,
      paste0("## `", item$commit, "`"),
      "",
      paste0("- ", item$tests),
      ""
    )
  }
  writeLines(lines, out)
  cli::cli_alert_warning(
    "Wrote {length(unresolved_failures)} unresolved item(s) to lifecycle-TODO.md"
  )
}

# --- queries ---

bump_query <- query(
  lang,
  '
  (call
    function: (namespace_operator
      lhs: (identifier) @ns
      rhs: (identifier) @fn)
    arguments: (arguments
      (argument)
      (argument value: (string content: (string_content) @what)))
    (#eq? @ns "lifecycle")
    (#match? @fn "^deprecate_(soft|warn)$"))
'
)

stop_query <- query(
  lang,
  '
  (call
    function: (namespace_operator
      lhs: (identifier) @ns
      rhs: (identifier) @fn)
    arguments: (arguments
      (argument)
      (argument value: (string content: (string_content) @what)))
    (#eq? @ns "lifecycle")
    (#eq? @fn "deprecate_stop"))
'
)

# --- per-file processing ---

process_file <- function(path) {
  # ---- 1. BUMP: deprecate_soft -> deprecate_warn, deprecate_warn -> deprecate_stop ----

  lines <- readLines(path, warn = FALSE)
  root <- tree_root_node(parser_parse(
    parser(lang),
    paste(lines, collapse = "\n")
  ))
  matches <- query_matches(bump_query, root)[[1]]

  if (length(matches) > 0L) {
    fn_nodes <- lapply(matches, \(m) m$node[m$name == "fn"][[1]])
    what_nodes <- lapply(matches, \(m) m$node[m$name == "what"][[1]])
    rows <- vapply(fn_nodes, \(n) point_row(node_start_point(n)), numeric(1))
    cols <- vapply(fn_nodes, \(n) point_column(node_start_point(n)), numeric(1))
    old_names <- vapply(fn_nodes, node_text, character(1))
    whats <- vapply(what_nodes, node_text, character(1))

    # Calls with >2 args produce a duplicate match for the same @fn node.
    # Keep only the first occurrence (args 1+2 = version+what).
    dups <- duplicated(paste(rows, cols, sep = ":"))
    fn_nodes <- fn_nodes[!dups]
    what_nodes <- what_nodes[!dups]
    rows <- rows[!dups]
    cols <- cols[!dups]
    old_names <- old_names[!dups]
    whats <- whats[!dups]

    for (i in order(rows, decreasing = TRUE)) {
      r <- rows[i] + 1L
      c <- cols[i] + 1L
      new_name <- next_level[[old_names[i]]]
      substr(lines[r], c, c + 13L) <- new_name
      writeLines(lines, path)
      msg <- sprintf(
        "feat!: bump %s from %s to %s",
        whats[i],
        old_names[i],
        new_name
      )
      commit_change(path, msg)
    }
  }

  # ---- 2. REMOVE: pure deprecate_stop shim functions ----

  # Re-parse after bumps (newly-bumped deprecate_stop shims are included here).
  lines <- readLines(path, warn = FALSE)
  root <- tree_root_node(parser_parse(
    parser(lang),
    paste(lines, collapse = "\n")
  ))
  stop_matches <- query_matches(stop_query, root)[[1]]
  fn_nodes <- lapply(stop_matches, \(m) m$node[m$name == "fn"][[1]])
  what_nodes <- lapply(stop_matches, \(m) m$node[m$name == "what"][[1]])

  # Same deduplication: calls with a third argument (e.g. `with`) match twice.
  if (length(fn_nodes) > 0L) {
    stop_rows <- vapply(
      fn_nodes,
      \(n) point_row(node_start_point(n)),
      numeric(1)
    )
    stop_cols <- vapply(
      fn_nodes,
      \(n) point_column(node_start_point(n)),
      numeric(1)
    )
    stop_dups <- duplicated(paste(stop_rows, stop_cols, sep = ":"))
    fn_nodes <- fn_nodes[!stop_dups]
    what_nodes <- what_nodes[!stop_dups]
  }

  if (length(fn_nodes) == 0L) {
    return(invisible(NULL))
  }

  shim_mask <- vapply(fn_nodes, is_pure_shim, logical(1))
  fn_shims <- fn_nodes[shim_mask]
  what_shims <- what_nodes[shim_mask]
  if (length(fn_shims) == 0L) {
    return(invisible(NULL))
  }

  asgn_nodes <- lapply(fn_shims, get_asgn_node)
  starts <- vapply(
    asgn_nodes,
    \(n) point_row(node_start_point(n)) + 1L,
    numeric(1)
  )
  ends <- vapply(asgn_nodes, \(n) point_row(node_end_point(n)) + 1L, numeric(1))
  whats <- vapply(what_shims, node_text, character(1))

  for (j in order(starts, decreasing = TRUE)) {
    fn_name <- get_fn_name(fn_shims[[j]])
    if (is_referenced_elsewhere(fn_name, path)) {
      cli::cli_alert_warning(
        "Skipping removal of {fn_name}(): still referenced in other R files (fix iterators manually)"
      )
      unresolved_failures[[length(unresolved_failures) + 1L]] <<- list(
        commit = sprintf(
          "feat!: remove deprecated %s (lifecycle::deprecate_stop)",
          whats[j]
        ),
        tests = paste0(fn_name, "() skipped: still referenced in other R files")
      )
      next
    }
    lines <- readLines(path, warn = FALSE)
    doc_range <- preceding_doc_range(lines, starts[j])
    fn_range <- seq(starts[j], ends[j])
    after_line <- ends[j] + 1L
    trail <- if (
      after_line <= length(lines) && grepl("^\\s*$", lines[after_line])
    ) {
      after_line
    } else {
      integer(0L)
    }
    writeLines(lines[-c(doc_range, fn_range, trail)], path)
    msg <- sprintf(
      "feat!: remove deprecated %s (lifecycle::deprecate_stop)",
      whats[j]
    )
    commit_change(path, msg)
  }
}

# --- run over all R source files ---

r_files <- fs::dir_ls(here::here("R"), glob = "*.R")

cli::cli_progress_bar(
  total = length(r_files),
  format = "{cli::pb_bar} {cli::pb_current}/{cli::pb_total} | {n_commits} commits | ETA {cli::pb_eta} | {cli::pb_status}",
  format_done = "{cli::pb_total} files done | {n_commits} commits in {cli::pb_elapsed}",
  clear = FALSE
)
for (path in r_files) {
  cli::cli_progress_update(status = basename(path))
  process_file(path)
  cli::cli_progress_update(inc = 1L)
}
cli::cli_progress_done()

write_unresolved_report()
