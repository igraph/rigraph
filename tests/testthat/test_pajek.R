
context("Pajek file format")

test_that("writing Pajek files works", {

  library(igraph)

  g <- make_ring(9)
  V(g)$color <- c("red", "green", "yellow")

  tc <- rawConnection(raw(0), "w")
  write_graph(g, format="pajek", file=tc)
  out <- rawToChar(rawConnectionValue(tc))
  close(tc)

  expect_that(out, equals("*Vertices 9\n1 \"1\" ic \"red\"\n2 \"2\" ic \"green\"\n3 \"3\" ic \"yellow\"\n4 \"4\" ic \"red\"\n5 \"5\" ic \"green\"\n6 \"6\" ic \"yellow\"\n7 \"7\" ic \"red\"\n8 \"8\" ic \"green\"\n9 \"9\" ic \"yellow\"\n*Edges\n1 2\n2 3\n3 4\n4 5\n5 6\n6 7\n7 8\n8 9\n1 9\n"))

})
