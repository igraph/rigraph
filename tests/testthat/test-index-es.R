
context("VS/ES indexing")

test_that("I can index a vs twice", {

  edges <- data.frame(
    stringsAsFactors = TRUE,
    from    = c("BOS", "JFK", "DEN", "BOS", "JFK", "DEN"),
    to      = c("JFK", "DEN", "ABQ", "JFK", "DEN", "ABQ"),
    carrier = c("foo", "foo", "foo", "bar", "bar", "bar")
  )

  vertices <- data.frame(
    stringsAsFactors = TRUE,
    id      = c("BOS", "JFK", "DEN", "ABQ"),
    state   = c("MA",  "NY",  "CO",  "NM")
  )

  g <- graph_from_data_frame(edges, vertices = vertices)

  x <- V(g)[ 3:4 ] [ state == 'NM' ]

  expect_equal(x, V(g)['ABQ'])
})

test_that("I can index an es twice", {

  edges <- data.frame(
    stringsAsFactors = TRUE,
    from    = c("BOS", "JFK", "DEN", "BOS", "JFK", "DEN"),
    to      = c("JFK", "DEN", "ABQ", "JFK", "DEN", "ABQ"),
    carrier = c("foo", "foo", "foo", "bar", "bar", "bar")
  )

  g <- graph_from_data_frame(edges)

  x <- E(g)['BOS' %->% 'JFK'][carrier == 'foo']

  expect_equal(x, E(g)[ carrier == 'foo' & .from('BOS') & .to('JFK')])
})
