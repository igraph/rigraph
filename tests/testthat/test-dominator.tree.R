test_that("dominator_tree works", {
  g <- graph_from_literal(
    R - +A:B:C, A - +D, B - +A:D:E, C - +F:G, D - +L,
    E - +H, F - +I, G - +I:J, H - +E:K, I - +K, J - +I,
    K - +I:R, L - +H
  )
  dtree <- dominator_tree(g, root = "R")

  # This is awkward; dtree$dom contains -1 for the root and normal vertex indices
  # for the rest, and we want to map them to names. This seemed to be the cleanest
  # way, but it is not nearly as user-friendly as it should be
  names <- c("$root", V(g)$name)
  dtree$dom <- names[ifelse(dtree$dom < 0, 1, dtree$dom + 1)]
  dtree$leftout <- V(g)$name[dtree$leftout]
  expect_equal(dtree$dom, c("$root", "R", "R", "R", "R", "R", "C", "C", "D", "R", "R", "G", "R"))
  expect_equal(dtree$leftout, character())
  expect_equal(
    as_edgelist(dtree$domtree),
    structure(c("R", "R", "R", "R", "R", "C", "C", "D", "R", "R", "G", "R", "A", "B", "C", "D", "E", "F", "G", "L", "H", "I", "J", "K"), .Dim = c(12L, 2L))
  )
})
