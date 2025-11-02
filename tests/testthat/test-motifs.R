test_that("count_motifs works", {
  withr::local_seed(123)

  gnp <- sample_gnp(10000, 4 / 10000, directed = TRUE)

  mno <- count_motifs(gnp)

  mno0 <- count_motifs(gnp, cut.prob = c(1 / 3, 0, 0))
  mno1 <- count_motifs(gnp, cut.prob = c(0, 0, 1 / 3))
  mno2 <- count_motifs(gnp, cut.prob = c(0, 1 / 3, 0))
  expect_equal(
    c(mno0 / mno, mno1 / mno, mno2 / mno),
    c(0.674541153079009, 0.666138135417257, 0.665968250372803)
  )

  mno3 <- count_motifs(gnp, cut.prob = c(0, 1 / 3, 1 / 3))
  mno4 <- count_motifs(gnp, cut.prob = c(1 / 3, 0, 1 / 3))
  mno5 <- count_motifs(gnp, cut.prob = c(1 / 3, 1 / 3, 0))
  expect_equal(
    c(mno3 / mno, mno4 / mno, mno5 / mno),
    c(0.441707407617142, 0.445633639755617, 0.440527650363994)
  )
})

test_that("motifs works", {
  withr::local_seed(123)
  gnp <- sample_gnp(10000, 4 / 10000, directed = TRUE)

  m <- motifs(gnp)

  m0 <- motifs(gnp, cut.prob = c(1 / 3, 0, 0))
  m1 <- motifs(gnp, cut.prob = c(0, 1 / 3, 0))
  m2 <- motifs(gnp, cut.prob = c(0, 0, 1 / 3))
  expect_equal(
    m0 / m,
    c(
      NA,
      NA,
      0.672381747145621,
      NA,
      0.674984795380304,
      0.63265306122449,
      0.675738567381627,
      0.698630136986301,
      NaN,
      0.784615384615385,
      NaN,
      0.608695652173913,
      NaN,
      NaN,
      NaN,
      NaN
    )
  )
  expect_equal(
    m1 / m,
    c(
      NA,
      NA,
      0.66650229488298,
      NA,
      0.666263300123518,
      0.63265306122449,
      0.66845406717928,
      0.671232876712329,
      NaN,
      0.6,
      NaN,
      0.695652173913043,
      NaN,
      NaN,
      NaN,
      NaN
    )
  )
  expect_equal(
    m2 / m,
    c(
      NA,
      NA,
      0.663265435142687,
      NA,
      0.667442050021631,
      0.653061224489796,
      0.666278834479968,
      0.657534246575342,
      NaN,
      0.661538461538462,
      NaN,
      0.652173913043478,
      NaN,
      NaN,
      NaN,
      NaN
    )
  )

  m3 <- motifs(gnp, cut.prob = c(0, 1 / 3, 1 / 3))
  m4 <- motifs(gnp, cut.prob = c(1 / 3, 1 / 3, 0))
  m5 <- motifs(gnp, cut.prob = c(1 / 3, 1 / 3, 0))
  expect_equal(
    m3 / m,
    c(
      NA,
      NA,
      0.439062322193984,
      NA,
      0.441742794264253,
      0.408163265306122,
      0.44431657223796,
      0.438356164383562,
      NaN,
      0.415384615384615,
      NaN,
      0.478260869565217,
      NaN,
      NaN,
      NaN,
      NaN
    )
  )

  expect_equal(
    m4 / m,
    c(NA, NA, 0.439770385262173, NA, 0.441040560282398, 0.224489795918367, 0.438752023472278, 0.534246575342466, NaN, 0.430769230769231, NaN, 0.391304347826087, NaN, NaN, NaN, NaN)
  )

  expect_equal(
    m5 / m,
    c(NA, NA, 0.444436015122204, NA, 0.445736750036052, 0.489795918367347, 0.445353601780656, 0.575342465753425, NaN, 0.415384615384615, NaN, 0.347826086956522, NaN, NaN, NaN, NaN)
  )
})

test_that("sample_motifs works", {
  withr::local_seed(20041103)

  g <- make_graph(~ A - B - C - A - D - E - F - D - C - F)
  n <- vcount(g)

  motif_count <- sample_motifs(g)
  expect_true(0 <= motif_count && motif_count <= n * (n - 1) * (n - 2) / 6)

  motif_count_letters <- sample_motifs(g, sample = c("C", "D", "E", "F"))
  expect_true(
    0 <= motif_count_letters && motif_count_letters <= n * (n - 1) * (n - 2) / 6
  )

  motif_count_all <- sample_motifs(g, sample = V(g))
  expect_true(
    0 <= motif_count_all && motif_count_all <= n * (n - 1) * (n - 2) / 6
  )
})

test_that("dyad_census works", {
  g1 <- make_ring(10)
  expect_warning(dc1 <- dyad_census(g1), "directed")
  expect_equal(dc1, list(mut = 10, asym = 0, null = 35))

  g2 <- make_ring(10, directed = TRUE, mutual = TRUE)
  dc2 <- dyad_census(g2)
  expect_equal(dc2, list(mut = 10, asym = 0, null = 35))

  g3 <- make_ring(10, directed = TRUE, mutual = FALSE)
  dc3 <- dyad_census(g3)
  expect_equal(dc3, list(mut = 0, asym = 10, null = 35))
})

test_that("dyad_census works with celegansneural", {
  ce <- simplify(read_graph(gzfile("celegansneural.gml.gz"), format = "gml"))
  dc <- dyad_census(ce)

  expect_equal(dc, list(mut = 197, asym = 1951, null = 41808))
  expect_equal(sum(which_mutual(ce)), dc$mut * 2)
  expect_equal(
    ecount(as_undirected(ce, mode = "collapse")) - dc$mut,
    dc$asym
  )
  expect_equal(sum(unlist(dc)), vcount(ce) * (vcount(ce) - 1) / 2)
})

test_that("motifs_randesu_callback works", {
  withr::local_seed(20041103)

  g <- make_graph(~ A - B - C - A - D - E - F - D - C - F)

  # Test 1: Callback receives correct parameters
  motif_count <- 0
  motifs_randesu_callback(g, 3, callback = function(graph, motif, extra) {
    # Check that graph parameter is the same graph
    expect_s3_class(graph, "igraph")
    expect_identical(graph, g)

    # Check motif structure
    expect_named(motif, c("vids", "isoclass"))
    expect_type(motif$vids, "double")
    expect_length(motif$vids, 3)
    expect_type(motif$isoclass, "double")

    motif_count <<- motif_count + 1
    TRUE
  }, extra = NULL)

  # We should find some motifs
  expect_gt(motif_count, 0)

  # Test 2: Callback can stop iteration
  motif_count <- 0
  motifs_randesu_callback(g, 3, callback = function(graph, motif, extra) {
    motif_count <<- motif_count + 1
    motif_count < 5  # stop after finding 5 motifs
  }, extra = NULL)

  expect_equal(motif_count, 5)

  # Test 3: Callback can collect motifs using environment
  motif_list <- list()
  motifs_randesu_callback(g, 3, callback = function(graph, motif, extra) {
    idx <- length(motif_list) + 1
    motif_list[[idx]] <<- motif
    TRUE
  }, extra = NULL)

  expect_gt(length(motif_list), 0)
  # Check that all collected motifs have the right structure
  for (m in motif_list) {
    expect_named(m, c("vids", "isoclass"))
    expect_length(m$vids, 3)
  }

  # Test 4: cut.prob parameter works
  motif_count_no_cut <- 0
  motifs_randesu_callback(g, 3, callback = function(graph, motif, extra) {
    motif_count_no_cut <<- motif_count_no_cut + 1
    TRUE
  }, extra = NULL)

  motif_count_with_cut <- 0
  motifs_randesu_callback(g, 3, cut.prob = c(0.5, 0, 0),
    callback = function(graph, motif, extra) {
      motif_count_with_cut <<- motif_count_with_cut + 1
      TRUE
    }, extra = NULL)

  # With cut probability, we should find fewer or equal motifs
  expect_lte(motif_count_with_cut, motif_count_no_cut)

  # Test 5: Extra parameter is passed correctly
  test_value <- list(a = 1, b = "test")
  extra_received <- NULL
  motifs_randesu_callback(g, 3, callback = function(graph, motif, extra) {
    extra_received <<- extra
    FALSE  # stop immediately
  }, extra = test_value)

  expect_identical(extra_received, test_value)
})

test_that("motifs_randesu_callback validates arguments", {
  g <- make_graph(~ A - B - C - A)

  # callback must be provided
  expect_error(
    motifs_randesu_callback(g, 3, callback = NULL),
    "must be a function"
  )

  # callback must be a function
  expect_error(
    motifs_randesu_callback(g, 3, callback = "not_a_function"),
    "must be a function"
  )

  # cut.prob must have the same length as size
  expect_error(
    motifs_randesu_callback(g, 3, cut.prob = c(0.5, 0.5),
      callback = function(graph, motif, extra) TRUE),
    "must be the same length"
  )
})
