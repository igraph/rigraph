test_that("cli print.igraph: undirected unnamed ring", {
  local_igraph_options(print.style = "cli", print.id = FALSE)
  withr::local_options(cli.num_colors = 1, cli.unicode = TRUE, cli.width = 80)
  g <- make_ring(5)
  expect_snapshot(print(g))
  expect_snapshot(summary(g))
})

test_that("cli print.igraph: directed named weighted", {
  local_igraph_options(print.style = "cli", print.id = FALSE)
  withr::local_options(cli.num_colors = 1, cli.unicode = TRUE, cli.width = 80)
  g <- make_ring(3, directed = TRUE) |>
    set_vertex_attr("name", value = c("A", "B", "C")) |>
    set_edge_attr("weight", value = 1:3) |>
    set_graph_attr("name", value = "trio")
  expect_snapshot(print(g))
  expect_snapshot(summary(g))
})

test_that("cli print.igraph: bipartite", {
  local_igraph_options(print.style = "cli", print.id = FALSE)
  withr::local_options(cli.num_colors = 1, cli.unicode = TRUE, cli.width = 80)
  g <- make_bipartite_graph(
    types = c(FALSE, FALSE, TRUE, TRUE),
    edges = c(1, 3, 2, 4)
  )
  expect_snapshot(print(g))
})

test_that("cli print.igraph: empty graph has no edges section", {
  local_igraph_options(print.style = "cli", print.id = FALSE)
  withr::local_options(cli.num_colors = 1, cli.unicode = TRUE, cli.width = 80)
  expect_snapshot(print(make_empty_graph(0)))
  expect_snapshot(print(make_empty_graph(3, directed = FALSE)))
})

test_that("cli print.igraph: full mode with all attribute sections", {
  local_igraph_options(
    print.style = "cli",
    print.id = FALSE,
    print.full = TRUE,
    print.graph.attributes = TRUE,
    print.vertex.attributes = TRUE,
    print.edge.attributes = TRUE
  )
  withr::local_options(cli.num_colors = 1, cli.unicode = TRUE, cli.width = 80)
  g <- make_ring(3, directed = TRUE) |>
    set_vertex_attr("name", value = c("A", "B", "C")) |>
    set_edge_attr("weight", value = 1:3) |>
    set_graph_attr("name", value = "trio")
  expect_snapshot(print(g))
})

test_that("cli print.igraph.vs: single and double bracket", {
  local_igraph_options(print.style = "cli", print.id = FALSE)
  withr::local_options(cli.num_colors = 1, cli.unicode = TRUE, cli.width = 80)
  g <- make_ring(3) |>
    set_vertex_attr("name", value = c("A", "B", "C")) |>
    set_vertex_attr("weight", value = 10:12)
  expect_snapshot({
    V(g)
    V(g)[1:2]
    V(g)[[1]]
    V(g)[[2:3]]
  })
})

test_that("cli print.igraph.es: single and double bracket", {
  local_igraph_options(print.style = "cli", print.id = FALSE)
  withr::local_options(cli.num_colors = 1, cli.unicode = TRUE, cli.width = 80)
  g <- make_ring(3, directed = TRUE) |>
    set_vertex_attr("name", value = c("A", "B", "C")) |>
    set_edge_attr("weight", value = 1:3)
  expect_snapshot({
    E(g)
    E(g)[1:2]
    E(g)[[1]]
    E(g)[[2:3]]
  })
})

test_that("cli print.igraph: ASCII fallback when cli.unicode = FALSE", {
  local_igraph_options(print.style = "cli", print.id = FALSE)
  withr::local_options(cli.num_colors = 1, cli.unicode = FALSE, cli.width = 80)
  g <- make_ring(3, directed = TRUE) |>
    set_vertex_attr("name", value = c("A", "B", "C"))
  expect_snapshot(print(g))
  expect_snapshot(V(g))
  expect_snapshot(E(g))
})

test_that("cli print.igraph: truncation in auto mode", {
  local_igraph_options(
    print.style = "cli",
    print.id = FALSE,
    auto.print.lines = 3
  )
  withr::local_options(cli.num_colors = 1, cli.unicode = TRUE, cli.width = 80)
  g <- make_ring(200)
  expect_snapshot(print(g))
})
