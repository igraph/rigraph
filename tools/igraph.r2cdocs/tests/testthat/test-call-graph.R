test_that("callees are visited breadth first, by vertex index", {
  # `b` is numbered before `c`, having appeared first as a caller,
  # so it comes first among the callees of `a`, which calls `c` first.
  graph <- call_graph(
    from = c("a", "a", "b", "c", "c"),
    to = c("c", "b", "d_impl", "a", "e_impl")
  )

  expect_equal(graph$vertices, c("a", "b", "c", "d_impl", "e_impl"))
  expect_equal(
    reachable_functions(graph, "a"),
    c("a", "b", "c", "d_impl", "e_impl")
  )
  expect_equal(
    reachable_functions(graph, "c"),
    c("c", "a", "e_impl", "b", "d_impl")
  )
  expect_equal(find_impl("c", graph), c("e_impl", "d_impl"))
})

test_that("a function that is not defined reaches nothing", {
  graph <- call_graph(from = "a", to = "b_impl")

  expect_equal(reachable_functions(graph, "z"), character())
  expect_equal(find_impl("z", graph), character())
})

test_that("the walk visits functions in the order igraph::subcomponent() does", {
  skip_if_not_installed("igraph")

  set.seed(20261016)
  functions <- c(paste0("f", 1:30), paste0("g", 1:10, "_impl"))
  from <- sample(functions[1:30], 120, replace = TRUE)
  to <- sample(functions, 120, replace = TRUE)

  graph <- call_graph(from, to)
  reference <- igraph::graph_from_data_frame(data.frame(from = from, to = to))

  expect_equal(graph$vertices, igraph::V(reference)$name)
  for (start in graph$vertices) {
    expect_equal(
      reachable_functions(graph, start),
      names(igraph::subcomponent(reference, start, mode = "out"))
    )
  }
})

test_that("the call graph comes from the function definitions under R/", {
  base_path <- withr::local_tempdir()
  dir.create(file.path(base_path, "R"))
  writeLines(
    c(
      "outer <- function(x) inner(x)",
      "inner <- function(x) {",
      "  list(degree_impl(x), vcount_impl(x))",
      "}"
    ),
    file.path(base_path, "R", "a.R")
  )

  graph <- r_call_graph(base_path)

  expect_equal(
    reachable_functions(graph, "outer"),
    c("outer", "inner", "list", "degree_impl", "vcount_impl")
  )
})
