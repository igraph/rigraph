test_that("delete_edges works", {
  g <- graph_from_literal(A:B:C - D:E:F, D - E - F)
  g2 <- delete_edges(g, E(g, P = c("D", "E")))

  expected_matrix <- matrix(
      c(
        0, 0, 0, 1, 1, 1,
        0, 0, 0, 1, 1, 1,
        0, 0, 0, 1, 1, 1,
        1, 1, 1, 0, 0, 0,
        1, 1, 1, 0, 0, 1,
        1, 1, 1, 0, 1, 0
      ),
      nrow = 6L,
      ncol = 6L,
      dimnames = list(c("A", "B", "C", "D", "E", "F"), c("A", "B", "C", "D", "E", "F"))
    )

  expect_equal(as.matrix(g2[]), expected_matrix)
})
