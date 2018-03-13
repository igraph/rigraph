#' Helper functions for piping
#' 
#' Most igraph functions require a graph object as the first argument, however,
#' not all functions return a graph object. This makes using the magrittr pipe 
#' difficult because magrittr auto-fills the first argument of a function with
#' the output of the LHS. This function simply switches the expected order of 
#' any given igraph function so that the first argument is a vertex vector.  
#' @param vertices either a vertex vector or a string vector that represents nodes
#' @param func typically reserved for the RHS argument of the magrittr pipe
#' @param graph the graph object the nodes were taken from
#' @param ... arguments used in func
#' 
#' @examples 
#' 
#' set.seed(1234)
#' g <- erdos.renyi.game(10, .5, directed = T)
#' V(g)$name <- letters[1:10]
#' E(g)$weight <- runif(ecount(g), 0, 100)
#' 
#' g %>% 
#'   E() %>% 
#'   .[weight == max(.$weight)] %>% 
#'   rev_e(ends, g) %>% 
#'   c() %>% 
#'   rev_n(ego, g, order = 1, 'out') %>% 
#'   unlist() %>% 
#'   rev_n(induced.subgraph, g)
#'   @export
v_first <- function(vertices, func, graph, ...){
  arg <- formals(func) %>%
    names() %>%
    .[sapply(., function(x) grepl('^v|^n', x, T))] %>%
    .[1]
  
  temp <- list()
  temp[[arg]] <- nodes
  temp[['graph']] <- graph
  
  temp <- c(temp, as.list(match.call(expand.dots = F)[["..."]]))
  do.call(func, temp)
}

#' Helper functions for piping
#' 
#' Most igraph functions require a graph object as the first argument, however,
#' not all functions return a graph object. This makes using the magrittr pipe 
#' difficult because magrittr auto-fills the first argument of a function with
#' the output of the LHS. This function simply switches the expected order of 
#' any given igraph function so that the first argument is an edge vector.  
#' @param edges an edge vector
#' @param func typically reserved for the RHS argument of the magrittr pipe
#' @param graph the graph object the edges were taken from
#' @param ... arguments used in func
#' 
#' @examples 
#' 
#' set.seed(1234)
#' g <- erdos.renyi.game(10, .5, directed = T)
#' V(g)$name <- letters[1:10]
#' E(g)$weight <- runif(ecount(g), 0, 100)
#' 
#' g %>% 
#'   E() %>% 
#'   .[weight == max(.$weight)] %>% 
#'   rev_e(ends, g) %>% 
#'   c() %>% 
#'   rev_n(ego, g, order = 1, 'out') %>% 
#'   unlist() %>% 
#'   rev_n(induced.subgraph, g)
#'   @export
e_first <- function(edges, func, graph, ...){
  arg <- formals(func) %>%
    names() %>%
    .[sapply(., function(x) grepl('^e', x, T))] %>%
    .[1]
  
  temp <- list()
  temp[[arg]] <- edges
  temp[['graph']] <- graph
  
  temp <- c(temp, as.list(match.call(expand.dots = F)[["..."]]))
  do.call(func, temp)
}
