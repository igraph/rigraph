
#   IGraph R package
#   Copyright (C) 2011-2012  Gabor Csardi <csardi.gabor@gmail.com>
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

makeNexusDatasetInfo <- function(entries) {
  dsi <- lapply(entries, "[", 2)
  nam <- sapply(entries, "[", 1)

  attr <- nam=="attribute"
  myattr <- unlist(dsi[attr])
  dsi <- dsi[!attr]
  nam <- nam[!attr]
  names(dsi) <- nam
  class(dsi) <- "nexusDatasetInfo"

  if (length(myattr) != 0) {
    myattr <- strsplit(myattr, "\n", fixed=TRUE)
    attrdat <- lapply(myattr, function(x) strsplit(x[1], " ")[[1]])
    myattr <- sapply(myattr, "[", 2)
    dsi$attributes <- mapply(attrdat, myattr, SIMPLIFY=FALSE,
                             FUN=function(dat, desc) {
                               list(type=dat[1], datatype=dat[2], name=dat[3],
                                    description=desc)
                             })
  }
  
  dsi$id <- as.numeric(dsi$id)
  dsi$tags <- strsplit(dsi$tags, ";", fixed=TRUE)[[1]]
  
  dsi
}

#' @method print nexusDatasetInfo
#' @rdname nexus

print.nexusDatasetInfo <- function(x, ...) {
  ve <- strsplit(parseVE(x$`vertices/edges`), "/")[[1]]
  nc <- c("U", "-", "-", "-")
  if ("directed" %in% x$tags && "undirected" %in% x$tags) {
    nc[1] <- "B"
  } else if ("directed" %in% x$tags) {
    nc[1] <- "D"
  }
  if (is.null(x$attributes)) {
    nc[2] <- "?"
  } else if (any(sapply(x$attributes,
                        function(X) X$name=="name" && X$type=="vertex"))) {
    nc[2] <- "N"
  } 
  if ("weighted" %in% x$tags) {
    nc[3] <- "W"
  }
  if ("bipartite" %in% x$tags) {
    nc[4] <- "B"
  }
  nc <- paste(nc, collapse="")
  head <- paste(sep="", "NEXUS ", nc, " ", ve[1], " ", ve[2], " #",
                x$id, " ", x$sid, " -- ", x$name)
  if (nchar(head) > getOption("width")) {
    head <- paste(sep="", substr(head, 1, getOption("width")-1), "+")
  }
  cat(head, sep="", "\n")
  if (length(x$tags) != 0) {
    tt <- strwrap(paste(sep="", "+ tags: ", paste(x$tags, collapse="; ")),
                  initial="", prefix="  ")
    cat(tt, sep="\n")
  }
  if ("networks" %in% names(x)) {
    nets <- strsplit(x$networks, " ")[[1]]
    nn <- strwrap(paste(sep="", "+ nets: ", paste(nets, collapse="; ")),
                  initial="", prefix="  ")
    cat(nn, sep="\n")
  }
  attr <- x[["attributes"]]
  printed <- c("id", "sid", "vertices/edges", "name", "tags", "networks",
               "attributes")
  x <- x[ setdiff(names(x), printed) ]
  if (length(attr)>0) {
    dcode <- function(d) {
      if (d=="numeric") return("n")
      if (d=="string") return("c")
      "x"
    }
    cat("+ attr: ")
    astr <- sapply(attr, function(a) {
      paste(sep="", a$name, " (", substr(a$type, 1, 1), "/",
            dcode(a$datatype), ")")
    })
    cat(strwrap(paste(astr, collapse=", "), exdent=2), "\n")
  }
  for (i in names(x)) {
    xx <- strsplit(x[[i]], "\n")[[1]]
    ff <- strwrap(paste(sep="", "+ ", i, ": ", xx[1]), initial="",
                  prefix="  ")
    xx <- unlist(sapply(xx[-1], strwrap, prefix="  "))
    cat(ff, sep="\n")
    if (length(xx)>0) {
      cat(xx, sep="\n")
    }
  }
  invisible(x)
}

#' @method summary nexusDatasetInfoList
#' @rdname nexus

summary.nexusDatasetInfoList <- function(object, ...) {
  o <- as.numeric(attr(object, "offset"))
  s <- as.numeric(attr(object, "size"))
  t <- as.numeric(attr(object, "totalsize"))
  n <- attr(object, "name")
  cat(sep="", "NEXUS ", o+1, "-", o+s, "/", t, " -- ", n, "\n")
  invisible(object)
}

parseVE <- function(ve) {
  if (length(ve)==0) { return(character(0)) }
  ve <- strsplit(unname(ve), " ")
  ve <- lapply(ve, strsplit, "/")
  v <- lapply(ve, function(x) sapply(x, "[", 1))
  e <- lapply(ve, function(x) sapply(x, "[", 2))
  int <- function(x) {
    if (length(unique(x))==1) {
      as.character(x[1])
    } else {
      paste(sep="", min(x), "-", max(x))
    }
  }
  v <- sapply(v, int)
  e <- sapply(e, int)
  paste(v, sep="/", e)
}

#' @method print nexusDatasetInfoList
#' @rdname nexus

print.nexusDatasetInfoList <- function(x, ...) {
  summary(x)
  
  if (length(x)==0) { return(invisible(x)) }
  
  ve <- parseVE(unname(sapply(x, "[[", "vertices/edges")))
  nets <- sapply(x, function(y) length(strsplit(y$networks, " ")[[1]]))
  sid <- sapply(x, "[[", "sid")
  if (any(nets>1)) {
    sid[nets > 1] <- paste(sep="", sid[nets>1], ".", nets[nets>1])
  }
  df <- data.frame(no=paste(sep="", "[", format(seq_along(x)), "] "),
                   sid=format(sid),
                   size=paste(sep="", " ", format(ve)),
                   id=paste(sep="", " #", format(sapply(x, "[[", "id")), " "),
                   name=sapply(x, "[[", "name"))
  out <- do.call(paste, c(as.list(df), sep=""))
  long <- nchar(out) > getOption("width")  
  out <- paste(sep="", substr(out, 1, getOption("width")-1),
               ifelse(long, "+", ""))
  cat(out, sep="\n")
  invisible(x)
}

nexus.format.result <- function(l, name="") {
  
  if (length(l)==0) {
    res <- list()
    class(res) <- "nexusDatasetInfoList"
    return(res)
  }
  
  l <- lapply(l, function(x) c(sub("[ ]*:[^:]*$", "", x),
                               sub("^[^:]*:[ ]*", "", x)))
  spos <- which(sapply(l, function(x) x[1]=="id"))
  epos <- c((spos-1), length(l))
  ehead <- epos[1]
  epos <- epos[-1]
  
  res <- mapply(spos, epos, SIMPLIFY=FALSE, FUN=function(s, e)
                makeNexusDatasetInfo(l[s:e]))
  class(res) <- "nexusDatasetInfoList"

  for (h in 1:ehead) {
    attr(res, l[[h]][1]) <- l[[h]][2]
    attr(res, "name") <- name
  }
  
  res
}

#' Query and download from the Nexus network repository
#' 
#' The Nexus network repository is an online collection of network data sets.
#' These functions can be used to query it and download data from it, directly
#' as an igraph graph.
#' 
#' Nexus is an online repository of networks, with an API that allow
#' programmatic queries against it, and programmatic data download as well.
#' 
#' The \code{nexus_list} and \code{nexus_info} functions query the online
#' database. They both return \code{nexusDatasetInfo} objects.
#' \code{nexus_info} returns more information than \code{nexus_list}.
#' 
#' \code{nexus_search} searches Nexus, and returns a list of data sets, as
#' \code{nexusDatasetInfo} objects. See below for some search examples.
#' 
#' \code{nexus_get} downloads a data set from Nexus, based on its numeric id,
#' or based on a Nexus search string. For search strings, only the first search
#' hit is downloaded, but see also the \code{offset} argument. (If there are
#' not data sets found, then the function returns an error.)
#' 
#' The \code{nexusDatasetInfo} objects returned by \code{nexus_list} have the
#' following fields: \describe{
#'   \item{id}{The numeric id of the dataset.}
#'   \item{sid}{The character id of the dataset.}
#'   \item{name}{Character scalar, the name of the dataset.}
#'   \item{vertices/edges}{Character, the number of vertices and edges in
#'     the graph(s). Vertices and edges are separated by a  slash, and if
#'     the data set consists of multiple networks, then they are separated
#'     by spaces.}
#'   \item{tags}{Character vector, the tags of the dataset. Directed graph
#'     have the tags \sQuote{directed}. Undirected graphs are tagged 
#'     as \sQuote{undirected}. Other common tags are: \sQuote{weighted},
#'     \sQuote{bipartite}, \sQuote{social network}, etc.}
#'   \item{networks}{The ids and names of the networks in the data set. The
#'     numeric and character id are separated by a slash, and multiple networks
#'     are separated by spaces.}
#' } 
#' 
#' \code{nexusDatasetInfo} objects returned by \code{nexus_info} have the
#' following additional fields: \describe{
#'   \item{date}{Character scalar, e.g. \sQuote{2011-01-09}, the date when
#'     the dataset was added to the database.} 
#'   \item{formats}{Character vector, the data formats in which the data set is
#'     available. The various formats are separated by semicolons.}
#'   \item{licence}{Character scalar, the licence of the dataset.}
#'   \item{licence url}{Character scalar, the URL of the licence of the
#'     dataset. Please make sure you consult this before using a dataset.}
#'   \item{summary}{Character scalar, the short description of the dataset,
#'     this is usually a single sentence.}
#'   \item{description}{Character scalar, the full description of the
#'     dataset.}
#'   \item{citation}{Character scalar, the paper(s) describing the
#'     dataset. Please cite these papers if you are using the dataset in your
#'     research, the licence of most datasets requires this.}
#'   \item{attributes}{A list of lists, each list entry is a graph, vertex
#'     or edge attribute and has the following entries: \describe{
#'       \item{type}{Type of the attribute, either \sQuote{graph},
#'         \sQuote{vertex} or \sQuote{edge}.}
#'       \item{datatype}{Data type of the attribute, currently it can be
#'         \sQuote{numeric} and \sQuote{string}.} 
#'       \item{name}{Character scalar, the name of the attribute.}
#'       \item{description}{Character scalar, the description of the
#'         attribute.}
#'     }
#'   } 
#' }
#' 
#' The results of the Nexus queries are printed to the screen in a consise
#' format, similar to the format of igraph graphs. A data set list (typically
#' the result of \code{nexus_list} and \code{nexus_search}) looks like this:
#' \preformatted{NEXUS 1-5/18 -- data set list
#' [1] kaptail.4         39/109-223   #18 Kapferer tailor shop
#' [2] condmatcollab2003 31163/120029 #17 Condensed matter collaborations+
#' [3] condmatcollab     16726/47594  #16 Condensed matter collaborations+
#' [4] powergrid         4941/6594    #15 Western US power grid
#' [5] celegansneural    297/2359     #14 C. Elegans neural network }
#' Each line here represents a data set, and the following information is
#' given about them: the character id of the data set (e.g. \code{kaptail}
#' or \code{powergrid}), the number of vertices and number of edges in the
#' graph of the data sets.  For data sets with multiple graphs, intervals
#' are given here. Then the numeric id of the data set and the remaining
#' space is filled with the name of the data set.
#' 
#' Summary information about an individual Nexus data set is printed as
#' \preformatted{NEXUS B--- 39 109-223 #18 kaptail -- Kapferer tailor shop
#' + tags: directed; social network; undirected
#' + nets: 1/KAPFTI2; 2/KAPFTS2; 3/KAPFTI1; 4/KAPFTS1}
#' This is very similar to the header that is used for printing igraph
#' graphs, but there are some differences as well. The four characters
#' after the \code{NEXUS} word give the most important properties of the
#' graph(s): the first is \sQuote{\code{U}} for undirected and
#' \sQuote{\code{D}} for directed graphs, and \sQuote{\code{B}} if the data
#' set contains both directed and undirected graphs. The second is
#' \sQuote{\code{N}} named graphs. The third character is \sQuote{\code{W}}
#' for weighted graphs, the fourth is \sQuote{\code{B}} if the data set
#' contains bipartite graphs. Then the number of vertices and number of
#' edges are printed, for data sets with multiple graphs, the smallest and
#' the largest values are given. Then comes the numeric id, and the string
#' id of the data set. The end of the first line contains the name of the
#' data set. The second row lists the data set tags, and the third row the
#' networks that are included in the data set.
#' 
#' Detailed data set information is printed similarly, but it contains more
#' fields.
#'
#' @rdname nexus
#' @aliases nexus nexus.list nexus.info nexus.get nexus.search nexus_list
#' nexus_info nexus_get nexus_search nexusDatasetInfo print.nexusDatasetInfo
#' print.nexusDatasetInfoList summary.nexusDatasetInfoList
#' @param tags A character vector, the tags that are searched. If not given (or
#' \code{NULL}), then all datasets are listed.
#' @param offset An offset to select part of the results. Results are listed
#' from \code{offset}+1.
#' @param limit The maximum number of results to return.
#' @param operator A character scalar. If \sQuote{or} (the default), then all
#' datasets that have at least one of the given tags, are returned. If it if
#' \sQuote{and}, then only datasets that have all the given tags, are returned.
#' @param order The ordering of the results, possible values are:
#' \sQuote{date}, \sQuote{name}, \sQuote{popularity}.
#' @param id The numeric or character id of the data set to query or download.
#' Instead of the data set ids, it is possible to supply a
#' \code{nexusDatasetInfo} or \code{nexusDatasetInfoList} object here directly
#' and then the query is done on the corresponding data set(s).
#' @param q Nexus search string. See examples below.
#' @param nexus.url The URL of the Nexus server. Don't change this from the
#' default, unless you set up your own Nexus server.
#' @param x,object The \code{nexusDatasetInfo} object to print.
#' @param \dots Currently ignored.
#' @return \code{nexus_list} and \code{nexus_search} return a list of
#' \code{nexusDatasetInfo} objects. The list also has these attributes:
#' \describe{ \item{size}{The number of data sets returned by the query.}
#' \item{totalsize}{The total number of data sets found for the query.}
#' \item{offset}{The offset parameter of the query.} \item{limit}{The limit
#' parameter of the query.} }
#' 
#' \code{nexus_info} returns a single \code{nexusDatasetInfo} object.
#' 
#' \code{nexus_get} returns an igraph graph object, or a list of graph objects,
#' if the data set consists of multiple networks.
#' @section Examples:
#' \preformatted{
#' nexus_list(tag="weighted")
#' nexus_list(limit=3, order="name")
#' nexus_list(limit=3, order="name")[[1]]
#' nexus_info(2)
#' g <- nexus_get(2)
#' summary(g)
#' 
#' ## Data sets related to 'US':
#' nexus_search("US")
#' 
#' ## Search for data sets that have 'network' in their name:
#' nexus_search("name:network")
#' 
#' ## Any word can match
#' nexus_search("blog or US or karate")
#' }
#' @export
#' @importFrom utils URLencode

nexus_list <- function(tags=NULL, offset=0, limit=10,
                       operator=c("or", "and"),
                       order=c("date", "name", "popularity"),
                       nexus.url=igraph_opt("nexus.url")) {

  operator=igraph.match.arg(operator)
  order=igraph.match.arg(order)
  
  if (is.null(tags)) {
    u <- paste(sep="", nexus.url, "/api/dataset_info?format=text",
               "&offset=", offset, "&limit=", limit, "&order=", order)
    name <- "data set list"
  } else {
    tags <- paste(tags, collapse="|")
    u <- paste(sep="", nexus.url, "/api/dataset_info?tag=", tags,
               "&operator=", operator, "&format=text",
               "&offset=", offset, "&limit=", limit, "&order=", order)
    name <- paste("tags:", gsub("|", "; ", tags, fixed=TRUE))
  }
  f <- url(URLencode(u))
  l <- readLines(f)
  close(f)

  nexus.format.result(l, name)
}

#' @export
#' @rdname nexus
#' @importFrom utils URLencode
 
nexus_info <- function(id, nexus.url=igraph_opt("nexus.url")) {

  if (inherits(id, "nexusDatasetInfo")) {
    id <- id$id
  } else if (inherits(id, "nexusDatasetInfoList")) {
    rid <- sapply(id, "[[", "id")
    res <- lapply(rid, nexus_info, nexus.url=nexus.url)
    class(res) <- class(id)
    attributes(res) <- attributes(id)
    return(res)
  }  
  
  u <- paste(sep="", nexus.url, "/api/dataset_info?format=text&id=", id)
  f <- url(URLencode(u))
  l <- readLines(f)
  close(f)
  l2 <- character()
  for (i in seq_along(l)) {
    if (!grepl("^  ", l[i])) {
      l2 <- c(l2, l[i])
    } else {
      l2[length(l2)] <- paste(sep="\n", l2[length(l2)],
                              sub("  ", "", l[i], fixed=TRUE))
    }
  }
  l2 <- lapply(l2, function(x)
               c(sub("[ ]*:.*$", "", x), sub("^[^:]*:[ ]*", "", x)))
  res <- makeNexusDatasetInfo(l2)
  if (! "attributes" %in% names(res)) { res$attributes <- list() }
  return(res)
}  

#' @export
#' @rdname nexus
#' @importFrom utils URLencode

nexus_get <- function(id, offset=0,
                      order=c("date", "name", "popularity"),
                      nexus.url=igraph_opt("nexus.url")) {

  order=igraph.match.arg(order)

  if (inherits(id, "nexusDatasetInfo")) {
    id <- id$id
  } else if (inherits(id, "nexusDatasetInfoList")) {
    id <- sapply(id, "[[", "id")
    return(lapply(id, nexus_get, nexus.url=nexus.url))
  }
  
  u <- paste(sep="", nexus.url, "/api/dataset?id=", id, "&format=R-igraph")
  env <- new.env()
  rdata <- url(URLencode(u))
  load(rdata, envir=env)
  close(rdata)
  res <- get(ls(env)[1], env)

  upgrade_if_igraph <- function(x) if (is_igraph(x)) upgrade_graph(x) else x

  if (is_igraph(res)) {
    upgrade_if_igraph(res)
  } else if (is.list(res)) {
    res2 <- lapply(res, upgrade_if_igraph)
    attributes(res2) <- attributes(res)
    res2
  }
}

#' @export
#' @rdname nexus
#' @importFrom utils URLencode

nexus_search <- function(q, offset=0, limit=10,
                         order=c("date", "name", "popularity"),
                         nexus.url=igraph_opt("nexus.url")) {

  order=igraph.match.arg(order)

  u <- paste(sep="", nexus.url, "/api/search?q=", q,
             "&format=text","&offset=", offset, "&limit=", limit,
             "&order=", order)
  f <- url(URLencode(u))
  l <- readLines(f)
  close(f)

  if (length(l)==0) {
    res <- list()
    class(res) <- "nexusDatasetInfoList"
    return(res)
  }

  nexus.format.result(l, name=paste("q:", q))
}

#' @param i Index.
#' @method [ nexusDatasetInfoList
#' @rdname nexus

`[.nexusDatasetInfoList` <- function(x, i) {
  res <- unclass(x)[i]
  class(res) <- class(x)
  attributes(res) <- attributes(x)
  res
}

'
DATA SET LIST:
--------------

NEXUS 1-10/18 -- data set list
[ 1] kaptail.4         #18 39/109-223   Kapferer tailor shop
[ 2] condmatcollab2003 #17 31163/120029 Condensed matter collaborations, 2003
[ 3] condmatcollab     #16 16726/47594  Condensed matter collaborations, 1999
[ 4] powergrid         #15 4941/6594    Western US power grid
[ 5] celegansneural    #14 297/2359     C. Elegans neural network
[ 6] polblogs          #13 1490/19090   US political blog network
[ 7] dolphins          #12 62/159       Dolphin social network
[ 8] football          #11 115/616      Network of American college ...
[ 9] adjnoun           #10 112/425      Word adjacencies from David ...
[10] huckleberry       # 9 74/301       Coappearance network from ...


TAG SEARCH:
-----------

NEXUS 1-4/4 -- tags: directed
[1] kaptail.4 #18 39/109-223 Kapferer tailor shop
[2] polblogs  #13 1490/19090 US political blog network
[3] macaque   # 4 45/463     Macaque visuotactile brain areas
[4] UKfaculty # 2 81/817     UK faculty social network


FULL TEXT SEARCH:
-----------------
  
NEXUS 1-2/2 -- q: US
[1] powergrid #15 4941/6594  Western US power grid
[2] polblogs  #13 1490/19090 US political blog network


DATA SET SUMMARY:
-----------------
  
NEXUS B--- 39 109-223 -- #18 Kapferer tailor shop
+ tags: directed; social network; undirected
+ networks: 1/KAPFTI2; 2/KAPFTS2; 3/KAPFTI1; 4/KAPFTS1

NEXUS U--- 4941 6594 -- #15 Western US power grid
+ tags: technology

DATA SET INFO:
--------------

NEXUS B--- 39 109-223 -- #18 Kapferer tailor shop
+ tags: directed; social network; undirected
+ attr: name (v/c) [Actor names]
+ networks: 1/KAPFTI2; 2/KAPFTS2; 3/KAPFTI1; 4/KAPFTS1
+ nets: #1 KAPFTI2; #2 KAPFTS2; #3 KAPFTI1; #4 KAPFTS1
+ date: 2011-01-23
+ licence: Creative Commons by-sa 3.0
+ licence url: http://creativecommons.org/licenses/by-sa/3.0/
+ summary: Interactions in a tailor shop in Zambia (then
  Northern Rhodesia) over a period of ten months.
+ details: Bruce Kapferer (1972) observed interactions in a tailor
  shop in Zambia (then Northern Rhodesia) over a period of ten months.
  His focus was the changing patterns of alliance among workers during
  extended negotiations for higher wages. . The matrices represent two
  different types of interaction, recorded at two different times
  (seven months apart) over a period of one month. TI1 and TI2 record
  the "instrumental" (work- and assistance-related) interactions at the
  two times; TS1 and TS2 the "sociational" (friendship, socioemotional)
  interactions. . The data are particularly interesting since an
  abortive strike occurred after the first set of observations, and a
  successful strike took place after the second.
+ formats: Pajek; R-igraph
+ citation: Kapferer B. (1972). Strategy and transaction in an African
  factory. Manchester: Manchester University Press. 
'
