#!/usr/bin/env Rscript
# Split a monolithic stimulus-generated aaa-auto.R into per-category
# R/aaa-<cat>.R files, using tools/aaa-categories.yaml for the mapping.
#
# Source file: first argument, or .build/aaa-auto.R by default, or
# R/aaa-auto.R as a transitional fallback.
#
# Each output file:
#   - starts with a generated-file header + `# styler: off` pragma
#   - groups impls by subcategory, each group prefixed with a banner comment
#   - preserves each impl's original source formatting byte-for-byte

suppressPackageStartupMessages({
  library(yaml)
})

# ---- locate repo + inputs/outputs ----------------------------------------

script_path <- (function() {
  args <- commandArgs(trailingOnly = FALSE)
  m <- grep("^--file=", args, value = TRUE)
  if (length(m)) sub("^--file=", "", m[1]) else "tools/split-aaa-auto.R"
})()
REPO <- normalizePath(file.path(dirname(script_path), ".."))
CATS <- file.path(REPO, "tools", "aaa-categories.yaml")

# Source file precedence: CLI arg > .build/aaa-auto.R > R/aaa-auto.R
cli_args <- commandArgs(trailingOnly = TRUE)
candidate <- if (length(cli_args) >= 1) {
  cli_args[1]
} else {
  file.path(REPO, ".build", "aaa-auto.R")
}
if (!file.exists(candidate)) {
  fallback <- file.path(REPO, "R", "aaa-auto.R")
  if (file.exists(fallback)) {
    candidate <- fallback
  } else {
    stop(
      "split-aaa-auto.R: no source file found at ",
      candidate,
      " or ",
      fallback
    )
  }
}
SRC <- normalizePath(candidate)
OUT_DIR <- file.path(REPO, "R")

message("split-aaa-auto.R: reading ", SRC)

# ---- closure normalization (matches tools/rebuild-cats.R) ----------------

closure_map <- c(
  "igraph_bfs_closure"                                     = "igraph_bfs",
  "igraph_dfs_closure"                                     = "igraph_dfs",
  "igraph_cliques_callback_closure"                        = "igraph_cliques_callback",
  "igraph_maximal_cliques_callback_closure"                = "igraph_maximal_cliques_callback",
  "igraph_simple_cycles_callback_closure"                  = "igraph_simple_cycles_callback",
  "igraph_get_isomorphisms_vf2_callback_closure"           = "igraph_get_isomorphisms_vf2_callback",
  "igraph_get_subisomorphisms_vf2_callback_closure"        = "igraph_get_subisomorphisms_vf2_callback",
  "igraph_motifs_randesu_callback_closure"                 = "igraph_motifs_randesu_callback",
  "igraph_community_leading_eigenvector_callback_closure"  = "igraph_community_leading_eigenvector"
)

# ---- load categories: build (cat, sub) lookup keyed by C function --------

cats <- yaml::read_yaml(CATS)
cat_lookup <- new.env(hash = TRUE, parent = emptyenv())
for (cat in names(cats)) {
  node <- cats[[cat]]
  if (is.character(node)) {
    for (fn in node) {
      cat_lookup[[fn]] <- list(category = cat, subcategory = NA_character_)
    }
  } else if (is.list(node)) {
    for (sub in names(node)) {
      for (fn in node[[sub]]) {
        cat_lookup[[fn]] <- list(category = cat, subcategory = sub)
      }
    }
  }
}

# ---- parse SRC, extract each impl's (name, c_function, src_text) --------

src_lines <- readLines(SRC, warn = FALSE)
parsed <- parse(text = src_lines, keep.source = TRUE)
pdata <- utils::getParseData(parsed) # AST + line positions

extract_call_sym <- function(expr) {
  # First non-finalizer `.Call(...)` symbol found in the expression tree.
  recur <- function(e) {
    if (is.call(e)) {
      fn <- e[[1]]
      if (is.name(fn) && as.character(fn) == ".Call" && length(e) >= 2) {
        first <- e[[2]]
        if (is.name(first)) {
          sym <- as.character(first)
          if (sym != "R_igraph_finalizer") return(sym)
        }
      }
      for (i in seq_along(e)) {
        r <- recur(e[[i]])
        if (!is.null(r)) return(r)
      }
    }
    NULL
  }
  recur(expr)
}

impls <- list()
for (i in seq_along(parsed)) {
  expr <- parsed[[i]]
  if (!is.call(expr) || length(expr) < 3) {
    next
  }
  op <- as.character(expr[[1]])
  if (!op %in% c("<-", "=", "assign")) {
    next
  }
  lhs <- expr[[2]]
  if (!is.name(lhs)) {
    next
  }
  impl_name <- as.character(lhs)
  if (!grepl("_impl$", impl_name)) {
    next
  }
  rhs <- expr[[3]]
  if (!(is.call(rhs) && identical(rhs[[1]], as.name("function")))) {
    next
  }

  sym <- extract_call_sym(rhs)
  if (is.null(sym)) {
    stop("impl ", impl_name, " has no non-finalizer .Call() target; aborting.")
  }
  c_literal <- sub("^R_", "", sym)
  c_fn <- if (c_literal %in% names(closure_map)) {
    closure_map[[c_literal]]
  } else {
    c_literal
  }

  sref <- attr(expr, "srcref")
  if (is.null(sref)) {
    sref <- getSrcref(parsed)[[i]]
  }
  line1 <- sref[1L]
  line2 <- sref[3L]
  src_text <- paste(src_lines[line1:line2], collapse = "\n")

  impls[[length(impls) + 1L]] <- list(
    impl_name = impl_name,
    c_function = c_fn,
    src_text = src_text
  )
}

message("parsed ", length(impls), " _impl wrappers from source")

# ---- map each impl to (category, subcategory); validate no gaps ---------

unassigned <- character()
for (i in seq_along(impls)) {
  lookup <- cat_lookup[[impls[[i]]$c_function]]
  if (is.null(lookup)) {
    unassigned <- c(unassigned, paste0(impls[[i]]$impl_name, " -> ", impls[[i]]$c_function))
  } else {
    impls[[i]]$category <- lookup$category
    impls[[i]]$subcategory <- lookup$subcategory
  }
}
if (length(unassigned)) {
  stop(
    "impls without a category in ",
    CATS,
    ":\n  ",
    paste(unassigned, collapse = "\n  "),
    "\nAdd placements in tools/rebuild-cats.R and rerun it."
  )
}

# ---- Subcategory ordering (mirrors tools/rebuild-cats.R override) -------

subcategory_order_overrides <- list(
  structural = c(
    "basic-properties",
    "degree-sequences",
    "directedness-conversion",
    "efficiency-measures",
    "graph-components",
    "k-cores",
    "matchings",
    "matrix-representations",
    "maximum-cardinality-search-chordal-graphs",
    "mixing-patterns",
    "mutual-edges",
    "neighborhood-of-a-vertex",
    "non-simple-graphs-multiple-and-loop-edges",
    "percolation",
    "pre-calculated-subsets",
    "similarity-measures",
    "sparsifiers",
    "spectral-properties",
    "summary-statistics",
    "them-statistics",
    "transitivity-or-clustering-coefficient",
    "us-statistics"
  ),
  centrality = c(
    "centrality-measures",
    "centralization",
    "range-limited-centrality-measures",
    "subset-limited-centrality-measures"
  ),
  paths = c(
    "distances-and-metrics",
    "shortest-paths",
    "widest-path-related-functions"
  ),
  trees = c(
    "spanning-trees-and-forests",
    "unfolding-a-graph-into-a-tree"
  )
)

# Natural subcategory order per category from the YAML itself (insertion order)
yaml_sub_order <- lapply(names(cats), function(cat) {
  node <- cats[[cat]]
  if (is.list(node) && !is.null(names(node))) names(node) else character()
})
names(yaml_sub_order) <- names(cats)

# ---- remove stale R/aaa-*.R before writing ------------------------------

stale <- list.files(OUT_DIR, pattern = "^aaa-.*\\.R$", full.names = TRUE)
# Keep aaa-auto.R if present — the caller deletes it manually after the split.
stale <- stale[basename(stale) != "aaa-auto.R"]
if (length(stale)) {
  message("removing ", length(stale), " stale R/aaa-*.R file(s)")
  invisible(file.remove(stale))
}

# ---- emit per-category files --------------------------------------------

impl_tbl <- do.call(
  rbind,
  lapply(impls, function(x) {
    data.frame(
      impl_name = x$impl_name,
      c_function = x$c_function,
      category = x$category,
      subcategory = x$subcategory,
      src_text = x$src_text,
      stringsAsFactors = FALSE
    )
  })
)

src_basename <- basename(SRC)
categories <- sort(unique(impl_tbl$category))

header <- c(
  paste0("# Generated by tools/split-aaa-auto.R from ", src_basename,
         " — do not edit by hand"),
  "# styler: off",
  ""
)

for (cat in categories) {
  sub_tbl <- impl_tbl[impl_tbl$category == cat, ]

  override <- subcategory_order_overrides[[cat]]
  natural <- yaml_sub_order[[cat]]
  prev <- if (!is.null(override)) {
    override
  } else if (!is.null(natural)) {
    natural
  } else {
    character()
  }
  subs_present <- unique(sub_tbl$subcategory)
  sub_order <- c(intersect(prev, subs_present), setdiff(subs_present, prev))

  out_lines <- header

  # Insert a blank line between each impl's source block.
  with_blanks <- function(srcs) as.vector(rbind(srcs, ""))

  # Emit NA (flat-list) entries first with no banner
  flat_mask <- is.na(sub_tbl$subcategory)
  if (any(flat_mask)) {
    flat <- sub_tbl[flat_mask, ]
    flat <- flat[order(flat$impl_name), ]
    out_lines <- c(out_lines, with_blanks(flat$src_text))
  }

  for (sub in sub_order) {
    if (is.na(sub)) {
      next
    }
    rows <- sub_tbl[!is.na(sub_tbl$subcategory) & sub_tbl$subcategory == sub, ]
    rows <- rows[order(rows$impl_name), ]
    if (nrow(rows) == 0) {
      next
    }
    banner <- paste0("# ==== ", sub, " ====")
    out_lines <- c(out_lines, banner, "", with_blanks(rows$src_text))
  }

  # Strip trailing empty lines, leave exactly one terminating newline
  while (length(out_lines) && !nzchar(tail(out_lines, 1))) {
    out_lines <- out_lines[-length(out_lines)]
  }

  out_path <- file.path(OUT_DIR, paste0("aaa-", cat, ".R"))
  writeLines(out_lines, out_path)
}

message(
  "wrote ",
  length(categories),
  " R/aaa-<cat>.R files (",
  nrow(impl_tbl),
  " impls total)"
)
