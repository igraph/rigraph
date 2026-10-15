# ---- ellipsis migration: argument coverage ----------------------------

test_that("cohesive_blocks() tail arguments and legacy positional recovery", {
  # A triangle with a pendant vertex: the triangle is the only deeper block.
  g <- graph_from_literal(A - B - C - A, C - D)

  # labels = FALSE must not copy the vertex names into the result.
  res <- cohesive_blocks(g, labels = FALSE)
  expect_s3_class(res, "cohesiveBlocks")
  expect_null(res$labels)
  expect_equal(unvs(blocks(res)), list(1:4, 1:3))
  expect_equal(cohesion(res), c(1, 2))

  # The default copies the vertex names.
  expect_identical(cohesive_blocks(g)$labels, c("A", "B", "C", "D"))

  lifecycle::expect_deprecated(res2 <- cohesive_blocks(g, FALSE))
  ref <- cohesive_blocks(g, labels = FALSE)
  expect_null(res2$labels)
  expect_equal(unvs(blocks(res2)), unvs(blocks(ref)))
  expect_identical(cohesion(res2), cohesion(ref))
  expect_identical_graphs(hierarchy(res2), hierarchy(ref))
})

test_that("export_pajek() tail arguments and legacy positional recovery", {
  g <- graph_from_literal(A - B - C - A, C - D)
  blks <- cohesive_blocks(g)
  tmp <- withr::local_tempdir()

  # project.file = FALSE writes separate network, hierarchy and block files.
  base <- file.path(tmp, "cb")
  expect_null(export_pajek(blks, g, file = base, project.file = FALSE))
  expect_true(file.exists(paste0(base, ".net")))
  expect_true(file.exists(paste0(base, "_hierarchy.net")))
  expect_true(all(file.exists(paste0(base, "_block_", 1:2, ".clu"))))

  # The default writes a single Pajek project file.
  pf <- file.path(tmp, "cb.paj")
  export_pajek(blks, g, file = pf)
  expect_identical(
    readLines(pf, warn = FALSE)[1],
    "*Network cohesive_blocks_input.net"
  )

  base2 <- file.path(tmp, "cb2")
  lifecycle::expect_deprecated(res <- export_pajek(blks, g, base2, FALSE))
  expect_null(res)
  expect_identical(
    readLines(paste0(base2, ".net")),
    readLines(paste0(base, ".net"))
  )
})
