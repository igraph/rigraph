# Reaching igraph again from inside a callback is easy to do without meaning
# to: `length()` on a graph calls `vcount()`, and lifecycle gets there through
# `rlang::trace_back()` while it assembles a backtrace for a deprecation
# warning. Every one of these used to leave the running algorithm working on
# structures that the nested call had freed, which ended in an igraph assertion
# or took R down with it.

# The smallest nested igraph call there is. Callbacks continue on FALSE.
call_igraph_again <- function(...) {
  vcount(make_ring(3))
  FALSE
}

test_that("a search callback may call igraph again", {
  g <- make_ring(5, directed = TRUE)

  expect_no_error(bfs(g, root = 1, callback = call_igraph_again))
  expect_no_error(dfs(g, root = 1, in.callback = call_igraph_again))
  expect_no_error(dfs(g, root = 1, out.callback = call_igraph_again))
})

test_that("a clique callback may call igraph again", {
  g <- make_full_graph(4)

  expect_no_error(cliques(g, min = 2, callback = call_igraph_again))
  expect_no_error(max_cliques(g, min = 2, callback = call_igraph_again))
})

test_that("a motif callback may call igraph again", {
  g <- make_ring(5, directed = TRUE)

  expect_no_error(motifs(g, 3, callback = call_igraph_again))
})

test_that("a cycle callback may call igraph again", {
  g <- make_ring(5, directed = TRUE)

  expect_no_error(simple_cycles(g, callback = call_igraph_again))
})

test_that("an isomorphism callback may call igraph again", {
  g <- make_ring(5, directed = TRUE)
  h <- make_ring(5, directed = TRUE)

  expect_no_error(isomorphisms(g, h, callback = call_igraph_again))
  expect_no_error(
    subgraph_isomorphisms(g, h, method = "vf2", callback = call_igraph_again)
  )
})

test_that("a community callback may call igraph again", {
  g <- make_graph("Zachary")

  expect_no_error(cluster_leading_eigen(g, callback = call_igraph_again))
})

test_that("an ARPACK multiplication may call igraph again", {
  multiply <- function(x, extra) {
    vcount(make_ring(3))
    x
  }

  expect_no_error(arpack(
    multiply,
    options = list(n = 5, nev = 1, ncv = 3, which = "LM"),
    sym = TRUE
  ))
})

test_that("an attribute combination function may call igraph again", {
  combine <- function(x) {
    vcount(make_ring(3))
    sum(x)
  }

  g <- make_graph(c(1, 2, 1, 2))
  E(g)$weight <- c(1, 2)
  expect_no_error(simplify(g, edge.attr.comb = list(weight = combine)))

  h <- make_ring(5)
  V(h)$size <- 1:5
  expect_no_error(
    contract(h, c(1, 1, 2, 2, 3), vertex.attr.comb = list(size = combine))
  )
})

test_that("a callback may signal a deprecation", {
  # The motivating case: lifecycle reaches `vcount()` through the backtrace it
  # assembles, so a deprecated function used as a callback took igraph down.
  # Two vertices keep the snapshot short: the callback runs for each of them,
  # and the "warning" verbosity a snapshot needs turns off the deduplication
  # that leaves a user with one warning.
  g <- make_ring(2, directed = TRUE)
  rlang::local_options(lifecycle_verbosity = "warning")

  expect_snapshot({
    order <- bfs(g, root = 1, callback = function(...) {
      is.igraph(g)
      FALSE
    })$order
  })
})

test_that("a callback may look at the graph it is given (#253)", {
  g <- set_vertex_attr(make_tree(10), "xx", value = 10:19)
  callback <- function(graph, data, extra) {
    V(graph)[data[["vid"]]]$xx
    format(graph)
    FALSE
  }

  expect_no_error(bfs(g, root = 1, mode = "out", callback = callback))
})

test_that("an error in a callback still reaches the caller", {
  # The nested call must not swallow the abort path along with the unwinding.
  g <- make_ring(5, directed = TRUE)
  callback <- function(...) {
    vcount(make_ring(3))
    cli::cli_abort("from the callback")
  }

  expect_error(bfs(g, root = 1, callback = callback), "from the callback")
})
