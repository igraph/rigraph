
#' Writing the graph to a file in some format
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `write.graph()` was renamed to `write_graph()` to create a more
#' consistent API.
#' @inheritParams write_graph
#' @keywords internal
#' @export
write.graph <- function(graph, file, format = c("edgelist", "pajek", "ncol", "lgl", "graphml", "dimacs", "gml", "dot", "leda"), ...) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "write.graph()", "write_graph()")
  write_graph(graph = graph, file = file, format = format, ...)
} # nocov end

#' Reading foreign file formats
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `read.graph()` was renamed to `read_graph()` to create a more
#' consistent API.
#' @inheritParams read_graph
#' @keywords internal
#' @export
read.graph <- function(file, format = c("edgelist", "pajek", "ncol", "lgl", "graphml", "dimacs", "graphdb", "gml", "dl"), ...) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "read.graph()", "read_graph()")
  read_graph(file = file, format = format, ...)
} # nocov end

#' Load a graph from the graph database for testing graph isomorphism.
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `graph.graphdb()` was renamed to `graph_from_graphdb()` to create a more
#' consistent API.
#' @inheritParams graph_from_graphdb
#' @keywords internal
#' @export
graph.graphdb <- function(url = NULL, prefix = "iso", type = "r001", nodes = NULL, pair = "A", which = 0, base = "http://cneurocvs.rmki.kfki.hu/graphdb/gzip", compressed = TRUE, directed = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "graph.graphdb()", "graph_from_graphdb()")
  graph_from_graphdb(url = url, prefix = prefix, type = type, nodes = nodes, pair = pair, which = which, base = base, compressed = compressed, directed = directed)
} # nocov end
#   IGraph R package
#   Copyright (C) 2005-2012  Gabor Csardi <csardi.gabor@gmail.com>
#   334 Harvard street, Cambridge, MA 02139 USA
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
#   02110-1301 USA
#
###################################################################

###################################################################
# Reading foreign file formats
###################################################################

read.graph.toraw <- function(filename) {
  if (is.character(filename)) {
    filename <- file(filename, open = "rb")
  }
  if (!isOpen(filename)) {
    open(filename, open = "rb")
  }

  tmpbufsize <- 20000
  buffer <- tmpbuffer <- readBin(filename, what = raw(0), n = tmpbufsize)
  while (length(tmpbuffer) == tmpbufsize) {
    tmpbuffer <- readBin(filename, what = raw(0), n = tmpbufsize)
    buffer <- c(buffer, tmpbuffer)
  }
  close(filename)
  rm(tmpbuffer)

  buffer
}

write.graph.fromraw <- function(buffer, file) {
  closeit <- FALSE
  if (is.character(file)) {
    file <- file(file, open = "w+b")
    closeit <- TRUE
  }

  if (!isOpen(file)) {
    file <- open(file)
    closeit <- TRUE
  }

  writeBin(buffer, file)

  if (closeit) {
    close(file)
  }

  invisible(NULL)
}



#' Reading foreign file formats
#'
#' The `read_graph()` function is able to read graphs in various
#' representations from a file, or from a http connection. Various formats
#' are supported.
#'
#' The `read_graph()` function may have additional arguments depending on
#' the file format (the `format` argument). See the details separately for
#' each file format, below.
#'
#' @aliases LGL Pajek GraphML GML DL UCINET
#' @param file The connection to read from. This can be a local file, or a
#'   `http` or `ftp` connection. It can also be a character string with
#'   the file name or URI.
#' @param format Character constant giving the file format. Right now
#'   `edgelist`, `pajek`, `ncol`, `lgl`, `graphml`,
#'   `dimacs`, `graphdb`, `gml` and `dl` are supported,
#'   the default is `edgelist`. As of igraph 0.4 this argument is case
#'   insensitive.
#' @param \dots Additional arguments, see below.
#' @return A graph object.
#' @section Edge list format:
#' This format is a simple text file with numeric
#' vertex IDs defining the edges. There is no need to have newline characters
#' between the edges, a simple space will also do. Vertex IDs contained in
#' the file are assumed to start at zero.
#'
#' Additional arguments: \describe{ \item{n}{The number of vertices in the
#' graph. If it is smaller than or equal to the largest integer in the file,
#' then it is ignored; so it is safe to set it to zero (the default).}
#' \item{directed}{Logical scalar, whether to create a directed graph. The
#' default value is `TRUE`.} }
#' @section Pajek format:
#' Currently igraph only supports Pajek network
#' files, with a `.net` extension, but not Pajek project files with
#' a `.paj` extension. Only network data is supported; permutations,
#' hierarchies, clusters and vectors are not.
#' @section NCOL format:
#' Additional arguments: \describe{
#' \item{predef}{Names of the vertices in the file.
#' If `character(0)` (the default) is given here
#' then vertex IDs will be assigned to vertex names in the order of
#' their appearance in the .ncol file.
#' If it is not `character(0)` and some unknown vertex names are found
#' in the .ncol file then new vertex ids will be assigned to them. }
#' \item{names}{Logical value, if `TRUE` (the default)
#' the symbolic names of the vertices will be added to the graph
#' as a vertex attribute called “name”. }
#' \item{weights}{Whether to add the weights of the edges to the graph
#' as an edge attribute called “weight”.
#' `"yes"` adds the weights (even if they are not present in the file,
#' in this case they are assumed to be zero).
#' `"no"` does not add any edge attribute.
#' `"auto"` (the default) adds the attribute if and only
#' if there is at least one explicit edge weight in the input file. }
#' \item{directed}{Whether to create a directed graph (default: `FALSE`).
#' As this format was originally used only for undirected graphs
#' there is no information in the file about the directedness of the graph.}
#' }
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [write_graph()]
#' @keywords graphs
#' @family foreign
#' @export
#' @cdocs igraph_read_graph_dimacs_flow igraph_read_graph_dl igraph_read_graph_edgelist
#' @cdocs igraph_read_graph_gml igraph_read_graph_graphdb igraph_read_graph_graphml
#' @cdocs igraph_read_graph_lgl igraph_read_graph_ncol igraph_read_graph_pajek
read_graph <- function(file, format = c(
                         "edgelist", "pajek", "ncol", "lgl",
                         "graphml", "dimacs", "graphdb", "gml", "dl"
                       ),
                       ...) {
  if (!is.character(file) || length(grep("://", file, fixed = TRUE)) > 0 ||
    length(grep("~", file, fixed = TRUE)) > 0) {
    buffer <- read.graph.toraw(file)
    file <- tempfile()
    write.graph.fromraw(buffer, file)
  }

  format <- igraph.match.arg(format)
  res <- switch(format,
    "pajek" = read.graph.pajek(file, ...),
    "ncol" = read.graph.ncol(file, ...),
    "edgelist" = read.graph.edgelist(file, ...),
    "lgl" = read.graph.lgl(file, ...),
    "graphml" = read.graph.graphml(file, ...),
    "dimacs" = read.graph.dimacs(file, ...),
    "graphdb" = read.graph.graphdb(file, ...),
    "gml" = read.graph.gml(file, ...),
    "dl" = read.graph.dl(file, ...),
    stop(paste("Unknown file format:", format))
  )
  res
}



#' Writing the graph to a file in some format
#'
#' `write_graph()` is a general function for exporting graphs to foreign
#' file formats. The recommended formats for data exchange are GraphML and GML.
#'
#' @param graph The graph to export.
#' @param file A connection or a string giving the file name to write the graph
#'   to.
#' @param format Character string giving the file format. Right now
#'   `pajek`, `graphml`, `dot`, `gml`, `edgelist`,
#'   `lgl`, `ncol`, `leda` and `dimacs` are implemented. As of igraph 0.4
#'   this argument is case insensitive.
#' @param \dots Other, format specific arguments, see below.
#' @return A `NULL``, invisibly.
#' @section Edge list format: The `edgelist` format is a simple text file,
#' with one edge per line, the two zero-based numerical vertex IDs separated
#' by a space character. Note that vertices are indexed starting with zero.
#' The file is sorted by the first and the second column. This format has no
#' additional arguments.
#' @section NCOL format: This format is a plain text edge list in which vertices
#' are referred to by name rather than numerical ID. Edge weights may be
#' optionally written. Additional parameters:
#' \describe{
#' \item{names}{The name of a vertex attribute to take vertex names from or
#' `NULL` to use zero-based numerical IDs.}
#' \item{weights}{The name of an edge attribute to take edge weights from or
#' `NULL` to omit edge weights.}
#' }
#' @section Pajek format: The `pajek` format is provided for interoperability
#' with the Pajek software only. Since the format does not have a formal
#' specification, it is not recommended for general data exchange or archival.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [read_graph()]
#' @references Adai AT, Date SV, Wieland S, Marcotte EM. LGL: creating a map of
#' protein function with an algorithm for visualizing very large biological
#' networks. *J Mol Biol.* 2004 Jun 25;340(1):179-90.
#' @family foreign
#' @export
#' @keywords graphs
#' @cdocs igraph_write_graph_dimacs_flow igraph_write_graph_dot igraph_write_graph_edgelist
#' @cdocs igraph_write_graph_gml igraph_write_graph_graphml igraph_write_graph_leda
#' @cdocs igraph_write_graph_lgl igraph_write_graph_ncol igraph_write_graph_pajek
#' @examples
#'
#' g <- make_ring(10)
#' file <- tempfile(fileext = ".txt")
#' write_graph(g, file, "edgelist")
#' if (!interactive()) {
#'   unlink(file)
#' }
#'
write_graph <- function(graph, file,
                        format = c(
                          "edgelist", "pajek", "ncol", "lgl",
                          "graphml", "dimacs", "gml", "dot", "leda"
                        ),
                        ...) {
  ensure_igraph(graph)
  if (!is.character(file) || length(grep("://", file, fixed = TRUE)) > 0 ||
    length(grep("~", file, fixed = TRUE)) > 0) {
    tmpfile <- TRUE
    origfile <- file
    file <- tempfile()
  } else {
    tmpfile <- FALSE
  }

  format <- igraph.match.arg(format)
  res <- switch(format,
    "pajek" = write.graph.pajek(graph, file, ...),
    "edgelist" = write.graph.edgelist(graph, file, ...),
    "ncol" = write.graph.ncol(graph, file, ...),
    "lgl" = write.graph.lgl(graph, file, ...),
    "graphml" = write.graph.graphml(graph, file, ...),
    "dimacs" = write.graph.dimacs(graph, file, ...),
    "gml" = write.graph.gml(graph, file, ...),
    "dot" = write.graph.dot(graph, file, ...),
    "leda" = write.graph.leda(graph, file, ...),
    stop(paste("Unknown file format:", format))
  )

  if (tmpfile) {
    buffer <- read.graph.toraw(file)
    write.graph.fromraw(buffer, origfile)
  }

  invisible(res)
}

################################################################
# Plain edge list format, not sorted
################################################################

read.graph.edgelist <- function(file, n = 0,
                                directed = TRUE, ...) {
  if (length(list(...)) > 0) {
    stop("Unknown arguments to read_graph (edgelist format)")
  }
  on.exit(.Call(R_igraph_finalizer))
  .Call(
    R_igraph_read_graph_edgelist, file,
    as.numeric(n), as.logical(directed)
  )
}

write.graph.edgelist <- function(graph, file, ...) {
  if (length(list(...)) > 0) {
    stop("Unknown arguments to write_graph (edgelist format)")
  }
  on.exit(.Call(R_igraph_finalizer))
  .Call(R_igraph_write_graph_edgelist, graph, file)
}

################################################################
# NCOL and LGL formats, quite simple
################################################################

read.graph.ncol <- function(file, predef = character(0), names = TRUE,
                            weights = c("auto", "yes", "no"),
                            directed = FALSE, ...) {
  if (length(list(...)) > 0) {
    stop("Unknown arguments to read_graph (NCOL format)")
  }
  weights <- switch(igraph.match.arg(weights),
    "no" = 0L,
    "yes" = 1L,
    "auto" = 2L
  )
  on.exit(.Call(R_igraph_finalizer))
  .Call(
    R_igraph_read_graph_ncol, file, as.character(predef),
    as.logical(names), weights, as.logical(directed)
  )
}

write.graph.ncol <- function(graph, file,
                             names = "name", weights = "weight", ...) {
  if (length(list(...)) > 0) {
    stop("Unknown arguments to write_graph (NCOL format)")
  }
  names <- as.character(names)
  weights <- as.character(weights)
  if (length(names) == 0 || !names %in% vertex_attr_names(graph)) {
    names <- NULL
  }
  if (length(weights) == 0 || !weights %in% edge_attr_names(graph)) {
    weights <- NULL
  }

  on.exit(.Call(R_igraph_finalizer))
  .Call(
    R_igraph_write_graph_ncol, graph, file,
    names, weights
  )
}

read.graph.lgl <- function(file, names = TRUE,
                           weights = c("auto", "yes", "no"),
                           directed = FALSE,
                           ...) {
  if (length(list(...)) > 0) {
    stop("Unknown arguments to read_graph (LGL format)")
  }
  weights <- switch(igraph.match.arg(weights),
    "no" = 0L,
    "yes" = 1L,
    "auto" = 2L
  )
  on.exit(.Call(R_igraph_finalizer))
  .Call(
    R_igraph_read_graph_lgl, file,
    as.logical(names), weights, as.logical(directed)
  )
}

write.graph.lgl <- function(graph, file,
                            names = "name", weights = "weight",
                            isolates = FALSE, ...) {
  if (length(list(...)) > 0) {
    stop("Unknown arguments to write_graph (LGL format)")
  }
  names <- as.character(names)
  weights <- as.character(weights)
  if (length(names) == 0 || !names %in% vertex_attr_names(graph)) {
    names <- NULL
  }
  if (length(weights) == 0 || !weights %in% edge_attr_names(graph)) {
    weights <- NULL
  }

  on.exit(.Call(R_igraph_finalizer))
  .Call(
    R_igraph_write_graph_lgl, graph, file,
    names, weights, as.logical(isolates)
  )
}

read.graph.pajek <- function(file, ...) {
  if (length(list(...)) > 0) {
    stop("Unknown arguments to read_graph (Pajek format)")
  }
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(R_igraph_read_graph_pajek, file)
  if ("type" %in% vertex_attr_names(res)) {
    type <- as.logical(V(res)$type)
    res <- delete_vertex_attr(res, "type")
    res <- set_vertex_attr(res, "type", value = type)
  }
  res
}

write.graph.pajek <- function(graph, file, ...) {
  if (length(list(...)) > 0) {
    stop("Unknown arguments to write_graph (Pajek format)")
  }
  on.exit(.Call(R_igraph_finalizer))
  .Call(R_igraph_write_graph_pajek, graph, file)
}

read.graph.dimacs <- function(file, directed = TRUE, ...) {
  if (length(list(...)) > 0) {
    stop("Unknown arguments to read_graph (DIMACS format)")
  }
  res <- .Call(R_igraph_read_graph_dimacs, file, as.logical(directed))
  if (res[[1]][1] == "max") {
    graph <- res[[2]]
    graph <- set_graph_attr(graph, "problem", res[[1]])
    graph <- set_graph_attr(graph, "source", res[[3]])
    graph <- set_graph_attr(graph, "target", res[[4]])
    E(graph)$capacity <- res[[5]]
    graph
  } else if (res[[1]][1] == "edge") {
    graph <- res[[2]]
    graph <- set_graph_attr(graph, "problem", res[[1]])
    V(graph)$label <- res[[3]]
    graph
  }
}

write.graph.dimacs <- function(graph, file,
                               source = NULL, target = NULL, capacity = NULL, ...) {
  if (length(list(...)) > 0) {
    stop("Unknown arguments to write_graph (DIMACS format)")
  }
  if (is.null(source)) {
    source <- graph_attr(graph, "source")
  }
  if (is.null(target)) {
    target <- graph_attr(graph, "target")
  }
  if (is.null(capacity)) {
    capacity <- E(graph)$capacity
  }

  on.exit(.Call(R_igraph_finalizer))
  .Call(
    R_igraph_write_graph_dimacs, graph, file, as.numeric(source),
    as.numeric(target), as.numeric(capacity)
  )
}

################################################################
# GraphML
################################################################

read.graph.graphml <- function(file, index = 0, ...) {
  if (length(list(...)) > 0) {
    stop("Unknown arguments to read_graph (GraphML format)")
  }
  on.exit(.Call(R_igraph_finalizer))
  .Call(R_igraph_read_graph_graphml, file, as.numeric(index))
}

write.graph.graphml <- function(graph, file, prefixAttr = TRUE, ...) {
  if (length(list(...)) > 0) {
    stop("Unknown arguments to write_graph (GraphML format)")
  }
  on.exit(.Call(R_igraph_finalizer))
  .Call(R_igraph_write_graph_graphml, graph, file, as.logical(prefixAttr))
}

################################################################
# GML
################################################################

read.graph.gml <- function(file, ...) {
  if (length(list(...)) > 0) {
    stop("Unknown arguments to read_graph (GML format)")
  }
  on.exit(.Call(R_igraph_finalizer))
  .Call(R_igraph_read_graph_gml, file)
}

write.graph.gml <- function(graph, file, id = NULL, creator = NULL, ...) {
  if (length(list(...)) > 0) {
    stop("Unknown arguments to write_graph (GML format)")
  }
  if (!is.null(id)) {
    id <- as.numeric(id)
  }
  if (!is.null(creator)) {
    creator <- as.character(creator)
  }
  on.exit(.Call(R_igraph_finalizer))
  .Call(R_igraph_write_graph_gml, graph, file, id, creator)
}

################################################################
# UCINET DL
################################################################

read.graph.dl <- function(file, directed = TRUE, ...) {
  if (length(list(...)) > 0) {
    stop("Unknown arguments to read_graph (DL format)")
  }
  on.exit(.Call(R_igraph_finalizer))
  .Call(R_igraph_read_graph_dl, file, as.logical(directed))
}

################################################################
# Dot
################################################################

write.graph.dot <- function(graph, file, ...) {
  if (length(list(...)) > 0) {
    stop("Unknown arguments to write_graph (DOT format)")
  }
  on.exit(.Call(R_igraph_finalizer))
  .Call(R_igraph_write_graph_dot, graph, file)
}

################################################################
# Download a file from the graph database for
# isomorphic problems
################################################################



#' Load a graph from the graph database for testing graph isomorphism.
#'
#' This function downloads a graph from a database created for the evaluation
#' of graph isomorphism testing algothitms.
#'
#' `graph_from_graphdb()` reads a graph from the graph database from an FTP or
#' HTTP server or from a local copy. It has two modes of operation:
#'
#' If the `url` argument is specified then it should the complete path to
#' a local or remote graph database file. In this case we simply call
#' [read_graph()] with the proper arguments to read the file.
#'
#' If `url` is `NULL`, and this is the default, then the filename is
#' assembled from the `base`, `prefix`, `type`, `nodes`,
#' `pair` and `which` arguments.
#'
#' Unfortunately the original graph database homepage is now defunct, but see
#' its old version at
#' <http://web.archive.org/web/20090215182331/http://amalfi.dis.unina.it/graph/db/doc/graphdbat.html>
#' for the actual format of a graph database file and other information.
#'
#' @param url If not `NULL` it is a complete URL with the file to import.
#' @param prefix Gives the prefix. See details below. Possible values:
#'   `iso`, `i2`, `si4`, `si6`, `mcs10`, `mcs30`,
#'   `mcs50`, `mcs70`, `mcs90`.
#' @param type Gives the graph type identifier. See details below. Possible
#'   values: `r001`, `r005`, `r01`, `r02`, `m2D`,
#'   `m2Dr2`, `m2Dr4`, `m2Dr6` `m3D`, `m3Dr2`,
#'   `m3Dr4`, `m3Dr6`, `m4D`, `m4Dr2`, `m4Dr4`,
#'   `m4Dr6`, `b03`, `b03m`, `b06`, `b06m`, `b09`,
#'   `b09m`.
#' @param nodes The number of vertices in the graph.
#' @param pair Specifies which graph of the pair to read. Possible values:
#'   `A` and `B`.
#' @param which Gives the number of the graph to read. For every graph type
#'   there are a number of actual graphs in the database. This argument specifies
#'   which one to read.
#' @param base The base address of the database. See details below.
#' @param compressed Logical constant, if TRUE than the file is expected to be
#'   compressed by gzip. If `url` is `NULL` then a \sQuote{`.gz`}
#'   suffix is added to the filename.
#' @param directed Logical constant, whether to create a directed graph.
#' @return A new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [read_graph()], [isomorphic()]
#' @references M. De Santo, P. Foggia, C. Sansone, M. Vento: A large database
#' of graphs and its use for benchmarking graph isomorphism algorithms,
#' *Pattern Recognition Letters*, Volume 24, Issue 8 (May 2003)
#' @family foreign
#' @export
#' @keywords graphs
graph_from_graphdb <- function(url = NULL,
                               prefix = "iso", type = "r001", nodes = NULL, pair = "A", which = 0,
                               base = "http://cneurocvs.rmki.kfki.hu/graphdb/gzip",
                               compressed = TRUE, directed = TRUE) {
  if (is.null(nodes) && is.null(url)) {
    stop("The `nodes' or the `url' argument must be non-null")
  }

  if (is.null(url)) {
    prefixes <- c("iso", "si6", "mcs10", "mcs30", "mcs50", "mcs70", "mcs90")
    types <- c(
      "r001", "r005", "r01", "r02", "m2D", "m2Dr2", "m2Dr4", "m2Dr6",
      "m3D", "m3Dr2", "m3Dr4", "m3Dr6", "m4D", "m4Dr2", "m4Dr4",
      "m4Dr6", "b03", "b03m", "b06", "b06m", "b09", "b09m"
    )
    sizecode <- if (nodes <= 100) "s" else if (nodes < 2000) "m" else "l" # "l" ????
    typegroups <- c(
      "rand", "rand", "rand", "rand",
      "m2D", "m2D", "m2D", "m2D",
      "m2D", "m3D", "m3D", "m3D",
      "m4D", "m4D", "m4D", "m4D",
      "bvg", "bvg", "bvg", "bvg", "bvg", "bvg"
    )
    typegroup <- typegroups[which(types == type)]

    if (!prefix %in% prefixes) {
      stop("Invalid prefix!")
    }
    if (!type %in% types) {
      stop("Invalid graph type!")
    }
    suff <- if (compressed) ".gz" else ""
    filename <- paste(
      sep = "", base, "/", prefix, "/", typegroup, "/", type, "/",
      prefix, "_", type, "_", sizecode, nodes,
      ".", pair, formatC(which, width = 2, flag = "0"), suff
    )
  } else {
    filename <- url
  }

  ## ok, we have the filename

  f <- try(gzcon(file(filename, open = "rb")))
  if (inherits(f, "try-error")) {
    stop(paste("Cannot open URL:", filename))
  }

  buffer <- read.graph.toraw(f)
  f <- tempfile()
  write.graph.fromraw(buffer, f)

  .Call(R_igraph_read_graph_graphdb, f, as.logical(directed))
}

read.graph.graphdb <- function(file, directed = TRUE, ...) {
  if (length(list(...)) > 0) {
    stop("Unknown arguments to read_graph (GraphDB format)")
  }
  on.exit(.Call(R_igraph_finalizer))
  .Call(R_igraph_read_graph_graphdb, file, as.logical(directed))
}

write.graph.leda <- function(graph, file, vertex.attr = NULL, edge.attr = NULL,
                             ...) {
  if (length(list(...)) > 0) {
    stop("Unknown arguments to write_graph (LEDA format)")
  }
  if (!is.null(vertex.attr)) {
    vertex.attr <- as.character(vertex.attr)
  }
  if (!is.null(edge.attr)) {
    edge.attr <- as.character(edge.attr)
  }
  on.exit(.Call(R_igraph_finalizer))
  .Call(R_igraph_write_graph_leda, graph, file, vertex.attr, edge.attr)
}
