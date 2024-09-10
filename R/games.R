
#' The Watts-Strogatz small-world model
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `watts.strogatz.game()` was renamed to `sample_smallworld()` to create a more
#' consistent API.
#' @inheritParams sample_smallworld
#' @keywords internal
#' @export
watts.strogatz.game <- function(dim, size, nei, p, loops = FALSE, multiple = FALSE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "watts.strogatz.game()", "sample_smallworld()")
  sample_smallworld(dim = dim, size = size, nei = nei, p = p, loops = loops, multiple = multiple)
} # nocov end

#' Scale-free random graphs, from vertex fitness scores
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `static.power.law.game()` was renamed to `sample_fitness_pl()` to create a more
#' consistent API.
#' @inheritParams sample_fitness_pl
#' @keywords internal
#' @export
static.power.law.game <- function(no.of.nodes, no.of.edges, exponent.out, exponent.in = -1, loops = FALSE, multiple = FALSE, finite.size.correction = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "static.power.law.game()", "sample_fitness_pl()")
  sample_fitness_pl(no.of.nodes = no.of.nodes, no.of.edges = no.of.edges, exponent.out = exponent.out, exponent.in = exponent.in, loops = loops, multiple = multiple, finite.size.correction = finite.size.correction)
} # nocov end

#' Random graphs from vertex fitness scores
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `static.fitness.game()` was renamed to `sample_fitness()` to create a more
#' consistent API.
#' @inheritParams sample_fitness
#' @keywords internal
#' @export
static.fitness.game <- function(no.of.edges, fitness.out, fitness.in = NULL, loops = FALSE, multiple = FALSE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "static.fitness.game()", "sample_fitness()")
  sample_fitness(no.of.edges = no.of.edges, fitness.out = fitness.out, fitness.in = fitness.in, loops = loops, multiple = multiple)
} # nocov end

#' Sample stochastic block model
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `sbm.game()` was renamed to `sample_sbm()` to create a more
#' consistent API.
#' @inheritParams sample_sbm
#' @keywords internal
#' @export
sbm.game <- function(n, pref.matrix, block.sizes, directed = FALSE, loops = FALSE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "sbm.game()", "sample_sbm()")
  sample_sbm(n = n, pref.matrix = pref.matrix, block.sizes = block.sizes, directed = directed, loops = loops)
} # nocov end

#' Trait-based random generation
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `preference.game()` was renamed to `sample_pref()` to create a more
#' consistent API.
#' @inheritParams sample_pref
#' @keywords internal
#' @export
preference.game <- function(nodes, types, type.dist = rep(1, types), fixed.sizes = FALSE, pref.matrix = matrix(1, types, types), directed = FALSE, loops = FALSE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "preference.game()", "sample_pref()")
  sample_pref(nodes = nodes, types = types, type.dist = type.dist, fixed.sizes = fixed.sizes, pref.matrix = pref.matrix, directed = directed, loops = loops)
} # nocov end

#' Random citation graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `lastcit.game()` was renamed to `sample_last_cit()` to create a more
#' consistent API.
#' @inheritParams sample_last_cit
#' @keywords internal
#' @export
lastcit.game <- function(n, edges = 1, agebins = n / 7100, pref = (1:(agebins + 1))^-3, directed = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "lastcit.game()", "sample_last_cit()")
  sample_last_cit(n = n, edges = edges, agebins = agebins, pref = pref, directed = directed)
} # nocov end

#' Create a random regular graph
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `k.regular.game()` was renamed to `sample_k_regular()` to create a more
#' consistent API.
#' @inheritParams sample_k_regular
#' @keywords internal
#' @export
k.regular.game <- function(no.of.nodes, k, directed = FALSE, multiple = FALSE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "k.regular.game()", "sample_k_regular()")
  sample_k_regular(no.of.nodes = no.of.nodes, k = k, directed = directed, multiple = multiple)
} # nocov end

#' A graph with subgraphs that are each a random graph.
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `interconnected.islands.game()` was renamed to `sample_islands()` to create a more
#' consistent API.
#' @inheritParams sample_islands
#' @keywords internal
#' @export
interconnected.islands.game <- function(islands.n, islands.size, islands.pin, n.inter) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "interconnected.islands.game()", "sample_islands()")
  sample_islands(islands.n = islands.n, islands.size = islands.size, islands.pin = islands.pin, n.inter = n.inter)
} # nocov end

#' Geometric random graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `grg.game()` was renamed to `sample_grg()` to create a more
#' consistent API.
#' @inheritParams sample_grg
#' @keywords internal
#' @export
grg.game <- function(nodes, radius, torus = FALSE, coords = FALSE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "grg.game()", "sample_grg()")
  sample_grg(nodes = nodes, radius = radius, torus = torus, coords = coords)
} # nocov end

#' Growing random graph generation
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `growing.random.game()` was renamed to `sample_growing()` to create a more
#' consistent API.
#' @inheritParams sample_growing
#' @keywords internal
#' @export
growing.random.game <- function(n, m = 1, directed = TRUE, citation = FALSE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "growing.random.game()", "sample_growing()")
  sample_growing(n = n, m = m, directed = directed, citation = citation)
} # nocov end

#' Forest Fire Network Model
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `forest.fire.game()` was renamed to `sample_forestfire()` to create a more
#' consistent API.
#' @inheritParams sample_forestfire
#' @keywords internal
#' @export
forest.fire.game <- function(nodes, fw.prob, bw.factor = 1, ambs = 1, directed = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "forest.fire.game()", "sample_forestfire()")
  sample_forestfire(nodes = nodes, fw.prob = fw.prob, bw.factor = bw.factor, ambs = ambs, directed = directed)
} # nocov end

#' Graph generation based on different vertex types
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `establishment.game()` was renamed to `sample_traits()` to create a more
#' consistent API.
#' @inheritParams sample_traits
#' @keywords internal
#' @export
establishment.game <- function(nodes, types, k = 1, type.dist = rep(1, types), pref.matrix = matrix(1, types, types), directed = FALSE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "establishment.game()", "sample_traits()")
  sample_traits(nodes = nodes, types = types, k = k, type.dist = type.dist, pref.matrix = pref.matrix, directed = directed)
} # nocov end

#' Generate random graphs with a given degree sequence
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `degree.sequence.game()` was renamed to `sample_degseq()` to create a more
#' consistent API.
#' @inheritParams sample_degseq
#' @keywords internal
#' @export
degree.sequence.game <- function(out.deg, in.deg = NULL, method = c("simple", "vl", "simple.no.multiple", "simple.no.multiple.uniform")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "degree.sequence.game()", "sample_degseq()")
  sample_degseq(out.deg = out.deg, in.deg = in.deg, method = method)
} # nocov end

#' Neighborhood of graph vertices
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `connect.neighborhood()` was renamed to `connect()` to create a more
#' consistent API.
#' @inheritParams connect
#' @keywords internal
#' @export
connect.neighborhood <- function(graph, order, mode = c("all", "out", "in", "total")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "connect.neighborhood()", "connect()")
  connect(graph = graph, order = order, mode = mode)
} # nocov end

#' Random citation graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `citing.cited.type.game()` was renamed to `sample_cit_cit_types()` to create a more
#' consistent API.
#' @inheritParams sample_cit_cit_types
#' @keywords internal
#' @export
citing.cited.type.game <- function(n, edges = 1, types = rep(0, n), pref = matrix(1, nrow = length(types), ncol = length(types)), directed = TRUE, attr = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "citing.cited.type.game()", "sample_cit_cit_types()")
  sample_cit_cit_types(n = n, edges = edges, types = types, pref = pref, directed = directed, attr = attr)
} # nocov end

#' Random citation graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `cited.type.game()` was renamed to `sample_cit_types()` to create a more
#' consistent API.
#' @inheritParams sample_cit_types
#' @keywords internal
#' @export
cited.type.game <- function(n, edges = 1, types = rep(0, n), pref = rep(1, length(types)), directed = TRUE, attr = TRUE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "cited.type.game()", "sample_cit_types()")
  sample_cit_types(n = n, edges = edges, types = types, pref = pref, directed = directed, attr = attr)
} # nocov end

#' Graph generation based on different vertex types
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `callaway.traits.game()` was renamed to `sample_traits_callaway()` to create a more
#' consistent API.
#' @inheritParams sample_traits_callaway
#' @keywords internal
#' @export
callaway.traits.game <- function(nodes, types, edge.per.step = 1, type.dist = rep(1, types), pref.matrix = matrix(1, types, types), directed = FALSE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "callaway.traits.game()", "sample_traits_callaway()")
  sample_traits_callaway(nodes = nodes, types = types, edge.per.step = edge.per.step, type.dist = type.dist, pref.matrix = pref.matrix, directed = directed)
} # nocov end

#' Bipartite random graphs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `bipartite.random.game()` was renamed to `sample_bipartite()` to create a more
#' consistent API.
#' @inheritParams sample_bipartite
#' @keywords internal
#' @export
bipartite.random.game <- function(n1, n2, type = c("gnp", "gnm"), p, m, directed = FALSE, mode = c("out", "in", "all")) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "bipartite.random.game()", "sample_bipartite()")
  sample_bipartite(n1 = n1, n2 = n2, type = type, p = p, m = m, directed = directed, mode = mode)
} # nocov end

#' Generate random graphs using preferential attachment
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `barabasi.game()` was renamed to `sample_pa()` to create a more
#' consistent API.
#' @inheritParams sample_pa
#' @keywords internal
#' @export
barabasi.game <- function(n, power = 1, m = NULL, out.dist = NULL, out.seq = NULL, out.pref = FALSE, zero.appeal = 1, directed = TRUE, algorithm = c("psumtree", "psumtree-multiple", "bag"), start.graph = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "barabasi.game()", "sample_pa()")
  sample_pa(n = n, power = power, m = m, out.dist = out.dist, out.seq = out.seq, out.pref = out.pref, zero.appeal = zero.appeal, directed = directed, algorithm = algorithm, start.graph = start.graph)
} # nocov end

#' Generate random graphs using preferential attachment
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `ba.game()` was renamed to `sample_pa()` to create a more
#' consistent API.
#' @inheritParams sample_pa
#' @keywords internal
#' @export
ba.game <- function(n, power = 1, m = NULL, out.dist = NULL, out.seq = NULL, out.pref = FALSE, zero.appeal = 1, directed = TRUE, algorithm = c("psumtree", "psumtree-multiple", "bag"), start.graph = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "ba.game()", "sample_pa()")
  sample_pa(n = n, power = power, m = m, out.dist = out.dist, out.seq = out.seq, out.pref = out.pref, zero.appeal = zero.appeal, directed = directed, algorithm = algorithm, start.graph = start.graph)
} # nocov end

#' Trait-based random generation
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `asymmetric.preference.game()` was renamed to `sample_asym_pref()` to create a more
#' consistent API.
#' @inheritParams sample_asym_pref
#' @keywords internal
#' @export
asymmetric.preference.game <- function(nodes, types, type.dist.matrix = matrix(1, types, types), pref.matrix = matrix(1, types, types), loops = FALSE) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "asymmetric.preference.game()", "sample_asym_pref()")
  sample_asym_pref(nodes = nodes, types = types, type.dist.matrix = type.dist.matrix, pref.matrix = pref.matrix, loops = loops)
} # nocov end

#' Generate an evolving random graph with preferential attachment and aging
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `aging.barabasi.game()` was renamed to `sample_pa_age()` to create a more
#' consistent API.
#' @inheritParams sample_pa_age
#' @keywords internal
#' @export
aging.barabasi.game <- function(n, pa.exp, aging.exp, m = NULL, aging.bin = 300, out.dist = NULL, out.seq = NULL, out.pref = FALSE, directed = TRUE, zero.deg.appeal = 1, zero.age.appeal = 0, deg.coef = 1, age.coef = 1, time.window = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "aging.barabasi.game()", "sample_pa_age()")
  sample_pa_age(n = n, pa.exp = pa.exp, aging.exp = aging.exp, m = m, aging.bin = aging.bin, out.dist = out.dist, out.seq = out.seq, out.pref = out.pref, directed = directed, zero.deg.appeal = zero.deg.appeal, zero.age.appeal = zero.age.appeal, deg.coef = deg.coef, age.coef = age.coef, time.window = time.window)
} # nocov end

#' Generate an evolving random graph with preferential attachment and aging
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `aging.ba.game()` was renamed to `sample_pa_age()` to create a more
#' consistent API.
#' @inheritParams sample_pa_age
#' @keywords internal
#' @export
aging.ba.game <- function(n, pa.exp, aging.exp, m = NULL, aging.bin = 300, out.dist = NULL, out.seq = NULL, out.pref = FALSE, directed = TRUE, zero.deg.appeal = 1, zero.age.appeal = 0, deg.coef = 1, age.coef = 1, time.window = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "aging.ba.game()", "sample_pa_age()")
  sample_pa_age(n = n, pa.exp = pa.exp, aging.exp = aging.exp, m = m, aging.bin = aging.bin, out.dist = out.dist, out.seq = out.seq, out.pref = out.pref, directed = directed, zero.deg.appeal = zero.deg.appeal, zero.age.appeal = zero.age.appeal, deg.coef = deg.coef, age.coef = age.coef, time.window = time.window)
} # nocov end

#' Generate an evolving random graph with preferential attachment and aging
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `aging.prefatt.game()` was renamed to `sample_pa_age()` to create a more
#' consistent API.
#' @inheritParams sample_pa_age
#' @keywords internal
#' @export
aging.prefatt.game <- function(n, pa.exp, aging.exp, m = NULL, aging.bin = 300, out.dist = NULL, out.seq = NULL, out.pref = FALSE, directed = TRUE, zero.deg.appeal = 1, zero.age.appeal = 0, deg.coef = 1, age.coef = 1, time.window = NULL) { # nocov start
  lifecycle::deprecate_soft("2.0.0", "aging.prefatt.game()", "sample_pa_age()")
  sample_pa_age(n = n, pa.exp = pa.exp, aging.exp = aging.exp, m = m, aging.bin = aging.bin, out.dist = out.dist, out.seq = out.seq, out.pref = out.pref, directed = directed, zero.deg.appeal = zero.deg.appeal, zero.age.appeal = zero.age.appeal, deg.coef = deg.coef, age.coef = age.coef, time.window = time.window)
} # nocov end

## -----------------------------------------------------------------
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
## -----------------------------------------------------------------

#' Generate random graphs using preferential attachment
#'
#' Preferential attachment is a family of simple stochastic algorithms for building
#' a graph. Variants include the Barabási-Abert model and the Price model.
#'
#' This is a simple stochastic algorithm to generate a graph. It is a discrete
#' time step model and in each time step a single vertex is added.
#'
#' We start with a single vertex and no edges in the first time step. Then we
#' add one vertex in each time step and the new vertex initiates some edges to
#' old vertices. The probability that an old vertex is chosen is given by
#' \deqn{P[i] \sim k_i^\alpha+a}{P[i] ~ k[i]^alpha + a} where \eqn{k_i}{k[i]}
#' is the in-degree of vertex \eqn{i} in the current time step (more precisely
#' the number of adjacent edges of \eqn{i} which were not initiated by \eqn{i}
#' itself) and \eqn{\alpha}{alpha} and \eqn{a} are parameters given by the
#' `power` and `zero.appeal` arguments.
#'
#' The number of edges initiated in a time step is given by the `m`,
#' `out.dist` and `out.seq` arguments. If `out.seq` is given and
#' not NULL then it gives the number of edges to add in a vector, the first
#' element is ignored, the second is the number of edges to add in the second
#' time step and so on. If `out.seq` is not given or null and
#' `out.dist` is given and not NULL then it is used as a discrete
#' distribution to generate the number of edges in each time step. Its first
#' element is the probability that no edges will be added, the second is the
#' probability that one edge is added, etc. (`out.dist` does not need to
#' sum up to one, it normalized automatically.) `out.dist` should contain
#' non-negative numbers and at east one element should be positive.
#'
#' If both `out.seq` and `out.dist` are omitted or NULL then `m`
#' will be used, it should be a positive integer constant and `m` edges
#' will be added in each time step.
#'
#' `sample_pa()` generates a directed graph by default, set
#' `directed` to `FALSE` to generate an undirected graph. Note that
#' even if an undirected graph is generated \eqn{k_i}{k[i]} denotes the number
#' of adjacent edges not initiated by the vertex itself and not the total
#' (in- + out-) degree of the vertex, unless the `out.pref` argument is set to
#' `TRUE`.
#'
#' @param n Number of vertices.
#' @param power The power of the preferential attachment, the default is one,
#'   i.e. linear preferential attachment.
#' @param m Numeric constant, the number of edges to add in each time step This
#'   argument is only used if both `out.dist` and `out.seq` are omitted
#'   or NULL.
#' @param out.dist Numeric vector, the distribution of the number of edges to
#'   add in each time step. This argument is only used if the `out.seq`
#'   argument is omitted or NULL.
#' @param out.seq Numeric vector giving the number of edges to add in each time
#'   step. Its first element is ignored as no edges are added in the first time
#'   step.
#' @param out.pref Logical, if true the total degree is used for calculating
#'   the citation probability, otherwise the in-degree is used.
#' @param zero.appeal The \sQuote{attractiveness} of the vertices with no
#'   adjacent edges. See details below.
#' @param directed Whether to create a directed graph.
#' @param algorithm The algorithm to use for the graph generation.
#'   `psumtree` uses a partial prefix-sum tree to generate the graph, this
#'   algorithm can handle any `power` and `zero.appeal` values and
#'   never generates multiple edges.  `psumtree-multiple` also uses a
#'   partial prefix-sum tree, but the generation of multiple edges is allowed.
#'   Before the 0.6 version igraph used this algorithm if `power` was not
#'   one, or `zero.appeal` was not one.  `bag` is the algorithm that
#'   was previously (before version 0.6) used if `power` was one and
#'   `zero.appeal` was one as well. It works by putting the ids of the
#'   vertices into a bag (multiset, really), exactly as many times as their
#'   (in-)degree, plus once more. Then the required number of cited vertices are
#'   drawn from the bag, with replacement. This method might generate multiple
#'   edges. It only works if `power` and `zero.appeal` are equal one.
#' @param start.graph `NULL` or an igraph graph. If a graph, then the
#'   supplied graph is used as a starting graph for the preferential attachment
#'   algorithm. The graph should have at least one vertex. If a graph is supplied
#'   here and the `out.seq` argument is not `NULL`, then it should
#'   contain the out degrees of the new vertices only, not the ones in the
#'   `start.graph`.
#' @return A graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @references Barabási, A.-L. and Albert R. 1999. Emergence of scaling in
#' random networks *Science*, 286 509--512.
#'
#' de Solla Price, D. J. 1965. Networks of Scientific Papers *Science*,
#' 149 510--515.
#' @family games
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- sample_pa(10000)
#' degree_distribution(g)
#'
sample_pa <- function(n, power = 1, m = NULL, out.dist = NULL, out.seq = NULL,
                      out.pref = FALSE, zero.appeal = 1,
                      directed = TRUE, algorithm = c(
                        "psumtree",
                        "psumtree-multiple", "bag"
                      ),
                      start.graph = NULL) {
  if (!is.null(start.graph) && !is_igraph(start.graph)) {
    stop("`start.graph' not an `igraph' object")
  }

  # Checks
  if (!is.null(out.seq) && (!is.null(m) || !is.null(out.dist))) {
    warning("if `out.seq' is given `m' and `out.dist' should be NULL")
    m <- out.dist <- NULL
  }
  if (is.null(out.seq) && !is.null(out.dist) && !is.null(m)) {
    warning("if `out.dist' is given `m' will be ignored")
    m <- NULL
  }
  if (!is.null(m) && m == 0) {
    warning("`m' is zero, graph will be empty")
  }

  if (is.null(m) && is.null(out.dist) && is.null(out.seq)) {
    m <- 1
  }

  n <- as.numeric(n)
  power <- as.numeric(power)
  if (!is.null(m)) {
    m <- as.numeric(m)
  }
  if (!is.null(out.dist)) {
    out.dist <- as.numeric(out.dist)
  }
  if (!is.null(out.seq)) {
    out.seq <- as.numeric(out.seq)
  }
  out.pref <- as.logical(out.pref)

  if (!is.null(out.dist)) {
    nn <- if (is.null(start.graph)) n else n - vcount(start.graph)
    out.seq <- as.numeric(sample(0:(length(out.dist) - 1), nn,
      replace = TRUE, prob = out.dist
    ))
  }

  if (is.null(out.seq)) {
    out.seq <- numeric()
  }

  algorithm <- igraph.match.arg(algorithm)
  algorithm1 <- switch(algorithm,
    "psumtree" = 1,
    "psumtree-multiple" = 2,
    "bag" = 0
  )

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_barabasi_game, n, power, m, out.seq, out.pref,
    zero.appeal, directed, algorithm1, start.graph
  )

  if (igraph_opt("add.params")) {
    res$name <- "Barabasi graph"
    res$power <- power
    res$m <- m
    res$zero.appeal <- zero.appeal
    res$algorithm <- algorithm
  }

  res
}

#' @rdname sample_pa
#' @param ... Passed to `sample_pa()`.
#' @export
pa <- function(...) constructor_spec(sample_pa, ...)


## -----------------------------------------------------------------


#' Generate random graphs according to the \eqn{G(n,p)} Erdős-Rényi model
#'
#' Every possible edge is created independently with the same probability `p`.
#' This model is also referred to as a Bernoulli random graph since the
#' connectivity status of vertex pairs follows a Bernoulli distribution.
#'
#' The graph has `n` vertices and each pair of vertices is connected
#' with the same probability `p`. The `loops` parameter controls whether
#' self-connections are also considered. This model effectively constrains
#' the average number of edges, \eqn{p m_\text{max}}, where \eqn{m_\text{max}}
#' is the largest possible number of edges, which depends on whether the
#' graph is directed or undirected and whether self-loops are allowed.
#'
#' @param n The number of vertices in the graph.
#' @param p The probability for drawing an edge between two
#'   arbitrary vertices (\eqn{G(n,p)} graph).
#' @param directed Logical, whether the graph will be directed, defaults to
#'   `FALSE`.
#' @param loops Logical, whether to add loop edges, defaults to `FALSE`.
#' @return A graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @references Erdős, P. and Rényi, A., On random graphs, *Publicationes
#' Mathematicae* 6, 290--297 (1959).
#' @family games
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- sample_gnp(1000, 1 / 1000)
#' degree_distribution(g)
sample_gnp <- function(n, p, directed = FALSE, loops = FALSE) {
  type <- "gnp"
  type1 <- switch(type,
    "gnp" = 0,
    "gnm" = 1
  )

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_erdos_renyi_game_gnp, as.numeric(n),
    as.numeric(p), as.logical(directed), as.logical(loops)
  )

  if (igraph_opt("add.params")) {
    res$name <- sprintf("Erdos-Renyi (%s) graph", type)
    res$type <- type
    res$loops <- loops
    res$p <- p
  }
  res
}

#' @rdname sample_gnp
#' @param ... Passed to `sample_gnp()`.
#' @export
gnp <- function(...) constructor_spec(sample_gnp, ...)

## -----------------------------------------------------------------



#' Generate random graphs according to the \eqn{G(n,m)} Erdős-Rényi model
#'
#' Random graph with a fixed number of edges and vertices.
#'
#' The graph has `n` vertices and `m` edges. The edges are chosen uniformly
#' at random from the set of all vertex pairs. This set includes potential
#' self-connections as well if the `loops` parameter is `TRUE`.
#'
#' @param n The number of vertices in the graph.
#' @param m The number of edges in the graph.
#' @param directed Logical, whether the graph will be directed, defaults to
#'   `FALSE`.
#' @param loops Logical, whether to add loop edges, defaults to `FALSE`.
#' @return A graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @references Erdős, P. and Rényi, A., On random graphs, *Publicationes
#' Mathematicae* 6, 290--297 (1959).
#' @family games
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- sample_gnm(1000, 1000)
#' degree_distribution(g)
sample_gnm <- function(n, m, directed = FALSE, loops = FALSE) {
  type <- "gnm"
  type1 <- switch(type,
    "gnp" = 0,
    "gnm" = 1
  )

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_erdos_renyi_game_gnm, as.numeric(n),
    as.numeric(m), as.logical(directed), as.logical(loops)
  )

  if (igraph_opt("add.params")) {
    res$name <- sprintf("Erdos-Renyi (%s) graph", type)
    res$type <- type
    res$loops <- loops
    res$m <- m
  }
  res
}

#' @rdname sample_gnm
#' @param ... Passed to `sample_gnm()`.
#' @export
gnm <- function(...) constructor_spec(sample_gnm, ...)

## -----------------------------------------------------------------

#' Generate random graphs according to the Erdős-Rényi model
#'
#' Simple random graph model, specifying the edge count either precisely
#' (\eqn{G(n,m)} model) or on average through a connection probability
#' (\eqn{G(n,p)} model).
#'
#' In \eqn{G(n,m)} graphs, there are precisely `m` edges.
#'
#' In \eqn{G(n,p)} graphs, all vertex pairs are connected with the same
#' probability `p`.
#'
#' `random.graph.game()` is an alias to this function.
#'
#' @section Deprecated:
#'
#' Since igraph version 0.8.0, both `erdos.renyi.game()` and
#' `random.graph.game()` are deprecated, and [sample_gnp()] and
#' [sample_gnm()] should be used instead. See these for more details.
#'
#' @aliases erdos.renyi.game random.graph.game
#' @param n The number of vertices in the graph.
#' @param p.or.m Either the probability for drawing an edge between two
#'   arbitrary vertices (\eqn{G(n,p)} graph), or the number of edges in
#'   the graph (for \eqn{G(n,m)} graphs).
#' @param type The type of the random graph to create, either `gnp()`
#'   (\eqn{G(n,p)} graph) or `gnm()` (\eqn{G(n,m)} graph).
#' @param directed Logical, whether the graph will be directed, defaults to
#'   `FALSE`.
#' @param loops Logical, whether to add loop edges, defaults to `FALSE`.
#' @return A graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @references Erdős, P. and Rényi, A., On random graphs, *Publicationes
#' Mathematicae* 6, 290--297 (1959).
#' @family games
#' @export
#' @keywords graphs
#' @keywords internal
#' @examples
#'
#' g <- erdos.renyi.game(1000, 1 / 1000)
#' degree_distribution(g)
#'
erdos.renyi.game <- function(n, p.or.m, type = c("gnp", "gnm"),
                             directed = FALSE, loops = FALSE) {
  type <- igraph.match.arg(type)

  on.exit(.Call(R_igraph_finalizer))
  if (type == "gnp") {
    res <- .Call(
      R_igraph_erdos_renyi_game_gnp, as.numeric(n),
      as.numeric(p.or.m), as.logical(directed), as.logical(loops)
    )
  } else if (type == "gnm") {
    res <- .Call(
      R_igraph_erdos_renyi_game_gnm, as.numeric(n),
      as.numeric(p.or.m), as.logical(directed), as.logical(loops)
    )
  }

  if (igraph_opt("add.params")) {
    res$name <- sprintf("Erdos-Renyi (%s) graph", type)
    res$type <- type
    res$loops <- loops
    if (type == "gnp") {
      res$p <- p.or.m
    }
    if (type == "gnm") {
      res$m <- p.or.m
    }
  }
  res
}

#' @family games
#' @export
random.graph.game <- erdos.renyi.game

## -----------------------------------------------------------------

#' Generate random graphs with a given degree sequence
#'
#' It is often useful to create a graph with given vertex degrees. This function
#' creates such a graph in a randomized manner.
#'
#' The \dQuote{configuration} method (formerly called "simple") implements the
#' configuration model. For undirected graphs, it puts all vertex IDs in a bag
#' such that the multiplicity of a vertex in the bag is the same as its degree.
#' Then it draws pairs from the bag until the bag becomes empty. This method may
#'  generate both loop (self) edges and multiple edges. For directed graphs,
#'  the algorithm is basically the same, but two separate bags are used
#'  for the in- and out-degrees. Undirected graphs are generated
#'  with probability proportional to \eqn{(\prod_{i<j} A_{ij} ! \prod_i A_{ii} !!)^{-1}},
#'  where A denotes the adjacency matrix and !! denotes the double factorial.
#'  Here A is assumed to have twice the number of self-loops on its diagonal.
#'  The corresponding expression for directed graphs is \eqn{(\prod_{i,j} A_{ij}!)^{-1}}.
#'   Thus the probability of all simple graphs
#'   (which only have 0s and 1s in the adjacency matrix)
#'   is the same, while that of non-simple ones depends on their edge and
#'   self-loop multiplicities.
#'
#' The \dQuote{fast.heur.simple} method (formerly called "simple.no.multiple")
#' generates simple graphs.
#' It is similar to \dQuote{configuration} but tries to avoid multiple and
#' loop edges and restarts the generation from scratch if it gets stuck.
#' It can generate all simple realizations of a degree sequence,
#' but it is not guaranteed to sample them uniformly.
#' This method is relatively fast and it will eventually succeed
#' if the provided degree sequence is graphical, but there is no upper bound on
#' the number of iterations.
#'
#' The \dQuote{configuration.simple} method (formerly called "simple.no.multiple.uniform")
#' is
#' identical to \dQuote{configuration}, but if the generated graph is not simple,
#' it rejects it and re-starts the generation.
#' It generates all simple graphs with the same probability.
#'
#' The \dQuote{vl} method samples undirected connected graphs approximately uniformly.
#' It is a Monte Carlo method based on degree-preserving edge switches.
#' This generator should be favoured if undirected and connected graphs are to be
#'  generated and execution time is not a concern. igraph uses
#'  the original implementation of Fabien Viger; for the algorithm, see
#'  <https://www-complexnetworks.lip6.fr/~latapy/FV/generation.html>
#'  and the paper <https://arxiv.org/abs/cs/0502085>.
#'
#' The \dQuote{edge.switching.simple} is an MCMC sampler based on
#' degree-preserving edge switches. It generates simple undirected or directed graphs.
#'
#' @param out.deg Numeric vector, the sequence of degrees (for undirected
#'   graphs) or out-degrees (for directed graphs). For undirected graphs its sum
#'   should be even. For directed graphs its sum should be the same as the sum of
#'   `in.deg`.
#' @param in.deg For directed graph, the in-degree sequence. By default this is
#'   `NULL` and an undirected graph is created.
#' @param method Character, the method for generating the graph. See Details.
#' @return The new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso
#' [simplify()] to get rid of the multiple and/or loops edges,
#' [realize_degseq()] for a deterministic variant.
#' @family games
#' @export
#' @keywords graphs
#' @examples
#'
#' ## The simple generator
#' undirected_graph <- sample_degseq(rep(2, 100))
#' degree(undirected_graph)
#' is_simple(undirected_graph) # sometimes TRUE, but can be FALSE
#'
#'
#' directed_graph <- sample_degseq(1:10, 10:1)
#' degree(directed_graph, mode = "out")
#' degree(directed_graph, mode = "in")
#'
#' ## The vl generator
#' vl_graph <- sample_degseq(rep(2, 100), method = "vl")
#' degree(vl_graph)
#' is_simple(vl_graph) # always TRUE
#'
#' ## Exponential degree distribution
#' ## We fix the seed as there's no guarantee
#' ##  that randomly picked integers will form a graphical degree sequence
#' ## (i.e. that there's a graph with these degrees)
#' ## withr::with_seed(42, {
#' ## exponential_degrees <- sample(1:100, 100, replace = TRUE, prob = exp(-0.5 * (1:100)))
#' ## })
#' exponential_degrees <- c(
#'   5L, 6L, 1L, 4L, 3L, 2L, 3L, 1L, 3L, 3L, 2L, 3L, 6L, 1L, 2L,
#'   6L, 8L, 1L, 2L, 2L, 5L, 1L, 10L, 6L, 1L, 2L, 1L, 5L, 2L, 4L,
#'   3L, 4L, 1L, 3L, 1L, 4L, 1L, 1L, 5L, 2L, 1L, 2L, 1L, 8L, 2L, 7L,
#'   5L, 3L, 8L, 2L, 1L, 1L, 2L, 4L, 1L, 3L, 3L, 1L, 1L, 2L, 3L, 9L,
#'   3L, 2L, 4L, 1L, 1L, 4L, 3L, 1L, 1L, 1L, 1L, 2L, 1L, 3L, 1L, 1L,
#'   2L, 1L, 2L, 1L, 1L, 3L, 3L, 2L, 1L, 1L, 1L, 1L, 3L, 1L, 1L, 6L,
#'   6L, 3L, 1L, 2L, 3L, 2L
#' )
#' ## Note, that we'd have to correct the degree sequence if its sum is odd
#' is_exponential_degrees_sum_odd <- (sum(exponential_degrees) %% 2 != 0)
#' if (is_exponential_degrees_sum_odd) {
#'   exponential_degrees[1] <- exponential_degrees[1] + 1
#' }
#' exp_vl_graph <- sample_degseq(exponential_degrees, method = "vl")
#' all(degree(exp_vl_graph) == exponential_degrees)
#'
#' ## An example that does not work
#' @examplesIf rlang::is_interactive()
#' ## withr::with_seed(11, {
#' ## exponential_degrees <- sample(1:100, 100, replace = TRUE, prob = exp(-0.5 * (1:100)))
#' ## })
#' exponential_degrees <- c(
#'   1L, 1L, 2L, 1L, 1L, 7L, 1L, 1L, 5L, 1L, 1L, 2L, 5L, 4L, 3L,
#'   2L, 2L, 1L, 1L, 2L, 1L, 3L, 1L, 1L, 1L, 2L, 2L, 1L, 1L, 2L, 2L,
#'   1L, 2L, 1L, 4L, 3L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 3L, 1L, 4L, 3L,
#'   1L, 2L, 4L, 2L, 2L, 2L, 1L, 1L, 2L, 2L, 4L, 1L, 2L, 1L, 3L, 1L,
#'   2L, 3L, 1L, 1L, 2L, 1L, 2L, 3L, 2L, 2L, 1L, 6L, 2L, 1L, 1L, 1L,
#'   1L, 1L, 2L, 2L, 1L, 4L, 2L, 1L, 3L, 4L, 1L, 1L, 3L, 1L, 2L, 4L,
#'   1L, 3L, 1L, 2L, 1L
#' )
#' ## Note, that we'd have to correct the degree sequence if its sum is odd
#' is_exponential_degrees_sum_odd <- (sum(exponential_degrees) %% 2 != 0)
#' if (is_exponential_degrees_sum_odd) {
#'   exponential_degrees[1] <- exponential_degrees[1] + 1
#' }
#' exp_vl_graph <- sample_degseq(exponential_degrees, method = "vl")
#'
#' @examples
#' ## Power-law degree distribution
#' ## We fix the seed as there's no guarantee
#' ##  that randomly picked integers will form a graphical degree sequence
#' ## (i.e. that there's a graph with these degrees)
#' ## withr::with_seed(1, {
#' ##  powerlaw_degrees <- sample(1:100, 100, replace = TRUE, prob = (1:100)^-2)
#' ## })
#' powerlaw_degrees <- c(
#'   1L, 1L, 1L, 6L, 1L, 6L, 10L, 2L, 2L, 1L, 1L, 1L, 2L, 1L, 3L,
#'   1L, 2L, 43L, 1L, 3L, 9L, 1L, 2L, 1L, 1L, 1L, 1L, 1L, 4L, 1L,
#'   1L, 1L, 1L, 1L, 3L, 2L, 3L, 1L, 2L, 1L, 3L, 2L, 3L, 1L, 1L, 3L,
#'   1L, 1L, 2L, 2L, 1L, 4L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 1L, 7L, 1L,
#'   1L, 1L, 2L, 1L, 1L, 3L, 1L, 5L, 1L, 4L, 1L, 1L, 1L, 5L, 4L, 1L,
#'   3L, 13L, 1L, 2L, 1L, 1L, 2L, 1L, 2L, 1L, 1L, 1L, 1L, 1L, 2L,
#'   5L, 3L, 3L, 1L, 1L, 3L, 1L
#' )
#' ## Note, that we correct the degree sequence if its sum is odd
#' is_exponential_degrees_sum_odd <- (sum(powerlaw_degrees) %% 2 != 0)
#' if (is_exponential_degrees_sum_odd) {
#'   powerlaw_degrees[1] <- powerlaw_degrees[1] + 1
#' }
#' powerlaw_vl_graph <- sample_degseq(powerlaw_degrees, method = "vl")
#' all(degree(powerlaw_vl_graph) == powerlaw_degrees)
#'
#' ## An example that does not work
#' @examplesIf rlang::is_interactive()
#' ## withr::with_seed(2, {
#' ##  powerlaw_degrees <- sample(1:100, 100, replace = TRUE, prob = (1:100)^-2)
#' ## })
#' powerlaw_degrees <- c(
#'   1L, 2L, 1L, 1L, 10L, 10L, 1L, 4L, 1L, 1L, 1L, 1L, 2L, 1L, 1L,
#'   4L, 21L, 1L, 1L, 1L, 2L, 1L, 4L, 1L, 1L, 1L, 1L, 1L, 14L, 1L,
#'   1L, 1L, 3L, 4L, 1L, 2L, 4L, 1L, 2L, 1L, 25L, 1L, 1L, 1L, 10L,
#'   3L, 19L, 1L, 1L, 3L, 1L, 1L, 2L, 8L, 1L, 3L, 3L, 36L, 2L, 2L,
#'   3L, 5L, 2L, 1L, 4L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 2L,
#'   1L, 4L, 1L, 1L, 1L, 2L, 1L, 1L, 1L, 4L, 18L, 1L, 2L, 1L, 21L,
#'   1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L
#' )
#' ## Note, that we correct the degree sequence if its sum is odd
#' is_exponential_degrees_sum_odd <- (sum(powerlaw_degrees) %% 2 != 0)
#' if (is_exponential_degrees_sum_odd) {
#'   powerlaw_degrees[1] <- powerlaw_degrees[1] + 1
#' }
#' powerlaw_vl_graph <- sample_degseq(powerlaw_degrees, method = "vl")
#' all(degree(powerlaw_vl_graph) == powerlaw_degrees)
#'
sample_degseq <- function(out.deg, in.deg = NULL,
                          method = c("configuration", "vl", "fast.heur.simple", "configuration.simple", "edge.switching.simple")) {
  if (missing(method)) {
    method <- method[1]
  }
  method <- igraph.match.arg(
    method,
    values = c(
      "configuration", "vl", "fast.heur.simple",
      "configuration.simple", "edge.switching.simple",
      "simple", "simple.no.multiple", "simple.no.multiple.uniform" # old names
    )
  )

  if (method == "simple") {
    lifecycle::deprecate_warn("2.0.4", "sample_degseq(method = 'must be configuration instead of simple')")
    method <- "configuration"
  }

  if (method == "simple.no.multiple") {
    lifecycle::deprecate_warn("2.0.4", "sample_degseq(method = 'must be fast.heur.simple instead of simple.no.multiple')")
    method <- "fast.heur.simple"
  }

  if (method == "simple.no.multiple.uniform") {
    lifecycle::deprecate_warn("2.0.4", "sample_degseq(method = 'must be configuration.simple instead of simple.no.multiple.uniform')")
    method <- "configuration.simple"
  }

  # numbers from https://github.com/igraph/igraph/blob/640083c88bf85fd322ff7b748b9b4e16ebe32aa2/include/igraph_constants.h#L94
  method1 <- switch(method,
    "configuration" = 0,
    "vl" = 1,
    "fast.heur.simple" = 2,
    "configuration.simple" = 3,
    "edge.switching.simple" = 4
  )
  if (!is.null(in.deg)) {
    in.deg <- as.numeric(in.deg)
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_degree_sequence_game, as.numeric(out.deg),
    in.deg, as.numeric(method1)
  )
  if (igraph_opt("add.params")) {
    res$name <- "Degree sequence random graph"
    res$method <- method
  }
  res
}

#' @rdname sample_degseq
#' @param deterministic  Whether the construction should be deterministic
#' @param ... Passed to `realize_degseq()` if \sQuote{deterministic} is true,
#'   or to `sample_degseq()` otherwise.
#' @export
degseq <- function(..., deterministic = FALSE) {
  constructor_spec(
    if (deterministic) realize_degseq else sample_degseq, ...
  )
}

## -----------------------------------------------------------------

#' Growing random graph generation
#'
#' This function creates a random graph by simulating its stochastic evolution.
#'
#' This is discrete time step model, in each time step a new vertex is added to
#' the graph and `m` new edges are created. If `citation` is
#' `FALSE` these edges are connecting two uniformly randomly chosen
#' vertices, otherwise the edges are connecting new vertex to uniformly
#' randomly chosen old vertices.
#'
#' @param n Numeric constant, number of vertices in the graph.
#' @param m Numeric constant, number of edges added in each time step.
#' @param directed Logical, whether to create a directed graph.
#' @param citation Logical. If `TRUE` a citation graph is created, i.e. in
#'   each time step the added edges are originating from the new vertex.
#' @return A new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @family games
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- sample_growing(500, citation = FALSE)
#' g2 <- sample_growing(500, citation = TRUE)
#'
#' @cdocs igraph_growing_random_game
sample_growing <- growing_random_game_impl

#' @rdname sample_growing
#' @param ... Passed to `sample_growing()`.
#' @export
growing <- function(...) constructor_spec(sample_growing, ...)

## -----------------------------------------------------------------


#' Generate an evolving random graph with preferential attachment and aging
#'
#' This function creates a random graph by simulating its evolution. Each time
#' a new vertex is added it creates a number of links to old vertices and the
#' probability that an old vertex is cited depends on its in-degree
#' (preferential attachment) and age.
#'
#' This is a discrete time step model of a growing graph. We start with a
#' network containing a single vertex (and no edges) in the first time step.
#' Then in each time step (starting with the second) a new vertex is added and
#' it initiates a number of edges to the old vertices in the network. The
#' probability that an old vertex is connected to is proportional to
#' \deqn{P[i] \sim (c\cdot k_i^\alpha+a)(d\cdot l_i^\beta+b)}.
#'
#' Here \eqn{k_i}{k[i]} is the in-degree of vertex \eqn{i} in the current time
#' step and \eqn{l_i}{l[i]} is the age of vertex \eqn{i}. The age is simply
#' defined as the number of time steps passed since the vertex is added, with
#' the extension that vertex age is divided to be in `aging.bin` bins.
#'
#' \eqn{c}, \eqn{\alpha}{alpha}, \eqn{a}, \eqn{d}, \eqn{\beta}{beta} and
#' \eqn{b} are parameters and they can be set via the following arguments:
#' `pa.exp` (\eqn{\alpha}{alpha}, mandatory argument), `aging.exp`
#' (\eqn{\beta}{beta}, mandatory argument), `zero.deg.appeal` (\eqn{a},
#' optional, the default value is 1), `zero.age.appeal` (\eqn{b},
#' optional, the default is 0), `deg.coef` (\eqn{c}, optional, the default
#' is 1), and `age.coef` (\eqn{d}, optional, the default is 1).
#'
#' The number of edges initiated in each time step is governed by the `m`,
#' `out.seq` and `out.pref` parameters. If `out.seq` is given
#' then it is interpreted as a vector giving the number of edges to be added in
#' each time step. It should be of length `n` (the number of vertices),
#' and its first element will be ignored. If `out.seq` is not given (or
#' NULL) and `out.dist` is given then it will be used as a discrete
#' probability distribution to generate the number of edges. Its first element
#' gives the probability that zero edges are added at a time step, the second
#' element is the probability that one edge is added, etc. (`out.seq`
#' should contain non-negative numbers, but if they don't sum up to 1, they
#' will be normalized to sum up to 1. This behavior is similar to the
#' `prob` argument of the `sample` command.)
#'
#' By default a directed graph is generated, but it `directed` is set to
#' `FALSE` then an undirected is created. Even if an undirected graph is
#' generated \eqn{k_i}{k[i]} denotes only the adjacent edges not initiated by
#' the vertex itself except if `out.pref` is set to `TRUE`.
#'
#' If the `time.window` argument is given (and not NULL) then
#' \eqn{k_i}{k[i]} means only the adjacent edges added in the previous
#' `time.window` time steps.
#'
#' This function might generate graphs with multiple edges.
#'
#' @param n The number of vertices in the graph.
#' @param pa.exp The preferential attachment exponent, see the details below.
#' @param aging.exp The exponent of the aging, usually a non-positive number,
#'   see details below.
#' @param m The number of edges each new vertex creates (except the very first
#'   vertex). This argument is used only if both the `out.dist` and
#'   `out.seq` arguments are NULL.
#' @param aging.bin The number of bins to use for measuring the age of
#'   vertices, see details below.
#' @param out.dist The discrete distribution to generate the number of edges to
#'   add in each time step if `out.seq` is NULL. See details below.
#' @param out.seq The number of edges to add in each time step, a vector
#'   containing as many elements as the number of vertices. See details below.
#' @param out.pref Logical constant, whether to include edges not initiated by
#'   the vertex as a basis of preferential attachment. See details below.
#' @param directed Logical constant, whether to generate a directed graph. See
#'   details below.
#' @param zero.deg.appeal The degree-dependent part of the
#'   \sQuote{attractiveness} of the vertices with no adjacent edges. See also
#'   details below.
#' @param zero.age.appeal The age-dependent part of the \sQuote{attrativeness}
#'   of the vertices with age zero. It is usually zero, see details below.
#' @param deg.coef The coefficient of the degree-dependent
#'   \sQuote{attractiveness}. See details below.
#' @param age.coef The coefficient of the age-dependent part of the
#'   \sQuote{attractiveness}. See details below.
#' @param time.window Integer constant, if NULL only adjacent added in the last
#'   `time.windows` time steps are counted as a basis of the preferential
#'   attachment. See also details below.
#' @return A new graph.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @family games
#' @export
#' @keywords graphs
#' @examples
#'
#' # The maximum degree for graph with different aging exponents
#' g1 <- sample_pa_age(10000, pa.exp = 1, aging.exp = 0, aging.bin = 1000)
#' g2 <- sample_pa_age(10000, pa.exp = 1, aging.exp = -1, aging.bin = 1000)
#' g3 <- sample_pa_age(10000, pa.exp = 1, aging.exp = -3, aging.bin = 1000)
#' max(degree(g1))
#' max(degree(g2))
#' max(degree(g3))
sample_pa_age <- function(n, pa.exp, aging.exp, m = NULL, aging.bin = 300,
                          out.dist = NULL, out.seq = NULL,
                          out.pref = FALSE, directed = TRUE,
                          zero.deg.appeal = 1, zero.age.appeal = 0,
                          deg.coef = 1, age.coef = 1,
                          time.window = NULL) {
  # Checks
  if (!is.null(out.seq) && (!is.null(m) || !is.null(out.dist))) {
    warning("if `out.seq' is given `m' and `out.dist' should be NULL")
    m <- out.dist <- NULL
  }
  if (is.null(out.seq) && !is.null(out.dist) && !is.null(m)) {
    warning("if `out.dist' is given `m' will be ignored")
    m <- NULL
  }
  if (!is.null(out.seq) && length(out.seq) != n) {
    stop("`out.seq' should be of length `n'")
  }
  if (!is.null(out.seq) && min(out.seq) < 0) {
    stop("negative elements in `out.seq'")
  }
  if (!is.null(m) && m < 0) {
    stop("`m' is negative")
  }
  if (!is.null(time.window) && time.window <= 0) {
    stop("time window size should be positive")
  }
  if (!is.null(m) && m == 0) {
    warning("`m' is zero, graph will be empty")
  }
  if (aging.exp > 0) {
    warning("aging exponent is positive")
  }
  if (zero.deg.appeal <= 0) {
    warning("initial attractiveness is not positive")
  }

  if (is.null(m) && is.null(out.dist) && is.null(out.seq)) {
    m <- 1
  }

  n <- as.numeric(n)
  if (!is.null(m)) {
    m <- as.numeric(m)
  }
  if (!is.null(out.dist)) {
    out.dist <- as.numeric(out.dist)
  }
  if (!is.null(out.seq)) {
    out.seq <- as.numeric(out.seq)
  }
  out.pref <- as.logical(out.pref)

  if (!is.null(out.dist)) {
    out.seq <- as.numeric(sample(0:(length(out.dist) - 1), n,
      replace = TRUE, prob = out.dist
    ))
  }

  if (is.null(out.seq)) {
    out.seq <- numeric()
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- if (is.null(time.window)) {
    .Call(
      R_igraph_barabasi_aging_game, as.numeric(n),
      as.numeric(pa.exp), as.numeric(aging.exp),
      as.numeric(aging.bin), m, out.seq,
      out.pref, as.numeric(zero.deg.appeal), as.numeric(zero.age.appeal),
      as.numeric(deg.coef), as.numeric(age.coef), directed
    )
  } else {
    .Call(
      R_igraph_recent_degree_aging_game, as.numeric(n),
      as.numeric(pa.exp), as.numeric(aging.exp),
      as.numeric(aging.bin), m, out.seq, out.pref, as.numeric(zero.deg.appeal),
      directed, time.window
    )
  }
  if (igraph_opt("add.params")) {
    res$name <- "Aging Barabasi graph"
    res$pa.exp <- pa.exp
    res$aging.exp <- aging.exp
    res$m <- m
    res$aging.bin <- aging.bin
    res$out.pref <- out.pref
    res$zero.deg.appeal <- zero.deg.appeal
    res$zero.age.appeal <- zero.age.appeal
    res$deg.coef <- deg.coef
    res$age.coef <- age.coef
    res$time.window <- if (is.null(time.window)) Inf else time.window
  }
  res
}

#' @rdname sample_pa_age
#' @param ... Passed to `sample_pa_age()`.
#' @export
pa_age <- function(...) constructor_spec(sample_pa_age, ...)

## -----------------------------------------------------------------

#' Graph generation based on different vertex types
#'
#' These functions implement evolving network models based on different vertex
#' types.
#'
#' For `sample_traits_callaway()` the simulation goes like this: in each
#' discrete time step a new vertex is added to the graph. The type of this
#' vertex is generated based on `type.dist`. Then two vertices are
#' selected uniformly randomly from the graph. The probability that they will
#' be connected depends on the types of these vertices and is taken from
#' `pref.matrix`. Then another two vertices are selected and this is
#' repeated `edges.per.step` times in each time step.
#'
#' For `sample_traits()` the simulation goes like this: a single vertex is
#' added at each time step. This new vertex tries to connect to `k`
#' vertices in the graph. The probability that such a connection is realized
#' depends on the types of the vertices involved and is taken from
#' `pref.matrix`.
#'
#' @param nodes The number of vertices in the graph.
#' @param types The number of different vertex types.
#' @param edge.per.step The number of edges to add to the graph per time step.
#' @param type.dist The distribution of the vertex types. This is assumed to be
#'   stationary in time.
#' @param pref.matrix A matrix giving the preferences of the given vertex
#'   types. These should be probabilities, i.e. numbers between zero and one.
#' @param directed Logical constant, whether to generate directed graphs.
#' @param k The number of trials per time step, see details below.
#' @return A new graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @family games
#' @export
#' @keywords graphs
#' @examples
#'
#' # two types of vertices, they like only themselves
#' g1 <- sample_traits_callaway(1000, 2, pref.matrix = matrix(c(1, 0, 0, 1), ncol = 2))
#' g2 <- sample_traits(1000, 2, k = 2, pref.matrix = matrix(c(1, 0, 0, 1), ncol = 2))
sample_traits_callaway <- function(nodes, types, edge.per.step = 1,
                                   type.dist = rep(1, types),
                                   pref.matrix = matrix(1, types, types),
                                   directed = FALSE) {
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_callaway_traits_game, as.double(nodes),
    as.double(types), as.double(edge.per.step),
    as.double(type.dist), matrix(
      as.double(pref.matrix), types,
      types
    ),
    as.logical(directed)
  )
  if (igraph_opt("add.params")) {
    res$name <- "Trait-based Callaway graph"
    res$types <- types
    res$edge.per.step <- edge.per.step
    res$type.dist <- type.dist
    res$pref.matrix <- pref.matrix
  }
  res
}

#' @rdname sample_traits_callaway
#' @param ... Passed to the constructor, `sample_traits()` or
#'   `sample_traits_callaway()`.
#' @export
traits_callaway <- function(...) constructor_spec(sample_traits_callaway, ...)

#' @rdname sample_traits_callaway
#' @export
sample_traits <- function(nodes, types, k = 1, type.dist = rep(1, types),
                          pref.matrix = matrix(1, types, types),
                          directed = FALSE) {
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_establishment_game, as.double(nodes),
    as.double(types), as.double(k), as.double(type.dist),
    matrix(as.double(pref.matrix), types, types),
    as.logical(directed)
  )
  if (igraph_opt("add.params")) {
    res$name <- "Trait-based growing graph"
    res$types <- types
    res$k <- k
    res$type.dist <- type.dist
    res$pref.matrix <- pref.matrix
  }
  res
}

#' @rdname sample_traits_callaway
#' @export
traits <- function(...) constructor_spec(sample_traits, ...)

## -----------------------------------------------------------------

#' Geometric random graphs
#'
#' Generate a random graph based on the distance of random point on a unit
#' square
#'
#' First a number of points are dropped on a unit square, these points
#' correspond to the vertices of the graph to create. Two points will be
#' connected with an undirected edge if they are closer to each other in
#' Euclidean norm than a given radius. If the `torus` argument is
#' `TRUE` then a unit area torus is used instead of a square.
#'
#' @param nodes The number of vertices in the graph.
#' @param radius The radius within which the vertices will be connected by an
#'   edge.
#' @param torus Logical constant, whether to use a torus instead of a square.
#' @param coords Logical scalar, whether to add the positions of the vertices
#'   as vertex attributes called \sQuote{`x`} and \sQuote{`y`}.
#' @return A graph object. If `coords` is `TRUE` then with vertex
#'   attributes \sQuote{`x`} and \sQuote{`y`}.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}, first version was
#' written by Keith Briggs (<http://keithbriggs.info/>).
#' @family games
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- sample_grg(1000, 0.05, torus = FALSE)
#' g2 <- sample_grg(1000, 0.05, torus = TRUE)
#'
sample_grg <- function(nodes, radius, torus = FALSE, coords = FALSE) {
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_grg_game, as.double(nodes), as.double(radius),
    as.logical(torus), as.logical(coords)
  )
  if (coords) {
    V(res[[1]])$x <- res[[2]]
    V(res[[1]])$y <- res[[3]]
  }
  if (igraph_opt("add.params")) {
    res[[1]]$name <- "Geometric random graph"
    res[[1]]$radius <- radius
    res[[1]]$torus <- torus
  }
  res[[1]]
}

#' @rdname sample_grg
#' @param ... Passed to `sample_grg()`.
#' @export
grg <- function(...) constructor_spec(sample_grg, ...)

## -----------------------------------------------------------------


#' Trait-based random generation
#'
#' Generation of random graphs based on different vertex types.
#'
#' Both models generate random graphs with given vertex types. For
#' `sample_pref()` the probability that two vertices will be connected
#' depends on their type and is given by the \sQuote{pref.matrix} argument.
#' This matrix should be symmetric to make sense but this is not checked. The
#' distribution of the different vertex types is given by the
#' \sQuote{type.dist} vector.
#'
#' For `sample_asym_pref()` each vertex has an in-type and an
#' out-type and a directed graph is created. The probability that a directed
#' edge is realized from a vertex with a given out-type to a vertex with a
#' given in-type is given in the \sQuote{pref.matrix} argument, which can be
#' asymmetric. The joint distribution for the in- and out-types is given in the
#' \sQuote{type.dist.matrix} argument.
#'
#' The types of the generated vertices can be retrieved from the
#' `type` vertex attribute for `sample_pref()` and from the
#' `intype` and `outtype` vertex attribute for `sample_asym_pref()`.
#'
#' @param nodes The number of vertices in the graphs.
#' @param types The number of different vertex types.
#' @param type.dist The distribution of the vertex types, a numeric vector of
#'   length \sQuote{types} containing non-negative numbers. The vector will be
#'   normed to obtain probabilities.
#' @param fixed.sizes Fix the number of vertices with a given vertex type
#'   label. The `type.dist` argument gives the group sizes (i.e. number of
#'   vertices with the different labels) in this case.
#' @param type.dist.matrix The joint distribution of the in- and out-vertex
#'   types.
#' @param pref.matrix A square matrix giving the preferences of the vertex
#'   types. The matrix has \sQuote{types} rows and columns. When generating
#'   an undirected graph, it must be symmetric.
#' @param directed Logical constant, whether to create a directed graph.
#' @param loops Logical constant, whether self-loops are allowed in the graph.
#' @return An igraph graph.
#' @author Tamas Nepusz \email{ntamas@@gmail.com} and Gabor Csardi
#' \email{csardi.gabor@@gmail.com} for the R interface
#' @family games
#' @export
#' @keywords graphs
#' @examples
#'
#' pf <- matrix(c(1, 0, 0, 1), nrow = 2)
#' g <- sample_pref(20, 2, pref.matrix = pf)
#' @examplesIf rlang::is_installed("tcltk") && rlang::is_interactive()
#' # example code
#'
#' tkplot(g, layout = layout_with_fr)
#' @examples
#'
#' pf <- matrix(c(0, 1, 0, 0), nrow = 2)
#' g <- sample_asym_pref(20, 2, pref.matrix = pf)
#' @examplesIf rlang::is_installed("tcltk") && rlang::is_interactive()
#' tkplot(g, layout = layout_in_circle)
#'
sample_pref <- function(nodes, types, type.dist = rep(1, types),
                        fixed.sizes = FALSE,
                        pref.matrix = matrix(1, types, types),
                        directed = FALSE, loops = FALSE) {
  if (nrow(pref.matrix) != types || ncol(pref.matrix) != types) {
    stop("Invalid size for preference matrix")
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_preference_game, as.numeric(nodes), as.numeric(types),
    as.double(type.dist), as.logical(fixed.sizes),
    matrix(as.double(pref.matrix), types, types),
    as.logical(directed), as.logical(loops)
  )
  V(res[[1]])$type <- res[[2]] + 1
  if (igraph_opt("add.params")) {
    res[[1]]$name <- "Preference random graph"
    res[[1]]$types <- types
    res[[1]]$type.dist <- type.dist
    res[[1]]$fixed.sizes <- fixed.sizes
    res[[1]]$pref.matrix <- pref.matrix
    res[[1]]$loops <- loops
  }
  res[[1]]
}

#' @rdname sample_pref
#' @param ... Passed to the constructor, `sample_pref()` or
#'   `sample_asym_pref()`.
#' @export
pref <- function(...) constructor_spec(sample_pref, ...)

#' @rdname sample_pref
#' @export
sample_asym_pref <- function(nodes, types,
                             type.dist.matrix = matrix(1, types, types),
                             pref.matrix = matrix(1, types, types),
                             loops = FALSE) {
  if (nrow(pref.matrix) != types || ncol(pref.matrix) != types) {
    stop("Invalid size for preference matrix")
  }
  if (nrow(type.dist.matrix) != types || ncol(type.dist.matrix) != types) {
    stop("Invalid size for type distribution matrix")
  }

  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_asymmetric_preference_game,
    as.numeric(nodes), as.numeric(types), as.numeric(types),
    matrix(as.double(type.dist.matrix), types, types),
    matrix(as.double(pref.matrix), types, types),
    as.logical(loops)
  )
  V(res[[1]])$outtype <- res[[2]] + 1
  V(res[[1]])$intype <- res[[3]] + 1
  if (igraph_opt("add.params")) {
    res[[1]]$name <- "Asymmetric preference random graph"
    res[[1]]$types <- types
    res[[1]]$type.dist.matrix <- type.dist.matrix
    res[[1]]$pref.matrix <- pref.matrix
    res[[1]]$loops <- loops
  }

  res[[1]]
}

#' @rdname sample_pref
#' @export
asym_pref <- function(...) constructor_spec(sample_asym_pref, ...)

## -----------------------------------------------------------------


#' @rdname ego
#' @export
#' @family functions for manipulating graph structure
connect <- function(graph, order, mode = c("all", "out", "in", "total")) {
  ensure_igraph(graph)
  mode <- igraph.match.arg(mode)
  mode <- switch(mode,
    "out" = 1,
    "in" = 2,
    "all" = 3,
    "total" = 3
  )

  on.exit(.Call(R_igraph_finalizer))
  .Call(
    R_igraph_connect_neighborhood, graph, as.numeric(order),
    as.numeric(mode)
  )
}


#' The Watts-Strogatz small-world model
#'
#' This function generates networks with the small-world property
#' based on a variant of the Watts-Strogatz model. The network is obtained
#' by first creating a periodic undirected lattice, then rewiring both
#' endpoints of each edge with probability `p`, while avoiding the
#' creation of multi-edges.
#'
#' Note that this function might create graphs with loops and/or multiple
#' edges. You can use [simplify()] to get rid of these.
#'
#' @details
#' This process differs from the original model of Watts and Strogatz
#' (see reference) in that it rewires **both** endpoints of edges. Thus in
#' the limit of `p=1`, we obtain a G(n,m) random graph with the
#' same number of vertices and edges as the original lattice. In comparison,
#' the original Watts-Strogatz model only rewires a single endpoint of each edge,
#' thus the network does not become fully random even for `p=1`.
#' For appropriate choices of `p`, both models exhibit the property of
#' simultaneously having short path lengths and high clustering.
#'
#'
#' @param dim Integer constant, the dimension of the starting lattice.
#' @param size Integer constant, the size of the lattice along each dimension.
#' @param nei Integer constant, the neighborhood within which the vertices of
#'   the lattice will be connected.
#' @param p Real constant between zero and one, the rewiring probability.
#' @param loops Logical scalar, whether loops edges are allowed in the
#'   generated graph.
#' @param multiple Logical scalar, whether multiple edges are allowed int the
#'   generated graph.
#' @return A graph object.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [make_lattice()], [rewire()]
#' @references Duncan J Watts and Steven H Strogatz: Collective dynamics of
#' \sQuote{small world} networks, Nature 393, 440-442, 1998.
#' @family games
#' @export
#' @keywords graphs
#' @examples
#'
#' g <- sample_smallworld(1, 100, 5, 0.05)
#' mean_distance(g)
#' transitivity(g, type = "average")
#'
sample_smallworld <- function(dim, size, nei, p, loops = FALSE,
                              multiple = FALSE) {
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_watts_strogatz_game, as.numeric(dim),
    as.numeric(size), as.numeric(nei), as.numeric(p),
    as.logical(loops), as.logical(multiple)
  )
  if (igraph_opt("add.params")) {
    res$name <- "Watts-Strogatz random graph"
    res$dim <- dim
    res$size <- size
    res$nei <- nei
    res$p <- p
    res$loops <- loops
    res$multiple <- multiple
  }
  res
}

#' @rdname sample_smallworld
#' @param ... Passed to `sample_smallworld()`.
#' @export
smallworld <- function(...) constructor_spec(sample_smallworld, ...)

## -----------------------------------------------------------------

#' Random citation graphs
#'
#' `sample_last_cit()` creates a graph, where vertices age, and
#' gain new connections based on how long ago their last citation
#' happened.
#'
#' `sample_cit_cit_types()` is a stochastic block model where the
#' graph is growing.
#'
#' `sample_cit_types()` is similarly a growing stochastic block model,
#' but the probability of an edge depends on the (potentially) cited
#' vertex only.
#'
#' @param n Number of vertices.
#' @param edges Number of edges per step.
#' @param agebins Number of aging bins.
#' @param pref Vector (`sample_last_cit()` and `sample_cit_types()` or
#'   matrix (`sample_cit_cit_types()`) giving the (unnormalized) citation
#'   probabilities for the different vertex types.
#' @param directed Logical scalar, whether to generate directed networks.
#' @param types Vector of length \sQuote{`n`}, the types of the vertices.
#'   Types are numbered from zero.
#' @param attr Logical scalar, whether to add the vertex types to the generated
#'   graph as a vertex attribute called \sQuote{`type`}.
#' @return A new graph.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @keywords graphs
#' @family games
#' @export
sample_last_cit <- function(n, edges = 1, agebins = n / 7100, pref = (1:(agebins + 1))^-3,
                            directed = TRUE) {
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_lastcit_game, as.numeric(n), as.numeric(edges),
    as.numeric(agebins),
    as.numeric(pref), as.logical(directed)
  )
  if (igraph_opt("add.params")) {
    res$name <- "Random citation graph based on last citation"
    res$edges <- edges
    res$agebins <- agebins
  }
  res
}

#' @rdname sample_last_cit
#' @param ... Passed to the actual constructor.
#' @export
last_cit <- function(...) constructor_spec(sample_last_cit, ...)

#' @rdname sample_last_cit
#' @export
sample_cit_types <- function(n, edges = 1, types = rep(0, n),
                             pref = rep(1, length(types)),
                             directed = TRUE, attr = TRUE) {
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_cited_type_game, as.numeric(n), as.numeric(edges),
    as.numeric(types), as.numeric(pref), as.logical(directed)
  )
  if (attr) {
    V(res)$type <- types
  }
  if (igraph_opt("add.params")) {
    res$name <- "Random citation graph (cited type)"
    res$edges <- edges
  }
  res
}

#' @rdname sample_last_cit
#' @export
cit_types <- function(...) constructor_spec(sample_cit_types, ...)

#' @rdname sample_last_cit
#' @export
sample_cit_cit_types <- function(n, edges = 1, types = rep(0, n),
                                 pref = matrix(1,
                                   nrow = length(types),
                                   ncol = length(types)
                                 ),
                                 directed = TRUE, attr = TRUE) {
  pref[] <- as.numeric(pref)
  on.exit(.Call(R_igraph_finalizer))
  res <- .Call(
    R_igraph_citing_cited_type_game, as.numeric(n),
    as.numeric(types), pref, as.numeric(edges),
    as.logical(directed)
  )
  if (attr) {
    V(res)$type <- types
  }
  if (igraph_opt("add.params")) {
    res$name <- "Random citation graph (citing & cited type)"
    res$edges <- edges
  }
  res
}

#' @rdname sample_last_cit
#' @export
cit_cit_types <- function(...) constructor_spec(sample_cit_cit_types, ...)

## -----------------------------------------------------------------


#' Bipartite random graphs
#'
#' Generate bipartite graphs using the Erdős-Rényi model
#'
#' Similarly to unipartite (one-mode) networks, we can define the \eqn{G(n,p)}, and
#' \eqn{G(n,m)} graph classes for bipartite graphs, via their generating process.
#' In \eqn{G(n,p)} every possible edge between top and bottom vertices is realized
#' with probability \eqn{p}, independently of the rest of the edges. In \eqn{G(n,m)}, we
#' uniformly choose \eqn{m} edges to realize.
#'
#' @param n1 Integer scalar, the number of bottom vertices.
#' @param n2 Integer scalar, the number of top vertices.
#' @param type Character scalar, the type of the graph, \sQuote{gnp} creates a
#'   \eqn{G(n,p)} graph, \sQuote{gnm} creates a \eqn{G(n,m)} graph. See details below.
#' @param p Real scalar, connection probability for \eqn{G(n,p)} graphs. Should not
#'   be given for \eqn{G(n,m)} graphs.
#' @param m Integer scalar, the number of edges for \eqn{G(n,m)} graphs. Should not
#'   be given for \eqn{G(n,p)} graphs.
#' @param directed Logical scalar, whether to create a directed graph. See also
#'   the `mode` argument.
#' @param mode Character scalar, specifies how to direct the edges in directed
#'   graphs. If it is \sQuote{out}, then directed edges point from bottom
#'   vertices to top vertices. If it is \sQuote{in}, edges point from top
#'   vertices to bottom vertices. \sQuote{out} and \sQuote{in} do not generate
#'   mutual edges. If this argument is \sQuote{all}, then each edge direction is
#'   considered independently and mutual edges might be generated. This argument
#'   is ignored for undirected graphs.
#' @return A bipartite igraph graph.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @family games
#' @export
#' @keywords graphs
#' @examples
#'
#' ## empty graph
#' sample_bipartite(10, 5, p = 0)
#'
#' ## full graph
#' sample_bipartite(10, 5, p = 1)
#'
#' ## random bipartite graph
#' sample_bipartite(10, 5, p = .1)
#'
#' ## directed bipartite graph, G(n,m)
#' sample_bipartite(10, 5, type = "Gnm", m = 20, directed = TRUE, mode = "all")
#'
sample_bipartite <- function(n1, n2, type = c("gnp", "gnm"), p, m,
                             directed = FALSE, mode = c("out", "in", "all")) {
  n1 <- as.numeric(n1)
  n2 <- as.numeric(n2)
  type <- igraph.match.arg(type)
  if (!missing(p)) {
    p <- as.numeric(p)
  }
  if (!missing(m)) {
    m <- as.numeric(m)
  }
  directed <- as.logical(directed)
  mode <- switch(igraph.match.arg(mode),
    "out" = 1,
    "in" = 2,
    "all" = 3
  )

  if (type == "gnp" && missing(p)) {
    stop("Connection probability `p' is not given for Gnp graph")
  }
  if (type == "gnp" && !missing(m)) {
    warning("Number of edges `m' is ignored for Gnp graph")
  }
  if (type == "gnm" && missing(m)) {
    stop("Number of edges `m' is not given for Gnm graph")
  }
  if (type == "gnm" && !missing(p)) {
    warning("Connection probability `p' is ignored for Gnp graph")
  }

  on.exit(.Call(R_igraph_finalizer))
  if (type == "gnp") {
    res <- .Call(R_igraph_bipartite_game_gnp, n1, n2, p, directed, mode)
    res <- set_vertex_attr(res$graph, "type", value = res$types)
    res$name <- "Bipartite Gnp random graph"
    res$p <- p
  } else if (type == "gnm") {
    res <- .Call(R_igraph_bipartite_game_gnm, n1, n2, m, directed, mode)
    res <- set_vertex_attr(res$graph, "type", value = res$types)
    res$name <- "Bipartite Gnm random graph"
    res$m <- m
  }

  res
}

#' @rdname sample_bipartite
#' @param ... Passed to `sample_bipartite()`.
#' @export
bipartite <- function(...) constructor_spec(sample_bipartite, ...)


#' Sample stochastic block model
#'
#' Sampling from the stochastic block model of networks
#'
#' This function samples graphs from a stochastic block model by (doing the
#' equivalent of) Bernoulli trials for each potential edge with the
#' probabilities given by the Bernoulli rate matrix, `pref.matrix`.
#' The order of the vertices in the generated graph corresponds to the
#' `block.sizes` argument.
#'
#' @param n Number of vertices in the graph.
#' @param pref.matrix The matrix giving the Bernoulli rates.  This is a
#'   \eqn{K\times K}{KxK} matrix, where \eqn{K} is the number of groups. The
#'   probability of creating an edge between vertices from groups \eqn{i} and
#'   \eqn{j} is given by element \eqn{(i,j)}. For undirected graphs, this matrix
#'   must be symmetric.
#' @param block.sizes Numeric vector giving the number of vertices in each
#'   group. The sum of the vector must match the number of vertices.
#' @param directed Logical scalar, whether to generate a directed graph.
#' @param loops Logical scalar, whether self-loops are allowed in the graph.
#' @return An igraph graph.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @references Faust, K., & Wasserman, S. (1992a). Blockmodels: Interpretation
#' and evaluation. *Social Networks*, 14, 5--61.
#' @keywords graphs
#' @examples
#'
#' ## Two groups with not only few connection between groups
#' pm <- cbind(c(.1, .001), c(.001, .05))
#' g <- sample_sbm(1000, pref.matrix = pm, block.sizes = c(300, 700))
#' g
#' @family games
#' @export
#' @cdocs igraph_sbm_game
sample_sbm <- sbm_game_impl

#' @rdname sample_sbm
#' @param ... Passed to `sample_sbm()`.
#' @export
sbm <- function(...) constructor_spec(sample_sbm, ...)

## -----------------------------------------------------------------

#' Sample the hierarchical stochastic block model
#'
#' Sampling from a hierarchical stochastic block model of networks.
#'
#' The function generates a random graph according to the hierarchical
#' stochastic block model.
#'
#' @param n Integer scalar, the number of vertices.
#' @param m Integer scalar, the number of vertices per block. `n / m` must
#'   be integer. Alternatively, an integer vector of block sizes, if not all the
#'   blocks have equal sizes.
#' @param rho Numeric vector, the fraction of vertices per cluster, within a
#'   block. Must sum up to 1, and `rho * m` must be integer for all elements
#'   of rho. Alternatively a list of rho vectors, one for each block, if they are
#'   not the same for all blocks.
#' @param C A square, symmetric numeric matrix, the Bernoulli rates for the
#'   clusters within a block. Its size must mach the size of the `rho`
#'   vector. Alternatively, a list of square matrices, if the Bernoulli rates
#'   differ in different blocks.
#' @param p Numeric scalar, the Bernoulli rate of connections between vertices
#'   in different blocks.
#' @return An igraph graph.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @keywords graphs
#' @examples
#'
#' ## Ten blocks with three clusters each
#' C <- matrix(c(
#'   1, 3 / 4, 0,
#'   3 / 4, 0, 3 / 4,
#'   0, 3 / 4, 3 / 4
#' ), nrow = 3)
#' g <- sample_hierarchical_sbm(100, 10, rho = c(3, 3, 4) / 10, C = C, p = 1 / 20)
#' g
#' if (require(Matrix)) {
#'   image(g[])
#' }
#' @family games
#' @export
#' @cdocs igraph_hsbm_game
#' @cdocs igraph_hsbm_list_game
sample_hierarchical_sbm <- function(n, m, rho, C, p) {
  mlen <- length(m)
  rholen <- if (is.list(rho)) length(rho) else 1
  Clen <- if (is.list(C)) length(C) else 1

  commonlen <- unique(c(mlen, rholen, Clen))

  if (length(commonlen) == 1 && commonlen == 1) {
    hsbm_game_impl(n, m, rho, C, p)
  } else {
    commonlen <- setdiff(commonlen, 1)
    if (length(commonlen) != 1) {
      stop("Lengths of `m', `rho' and `C' must match")
    }
    m <- rep(m, length.out = commonlen)
    rho <- if (is.list(rho)) {
      rep(rho, length.out = commonlen)
    } else {
      rep(list(rho), length.out = commonlen)
    }
    C <- if (is.list(C)) {
      rep(C, length.out = commonlen)
    } else {
      rep(list(C), length.out = commonlen)
    }
    hsbm_list_game_impl(n, m, rho, C, p)
  }
}

#' @rdname sample_hierarchical_sbm
#' @param ... Passed to `sample_hierarchical_sbm()`.
#' @export
hierarchical_sbm <- function(...) {
  constructor_spec(sample_hierarchical_sbm, ...)
}

## -----------------------------------------------------------------


#' Generate random graphs according to the random dot product graph model
#'
#' In this model, each vertex is represented by a latent position vector.
#' Probability of an edge between two vertices are given by the dot product of
#' their latent position vectors.
#'
#' The dot product of the latent position vectors should be in the \[0,1\]
#' interval, otherwise a warning is given. For negative dot products, no edges
#' are added; dot products that are larger than one always add an edge.
#'
#' @param vecs A numeric matrix in which each latent position vector is a
#'   column.
#' @param directed A logical scalar, TRUE if the generated graph should be
#'   directed.
#' @return An igraph graph object which is the generated random dot product
#'   graph.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [sample_dirichlet()], [sample_sphere_surface()]
#' and [sample_sphere_volume()] for sampling position vectors.
#' @references Christine Leigh Myers Nickel: Random dot product graphs, a model
#' for social networks. Dissertation, Johns Hopkins University, Maryland, USA,
#' 2006.
#' @keywords graphs
#' @examples
#'
#' ## A randomly generated  graph
#' lpvs <- matrix(rnorm(200), 20, 10)
#' lpvs <- apply(lpvs, 2, function(x) {
#'   return(abs(x) / sqrt(sum(x^2)))
#' })
#' g <- sample_dot_product(lpvs)
#' g
#'
#' ## Sample latent vectors from the surface of the unit sphere
#' lpvs2 <- sample_sphere_surface(dim = 5, n = 20)
#' g2 <- sample_dot_product(lpvs2)
#' g2
#' @family games
#' @export
#' @cdocs igraph_dot_product_game
sample_dot_product <- dot_product_game_impl

#' @rdname sample_dot_product
#' @param ... Passed to `sample_dot_product()`.
#' @export
dot_product <- function(...) constructor_spec(sample_dot_product, ...)


#' A graph with subgraphs that are each a random graph.
#'
#' Create a number of Erdős-Rényi random graphs with identical parameters, and
#' connect them with the specified number of edges.
#'
#' @section Examples:
#' \preformatted{
#' g <- sample_islands(3, 10, 5/10, 1)
#' oc <- cluster_optimal(g)
#' oc
#' }
#'
#' @param islands.n The number of islands in the graph.
#' @param islands.size The size of islands in the graph.
#' @param islands.pin The probability to create each possible edge into each
#'   island.
#' @param n.inter The number of edges to create between two islands.
#' @return An igraph graph.
#' @author Samuel Thiriot
#' @seealso [sample_gnp()]
#' @keywords graphs
#' @family games
#' @export
#' @cdocs igraph_simple_interconnected_islands_game
sample_islands <- simple_interconnected_islands_game_impl


#' Create a random regular graph
#'
#' Generate a random graph where each vertex has the same degree.
#'
#' This game generates a directed or undirected random graph where the degrees
#' of vertices are equal to a predefined constant k. For undirected graphs, at
#' least one of k and the number of vertices must be even.
#'
#' The game simply uses [sample_degseq()] with appropriately
#' constructed degree sequences.
#'
#' @param no.of.nodes Integer scalar, the number of vertices in the generated
#'   graph.
#' @param k Integer scalar, the degree of each vertex in the graph, or the
#'   out-degree and in-degree in a directed graph.
#' @param directed Logical scalar, whether to create a directed graph.
#' @param multiple Logical scalar, whether multiple edges are allowed.
#' @return An igraph graph.
#' @author Tamas Nepusz \email{ntamas@@gmail.com}
#' @seealso [sample_degseq()] for a generator with prescribed degree
#' sequence.
#' @keywords graphs
#' @examples
#'
#' ## A simple ring
#' ring <- sample_k_regular(10, 2)
#' plot(ring)
#'
#' ## k-regular graphs on 10 vertices, with k=1:9
#' k10 <- lapply(1:9, sample_k_regular, no.of.nodes = 10)
#'
#' layout(matrix(1:9, nrow = 3, byrow = TRUE))
#' sapply(k10, plot, vertex.label = NA)
#' @family games
#' @export
#' @cdocs igraph_k_regular_game
sample_k_regular <- k_regular_game_impl


#' Random graph with given expected degrees
#'
#' @description
#' `r lifecycle::badge("experimental")`
#'
#' The Chung-Lu model is useful for generating random graphs with fixed expected
#' degrees. This function implements both the original model of Chung and Lu, as
#' well as some additional variants with useful properties.
#'
#' @details
#' In the original Chung-Lu model, each pair of vertices \eqn{i} and \eqn{j} is
#' connected with independent probability
#' \deqn{p_{ij} = \frac{w_i w_j}{S},}{p_ij = w_i w_j / S,}
#' where \eqn{w_i} is a weight associated with vertex \eqn{i} and
#' \deqn{S = \sum_k w_k}{S = sum_k w_k}
#' is the sum of weights. In the directed variant, vertices have both
#' out-weights, \eqn{w^\text{out}}{w^out}, and in-weights,
#' \eqn{w^\text{in}}{w^in}, with equal sums,
#' \deqn{S = \sum_k w^\text{out}_k = \sum_k w^\text{in}_k.}{S = sum_k w^out_k = sum_k w^in_k.}
#' The connection probability between \eqn{i} and \eqn{j} is
#' \deqn{p_{ij} = \frac{w^\text{out}_i w^\text{in}_j.}{S}}{p_ij = w^out_i w^in_j / S.}
#'
#' This model is commonly used to create random graphs with a fixed
#' \emph{expected} degree sequence. The expected degree of vertex \eqn{i} is
#' approximately equal to the weight \eqn{w_i}. Specifically, if the graph is
#' directed and self-loops are allowed, then the expected out- and in-degrees
#' are precisely \eqn{w^\text{out}}{w^out} and \eqn{w^\text{in}}{w^in}. If
#' self-loops are disallowed, then the expected out- and in-degrees are
#' \eqn{\frac{w^\text{out} (S - w^\text{in})}{S}}{w^out (S - w^in) / S}
#' and
#' \eqn{\frac{w^\text{in} (S - w^\text{out})}{S}}{w^in (S - w^out) / S},
#' respectively. If the graph is undirected, then the expected degrees with and
#' without self-loops are
#' \eqn{\frac{w (S + w)}{S}}{w (S + w) / S}
#' and
#' \eqn{\frac{w (S - w)}{S}}{w (S - w) / S},
#' respectively.
#'
#' A limitation of the original Chung-Lu model is that when some of the weights
#' are large, the formula for \eqn{p_{ij}}{p_ij} yields values larger than 1.
#' Chung
#' and Lu's original paper excludes the use of such weights. When
#' \eqn{p_{ij} > 1}{p_ij > 1}, this function simply issues a warning and creates
#' a connection between \eqn{i} and \eqn{j}. However, in this case the expected
#' degrees will no longer relate to the weights in the manner stated above. Thus,
#' the original Chung-Lu model cannot produce certain (large) expected degrees.
#'
#' To overcome this limitation, this function implements additional variants of
#' the model, with modified expressions for the connection probability
#' \eqn{p_{ij}}{p_ij} between vertices \eqn{i} and \eqn{j}. Let
#' \eqn{q_{ij} = \frac{w_i w_j}{S}}{q_ij = w_i w_j / S}, or
#' \eqn{q_{ij} = \frac{w^\text{out}_i w^\text{in}_j}{S}}{q_ij = w^out_i w^in_j / S}
#' in the directed case. All model variants become equivalent in the limit of sparse
#' graphs where \eqn{q_{ij}} approaches zero. In the original Chung-Lu model,
#' selectable by setting \code{variant} to \dQuote{original}, \eqn{p_{ij} =
#' \min(q_{ij}, 1)}{p_ij = min(q_ij, 1)}. The \dQuote{maxent} variant,
#' sometimes referred to as the generalized random graph, uses \eqn{p_{ij} =
#' \frac{q_{ij}}{1 + q_{ij}}}{p_ij = q_ij / (1 + q_ij)}, and is equivalent to a
#' maximum entropy model (i.e., exponential random graph model) with a
#' constraint on expected degrees;
#' see Park and Newman (2004), Section B, setting \eqn{\exp(-\Theta_{ij}) =
#' \frac{w_i w_j}{S}}{exp(-Theta_ij) = w_i w_j / S}. This model is also discussed
#' by Britton, Deijfen, and Martin-Löf (2006). By virtue of being a
#' degree-constrained maximum entropy model, it generates graphs with the same
#' degree sequence with the same probability. A third variant can be requested
#' with \dQuote{nr}, and uses \eqn{p_{ij} = 1 - \exp(-q_{ij})}{p_ij = 1 -
#' exp(-q_ij)}. This is the underlying simple graph of a multigraph model
#' introduced by Norros and Reittu (2006). For a discussion of these three model
#' variants, see Section 16.4 of Bollobás, Janson, Riordan (2007), as well as
#' Van Der Hofstad (2013).
#'
#' @references Chung, F., and Lu, L. (2002). Connected components in a random
#'   graph with given degree sequences. Annals of Combinatorics, 6, 125-145.
#'   \doi{10.1007/PL00012580}
#'
#'   Miller, J. C., and Hagberg, A. (2011). Efficient Generation of Networks
#'   with Given Expected Degrees. \doi{10.1007/978-3-642-21286-4_10}
#'
#'   Park, J., and Newman, M. E. J. (2004). Statistical mechanics of networks.
#'   Physical Review E, 70, 066117. \doi{10.1103/PhysRevE.70.066117}
#'
#'   Britton, T., Deijfen, M., and Martin-Löf, A. (2006). Generating Simple
#'   Random Graphs with Prescribed Degree Distribution. Journal of Statistical
#'   Physics, 124, 1377-1397. \doi{10.1007/s10955-006-9168-x}
#'
#'   Norros, I., and Reittu, H. (2006). On a conditionally Poissonian graph
#'   process. Advances in Applied Probability, 38, 59-75.
#'   \doi{10.1239/aap/1143936140}
#'
#'   Bollobás, B., Janson, S., and Riordan, O. (2007). The phase transition in
#'   inhomogeneous random graphs. Random Structures & Algorithms, 31, 3-122.
#'   \doi{10.1002/rsa.20168}
#'
#'   Van Der Hofstad, R. (2013). Critical behavior in inhomogeneous random
#'   graphs. Random Structures & Algorithms, 42, 480-508.
#'   \doi{10.1002/rsa.20450}
#'
#' @inheritParams rlang::args_dots_empty
#' @param out.weights A vector of non-negative vertex weights (or out-weights).
#'   In sparse graphs, these will be approximately equal to the expected
#'   (out-)degrees.
#' @param in.weights A vector of non-negative in-weights, approximately equal to
#'   the expected in-degrees in sparse graphs. May be set to \code{NULL}, in
#'   which case undirected graphs are generated.
#' @param loops Logical, whether to allow the creation of self-loops. Since
#'   vertex pairs are connected independently, setting this to \code{FALSE} is
#'   equivalent to simply discarding self-loops from an existing loopy Chung-Lu
#'   graph.
#' @param variant The model variant to sample from, with different definitions
#'   of the connection probability between vertices \eqn{i} and \eqn{j}. Given
#'   \eqn{q_{ij} = \frac{w_i w_j}{S}}{q_ij = w_i w_j / S}, the following
#'   formulations are available:
#'   \describe{
#'     \item{\dQuote{original}}{the original Chung-Lu model, \eqn{p_{ij} = \min(q_{ij}, 1)}{p_ij = min(q_ij, 1)}.}
#'     \item{\dQuote{maxent}}{maximum entropy model with fixed expected degrees,
#'       \eqn{p_{ij} = \frac{q_{ij}}{1 + q_{ij}}}{p_ij = q_ij / (1 + q_ij)}.}
#'     \item{\dQuote{nr}}{Norros and Reittu's model, \eqn{p_{ij} = 1 - \exp(-q_{ij})}{p_ij = 1 - exp(-q_ij)}.}
#'   }
#' @return An igraph graph.
#' @seealso [sample_fitness()] implements a similar model with a sharp
#'   constraint on the number of edges. [sample_degseq()] samples random graphs
#'   with sharply specified degrees. [sample_gnp()] creates random graphs with a
#'   fixed connection probability \eqn{p} between all vertex pairs.
#'
#' @family games
#' @examples
#'
#' g <- sample_chung_lu(c(3, 3, 2, 2, 2, 1, 1))
#'
#' rowMeans(replicate(
#'   100,
#'   degree(sample_chung_lu(c(1, 3, 2, 1), c(2, 1, 2, 2)), mode = "out")
#' ))
#'
#' rowMeans(replicate(
#'   100,
#'   degree(sample_chung_lu(c(1, 3, 2, 1), c(2, 1, 2, 2), variant = "maxent"), mode='out')
#' ))
#' @export
#' @cdocs igraph_chung_lu_game
sample_chung_lu <- chung_lu_game_impl

#' @rdname sample_chung_lu
#' @export
chung_lu <- function(
    out.weights,
    in.weights = NULL,
    ...,
    loops = TRUE,
    variant = c("original", "maxent", "nr")
) {
  variant <- rlang::arg_match(variant)
  constructor_spec(
    sample_chung_lu,
    out.weights,
    in.weights,
    ...,
    loops = loops,
    variant = variant
  )
}


#' Random graphs from vertex fitness scores
#'
#' This function generates a non-growing random graph with edge probabilities
#' proportional to node fitness scores.
#'
#' This game generates a directed or undirected random graph where the
#' probability of an edge between vertices \eqn{i} and \eqn{j} depends on the
#' fitness scores of the two vertices involved. For undirected graphs, each
#' vertex has a single fitness score. For directed graphs, each vertex has an
#' out- and an in-fitness, and the probability of an edge from \eqn{i} to
#' \eqn{j} depends on the out-fitness of vertex \eqn{i} and the in-fitness of
#' vertex \eqn{j}.
#'
#' The generation process goes as follows. We start from \eqn{N} disconnected
#' nodes (where \eqn{N} is given by the length of the fitness vector). Then we
#' randomly select two vertices \eqn{i} and \eqn{j}, with probabilities
#' proportional to their fitnesses. (When the generated graph is directed,
#' \eqn{i} is selected according to the out-fitnesses and \eqn{j} is selected
#' according to the in-fitnesses). If the vertices are not connected yet (or if
#' multiple edges are allowed), we connect them; otherwise we select a new
#' pair. This is repeated until the desired number of links are created.
#'
#' It can be shown that the *expected* degree of each vertex will be
#' proportional to its fitness, although the actual, observed degree will not
#' be. If you need to generate a graph with an exact degree sequence, consider
#' [sample_degseq()] instead.
#'
#' This model is commonly used to generate static scale-free networks. To
#' achieve this, you have to draw the fitness scores from the desired power-law
#' distribution. Alternatively, you may use [sample_fitness_pl()]
#' which generates the fitnesses for you with a given exponent.
#'
#' @param no.of.edges The number of edges in the generated graph.
#' @param fitness.out A numeric vector containing the fitness of each vertex.
#'   For directed graphs, this specifies the out-fitness of each vertex.
#' @param fitness.in If `NULL` (the default), the generated graph will be
#'   undirected. If not `NULL`, then it should be a numeric vector and it
#'   specifies the in-fitness of each vertex.
#'
#'   If this argument is not `NULL`, then a directed graph is generated,
#'   otherwise an undirected one.
#' @param loops Logical scalar, whether to allow loop edges in the graph.
#' @param multiple Logical scalar, whether to allow multiple edges in the
#'   graph.
#' @return An igraph graph, directed or undirected.
#' @author Tamas Nepusz \email{ntamas@@gmail.com}
#' @references Goh K-I, Kahng B, Kim D: Universal behaviour of load
#' distribution in scale-free networks. *Phys Rev Lett* 87(27):278701,
#' 2001.
#' @keywords graphs
#' @family games
#' @export
#' @examples
#'
#' N <- 10000
#' g <- sample_fitness(5 * N, sample((1:50)^-2, N, replace = TRUE))
#' degree_distribution(g)
#' plot(degree_distribution(g, cumulative = TRUE), log = "xy")
#' @cdocs igraph_static_fitness_game
sample_fitness <- static_fitness_game_impl


#' Scale-free random graphs, from vertex fitness scores
#'
#' This function generates a non-growing random graph with expected power-law
#' degree distributions.
#'
#' This game generates a directed or undirected random graph where the degrees
#' of vertices follow power-law distributions with prescribed exponents. For
#' directed graphs, the exponents of the in- and out-degree distributions may
#' be specified separately.
#'
#' The game simply uses [sample_fitness()] with appropriately
#' constructed fitness vectors. In particular, the fitness of vertex \eqn{i} is
#' \eqn{i^{-\alpha}}{i^(-alpha)}, where \eqn{\alpha = 1/(\gamma-1)}{alpha = 1/(gamma - 1)}
#' and \eqn{\gamma}{gamma} is the exponent given in the arguments.
#'
#' To remove correlations between in- and out-degrees in case of directed
#' graphs, the in-fitness vector will be shuffled after it has been set up and
#' before [sample_fitness()] is called.
#'
#' Note that significant finite size effects may be observed for exponents
#' smaller than 3 in the original formulation of the game. This function
#' provides an argument that lets you remove the finite size effects by
#' assuming that the fitness of vertex \eqn{i} is
#' \eqn{(i+i_0-1)^{-\alpha}}{(i+i0-1)^(-alpha)} where \eqn{i_0}{i0} is a
#' constant chosen appropriately to ensure that the maximum degree is less than
#' the square root of the number of edges times the average degree; see the
#' paper of Chung and Lu, and Cho et al for more details.
#'
#' @param no.of.nodes The number of vertices in the generated graph.
#' @param no.of.edges The number of edges in the generated graph.
#' @param exponent.out Numeric scalar, the power law exponent of the degree
#'   distribution. For directed graphs, this specifies the exponent of the
#'   out-degree distribution. It must be greater than or equal to 2. If you pass
#'   `Inf` here, you will get back an Erdős-Rényi random network.
#' @param exponent.in Numeric scalar. If negative, the generated graph will be
#'   undirected. If greater than or equal to 2, this argument specifies the
#'   exponent of the in-degree distribution. If non-negative but less than 2, an
#'   error will be generated.
#' @param loops Logical scalar, whether to allow loop edges in the generated
#'   graph.
#' @param multiple Logical scalar, whether to allow multiple edges in the
#'   generated graph.
#' @param finite.size.correction Logical scalar, whether to use the proposed
#'   finite size correction of Cho et al., see references below.
#' @return An igraph graph, directed or undirected.
#' @author Tamas Nepusz \email{ntamas@@gmail.com}
#' @references Goh K-I, Kahng B, Kim D: Universal behaviour of load
#' distribution in scale-free networks. *Phys Rev Lett* 87(27):278701,
#' 2001.
#'
#' Chung F and Lu L: Connected components in a random graph with given degree
#' sequences. *Annals of Combinatorics* 6, 125-145, 2002.
#'
#' Cho YS, Kim JS, Park J, Kahng B, Kim D: Percolation transitions in
#' scale-free networks under the Achlioptas process. *Phys Rev Lett*
#' 103:135702, 2009.
#' @family games
#' @keywords graphs
#' @export
#' @examples
#'
#' g <- sample_fitness_pl(10000, 30000, 2.2, 2.3)
#' plot(degree_distribution(g, cumulative = TRUE, mode = "out"), log = "xy")
#' @cdocs igraph_static_power_law_game
sample_fitness_pl <- static_power_law_game_impl


#' Forest Fire Network Model
#'
#' This is a growing network model, which resembles of how the forest fire
#' spreads by igniting trees close by.
#'
#' The forest fire model intends to reproduce the following network
#' characteristics, observed in real networks: \itemize{ \item Heavy-tailed
#' in-degree distribution.  \item Heavy-tailed out-degree distribution.  \item
#' Communities.  \item Densification power-law. The network is densifying in
#' time, according to a power-law rule.  \item Shrinking diameter. The diameter
#' of the network decreases in time.  }
#'
#' The network is generated in the following way. One vertex is added at a
#' time. This vertex connects to (cites) `ambs` vertices already present
#' in the network, chosen uniformly random. Now, for each cited vertex \eqn{v}
#' we do the following procedure: \enumerate{ \item We generate two random
#' number, \eqn{x} and \eqn{y}, that are geometrically distributed with means
#' \eqn{p/(1-p)} and \eqn{rp(1-rp)}. (\eqn{p} is `fw.prob`, \eqn{r} is
#' `bw.factor`.) The new vertex cites \eqn{x} outgoing neighbors and
#' \eqn{y} incoming neighbors of \eqn{v}, from those which are not yet cited by
#' the new vertex. If there are less than \eqn{x} or \eqn{y} such vertices
#' available then we cite all of them.  \item The same procedure is applied to
#' all the newly cited vertices.  }
#'
#' @param nodes The number of vertices in the graph.
#' @param fw.prob The forward burning probability, see details below.
#' @param bw.factor The backward burning ratio. The backward burning
#'   probability is calculated as `bw.factor*fw.prob`.
#' @param ambs The number of ambassador vertices.
#' @param directed Logical scalar, whether to create a directed graph.
#' @return A simple graph, possibly directed if the `directed` argument is
#'   `TRUE`.
#' @note The version of the model in the published paper is incorrect in the
#' sense that it cannot generate the kind of graphs the authors claim. A
#' corrected version is available from
#' <http://www.cs.cmu.edu/~jure/pubs/powergrowth-tkdd.pdf>, our
#' implementation is based on this.
#' @author Gabor Csardi \email{csardi.gabor@@gmail.com}
#' @seealso [sample_pa()] for the basic preferential attachment
#' model.
#' @references Jure Leskovec, Jon Kleinberg and Christos Faloutsos. Graphs over
#' time: densification laws, shrinking diameters and possible explanations.
#' *KDD '05: Proceeding of the eleventh ACM SIGKDD international
#' conference on Knowledge discovery in data mining*, 177--187, 2005.
#' @family games
#' @keywords graphs
#' @export
#' @examples
#'
#' fire <- sample_forestfire(50, fw.prob = 0.37, bw.factor = 0.32 / 0.37)
#' plot(fire)
#'
#' g <- sample_forestfire(10000, fw.prob = 0.37, bw.factor = 0.32 / 0.37)
#' dd1 <- degree_distribution(g, mode = "in")
#' dd2 <- degree_distribution(g, mode = "out")
#' # The forest fire model produces graphs with a heavy tail degree distribution.
#' # Note that some in- or out-degrees are zero which will be excluded from the logarithmic plot.
#' plot(seq(along.with = dd1) - 1, dd1, log = "xy")
#' points(seq(along.with = dd2) - 1, dd2, col = 2, pch = 2)
#' @cdocs igraph_forest_fire_game
sample_forestfire <- forest_fire_game_impl


#' Generate a new random graph from a given graph by randomly
#' adding/removing edges
#'
#' Sample a new graph by perturbing the adjacency matrix of a given graph
#' and shuffling its vertices.
#'
#' Please see the reference given below.
#'
#' @param old.graph The original graph.
#' @param corr A scalar in the unit interval, the target Pearson
#'   correlation between the adjacency matrices of the original and the generated
#'   graph (the adjacency matrix being used as a vector).
#' @param p A numeric scalar, the probability of an edge between two
#'   vertices, it must in the open (0,1) interval. The default is the empirical
#'   edge density of the graph. If you are resampling an Erdős-Rényi graph and
#'   you know the original edge probability of the Erdős-Rényi model, you should
#'   supply that explicitly.
#' @param permutation A numeric vector, a permutation vector that is
#'   applied on the vertices of the first graph, to get the second graph.  If
#'   `NULL`, the vertices are not permuted.
#' @return An unweighted graph of the same size as `old.graph` such
#'   that the correlation coefficient between the entries of the two
#'   adjacency matrices is `corr`.  Note each pair of corresponding
#'   matrix entries is a pair of correlated Bernoulli random variables.
#'
#' @references Lyzinski, V., Fishkind, D. E., Priebe, C. E. (2013).  Seeded
#' graph matching for correlated Erdős-Rényi graphs.
#' <https://arxiv.org/abs/1304.7844>
#' @family games
#' @export
#' @examples
#' g <- sample_gnp(1000, .1)
#' g2 <- sample_correlated_gnp(g, corr = 0.5)
#' cor(as.vector(g[]), as.vector(g2[]))
#' g
#' g2
#' @cdocs igraph_correlated_game
sample_correlated_gnp <- correlated_game_impl


#' Sample a pair of correlated \eqn{G(n,p)} random graphs
#'
#' Sample a new graph by perturbing the adjacency matrix of a given graph and
#' shuffling its vertices.
#'
#' Please see the reference given below.
#'
#' @param n Numeric scalar, the number of vertices for the sampled graphs.
#' @param corr A scalar in the unit interval, the target Pearson correlation
#'   between the adjacency matrices of the original the generated graph (the
#'   adjacency matrix being used as a vector).
#' @param p A numeric scalar, the probability of an edge between two vertices,
#'   it must in the open (0,1) interval.
#' @param directed Logical scalar, whether to generate directed graphs.
#' @param permutation A numeric vector, a permutation vector that is applied on
#'   the vertices of the first graph, to get the second graph.  If `NULL`,
#'   the vertices are not permuted.
#' @return A list of two igraph objects, named `graph1` and
#'   `graph2`, which are two graphs whose adjacency matrix entries are
#'   correlated with `corr`.
#'
#' @references Lyzinski, V., Fishkind, D. E., Priebe, C. E. (2013).  Seeded
#' graph matching for correlated Erdős-Rényi graphs.
#' <https://arxiv.org/abs/1304.7844>
#' @keywords graphs
#' @family games
#' @export
#' @examples
#' gg <- sample_correlated_gnp_pair(
#'   n = 10, corr = .8, p = .5,
#'   directed = FALSE
#' )
#' gg
#' cor(as.vector(gg[[1]][]), as.vector(gg[[2]][]))
#' @cdocs igraph_correlated_pair_game
sample_correlated_gnp_pair <- correlated_pair_game_impl
