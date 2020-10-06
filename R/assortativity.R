
## -----------------------------------------------------------------------
##
##   IGraph R package
##   Copyright (C) 2015  Gabor Csardi <csardi.gabor@gmail.com>
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
## -----------------------------------------------------------------------


#' Assortativity coefficient
#' 
#' The assortativity coefficient is positive is similar vertices (based on some
#' external property) tend to connect to each, and negative otherwise.
#' 
#' The assortativity coefficient measures the level of homophyly of the graph,
#' based on some vertex labeling or values assigned to vertices. If the
#' coefficient is high, that means that connected vertices tend to have the
#' same labels or similar assigned values.
#' 
#' M.E.J. Newman defined two kinds of assortativity coefficients, the first one
#' is for categorical labels of vertices. \code{assortativity_nominal}
#' calculates this measure. It is defines as
#' 
#' \deqn{r=\frac{\sum_i e_{ii}-\sum_i a_i b_i}{1-\sum_i a_i b_i}}{
#' r=(sum(e(i,i), i) - sum(a(i)b(i), i)) / (1 - sum(a(i)b(i), i))}
#' 
#' where \eqn{e_{ij}}{e(i,j)} is the fraction of edges connecting vertices of
#' type \eqn{i} and \eqn{j}, \eqn{a_i=\sum_j e_{ij}}{a(i)=sum(e(i,j), j)} and
#' \eqn{b_j=\sum_i e_{ij}}{b(j)=sum(e(i,j), i)}.
#' 
#' The second assortativity variant is based on values assigned to the
#' vertices. \code{assortativity} calculates this measure. It is defined as
#' 
#' \deqn{r=\frac1{\sigma_q^2}\sum_{jk} jk(e_{jk}-q_j q_k)}{
#' sum(jk(e(j,k)-q(j)q(k)), j, k) / sigma(q)^2}
#' 
#' for undirected graphs (\eqn{q_i=\sum_j e_{ij}}{q(i)=sum(e(i,j), j)}) and as
#' 
#' \deqn{r=\frac1{\sigma_o\sigma_i}\sum_{jk}jk(e_{jk}-q_j^o q_k^i)}{
#' sum(jk(e(j,k)-qout(j)qin(k)), j, k) / sigma(qin) / sigma(qout) }
#' 
#' for directed ones. Here \eqn{q_i^o=\sum_j e_{ij}}{qout(i)=sum(e(i,j), j)},
#' \eqn{q_i^i=\sum_j e_{ji}}{qin(i)=sum(e(j,i), j)}, moreover,
#' \eqn{\sigma_q}{sigma(q)}, \eqn{sigma_o}{sigma(qout)} and
#' \eqn{sigma_i}{sigma(qin)} are the standard deviations of \eqn{q},
#' \eqn{q^o}{qout} and \eqn{q^i}{qin}, respectively.
#' 
#' The reason of the difference is that in directed networks the relationship
#' is not symmetric, so it is possible to assign different values to the
#' outgoing and the incoming end of the edges.
#' 
#' \code{assortativity_degree} uses vertex degree (minus one) as vertex values
#' and calls \code{assortativity}.
#' 
#' @aliases assortativity assortativity.degree assortativity_degree
#' assortativity.nominal assortativity_nominal
#' @param graph The input graph, it can be directed or undirected.
#' @param types Vector giving the vertex types. They as assumed to be integer
#' numbers, starting with one. Non-integer values are converted to integers
#' with \code{\link{as.integer}}.
#' @param types1 The vertex values, these can be arbitrary numeric values.
#' @param types2 A second value vector to be using for the incoming edges when
#' calculating assortativity for a directed graph.  Supply \code{NULL} here if
#' you want to use the same values for outgoing and incoming edges. This
#' argument is ignored (with a warning) if it is not \code{NULL} and undirected
#' assortativity coefficient is being calculated.
#' @param directed Logical scalar, whether to consider edge directions for
#' directed graphs. This argument is ignored for undirected graphs. Supply
#' \code{TRUE} here to do the natural thing, i.e. use directed version of the
#' measure for directed graphs and the undirected version for undirected
#' graphs.
#' @return A single real number.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @references M. E. J. Newman: Mixing patterns in networks, \emph{Phys. Rev.
#' E} 67, 026126 (2003) \url{https://arxiv.org/abs/cond-mat/0209450}
#' 
#' M. E. J. Newman: Assortative mixing in networks, \emph{Phys. Rev. Lett.} 89,
#' 208701 (2002) \url{https://arxiv.org/abs/cond-mat/0205405}
#' @keywords graphs
#' @examples
#' 
#' # random network, close to zero
#' assortativity_degree(sample_gnp(10000, 3/10000))
#' 
#' # BA model, tends to be dissortative
#' assortativity_degree(sample_pa(10000, m=4))
#' @include auto.R

assortativity <- assortativity

#' @rdname assortativity

assortativity_nominal <- assortativity_nominal

#' @rdname assortativity

assortativity_degree <- assortativity_degree
