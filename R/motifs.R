
#   IGraph R package
#   Copyright (C) 2006-2012  Gabor Csardi <csardi.gabor@gmail.com>
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

#' Graph motifs
#' 
#' Graph motifs are small connected subgraphs with a well-defined
#' structure.  These functions search a graph for various motifs.
#' 
#' \code{motifs} searches a graph for motifs of a given size and returns a
#' numeric vector containing the number of different motifs. The order of
#' the motifs is defined by their isomorphism class, see
#' \code{\link{isomorphism_class}}.
#' 
#' @aliases graph.motifs
#' @param graph Graph object, the input graph.
#' @param size The size of the motif, currently 3 and 4 are supported only.
#' @param cut.prob Numeric vector giving the probabilities that the search
#' graph is cut at a certain level. Its length should be the same as the size
#' of the motif (the \code{size} argument). By default no cuts are made.
#' @return \code{motifs} returns a numeric vector, the number of occurrences of
#' each motif in the graph. The motifs are ordered by their isomorphism
#' classes. Note that for unconnected subgraphs, which are not considered to be
#' motifs, the result will be \code{NA}.
#' @seealso \code{\link{isomorphism_class}}
#'
#' @export
#' @family graph motifs
#'
#' @examples
#' g <- barabasi.game(100)
#' motifs(g, 3)
#' count_motifs(g, 3)
#' sample_motifs(g, 3)

motifs <- function(graph, size=3, cut.prob=rep(0, size)) {

  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  cut.prob <- as.numeric(cut.prob)
  if (length(cut.prob) != size) {
    cut.prob <- c(cut.prob[-length(cut.prob)],
                  rep(cut.prob[-length(cut.prob)], length(cut.prob)-1))
  }
  
  on.exit( .Call(C_R_igraph_finalizer) )
  res <- .Call(C_R_igraph_motifs_randesu, graph, as.integer(size),
               as.numeric(cut.prob))
  res[is.nan(res)] <- NA
  res
}

#' Graph motifs
#' 
#' Graph motifs are small connected subgraphs with a well-defined
#' structure.  These functions search a graph for various motifs.
#' 
#' \code{count_motifs} calculates the total number of motifs of a given
#' size in graph.
#' 
#' @aliases graph.motifs.no
#' @param graph Graph object, the input graph.
#' @param size The size of the motif, currently 3 and 4 are supported only.
#' @param cut.prob Numeric vector giving the probabilities that the search
#' graph is cut at a certain level. Its length should be the same as the size
#' of the motif (the \code{size} argument). By default no cuts are made.
#' @return \code{count_motifs} returns  a numeric scalar.
#' @seealso \code{\link{isomorphism_class}}
#'
#' @export
#' @family graph motifs
#'
#' @examples
#' g <- barabasi.game(100)
#' motifs(g, 3)
#' count_motifs(g, 3)
#' sample_motifs(g, 3)

count_motifs <- function(graph, size=3, cut.prob=rep(0, size)) {

  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  cut.prob <- as.numeric(cut.prob)
  if (length(cut.prob) != size) {
    cut.prob <- c(cut.prob[-length(cut.prob)],
                  rep(cut.prob[-length(cut.prob)], length(cut.prob)-1))
  }
  
  on.exit( .Call(C_R_igraph_finalizer) )
  .Call(C_R_igraph_motifs_randesu_no, graph, as.integer(size),
        as.numeric(cut.prob))
}

#' Graph motifs
#' 
#' Graph motifs are small connected subgraphs with a well-defined
#' structure.  These functions search a graph for various motifs.
#' 
#' \code{sample_motifs} estimates the total number of motifs of a given
#' size in a graph based on a sample.
#' 
#' @aliases graph.motifs.est
#' @param graph Graph object, the input graph.
#' @param size The size of the motif, currently 3 and 4 are supported only.
#' @param cut.prob Numeric vector giving the probabilities that the search
#' graph is cut at a certain level. Its length should be the same as the size
#' of the motif (the \code{size} argument). By default no cuts are made.
#' @param sample.size The number of vertices to use as a starting point for
#' finding motifs. Only used if the \code{sample} argument is \code{NULL}.
#' @param sample If not \code{NULL} then it specifies the vertices to use as a
#' starting point for finding motifs.
#' @return A numeric scalar, an estimate for the total number of motifs in
#'   the graph.
#' @seealso \code{\link{isomorphism_class}}
#'
#' @export
#' @family graph motifs
#'
#' @examples
#' g <- barabasi.game(100)
#' motifs(g, 3)
#' count_motifs(g, 3)
#' sample_motifs(g, 3)

sample_motifs <- function(graph, size=3, cut.prob=rep(0, size),
                             sample.size=vcount(graph)/10, sample=NULL) {

  if (!is_igraph(graph)) {
    stop("Not a graph object")
  }
  cut.prob <- as.numeric(cut.prob)
  if (length(cut.prob) != size) {
    cut.prob <- c(cut.prob[-length(cut.prob)],
                  rep(cut.prob[-length(cut.prob)], length(cut.prob)-1))
  }
  
  on.exit( .Call(C_R_igraph_finalizer) )
  .Call(C_R_igraph_motifs_randesu_estimate, graph, as.integer(size),
        as.numeric(cut.prob), as.integer(sample.size), as.numeric(sample))
}
  

#' Dyad census of a graph
#' 
#' Classify dyads in a directed graphs. The relationship between each pair of
#' vertices is measured. It can be in three states: mutual, asymmetric or
#' non-existent.
#' 
#' 
#' @aliases dyad.census dyad_census
#' @param graph The input graph. A warning is given if it is not directed.
#' @return A named numeric vector with three elements: \item{mut}{The number of
#' pairs with mutual connections.} \item{asym}{The number of pairs with
#' non-mutual connections.} \item{null}{The number of pairs with no connection
#' between them.}
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{triad_census}} for the same classification, but with
#' triples.
#' @references Holland, P.W. and Leinhardt, S. A Method for Detecting Structure
#' in Sociometric Data. \emph{American Journal of Sociology}, 76, 492--513.
#' 1970.
#' 
#' Wasserman, S., and Faust, K. \emph{Social Network Analysis: Methods and
#' Applications.} Cambridge: Cambridge University Press. 1994.
#' @keywords graphs
#' @examples
#' 
#' g <- sample_pa(100)
#' dyad_census(g)
#' @export

dyad_census <- dyad_census


#' Triad census, subgraphs with three vertices
#' 
#' This function counts the different subgraphs of three vertices in a graph.
#' 
#' Triad census was defined by David and Leinhardt (see References below).
#' Every triple of vertices (A, B, C) are classified into the 16 possible
#' states: \describe{ \item{003}{A,B,C, the empty graph.} \item{012}{A->B, C,
#' the graph with a single directed edge.} \item{102}{A<->B, C, the graph with
#' a mutual connection between two vertices.} \item{021D}{A<-B->C, the
#' out-star.} \item{021U}{A->B<-C, the in-star.} \item{021C}{A->B->C, directed
#' line.} \item{111D}{A<->B<-C.} \item{111U}{A<->B->C.} \item{030T}{A->B<-C,
#' A->C.} \item{030C}{A<-B<-C, A->C.} \item{201}{A<->B<->C.}
#' \item{120D}{A<-B->C, A<->C.} \item{120U}{A->B<-C, A<->C.}
#' \item{120C}{A->B->C, A<->C.} \item{210}{A->B<->C, A<->C.}
#' \item{300}{A<->B<->C, A<->C, the complete graph.} }
#' 
#' This functions uses the RANDESU motif finder algorithm to find and count the
#' subgraphs, see \code{\link{motifs}}.
#' 
#' @aliases triad.census triad_census
#' @param graph The input graph, it should be directed. An undirected graph
#' results a warning, and undefined results.
#' @return A numeric vector, the subgraph counts, in the order given in the
#' above description.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso \code{\link{dyad_census}} for classifying binary relationships,
#' \code{\link{motifs}} for the underlying implementation.
#' @references See also Davis, J.A. and Leinhardt, S.  (1972).  The Structure
#' of Positive Interpersonal Relations in Small Groups.  In J. Berger (Ed.),
#' Sociological Theories in Progress, Volume 2, 218-251.  Boston: Houghton
#' Mifflin.
#' @keywords graphs
#' @examples
#' 
#' g <- sample_gnm(15, 45, directed = TRUE)
#' triad_census(g)
#' @export

triad_census <- triad_census
