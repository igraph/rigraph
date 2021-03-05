
context("Detailed printing of vs and es")

test_that("vs printing", {

  local_rng_version("3.5.0")
  set.seed(42)
  g <- make_graph(~ A - A:B:C, B - A:B:C) %>%
    set_vertex_attr("color", value = "red") %>%
      set_vertex_attr("weight", value = sample(1:10, 3))
  sid <- substr(graph_id(g), 1, 7)

  o1 <- c(
    paste0("+ 1/3 vertex, named, from ", sid, ":"),
    "  name color weight",
    "1    A   red     10")
  expect_output(print(V(g)[[1]]), paste(o1, collapse = "\n"), fixed = TRUE)

  o2 <- c(
    paste0("+ 1/3 vertex, named, from ", sid, ":"),
    "  name color weight",
    "2    B   red      9")
  expect_output(print(V(g)[[2]]), paste(o2, collapse = "\n"), fixed = TRUE)

  o3 <- c(
    paste0("+ 2/3 vertices, named, from ", sid, ":"),
    "  name color weight",
    "1    A   red     10", "2    B   red      9")
  expect_output(print(V(g)[[1:2]]), paste(o3, collapse = "\n"), fixed = TRUE)

  o4 <- c(
    paste0("+ 2/3 vertices, named, from ", sid, ":"),
    "  name color weight",
    "2    B   red      9",  "3    C   red      3")
  expect_output(print(V(g)[[2:3]]), paste(o4, collapse = "\n"), fixed = TRUE)

})

test_that("vs printing, complex attributes", {

  local_rng_version("3.5.0")
  set.seed(42)
  g <- make_graph(~ A - A:B:C, B - A:B:C) %>%
    set_vertex_attr("color", value = "red") %>%
    set_vertex_attr("weight", value = sample(1:10, 3)) %>%
    set_vertex_attr("cplx", value = replicate(3, 1:4, simplify = FALSE))
  sid <- substr(graph_id(g), 1, 7)

  o1 <- c(
    paste0("+ 1/3 vertex, named, from ", sid, ":"),
    "$name", "[1] \"A\"", "", "$color",
    "[1] \"red\"", "", "$weight", "[1] 10", "", "$cplx", "$cplx[[1]]",
    "[1] 1 2 3 4", "", "")
  expect_output(print(V(g)[[1]]), paste(o1, collapse = "\n"), fixed = TRUE)

  o2 <- c(
    paste0("+ 2/3 vertices, named, from ", sid, ":"),
    "$name", "[1] \"B\" \"C\"", "", "$color",
    "[1] \"red\" \"red\"", "", "$weight", "[1] 9 3", "", "$cplx",
    "$cplx[[1]]", "[1] 1 2 3 4", "", "$cplx[[2]]", "[1] 1 2 3 4",
    "", "")
  expect_output(print(V(g)[[2:3]]), paste(o2, collapse = "\n"), fixed = TRUE)

})

test_that("es printing", {

  local_rng_version("3.5.0")
  set.seed(42)
  g <- make_graph(~ A - A:B:C, B - A:B:C) %>%
    set_edge_attr("color", value = "red") %>%
    set_edge_attr("weight", value = sample(1:10, 3))
  sid <- substr(graph_id(g), 1, 7)

  o1 <- c(
    paste0("+ 1/3 edge from ", sid, " (vertex names):"),
    "  tail head tid hid color weight",
    "1    A    B   1   2   red     10")
  expect_output(print(E(g)[[1]]), paste(o1, collapse = "\n"), fixed = TRUE)

  o2 <- c(
    paste0("+ 2/3 edges from ", sid, " (vertex names):"),
    "  tail head tid hid color weight",
    "2    A    C   1   3   red      9",
    "3    B    C   2   3   red      3")
  expect_output(print(E(g)[[2:3]]), paste(o2, collapse = "\n"), fixed = TRUE)

})

test_that("es printing, complex attributes", {

  local_rng_version("3.5.0")
  set.seed(42)
  g <- make_graph(~ A - A:B:C, B - A:B:C) %>%
    set_edge_attr("color", value = "red") %>%
    set_edge_attr("weight", value = sample(1:10, 3)) %>%
    set_edge_attr("cmpx", value = replicate(3, 1:4, simplify = FALSE))
  sid <- substr(graph_id(g), 1, 7)

  o1 <- c(
    paste0("+ 1/3 edge from ", sid, " (vertex names):"),
    "$color", "[1] \"red\"", "",
    "$weight", "[1] 10", "", "$cmpx", "$cmpx[[1]]", "[1] 1 2 3 4",
    "", "")
  expect_output(print(E(g)[[1]]), paste(o1, collapse = "\n"), fixed = TRUE)

  o2 <- c(
    paste0("+ 2/3 edges from ", sid, " (vertex names):"),
    "$color", "[1] \"red\" \"red\"",
    "", "$weight", "[1] 9 3", "", "$cmpx", "$cmpx[[1]]",
    "[1] 1 2 3 4", "", "$cmpx[[2]]", "[1] 1 2 3 4", "", "")
  expect_output(print(E(g)[[2:3]]), paste(o2, collapse = "\n"), fixed = TRUE)

})
