## ----------------------------------------------------------------------
##
##   IGraph R package
##   Copyright (C) 2005-2014  Gabor Csardi <csardi.gabor@gmail.com>
##   334 Harvard street, Cambridge, MA 02139 USA
##
##   This program is free software; you can redistribute it and/or modify
##   it under the terms of the GNU General Public License as published by
##   the Free Software Foundation; either version 2 of the License, or
##   (at your option) any later version.
##
##   This program is distributed in the hope that it will be useful,
##   but WITHOUT ANY WARRANTY; without even the implied warranty of
##   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##   GNU General Public License for more details.
##
##   You should have received a copy of the GNU General Public License
##   along with this program; if not, write to the Free Software
##   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
##   02110-1301 USA
##
## ----------------------------------------------------------------------

###################################################################
# Convert graphs to human readable forms
###################################################################

.get.attr.codes <- function(object) {
  ga <- va <- ea <- ""
  gal <- graph_attr_names(object)
  if (length(gal) != 0) {
    ga <- paste(
      sep = "",
      gal,
      " (g/",
      .Call(Rx_igraph_get_attr_mode, object, 2L),
      ")"
    )
  }
  val <- vertex_attr_names(object)
  if (length(val) != 0) {
    va <- paste(
      sep = "",
      val,
      " (v/",
      .Call(Rx_igraph_get_attr_mode, object, 3L),
      ")"
    )
  }
  eal <- edge_attr_names(object)
  if (length(eal) != 0) {
    ea <- paste(
      sep = "",
      edge_attr_names(object),
      " (e/",
      .Call(Rx_igraph_get_attr_mode, object, 4L),
      ")"
    )
  }
  c(ga, va, ea)
}

.print.header <- function(object, id = igraph_opt("print.id")) {
  ensure_igraph(object)

  title <- paste0(
    "IGRAPH ",
    if (id) paste0(substr(graph_id(object), 1, 7), " "),
    c("U", "D")[is_directed(object) + 1],
    c("-", "N")[is_named(object) + 1],
    c("-", "W")[is_weighted(object) + 1],
    c("-", "B")[is_bipartite(object) + 1],
    " ",
    vcount(object),
    " ",
    ecount(object),
    " -- "
  )
  w <- getOption("width")
  if (nchar(title) < w && "name" %in% graph_attr_names(object)) {
    title <- substring(
      paste(sep = "", title, as.character(object$name)[1]),
      1,
      w - 1
    )
  }
  cat(title, "\n", sep = "")

  atxt <- .get.attr.codes(object)
  atxt <- paste(atxt[nzchar(atxt)], collapse = ", ")
  if (nzchar(atxt)) {
    atxt <- strwrap(
      paste(sep = "", "+ attr: ", atxt),
      prefix = "| ",
      initial = ""
    )
    cat(atxt, sep = "\n")
  }
  1 + if (length(atxt) == 1 && !nzchar(atxt)) 0 else length(atxt)
}

#' @importFrom utils capture.output
.print.graph.attributes <- function(x, full, max.lines) {
  list <- graph_attr_names(x)
  if (length(list) != 0) {
    cat("+ graph attributes:\n")
    out <- capture.output({
      lapply(list, function(n) {
        cat(sep = "", "+ ", n, ":\n")
        indent_print(graph_attr(x, n), .indent = "  ")
      })
      invisible(NULL)
    })
    indent_print(out, sep = "\n", .indent = "| ", .printer = cat)
    length(out) + 1
  } else {
    0
  }
}

## IGRAPH U--- 10 10 -- Ring graph
## + attr: name (g/c), mutual (g/l), circular (g/l)
## + graph attributes:
## | + name:
## |   [1] "Ring graph"
## | + mutual:
## |   [1] FALSE
## | + circular=
## |   [1] TRUE
## | + layout =
## |            [,1]          [,2]
## |    [1,]  0.000000  0.000000e+00
## |    [2,]  1.000000  0.000000e+00
## |    [3,]  0.809017  5.877853e-01
## |    [4,]  0.309017  9.510565e-01
## |    [5,] -0.309017  9.510565e-01
## |    [6,] -0.809017  5.877853e-01
## |    [7,] -1.000000  1.224647e-16
## |    [8,] -0.809017 -5.877853e-01
## |    [9,] -0.309017 -9.510565e-01
## |   [10,]  0.309017 -9.510565e-01
## |   [11,]  0.809017 -5.877853e-01
## + edges:
##  [1] 1-- 2 2-- 3 3-- 4 4-- 5 5-- 6 6-- 7 7-- 8 8-- 9 9--10 1--10

.print.vertex.attributes <- function(x, full, max.lines) {
  pf <- function(x) .print.vertex.attributes.old(x, full, max.lines)
  if (length(vertex_attr_names(x))) {
    cat("+ vertex attributes:\n")
  }
  indent_print(x, .indent = "| ", .printer = pf)
}

.print.vertex.attributes.old <- function(x, full, max.lines) {
  vc <- vcount(x)
  list <- vertex_attr_names(x)
  if (length(list) != 0) {
    mp <- getOption("max.print")
    options(max.print = 1000000000)
    if (vc <= mp) {
      omitted.vertices <- 0
      ind <- as.numeric(V(x))
    } else {
      omitted.vertices <- vc - mp
      ind <- seq(length.out = mp)
    }
    if (
      vc == 0 ||
        all(sapply(list, function(v) {
          is.numeric(vertex_attr(x, v)) ||
            is.character(vertex_attr(x, v)) ||
            is.logical(vertex_attr(x, v))
        }))
    ) {
      ## create a table
      tab <- data.frame(v = paste(sep = "", "[", ind, "]"), row.names = "v")
      for (i in list) {
        tab[i] <- vertex_attr(x, i, ind)
      }
      print(tab)
    } else {
      for (i in ind) {
        cat(sep = "", "[[", i, "]]\n")
        lapply(list, function(n) {
          cat(sep = "", "[[", i, "]][[", n, "]]\n")
          print(vertex_attr(x, n, i))
        })
      }
    }
    options(max.print = mp)
    if (omitted.vertices != 0) {
      cat(paste(
        '[ reached getOption("max.print") -- omitted',
        omitted.vertices,
        "vertices ]\n\n"
      ))
    }
  }
}

.print.edges.edgelist <- function(x, edges = E(x), names) {
  ec <- length(edges)
  list <- edge_attr_names(x)
  list <- list[list != "name"]
  arrow <- ifelse(is_directed(x), "->", "--")
  if (is_named(x)) {
    cat("+ edges (vertex names) and their attributes:\n")
  } else {
    cat("+ edges and their attributes:\n")
  }
  if (names && !"name" %in% vertex_attr_names(x)) {
    names <- FALSE
  }
  if (
    names &&
      "name" %in% vertex_attr_names(x) &&
      !is.numeric(vertex_attr(x, "name")) &&
      !is.character(vertex_attr(x, "name")) &&
      !is.logical(vertex_attr(x, "name"))
  ) {
    cli::cli_warn(
      "Can't print vertex names, complex {.val name} vertex attribute."
    )
    names <- FALSE
  }

  mp <- getOption("max.print")
  if (mp >= ec) {
    omitted.edges <- 0
    el <- ends(x, edges, names = names)
  } else {
    omitted.edges <- ec - mp
    el <- ends(x, ends[seq_len(mp)])
    if (names) {
      el[] <- V(x)$name[el]
    }
  }
  ename <- if ("name" %in% edge_attr_names(x)) {
    paste(sep = "", "'", E(x)$name, "'")
  } else {
    seq(length.out = nrow(el))
  }
  if (
    ec == 0 ||
      all(sapply(list, function(v) {
        is.numeric(edge_attr(x, v)) |
          is.character(edge_attr(x, v)) |
          is.logical(edge_attr(x, v))
      }))
  ) {
    ## create a table
    tab <- data.frame(row.names = paste(sep = "", "[", ename, "]"))
    if (is.numeric(el)) {
      w <- nchar(max(el))
    } else {
      w <- max(nchar(el))
    }
    tab["edge"] <- paste(
      sep = "",
      format(el[, 1], width = w),
      arrow,
      format(el[, 2], width = w)
    )
    for (i in list) {
      tab[i] <- edge_attr(x, i)
    }
    print(tab)
  } else {
    i <- 1
    apply(el, 1, function(v) {
      cat(sep = "", "[", ename[i], "] ", v[1], " ", arrow, " ", v[2])
      lapply(list, function(n) {
        cat(sep = "", "\n[[", i, "]][[", n, "]]\n")
        print(edge_attr(x, n, i))
      })
      cat("\n")
      i <<- i + 1
    })
  }
  if (omitted.edges != 0) {
    cat(paste(
      '[ reached getOption("max.print") -- omitted',
      omitted.edges,
      "edges ]\n\n"
    ))
  }
}

# Print the "single index" (`[[`) edge detail view: one row per edge with
# tail/head names, their raw numeric ids (tid/hid) and one column per atomic
# edge attribute. If any attribute is list-valued, the frame can't hold it, so
# fall back to a per-attribute named list sliced to the selected edges.
print_edge_detail <- function(graph, edges) {
  ea <- edge_attr(graph)
  if (all(vapply(ea, is.atomic, logical(1)))) {
    etail <- tail_of(graph, edges)
    ehead <- head_of(graph, edges)
    df <- data.frame(
      stringsAsFactors = FALSE,
      tail = as_ids(etail),
      head = as_ids(ehead),
      tid = as.vector(etail),
      hid = as.vector(ehead)
    )
    if (length(ea)) {
      ea <- do_call(data.frame, .args = ea, stringsAsFactors = FALSE)
      df <- cbind(df, ea[as.vector(edges), , drop = FALSE])
    }
    print(df)
  } else {
    print(lapply(ea, "[", as.vector(edges)))
  }
}

.print.edges.compressed <- function(
  x,
  edges = E(x),
  names,
  num = FALSE,
  max.lines = igraph_opt("auto.print.lines"),
  id = igraph_opt("print.id")
) {
  len <- length(edges)
  gid <- graph_id(edges)

  title <- "+" %+%
    (if (num) {
      " " %+% chr(len) %+% "/" %+% (if (is.null(x)) "?" else chr(gsize(x)))
    } else {
      ""
    }) %+%
    (if (len == 1) " edge" else " edges") %+%
    (if (isTRUE(id) && !is.na(gid)) {
      paste(" from", substr(gid, 1, 7))
    } else {
      ""
    }) %+%
    (if (is.null(x)) " (deleted)" else "") %+%
    (if (is.null(attr(edges, "vnames"))) "" else " (vertex names)") %+%
    ":\n"
  cat(title)

  if (is_single_index(edges) && !is.null(x)) {
    ## Double bracket
    print_edge_detail(x, edges)
  } else if (is.null(max.lines)) {
    .print.edges.compressed.all(x, edges, names)
  } else {
    .print.edges.compressed.limit(x, edges, names, max.lines)
  }
}

.print.edges.compressed.all <- function(x, edges, names) {
  if (!is.null(x)) {
    arrow <- c("--", "->")[is_directed(x) + 1]

    el <- ends(x, edges, names = names)
    pr <- paste(sep = "", format(el[, 1]), arrow, format(el[, 2]))
    print(pr, quote = FALSE)
  } else {
    if (!is.null(attr(edges, "vnames"))) {
      print(as.vector(attr(edges, "vnames")), quote = FALSE)
    } else if (!is.null(names(edges))) {
      print(names(edges), quote = FALSE)
    } else {
      print(as.vector(edges))
    }
  }
}

#' @importFrom utils capture.output
.print.edges.compressed.limit <- function(x, edges, names, max.lines) {
  if (!is.null(x)) {
    arrow <- c("--", "->")[is_directed(x) + 1]

    el <- NA

    fun <- function(q, no) {
      if (q == "length") {
        length(edges)
      } else if (q == "min_width") {
        5
      } else if (q == "width") {
        el <<- ends(x, edges[seq_len(no)], names = names)
        cummax(nchar(el[, 1])) + nchar(arrow) + cummax(nchar(el[, 2])) + 1
      } else if (q == "print") {
        el <<- el[seq_len(no), , drop = FALSE]
        out <- paste(sep = "", format(el[, 1]), arrow, format(el[, 2]))
        capture.output(print(out, quote = FALSE))
      } else if (q == "max") {
        can_max <<- no
      } else if (q == "done") {
        if (
          no["tried_items"] < length(edges) ||
            no["printed_lines"] < no["tried_lines"]
        ) {
          cat("+ ... omitted several edges\n")
        }
      }
    }

    fun <- printer_callback(fun)
    head_print(fun, max_lines = max.lines)
  } else {
    if (!is.null(attr(edges, "vnames"))) {
      head_print(as.vector(attr(edges, "vnames")), quote = FALSE)
    } else if (!is.null(names(edges))) {
      head_print(names(edges), quote = FALSE)
    } else {
      head_print(as.vector(edges))
    }
  }
}

.truncate.vertices <- function(vc) {
  mp <- getOption("max.print")
  if (vc <= mp) {
    list(ind = seq_len(vc), omitted = 0)
  } else {
    list(ind = seq_len(mp), omitted = vc - mp)
  }
}

.print.omitted.vertices <- function(omitted) {
  if (omitted != 0) {
    cat(paste(
      '[ reached getOption("max.print") -- omitted',
      omitted,
      "vertices ]\n\n"
    ))
  }
}

.print.edges.adjlist <- function(x) {
  cat("+ edges:\n")
  tr <- .truncate.vertices(vcount(x))
  ind <- tr$ind

  arrow <- c(" -- ", " -> ")[is_directed(x) + 1]
  al <- as_adj_list(x, mode = "out")[ind]
  max.ind.width <- nchar(max(ind))
  w <- nchar(vcount(x))
  mpl <- trunc((getOption("width") - nchar(arrow) - max.ind.width) / (w + 1))
  if (any(lengths(al) > mpl)) {
    ## Wrapping needed
    mw <- max.ind.width
    sm <- paste(collapse = "", rep(" ", mw + 4))
    alstr <- lapply(seq_along(al), function(x) {
      len <- length(al[[x]])
      fac <- rep(1:(len / mpl + 1), each = mpl, length.out = len)
      nei <- tapply(format(al[[x]], width = mw), fac, paste, collapse = " ")
      mark <- paste(sep = "", format(ind[x], width = mw), arrow)
      mark <- c(mark, rep(sm, max(0, length(nei) - 1)))
      paste(sep = "", mark, nei)
    })
    cat(unlist(alstr), sep = "\n")
  } else {
    alstr <- sapply(al, function(x) {
      paste(format(x, width = w), collapse = " ")
    })
    mark <- paste(sep = "", format(ind), arrow)
    alstr <- paste(sep = "", mark, alstr)
    maxw <- max(nchar(alstr))
    sep <- "   "
    ncol <- trunc((getOption("width") - 1 + nchar(sep)) / (maxw + nchar(sep)))
    if (ncol > 1) {
      alstr <- format(alstr, width = maxw, justify = "left")
      fac <- rep(
        1:(length(ind) / ncol + 1),
        each = ncol,
        length.out = length(ind)
      )
      alstr <- tapply(alstr, fac, paste, collapse = sep)
    }
    cat(alstr, sep = "\n")
  }
  .print.omitted.vertices(tr$omitted)
}

.print.edges.adjlist.named <- function(x, edges = E(x)) {
  cat("+ edges (vertex names):\n")

  arrow <- c(" -- ", " -> ")[is_directed(x) + 1]
  vn <- V(x)$name

  tr <- .truncate.vertices(vcount(x))
  ind <- tr$ind

  al <- as_adj_list(x, mode = "out")[ind]
  alstr <- sapply(al, function(x) {
    paste(collapse = ", ", vn[x])
  })
  alstr <- paste(sep = "", format(vn[ind]), arrow, alstr)
  alstr <- strwrap(alstr, exdent = max(nchar(vn[ind])) + nchar(arrow))
  cat(alstr, sep = "\n")
  .print.omitted.vertices(tr$omitted)
}

#' @family print
#' @export
print_all <- function(object, ...) {
  print.igraph(object, full = TRUE, ...)
}


#' Print graphs to the terminal
#'
#' These functions attempt to print a graph to the terminal in a human readable
#' form.
#'
#' `summary.igraph` prints the number of vertices, edges and whether the
#' graph is directed.
#'
#' `print_all()` prints the same information, and also lists the edges, and
#' optionally graph, vertex and/or edge attributes.
#'
#' `print.igraph()` behaves either as `summary.igraph` or
#' `print_all()` depending on the `full` argument. See also the
#' \sQuote{print.full} igraph option and [igraph_opt()].
#'
#' The graph summary printed by `summary.igraph` (and `print.igraph()`
#' and `print_all()`) consists of one or more lines. The first line contains
#' the basic properties of the graph, and the rest contains its attributes.
#' Here is an example, a small star graph with weighted directed edges and named
#' vertices: \preformatted{    IGRAPH badcafe DNW- 10 9 -- In-star
#'     + attr: name (g/c), mode (g/c), center (g/n), name (v/c),
#'       weight (e/n) }
#' The first line always
#' starts with `IGRAPH`, showing you that the object is an igraph graph.
#' Then a seven character code is printed, this the first seven characters
#' of the unique ID of the graph. See [graph_id()] for more.
#' Then a four letter long code string is printed. The first letter
#' distinguishes between directed (\sQuote{`D`}) and undirected
#' (\sQuote{`U`}) graphs. The second letter is \sQuote{`N`} for named
#' graphs, i.e. graphs with the `name` vertex attribute set. The third
#' letter is \sQuote{`W`} for weighted graphs, i.e. graphs with the
#' `weight` edge attribute set. The fourth letter is \sQuote{`B`} for
#' bipartite graphs, i.e. for graphs with the `type` vertex attribute set.
#'
#' This is followed by the number of vertices and edges, then two dashes.
#'
#' Finally, after two dashes, the name of the graph is printed, if it has one,
#' i.e. if the `name` graph attribute is set.
#'
#' From the second line, the attributes of the graph are listed, separated by a
#' comma. After the attribute names, the kind of the attribute -- graph
#' (\sQuote{`g`}), vertex (\sQuote{`v`}) or edge (\sQuote{`e`})
#' -- is denoted, and the type of the attribute as well, character
#' (\sQuote{`c`}), numeric (\sQuote{`n`}), logical
#' (\sQuote{`l`}), or other (\sQuote{`x`}).
#'
#' As of igraph 0.4 `print_all()` and `print.igraph()` use the
#' `max.print` option, see [base::options()] for details.
#'
#' As of igraph 1.1.1, the `str.igraph` function is defunct, use
#' `print_all()`.
#'
#' Output style is controlled by the `print.style` igraph option. The default
#' `"cli"` produces cli-styled output with section rules, typed attribute
#' listings and Unicode arrows for edges. Set
#' `igraph_options(print.style = "classic")` for the historical
#' `IGRAPH ... DNW-` header relied on by parsers and tutorials.
#'
#' @aliases print.igraph print_all summary.igraph str.igraph
#' @param x The graph to print.
#' @param full Logical scalar, whether to print the graph structure itself as
#'   well.
#' @param graph.attributes Logical constant, whether to print graph attributes.
#' @param vertex.attributes Logical constant, whether to print vertex
#'   attributes.
#' @param edge.attributes Logical constant, whether to print edge attributes.
#' @param names Logical constant, whether to print symbolic vertex names (i.e.
#'   the `name` vertex attribute) or vertex IDs.
#' @param max.lines The maximum number of lines to use. The rest of the
#'   output will be truncated.
#' @param id Whether to print the graph ID.
#' @param object The graph of which the summary will be printed.
#' @param \dots Additional agruments.
#' @return All these functions return the graph invisibly.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @export
#' @method print igraph
#' @rawNamespace export(print.igraph)
#' @family print
#' @keywords graphs
#' @examples
#'
#' g <- make_ring(10)
#' g
#' summary(g)
#'
print.igraph <- function(
  x,
  full = igraph_opt("print.full"),
  graph.attributes = igraph_opt("print.graph.attributes"),
  vertex.attributes = igraph_opt("print.vertex.attributes"),
  edge.attributes = igraph_opt("print.edge.attributes"),
  names = TRUE,
  max.lines = igraph_opt("auto.print.lines"),
  id = igraph_opt("print.id"),
  ...
) {
  ensure_igraph(x)

  if (!is_cli_style()) {
    return(print_igraph_legacy(
      x,
      full = full,
      graph.attributes = graph.attributes,
      vertex.attributes = vertex.attributes,
      edge.attributes = edge.attributes,
      names = names,
      max.lines = max.lines,
      id = id,
      ...
    ))
  }

  print_igraph_cli(
    x,
    full = full,
    graph.attributes = graph.attributes,
    vertex.attributes = vertex.attributes,
    edge.attributes = edge.attributes,
    names = names,
    max.lines = max.lines,
    id = id,
    ...
  )
}

print_igraph_legacy <- function(
  x,
  full = igraph_opt("print.full"),
  graph.attributes = igraph_opt("print.graph.attributes"),
  vertex.attributes = igraph_opt("print.vertex.attributes"),
  edge.attributes = igraph_opt("print.edge.attributes"),
  names = TRUE,
  max.lines = igraph_opt("auto.print.lines"),
  id = igraph_opt("print.id"),
  ...
) {
  head_lines <- .print.header(x, id)
  if (is.logical(full) && full) {
    if (graph.attributes) {
      .print.graph.attributes(x, full, max.lines)
    }
    if (vertex.attributes) {
      .print.vertex.attributes(x, full, max.lines)
    }
    if (ecount(x) == 0) {
      ## Do nothing
    } else if (edge.attributes && length(edge_attr_names(x)) != 0) {
      .print.edges.edgelist(x, names = names)
    } else if (median(degree(x, mode = "out")) < 3) {
      .print.edges.compressed(x, names = names, max.lines = NULL, id = id)
    } else if (is_named(x)) {
      .print.edges.adjlist.named(x)
    } else {
      .print.edges.adjlist(x)
    }
  } else if (full == "auto") {
    .print.edges.compressed(
      x,
      names = names,
      max.lines = max(0, max.lines - head_lines),
      id = id
    )
  }

  invisible(x)
}

#' @rdname print.igraph
#' @method summary igraph
#' @family print
#' @export
summary.igraph <- function(object, ...) {
  if (!is_cli_style()) {
    return(summary_igraph_legacy(object))
  }
  summary_igraph_cli(object)
}

summary_igraph_legacy <- function(object, ...) {
  .print.header(object)
  invisible(object)
}

# cli-styled printing ----------------------------------------------------

# igraph_opt() may return NULL; NULL == "cli" breaks if(), so use identical()
is_cli_style <- function() {
  identical(igraph_opt("print.style"), "cli")
}

# Emit a cli section rule. The leading blank line separates this section from
# the previous one; `blank = FALSE` omits it for the first (header) rule.
cli_section <- function(title, right = NULL, blank = TRUE) {
  rule <- if (is.null(right)) {
    cli::rule(left = title)
  } else {
    cli::rule(left = title, right = right)
  }
  cat(if (blank) "\n", rule, "\n", sep = "")
}

# Print a character vector either in full (`max.lines = NULL`) or truncated to
# `max.lines` with cli's omission footer.
print_cli_lines <- function(x, max.lines, omitted_footer) {
  if (is.null(max.lines)) {
    print(x, quote = FALSE)
  } else {
    head_print(
      x,
      omitted_footer = omitted_footer,
      quote = FALSE,
      max_lines = max.lines
    )
  }
}

# Format edge endpoints as "tail <arrow> head " strings. Endpoints are not
# padded to a common width, so each edge reads with a single space around the
# delimiter; the trailing space yields two spaces between edges once print()
# adds its own single-space separator.
format_cli_edge_endpoints <- function(endpoints, arrow) {
  paste0(endpoints[, 1], " ", arrow, " ", endpoints[, 2], " ")
}

# Leading + interleaved middot separators for a vector of flag labels;
# returns "" when there are no flags (avoids an if/else at the call site).
flag_suffix_cli <- function(flags, middot) {
  paste(c("", flags), collapse = paste0(" ", middot, " "))
}

edge_arrow_cli <- function(directed) {
  if (cli::is_utf8_output()) {
    if (directed) "\u2192" else "\u2500"
  } else {
    if (directed) "->" else "--"
  }
}

middot_cli <- function() {
  if (cli::is_utf8_output()) "\u00b7" else "*"
}

# Bare type label for an attribute mode code; the surrounding `<...>` is added
# by cli's `{.cls}` inline class at the call site.
attr_label_cli <- function(code) {
  switch(
    code,
    c = "chr",
    n = "dbl",
    l = "lgl",
    x = "list",
    code
  )
}

attr_codes_cli <- function(x, kind) {
  if (kind == "graph") {
    .Call(Rx_igraph_get_attr_mode, x, 2L)
  } else if (kind == "vertex") {
    .Call(Rx_igraph_get_attr_mode, x, 3L)
  } else {
    .Call(Rx_igraph_get_attr_mode, x, 4L)
  }
}

print_igraph_header_cli <- function(x, id) {
  name <- if ("name" %in% graph_attr_names(x)) {
    as.character(x$name)[1]
  } else {
    NULL
  }
  title <- if (!is.null(name) && !is.na(name) && nzchar(name)) {
    paste0("<igraph> ", name)
  } else {
    "<igraph>"
  }
  # `id` comes from an option and may be NULL/NA, so guard with isTRUE().
  graph_id_short <- if (isTRUE(id)) substr(graph_id(x), 1, 7) else NA_character_

  # Show the graph id on the right of the rule only when we have one.
  has_id <- !is.na(graph_id_short) && nzchar(graph_id_short)
  cli_section(title, right = if (has_id) graph_id_short, blank = FALSE)

  properties <- c(
    if (is_directed(x)) "directed" else "undirected",
    if (is_named(x)) "named",
    if (is_weighted(x)) "weighted",
    if (is_bipartite(x)) "bipartite"
  )

  middot <- middot_cli()
  sep <- paste0(" ", middot, " ")
  info_symbol <- cli::col_cyan(cli::symbol$info)

  cat(info_symbol, " ", paste(properties, collapse = sep), "\n", sep = "")
  cat(
    info_symbol,
    " ",
    vcount(x),
    " vertices ",
    middot,
    " ",
    ecount(x),
    " edges\n",
    sep = ""
  )
}

print_igraph_attr_summary_cli <- function(x) {
  graph_attrs <- graph_attr_names(x)
  vertex_attrs <- vertex_attr_names(x)
  edge_attrs <- edge_attr_names(x)
  if (
    length(graph_attrs) == 0 &&
      length(vertex_attrs) == 0 &&
      length(edge_attrs) == 0
  ) {
    return(invisible(NULL))
  }

  cli_section("Attributes")
  arrow <- if (cli::is_utf8_output()) "\u2192" else "->"

  # Style names and type codes via cli's semantic classes (`.field`, `.cls`)
  # rather than hand-picked colors, so cli's theme owns the palette and it
  # respects NO_COLOR / non-tty output. `.cls` also supplies the `<...>`.
  format_line <- function(label, names, codes) {
    labels <- vapply(codes, attr_label_cli, character(1))
    parts <- vapply(
      seq_along(names),
      function(i) {
        nm <- names[i]
        lbl <- labels[i]
        cli::format_inline("{.field {nm}} {.cls {lbl}}")
      },
      character(1)
    )
    paste0(arrow, " ", label, paste(parts, collapse = ", "))
  }

  lines <- c(
    if (length(graph_attrs)) {
      format_line("graph:  ", graph_attrs, attr_codes_cli(x, "graph"))
    },
    if (length(vertex_attrs)) {
      format_line("vertex: ", vertex_attrs, attr_codes_cli(x, "vertex"))
    },
    if (length(edge_attrs)) {
      format_line("edge:   ", edge_attrs, attr_codes_cli(x, "edge"))
    }
  )
  # One newline per line, no trailing blank: each section starts with its own
  # leading blank, so emitting one here would double the gap to the next one.
  cat(paste0(lines, "\n"), sep = "")
}

print_igraph_graph_attrs_cli <- function(x) {
  attr_names <- graph_attr_names(x)
  if (length(attr_names) == 0) {
    return(invisible(NULL))
  }
  cli_section("Graph attributes")
  for (attr_name in attr_names) {
    cat(cli::format_inline("{.field {attr_name}}:"), "\n", sep = "")
    indent_print(graph_attr(x, attr_name), .indent = "  ")
  }
}

print_igraph_vertex_attrs_cli <- function(x) {
  if (length(vertex_attr_names(x)) == 0) {
    return(invisible(NULL))
  }
  cli_section("Vertex attributes")
  # reuse classic tabular renderer
  .print.vertex.attributes.old(x, full = TRUE, max.lines = NULL)
}

print_igraph_edges_cli <- function(
  x,
  edges = E(x),
  names = TRUE,
  max.lines = NULL,
  with_attrs = FALSE
) {
  is_named_g <- isTRUE(names) && is_named(x)
  if (
    is_named_g &&
      "name" %in% vertex_attr_names(x) &&
      !is.numeric(vertex_attr(x, "name")) &&
      !is.character(vertex_attr(x, "name")) &&
      !is.logical(vertex_attr(x, "name"))
  ) {
    cli::cli_warn(
      "Can't print vertex names, complex {.val name} vertex attribute."
    )
    is_named_g <- FALSE
  }

  n_edges <- length(edges)
  if (n_edges == 0) {
    return(invisible(NULL))
  }

  title_suffix <- if (is_named_g) " (vertex names)" else ""
  show_attrs <- with_attrs && length(edge_attr_names(x)) != 0
  title <- if (show_attrs) {
    paste0("Edges with attributes", title_suffix)
  } else {
    paste0("Edges", title_suffix)
  }
  cli_section(title)

  arrow <- edge_arrow_cli(is_directed(x))
  endpoints <- ends(x, edges, names = is_named_g)

  if (show_attrs) {
    # Tabular layout: one row per edge, endpoints in an "edge" column
    # followed by one column per (non-name) edge attribute.
    other_attrs <- setdiff(edge_attr_names(x), "name")
    width <- if (is.numeric(endpoints)) {
      nchar(max(endpoints))
    } else {
      max(nchar(endpoints))
    }
    edge_names <- if ("name" %in% edge_attr_names(x)) {
      paste0("'", edge_attr(x, "name"), "'")
    } else {
      seq_len(nrow(endpoints))
    }
    tab <- data.frame(row.names = paste0("[", edge_names, "]"))
    tab[["edge"]] <- paste0(
      format(endpoints[, 1], width = width),
      " ",
      arrow,
      " ",
      format(endpoints[, 2], width = width)
    )
    for (attr_name in other_attrs) {
      tab[[attr_name]] <- edge_attr(x, attr_name)
    }
    print(tab)
  } else {
    formatted <- format_cli_edge_endpoints(endpoints, arrow)
    print_cli_lines(formatted, max.lines, "+ ... omitted several edges\n")
  }
}

print_igraph_cli <- function(
  x,
  full = igraph_opt("print.full"),
  graph.attributes = igraph_opt("print.graph.attributes"),
  vertex.attributes = igraph_opt("print.vertex.attributes"),
  edge.attributes = igraph_opt("print.edge.attributes"),
  names = TRUE,
  max.lines = igraph_opt("auto.print.lines"),
  id = igraph_opt("print.id"),
  ...
) {
  print_igraph_header_cli(x, id)
  print_igraph_attr_summary_cli(x)

  if (isTRUE(full)) {
    if (graph.attributes) {
      print_igraph_graph_attrs_cli(x)
    }
    if (vertex.attributes) {
      print_igraph_vertex_attrs_cli(x)
    }
    if (ecount(x) > 0) {
      if (edge.attributes && length(edge_attr_names(x)) != 0) {
        print_igraph_edges_cli(
          x,
          names = names,
          max.lines = NULL,
          with_attrs = TRUE
        )
      } else {
        print_igraph_edges_cli(x, names = names, max.lines = NULL)
      }
    }
  } else if (identical(full, "auto")) {
    print_igraph_edges_cli(x, names = names, max.lines = max.lines)
  }
  invisible(x)
}

summary_igraph_cli <- function(object) {
  print_igraph_header_cli(object, id = igraph_opt("print.id"))
  print_igraph_attr_summary_cli(object)
  invisible(object)
}

"
####################################################################
## Various designs for printing graphs

## Summary

IGRAPH UNW- 5 5 -- A ring
Attr: name (g/c), name (v/c), weight (e/n)

IGRAPH D-W- 100 200 -- Gnm random graph

## Printing, edge list

IGRAPH-UNW--V5-E5----------------------------------------- A ring -
+ attributes: name (g), name (v), weight (e).
+ edges:
     edge  weight
[1]' a--b       1
[2]' b--c       2
[3]' c--d      -1
[4]' d--e     0.5
[5]' a--e       1

## Compressed edge list

IGRAPH UNW- 5 10 -- A ring
+ attributes: name (g/c), name (v/n), weight (e/n)
+ edges:
[1]' 1--2 2--3 3--4 4--5 1--5 2--5 5--1
[8]' 1--4 4--2 1--3

## This is good if vertices are named

IGRAPH UNW- 10 18 -- Krackhardt kite
+ attributes: name (g/c), name (v/c), weight (e/n)
+ edges:
Andre    -- [1] Beverly, Carol, Diane, Fernando
Beverly  -- [1] Andre, Diane, Ed, Garth
Carol    -- [1] Andre, Diane, Fernando
Diane    -- [1] Andre, Beverly, Carol, Diane, Ed
         -- [6] Garth
Ed       -- [1] Beverly, Diane, Garth
Fernando -- [1] Andre, Carol, Diane, Garth
Garth    -- [1] Beverly, Diane, Ed, Fernando
Heather  -- [1] Fernando, Garth
Ike      -- [1] Heather, Jane
Jane     -- [1] Ike

IGRAPH UNW- 10 18 -- Krackhardt kite
+ attributes: name (g/c), name (v/c), weight (e/n)
+ edges:
Andre    -- Beverly, Carol, Diane, Fernando
Beverly  -- Andre, Diane, Ed, Garth
Carol    -- Andre, Diane, Fernando
Diane    -- Andre, Beverly, Carol, Diane, Ed, Garth
Ed       -- Beverly, Diane, Garth
Fernando -- Andre, Carol, Diane, Garth
Garth    -- Beverly, Diane, Ed, Fernando
Heather  -- Fernando, Garth
Ike      -- Heather, Jane
Jane     -- Ike

## This is the good one if vertices are not named

IGRAPH U--- 100 200 -- Gnm random graph
+ edges:
[  1] 28 46 89 90                 [  2] 47 69 72 89
[  3] 29                          [  4] 17 20
[  5] 11 40 42 51 78 89           [  6] 27 32 70 87 93
[  7] 18 27 87                    [  8] 18 24 82
[  9] 18 20 85 94                 [ 10] 24 70 77 91
[ 11]  5 12 34 61 62              [ 12] 11 41 44 61 65 80
...

## Alternative designs, summary

IGRAPH-UNW--V5-E5,---------------------------------------- A ring -
+ attributes: name (g/c), name (v/c), weight (e/n)

IGRAPH. |V|=5, |E|=5, undirected, named, weighted.
Attributes: name (g/c), name (v/c), weight (e/n)

IGRAPH: 'A ring'
Graph attributes: |V|=5, |E|=5, undirected, name.
Vertex attributes: name.
Edge attributes: weight.

## Alternative designs, printing

IGRAPH-UNW--V5-E5----------------------------------------- A ring -
'- attributes: name (g), name (v), weight (e).
'         edge  weight
[1] 'a' -- 'b'       1
[2] 'b' -- 'c'       2
[3] 'c' -- 'd'      -1
[4] 'd' -- 'e'     0.5
[5] 'a' -- 'e'       1

IGRAPH-UNW--V-5-E-10-------------------------------------- A ring -
|- attributes: name (g), name (v), weight (e).
|- edges:
[1] 'a'--'b'  'b'--'c'  'c'--'d'  'd'--'e'  'a'--'e'  'b'-'e'
[7] 'e'--'a'  'a'--'d'  'd'--'b'  'a'--'c'


IGRAPH-UNW--V-5-E-10-------------------------------------- A ring -
+ attributes: name (g), name (v), weight (e).
+ vertices:
|     name
| [1]    a
| [2]    b
| [3]    c
| [4]    d
| [5]    e
+ edges:
[1] 'a'--'b'  'b'--'c'  'c'--'d'  'd'--'e'  'a'--'e'  'b'-'e'
[7] 'e'--'a'  'a'--'d'  'd'--'b'  'a'--'c'




IGRAPH-UNW--V-5-E-10-------------------------------------- A ring -
+ graph attributes: name
+ vertex attributes: name
+ edge attributes: weight
+ vertices:
|   name
|1]    a
|2]    b
|3]    c
|4]    d
|5]    e
+ edges:
|1] a--b  b--c  c--d  d--e  a--e  b-e
|7] e--a  a--d  d--b  a--c



IGRAPH-UNW--V-5-E-10-------------------------------------- A ring -
+ graph attributes:  name (c)
+ vertex attributes: name (c)
+ edge attributes:   weight (n)
+ edges:
[1] a--b  b--c  c--d  d--e  a--e  b-e
[7] e--a  a--d  d--b  a--c


IGRAPH-UNW--V-5-E-10-------------------------------------- A ring -
+ attributes: name (g/c), name (v/c), weight (e/n)
+ edges:
[ 1] a--b b--c c--d d--e a--e b--e e--a a--d d--b
[10] a--c

IGRAPH-DNW--V-5-E-10-------------------------------------- A ring -
+ attributes: name (g/c), name (v/n), weight (e/n)
+ edges:
[1]' 1->2 2->3 3->4 4->5 1->5 2->5 5->1
[8]' 1->4 4->2 1->3


IGRAPH-UNW--V-5-E-20-------------------------------------- A ring -
+ attributes: name (g/c), name (v/c), weight (e/n)
+ edges:
[ 1] a-b b-c c-d d-e a-e b-e e-a a-d d-b a-c
[11] a-b b-c c-d d-e a-e b-e e-a a-d d-b a-c


IGRAPH-UNW--V-8-E-10-------------------------------------- A ring -
+ attributes: name (g/c), name (v/c), weight (e/n)
+ edges:
[a] b c e f h
[b] a c e
[c] a b d
[d] a b c h
[e] a b d
[f] a
[g]
[h] a d

IGRAPH-UNW--V-10-E-18------------------------------------- A ring -
+ attributes: name (g/c), name (v/c), weight (e/n)
+ edges:
[a] a--{b,c,e,f,h}  b--{a,c,e}  c--{a,b,d}  d--{a,b,c,h}
[e] e--{a,b,d}      f--{a}      g--{}       h--{a,d}


IGRAPH-UNW--V10-E18------------------------------Krackhardt kite--
+ attributes: name (g/c), name (v/c), weight (e/n)
+ edges:
[   Andre][1] Beverly  Carol    Diane    Fernando
[ Beverly][1] Andre    Diane    Ed       Garth
[   Carol][1] Andre    Diane    Fernando
[   Diane][1] Andre    Beverly  Carol    Diane    Ed
[   Diane][6] Garth
[      Ed][1] Beverly  Diane    Garth
[Fernando][1] Andre    Carol    Diane    Garth
[   Garth][1] Beverly  Diane    Ed       Fernando
[ Heather][1] Fernando Garth
[     Ike][1] Heather  Jane
[    Jane][1] Ike

IGRAPH-UNW--V10-E18-------------------------------Krackhardt kite--
+ attributes: name (g/c), name (v/c), weight (e/n)
+ edges:
[   Andre][1] Beverly/1  Carol/3    Diane/3    Fernando/1
[ Beverly][1] Andre/1    Diane/1    Ed/2       Garth/2
[   Carol][1] Andre/2    Diane/2    Fernando/1
[   Diane][1] Andre/5    Beverly/1  Carol/0.4  Diane/2
[   Diane][5] Ed/1.5     Garth/2.5
[      Ed][1] Beverly/-1 Diane/1.5  Garth/2
[Fernando][1] Andre/1    Carol/2    Diane/1    Garth/1
[   Garth][1] Beverly/2  Diane/3    Ed/1       Fernando/-1
[ Heather][1] Fernando/3 Garth/1
[     Ike][1] Heather/1  Jane/-1
[    Jane][1] Ike/-2


IGRAPH-UNW--V10-E18-------------------------------Krackhardt kite--
+ attributes: name (g/c), name (v/c), weight (e/n)
+ edges:
[   Andre][1] Beverly (1)  Carol (3)    Diane (3)    Fernando (1)
[ Beverly][1] Andre (1)    Diane (1)    Ed (2)       Garth (2)
[   Carol][1] Andre (2)    Diane (2)    Fernando (1)
[   Diane][1] Andre (5)    Beverly (1)  Carol (0.5)  Diane (2)
[   Diane][5] Ed (1.5)     Garth (2.5)
[      Ed][1] Beverly (-1) Diane (1.5)  Garth (2)
[Fernando][1] Andre (1)    Carol (2)    Diane (1)    Garth (1)
[   Garth][1] Beverly (2)  Diane (3)    Ed (1)       Fernando (-1)
[ Heather][1] Fernando (3) Garth (1)
[     Ike][1] Heather (1)  Jane (-1)
[    Jane][1] Ike (-2)

IGRAPH UNW- V10 E18 -- Krackhardt kite
+ attr: name (g/c), name (v/c), weight (e/n)
+ edges:
[   Andre][1] Beverly (1)  Carol (3)    Diane (3)    Fernando (1)
[ Beverly][1] Andre (1)    Diane (1)    Ed (2)       Garth (2)
[   Carol][1] Andre (2)    Diane (2)    Fernando (1)
[   Diane][1] Andre (5)    Beverly (1)  Carol (0.5)  Diane (2)
[   Diane][5] Ed (1.5)     Garth (2.5)
[      Ed][1] Beverly (-1) Diane (1.5)  Garth (2)
[Fernando][1] Andre (1)    Carol (2)    Diane (1)    Garth (1)
[   Garth][1] Beverly (2)  Diane (3)    Ed (1)       Fernando (-1)
[ Heather][1] Fernando (3) Garth (1)
[     Ike][1] Heather (1)  Jane (-1)
[    Jane][1] Ike (-2)



IGRAPH-U----V100-E200----------------------------Gnm random graph--
+ edges:
[  1] 28 46 89 90
[  2] 47 69 72 89
[  3] 29
[  4] 17 20
[  5] 11 40 42 51 78 89
[  6] 27 32 70 87 93
[  7] 18 27 87
[  8] 18 24 82
[  9] 18 20 85 94
[ 10] 24 70 77 91
[ 11]  5 12 34 61 62
[ 12] 11 41 44 61 65 80
...

IGRAPH-U----100-200------------------------------Gnm random graph--
+ edges:
[  1] 28 46 89 90                 [  2] 47 69 72 89
[  3] 29                          [  4] 17 20
[  5] 11 40 42 51 78 89           [  6] 27 32 70 87 93
[  7] 18 27 87                    [  8] 18 24 82
[  9] 18 20 85 94                 [ 10] 24 70 77 91
[ 11]  5 12 34 61 62              [ 12] 11 41 44 61 65 80
...



"
