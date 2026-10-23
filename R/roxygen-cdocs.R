# The roclet that links the C manual from the reference pages.
# The `Roxygen` field of `DESCRIPTION` names it as `docs_rd` of this package,
# in place of roxygen2's `rd`;
# roxygen2 finds it after loading the package code, so it needs no install.
# This file is `.Rbuildignore`d: the roclet serves documenting only,
# and its dependencies are in `Config/Needs/roxygen2` rather than `Imports`.
# See handbook/architecture/r-layer/documentation/.

docs_rd <- function() {
  # Registered here rather than in `NAMESPACE`,
  # which the built package, without this file, could not honor.
  registerS3method(
    "roclet_output",
    "roclet_docs_rd",
    roclet_output.roclet_docs_rd,
    envir = asNamespace("roxygen2")
  )
  roxygen2::roclet(c("docs_rd", "rd"))
}

roclet_output.roclet_docs_rd <- function(x, results, base_path, ...) {
  # Built once per run rather than memoised across runs,
  # where a second run in the same session would get the call graph
  # of sources that have changed since.
  call_graph <- r_call_graph(base_path)
  clinks <- c_links(base_path)
  results <- lapply_with_names(results, add_cdocs_section, call_graph, clinks)
  NextMethod()
}

# https://github.com/gaborcsardi/roxygenlabs/blob/5a7e4449c28f9e423de3f4e8e1be9bc9080f4e52/R/themed-rd.R#L26
lapply_with_names <- function(X, FUN, ...) {
  structure(
    lapply(X, FUN, ...),
    names = names(X) %||% (if (is.character(X)) X)
  )
}

add_cdocs_section <- function(topic, call_graph, clinks) {
  alias <- topic$get_value("alias")
  impl <- map(alias, find_impl, call_graph = call_graph) |> unlist()

  if (length(impl) == 0) {
    return(topic)
  }

  impl <- sub("_impl", "", impl)
  impl <- sprintf("igraph_%s", impl)

  content <- present_cdocs_link(impl, clinks)

  # Only add section if there are actual links
  if (content == "") {
    return(topic)
  }

  topic$add_section(roxygen2::rd_section(
    "section",
    list(
      title = "Related documentation in the C library",
      content = content
    )
  ))

  topic
}

present_cdocs_link <- function(value, clinks) {
  strings <- map_chr(
    unique(value),
    format_cdocs_single_link,
    clinks
  )

  # Filter out empty strings
  strings <- strings[strings != ""]

  paste(strings, collapse = ", ")
}


# rigraph's `src/rcallback.c` defines closure shims that exist on the R side
# only: each one wraps a single C function, and none has a C entry of its own.
# The wrapped name is mapped explicitly rather than derived by stripping the
# `_closure` suffix, for two reasons.
# `igraph_transitive_closure` and `igraph_transitive_closure_dag` are
# graph-theory functions rather than wrappers, so a suffix rule would have to
# know to leave them alone.
# And `community_leading_eigenvector_callback_closure` wraps
# `igraph_community_leading_eigenvector`, dropping `_callback` along with
# `_closure`, where every other shim keeps it.
# Mirrors `closure_map` in rigraph's `tools/rebuild-cats.R`.
closure_map <- c(
  "igraph_bfs_closure" = "igraph_bfs",
  "igraph_dfs_closure" = "igraph_dfs",
  "igraph_cliques_callback_closure" = "igraph_cliques_callback",
  "igraph_maximal_cliques_callback_closure" = "igraph_maximal_cliques_callback",
  "igraph_simple_cycles_callback_closure" = "igraph_simple_cycles_callback",
  "igraph_get_isomorphisms_vf2_callback_closure" = "igraph_get_isomorphisms_vf2_callback",
  "igraph_get_subisomorphisms_vf2_callback_closure" = "igraph_get_subisomorphisms_vf2_callback",
  "igraph_motifs_randesu_callback_closure" = "igraph_motifs_randesu_callback",
  "igraph_community_leading_eigenvector_callback_closure" = "igraph_community_leading_eigenvector"
)

# C functions that a public header exports but the C manual does not document,
# so the index can never carry an entry for them.
# Reported with a message rather than a warning:
# the gap is upstream in the C library's own documentation,
# and neither this package nor the R package calling it can close it.
# Checked against the `doxrox-include` directives in igraph/igraph's `doc/`.
undocumented_c_functions <- c(
  "igraph_eigen_adjacency",
  "igraph_eigen_matrix",
  "igraph_eigen_matrix_symmetric",
  "igraph_has_attribute_table",
  "igraph_hrg_sample_many",
  "igraph_residual_graph",
  "igraph_reverse_residual_graph",
  "igraph_solve_lsap",
  "igraph_transitive_closure_dag",
  "igraph_weighted_sparsemat"
)

format_cdocs_single_link <- function(x, clinks) {
  if (x %in% names(closure_map)) {
    x <- closure_map[[x]]
  }

  # we can use igraph_ or not
  df <- clinks[clinks$method %in% c(x, sprintf("igraph_%s", x)), ]
  if (nrow(df) == 0) {
    if (x %in% undocumented_c_functions) {
      cli::cli_inform("No C entry for {x}, the C manual does not document it.")
    } else {
      cli::cli_warn("Can't find C entry for {x}!")
    }
    return("")
  }
  sprintf("\\href{%s}{\\code{%s()}}", df$url, sub("igraph_", "", df$method))
}

find_impl <- function(topic, call_graph) {
  reachable <- reachable_functions(call_graph, topic)
  reachable[endsWith(reachable, "_impl")]
}

# The functions defined under `R/` of the package at `base_path`
# and the functions each one calls, as `call_graph()` represents them.
r_call_graph <- function(base_path) {
  # Sorted bytewise, as fs::dir_ls() returned them:
  # the order of the definitions decides the order of the links.
  all_r_scripts <- sort(
    dir(file.path(base_path, "R"), pattern = "R$", full.names = TRUE),
    method = "radix"
  )
  all_r_code <- map_chr(
    all_r_scripts,
    \(x) readLines(x) |> paste(collapse = "\n")
  ) |>
    paste(collapse = "\n")

  r_language <- treesitter.r::language()
  r_parser <- treesitter::parser(language = r_language)
  tree <- treesitter::parser_parse(r_parser, all_r_code)

  # Query to find all function definitions with their names
  func_def_query <- treesitter::query(
    r_language,
    '(binary_operator
      lhs: (identifier) @func_name
      rhs: (function_definition) @func_def
    )'
  )

  # Extract all function definitions
  root_node <- treesitter::tree_root_node(tree)
  all_matches <- treesitter::query_matches(func_def_query, root_node)[[1]]

  # Extract function names and definition nodes from matches
  # Each match contains paired func_name and func_def captures
  func_names <- map_chr(all_matches, \(m) {
    treesitter::node_text(m$node[[which(m$name == "func_name")]])
  })
  func_def_nodes <- map(all_matches, \(m) {
    m$node[[which(m$name == "func_def")]]
  })

  # Query to find all function calls
  func_call_query <- treesitter::query(
    r_language,
    '(call
      function: (identifier) @call_name
    )'
  )

  # The functions called within each function definition
  calls <- map(func_def_nodes, \(func_def_node) {
    captures <- treesitter::query_captures(func_call_query, func_def_node)
    map_chr(captures$node, treesitter::node_text)
  })

  call_graph(
    from = rep(func_names, lengths(calls)),
    to = unlist(calls, use.names = FALSE) %||% character()
  )
}

# A call graph from its edges, one per call from `from` to `to`,
# as the function names (`vertices`) and the callees of each one
# (`callees`, sorted vertex indices).
# Vertices are numbered in order of first appearance, callers first,
# as graph_from_data_frame() numbers them.
call_graph <- function(from, to) {
  vertices <- unique(c(from, to))
  callees <- split(
    match(to, vertices),
    factor(match(from, vertices), levels = seq_along(vertices))
  )
  list(
    vertices = vertices,
    callees = lapply(unname(callees), \(x) sort(unique(x)))
  )
}

# The functions reachable from `start` through calls, `start` included,
# in the order subcomponent(mode = "out") returns them:
# breadth first, and the callees of each function by ascending index.
# Empty when `start` is not a vertex.
reachable_functions <- function(call_graph, start) {
  first <- match(start, call_graph$vertices)
  if (is.na(first)) {
    return(character())
  }

  seen <- logical(length(call_graph$vertices))
  seen[[first]] <- TRUE
  queue <- first
  head <- 0L
  while (head < length(queue)) {
    head <- head + 1L
    callees <- call_graph$callees[[queue[[head]]]]
    callees <- callees[!seen[callees]]
    seen[callees] <- TRUE
    queue <- c(queue, callees)
  }

  call_graph$vertices[queue]
}

igraph_c_version <- function(base_path) {
  c_lines <- readLines(file.path(
    base_path,
    "src",
    "vendor",
    "igraph_version.h"
  ))
  version_line <- c_lines[startsWith(c_lines, "#define IGRAPH_VERSION ")]

  regmatches(version_line, regexec('"([^"]+)"', version_line))[[1]][2]
}

# The release whose manual documents a version of the C library.
# A development snapshot carries the version `git describe` gives its commit,
# `<tag>-<commits since the tag>-g<hash>`, and has no manual of its own:
# until the next release, the manual of its tag documents it.
c_docs_version <- function(version) {
  sub("-[0-9]+-g[0-9a-f]+(-dirty)?$", "", version)
}

# The releases of the C library vendored at `base_path`,
# from the headings of its changelog, such as `## [0.10.17] - 2025-09-19`.
c_releases <- function(base_path) {
  lines <- readLines(file.path(
    base_path,
    "src",
    "vendor",
    "cigraph",
    "CHANGELOG.md"
  ))
  headings <- regmatches(lines, regexec("^## \\[([0-9][^]]*)\\]", lines))
  map_chr(compact(headings), \(x) x[[2]])
}

# The directory caching the link tables, one per release of the C manual.
# The tables describe the C library, so every flavor of this package shares them.
c_links_cache_dir <- function() {
  file.path(tools::R_user_dir("igraph", "cache"), "clinks")
}

# The link tables in the cache, named by the release.
c_links_tables <- function() {
  files <- dir(c_links_cache_dir(), pattern = "[.]csv$", full.names = TRUE)
  set_names(files, sub("[.]csv$", "", basename(files)))
}

# Downloads the link table for one release of the C manual into the cache,
# from the index igraph.org publishes for that release.
# The release tarball of the C library carries the same index
# as `doc/html/ix01.html`, which `index_url` can name instead.
c_links_download <- function(
  version,
  index_url = sprintf("https://igraph.org/c/html/%s/ix01.html", version)
) {
  index <- xml2::read_html(index_url)
  entries <- xml2::xml_find_all(index, ".//dt")
  href <- map_chr(entries, \(dt) xml2::xml_attr(xml2::xml_child(dt), "href"))

  clinks <- data.frame(
    method = sub(".*#", "", href),
    url = sprintf("https://igraph.org/c/html/%s/%s", version, href)
  )

  dir <- c_links_cache_dir()
  dir.create(dir, recursive = TRUE, showWarnings = FALSE)
  utils::write.csv(
    clinks,
    file.path(dir, paste0(version, ".csv")),
    row.names = FALSE
  )
}

# The release whose link table serves `version`:
# its own, else the newest release before it, else `NA`.
# Versions compare by their numeric part, so a pre-release comes after the
# releases before it and before its own release.
c_links_release <- function(version, releases) {
  if (version %in% releases) {
    return(version)
  }

  core <- function(x) numeric_version(sub("^([0-9.]*[0-9]).*$", "\\1", x))
  older <- releases[core(releases) < core(version)]
  if (length(older) == 0) {
    return(NA_character_)
  }

  is_release <- !grepl("-", older, fixed = TRUE)
  older[[order(core(older), is_release, decreasing = TRUE)[[1]]]]
}

# The link table for the version of the C library vendored at `base_path`.
# The table of its release is downloaded once and cached;
# the links depend on the sources and that cache alone.
c_links <- function(base_path) {
  engine <- igraph_c_version(base_path)
  version <- c_docs_version(engine)

  # The newest release of the C library documenting `version`,
  # as the changelog vendored with it lists the releases.
  target <- c_links_release(version, c_releases(base_path))
  if (!is.na(target) && !target %in% names(c_links_tables())) {
    tryCatch(
      c_links_download(target),
      error = function(e) NULL
    )
  }

  tables <- c_links_tables()
  release <- c_links_release(version, names(tables))

  if (is.na(release)) {
    cli::cli_abort(c(
      "No link table for the C manual of igraph {version} or an earlier release.",
      i = "Could not download it from igraph.org; check the network access."
    ))
  }

  if (release != version) {
    # The links stay those of the newest release in the cache.
    # A development snapshot past that release is the normal state of a
    # vendoring series, whose manual is not published yet;
    # a release whose manual cannot be downloaded is worth a warning.
    notify <- if (engine != version) cli::cli_inform else cli::cli_warn
    notify(c(
      "No link table for the C manual of igraph {version}, linking the manual of {release}.",
      i = "It is downloaded from igraph.org once that manual is published."
    ))
  }

  utils::read.csv(tables[[release]])
}
