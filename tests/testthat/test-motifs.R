test_that("motif finding works", {
  withr::local_seed(123)

  b <- sample_gnp(10000, 4 / 10000, directed = TRUE)

  mno <- count_motifs(b)

  mno0 <- count_motifs(b, cut.prob = c(1 / 3, 0, 0))
  mno1 <- count_motifs(b, cut.prob = c(0, 0, 1 / 3))
  mno2 <- count_motifs(b, cut.prob = c(0, 1 / 3, 0))
  expect_equal(
    c(mno0 / mno, mno1 / mno, mno2 / mno),
    c(0.674541153079009, 0.666138135417257, 0.665968250372803)
  )

  mno3 <- count_motifs(b, cut.prob = c(0, 1 / 3, 1 / 3))
  mno4 <- count_motifs(b, cut.prob = c(1 / 3, 0, 1 / 3))
  mno5 <- count_motifs(b, cut.prob = c(1 / 3, 1 / 3, 0))
  expect_equal(
    c(mno3 / mno, mno4 / mno, mno5 / mno),
    c(0.441707407617142, 0.445633639755617, 0.440527650363994)
  )

  ######################

  withr::local_seed(123)
  b <- sample_gnp(10000, 4 / 10000, directed = TRUE)

  m <- motifs(b)

  m0 <- motifs(b, cut.prob = c(1 / 3, 0, 0))
  m1 <- motifs(b, cut.prob = c(0, 1 / 3, 0))
  m2 <- motifs(b, cut.prob = c(0, 0, 1 / 3))
  expect_equal(m0 / m, c(NA, NA, 0.672381747145621, NA, 0.674984795380304, 0.63265306122449, 0.675738567381627, 0.698630136986301, NaN, 0.784615384615385, NaN, 0.608695652173913, NaN, NaN, NaN, NaN))
  expect_equal(m1 / m, c(NA, NA, 0.66650229488298, NA, 0.666263300123518, 0.63265306122449, 0.66845406717928, 0.671232876712329, NaN, 0.6, NaN, 0.695652173913043, NaN, NaN, NaN, NaN))
  expect_equal(m2 / m, c(NA, NA, 0.663265435142687, NA, 0.667442050021631, 0.653061224489796, 0.666278834479968, 0.657534246575342, NaN, 0.661538461538462, NaN, 0.652173913043478, NaN, NaN, NaN, NaN))

  m3 <- motifs(b, cut.prob = c(0, 1 / 3, 1 / 3))
  m4 <- motifs(b, cut.prob = c(1 / 3, 1 / 3, 0))
  m5 <- motifs(b, cut.prob = c(1 / 3, 1 / 3, 0))
  expect_equal(m3 / m, c(NA, NA, 0.439062322193984, NA, 0.441742794264253, 0.408163265306122, 0.44431657223796, 0.438356164383562, NaN, 0.415384615384615, NaN, 0.478260869565217, NaN, NaN, NaN, NaN))

  expect_equal(m4 / m, c(NA, NA, 0.439770385262173, NA, 0.441040560282398, 0.224489795918367, 0.438752023472278, 0.534246575342466, NaN, 0.430769230769231, NaN, 0.391304347826087, NaN, NaN, NaN, NaN))

  expect_equal(m5 / m, c(NA, NA, 0.444436015122204, NA, 0.445736750036052, 0.489795918367347, 0.445353601780656, 0.575342465753425, NaN, 0.415384615384615, NaN, 0.347826086956522, NaN, NaN, NaN, NaN))
})

test_that("sample_motifs works", {
  withr::local_seed(20041103)

  g <- make_graph(~ A-B-C-A-D-E-F-D-C-F)
  n <- vcount(g)

  motif_count <- sample_motifs(g)
  expect_true(0 <= motif_count && motif_count <= n*(n-1)*(n-2) / 6)

  motif_count_letters <- sample_motifs(g, sample = c("C", "D", "E", "F"))
  expect_true(0 <= motif_count_letters && motif_count_letters <= n*(n-1)*(n-2) / 6)

  motif_count_all <- sample_motifs(g, sample = V(g))
  expect_true(0 <= motif_count_all && motif_count_all <= n*(n-1)*(n-2) / 6)
})
