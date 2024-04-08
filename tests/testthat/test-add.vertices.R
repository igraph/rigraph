test_that("add_vertices works", {
  g <- graph_from_literal(A - B - C - D - E)
  g2 <- add_vertices(g, (nv <- 4))
  expect_equal(vcount(g2), vcount(g) + nv)
  expect_equal(ecount(g2), ecount(g))
  expect_equal(as_edgelist(g2), as_edgelist(g))
})

test_that("add_vertices handles attributes properly", {
  g <- graph_from_literal(A - B - C - D - E)
  g3 <- add_vertices(g, (nv <- 3),
    attr = list(
      name = (names <- c("F", "G", "H")),
      weight = weights <- 1:3
    )
  )
  expect_equal(V(g3)$name, c(V(g)$name, names))
  expect_equal(V(g3)$weight, c(rep(NA, vcount(g)), weights))
})
