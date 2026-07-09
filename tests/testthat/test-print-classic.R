test_that("classic: print.igraph() works", {
  local_igraph_options(print.full = TRUE)
  withr::local_options(width = 76)

  g <- make_ring(5)
  expect_output(summary(g), "attr:.* name[ ]*[(]g/c[)]")
  expect_output(print(g), "attr:.* name[ ]*[(]g/c[)]")
  expect_output(print(g), "1--2")

  V(g)$name <- letters[1:vcount(g)]
  expect_output(summary(g), "name[ ]*[(]v/c[)]")
  expect_output(print(g), "a--b")

  igraph_with_seed(42, {
    E(g)$weight <- sample(ecount(g))
  })
  expect_output(summary(g), "weight[\n |]*[(]e/n[)]")

  g$name <- "A ring"
  expect_output(summary(g), "A ring")
  expect_output(print(g, v = T), "vertex attributes")
  expect_output(print(g, e = T), "edges [(]vertex names[)] and")

  igraph_with_seed(42, {
    g2 <- sample_gnp(13, p = 0.6, directed = TRUE)
  })
  expect_output(print(g2), "1 ->")

  igraph_with_seed(42, {
    g3 <- sample_gnp(20, p = 0.8)
  })
  expect_output(print(g3), "1 --")

  igraph_with_seed(42, {
    g4 <- make_star(100)
  })
  expect_output(print(g4), "2->1")

  igraph_with_seed(42, {
    g5 <- make_star(100, mode = "out")
  })
  expect_output(print(g5), "1->")

  igraph_with_seed(42, {
    g6 <- sample_pa(100, m = 6, directed = FALSE)
  })
  expect_output(print(g6), "     ")

  kite <- make_empty_graph(directed = FALSE) + LETTERS[1:10]
  kite <- kite +
    edges(
      "A", "B",
      "A", "C",
      "A", "D",
      "A", "F",
      "B", "D",
      "B", "E",
      "B", "G",
      "C", "D",
      "C", "F",
      "D", "E",
      "D", "F",
      "D", "G",
      "E", "G",
      "F", "G",
      "F", "H",
      "G", "H",
      "H", "I",
      "I", "J"
    )
  expect_output(print(kite), "A -- ")
})

test_that("classic: print.igraph() respects max.print for adjacency list formats", {
  local_igraph_options(print.full = TRUE)
  withr::local_options(width = 76, max.print = 3)

  g <- make_full_graph(6)
  joined <- paste(capture.output(print(g)), collapse = "\n")
  expect_match(
    joined,
    'reached getOption\\("max.print"\\) -- omitted 3 vertices'
  )
  # First three source vertices shown, fourth onwards omitted
  expect_match(joined, "1 -- ")
  expect_match(joined, "3 -- ")
  expect_false(grepl("4 -- ", joined))

  V(g)$name <- letters[1:vcount(g)]
  joined <- paste(capture.output(print(g)), collapse = "\n")
  expect_match(
    joined,
    'reached getOption\\("max.print"\\) -- omitted 3 vertices'
  )
  expect_match(joined, "a -- ")
  expect_match(joined, "c -- ")
  expect_false(grepl("d -- ", joined))
})

test_that("classic: print.igraph() omits no message when vcount <= max.print", {
  local_igraph_options(print.full = TRUE)
  withr::local_options(width = 76, max.print = 10)

  g <- make_full_graph(6)
  joined <- paste(capture.output(print(g)), collapse = "\n")
  expect_false(grepl("reached getOption", joined))

  V(g)$name <- letters[1:vcount(g)]
  joined <- paste(capture.output(print(g)), collapse = "\n")
  expect_false(grepl("reached getOption", joined))
})

test_that("classic: print.igraph() respects max.print in the adjlist wrapping branch", {
  local_igraph_options(print.full = TRUE)
  withr::local_options(width = 40, max.print = 2)

  g <- make_full_graph(20)
  out <- capture.output(print(g))
  joined <- paste(out, collapse = "\n")
  expect_match(
    joined,
    'reached getOption\\("max.print"\\) -- omitted 18 vertices'
  )
  # Wrapped continuation lines should appear (lines starting with spaces before a number)
  expect_true(any(grepl("^ +[0-9]+ ", out)))
  expect_true(any(grepl("^1 -- ", out)))
  expect_true(any(grepl("^2 -- ", out)))
  expect_false(any(grepl("^3 -- ", out)))
})

test_that("classic: print.igraph.es() uses vertex names", {
  g <- make_directed_graph(c("A", "B"))
  expect_snapshot({
    E(g)
  })
})


test_that("classic: vs printing", {
  igraph_local_seed(42, rng_version = "3.5.0")
  g <- make_graph(~ A - A:B:C, B - A:B:C) %>%
    set_vertex_attr("color", value = "red") %>%
    set_vertex_attr("weight", value = sample(1:10, 3))

  expect_snapshot({
    V(g)[[1]]
    V(g)[[2]]
    V(g)[1:2]
    V(g)[2:3]
  })
})

test_that("classic: vs printing, complex attributes", {
  igraph_local_seed(42, rng_version = "3.5.0")
  g <- make_graph(~ A - A:B:C, B - A:B:C) %>%
    set_vertex_attr("color", value = "red") %>%
    set_vertex_attr("weight", value = sample(1:10, 3)) %>%
    set_vertex_attr("cplx", value = replicate(3, 1:4, simplify = FALSE))

  expect_snapshot({
    V(g)[[1]]
    V(g)[[2:3]]
  })
})

test_that("classic: es printing", {
  igraph_local_seed(42, rng_version = "3.5.0")
  g <- make_graph(~ A - A:B:C, B - A:B:C) %>%
    set_edge_attr("color", value = "red") %>%
    set_edge_attr("weight", value = sample(1:10, 3))

  expect_snapshot({
    E(g)[[1]]
    E(g)[[2:3]]
  })
})

test_that("classic: es printing, complex attributes", {
  igraph_local_seed(42, rng_version = "3.5.0")
  g <- make_graph(~ A - A:B:C, B - A:B:C) %>%
    set_edge_attr("color", value = "red") %>%
    set_edge_attr("weight", value = sample(1:10, 3)) %>%
    set_edge_attr("cmpx", value = replicate(3, 1:4, simplify = FALSE))

  expect_snapshot({
    E(g)[[1]]
    E(g)[[2:3]]
  })
})
