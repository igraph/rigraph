test_that("infix operators work", {
  g <- make_ring(10)
  V(g)$name <- letters[1:10]
  E(g)$name <- LETTERS[1:10]

  g <- g - c("a", "b")
  expect_vcount(g, 8)
  expect_equal(ecount(g), 7)
  expect_isomorphic(g, make_lattice(8))

  g <- g - edge("e|f")
  expect_isomorphic(g, make_lattice(5) + make_lattice(3))

  g <- g - edge("H")
  expect_isomorphic(g, graph_from_literal(a - b - c, d - e - f, g - h))

  g <- make_ring(10)
  V(g)$name <- letters[1:10]
  g <- g - path("a", "b")
  expect_isomorphic(g, graph_from_literal(a, b - c - d - e - f - g - h - i - j - a))
  g <- g + path("a", "b")
  expect_isomorphic(g, make_ring(10))

  g <- make_ring(10)
  V(g)$name <- letters[1:10]

  g <- g - path("a", "b", "c", "d")
  expect_isomorphic(g, make_lattice(8) + 2)

  expect_isomorphic(
    g - V(g)[c("d", "g")],
    make_lattice(4) + make_lattice(2) + 2
  )

  expect_isomorphic(
    g - E(g)["f" %--% "g"],
    make_lattice(5) + make_lattice(3) + 2
  )
})
