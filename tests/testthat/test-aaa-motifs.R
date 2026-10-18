# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 243. motifs_randesu_impl

test_that("motifs_randesu_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(motifs_randesu_impl(
    graph = g
  ))
  expect_snapshot(motifs_randesu_impl(
    graph = g,
    size = 4,
    cut_prob = rep(0.1, 4)
  ))

  # Structured tests
  result <- motifs_randesu_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("motifs_randesu_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(motifs_randesu_impl(
    graph = NULL
  ))
})

# 244. motifs_randesu_estimate_impl

test_that("motifs_randesu_estimate_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 6
  )

  expect_snapshot(motifs_randesu_estimate_impl(
    graph = g,
    size = 3,
    sample_size = 2
  ))
  expect_snapshot(motifs_randesu_estimate_impl(
    graph = g,
    size = 4,
    cut_prob = rep(0.1, 4),
    sample_size = 2,
    sample = 1:2
  ))

  # Structured tests
  result <- motifs_randesu_estimate_impl(
    graph = g,
    size = 3,
    sample_size = 2
  )
  expect_true(is.numeric(result))
})

test_that("motifs_randesu_estimate_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(
    motifs_randesu_estimate_impl(
      graph = NULL,
      size = 3,
      sample_size = 2
    )
  )
})

# 245. motifs_randesu_no_impl

test_that("motifs_randesu_no_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(motifs_randesu_no_impl(
    graph = g
  ))
  expect_snapshot(motifs_randesu_no_impl(
    graph = g,
    size = 4,
    cut_prob = c(0.1, 0.1, 0.1, 0.1)
  ))

  # Structured tests
  result <- motifs_randesu_no_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("motifs_randesu_no_impl errors", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot_igraph_error(
    motifs_randesu_no_impl(
      graph = g,
      size = 3,
      cut_prob = c(0.1)
    )
  )
})

# 246. dyad_census_impl

test_that("dyad_census_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(dyad_census_impl(
    graph = g
  ))

  # Structured tests
  result <- dyad_census_impl(
    graph = g
  )
  expect_type(result, "list")
})

test_that("dyad_census_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(dyad_census_impl(
    graph = NULL
  ))
})

# 247. triad_census_impl

test_that("triad_census_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(triad_census_impl(
    graph = g
  ))

  # Structured tests
  expect_warning(
    result <- triad_census_impl(
      graph = g
    )
  )
  expect_true(is.numeric(result))
})

test_that("triad_census_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(triad_census_impl(
    graph = NULL
  ))
})

# 248. count_adjacent_triangles_impl

test_that("count_adjacent_triangles_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(count_adjacent_triangles_impl(
    graph = g
  ))
  expect_snapshot(count_adjacent_triangles_impl(
    graph = g,
    vids = 1:2
  ))

  # Structured tests
  result <- count_adjacent_triangles_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("count_adjacent_triangles_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(count_adjacent_triangles_impl(
    graph = NULL
  ))
})

# 249. count_triangles_impl

test_that("count_triangles_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(count_triangles_impl(
    graph = g
  ))

  # Structured tests
  result <- count_triangles_impl(
    graph = g
  )
  expect_true(is.numeric(result))
})

test_that("count_triangles_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(count_triangles_impl(
    graph = NULL
  ))
})

# 258. list_triangles_impl

test_that("list_triangles_impl basic", {
  igraph_local_seed(20250909)
  g <- path_graph_impl(
    n = 3
  )

  expect_snapshot(list_triangles_impl(
    graph = g
  ))

  # Structured tests
  result <- list_triangles_impl(
    graph = g
  )
  expect_s3_class(result, "igraph.vs")
})

test_that("list_triangles_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(list_triangles_impl(
    graph = NULL
  ))
})

# motifs_randesu_callback_closure_impl

test_that("motifs_randesu_callback_closure_impl basic", {
  igraph_local_seed(20250909)

  g <- make_graph(~ A - B - C - A)

  # Collect motif information for snapshot
  motif_data <- list()
  result <- motifs_randesu_callback_closure_impl(
    graph = g,
    size = 3,
    cut_prob = NULL,
    callback = function(vids, isoclass) {
      motif_data[[length(motif_data) + 1]] <<- list(
        vids = vids,
        isoclass = isoclass
      )
      FALSE # Continue
    }
  )

  expect_snapshot({
    cat("Result:\n")
    print(result)
    cat("\nNumber of motifs found:", length(motif_data), "\n")
    cat("First motif:\n")
    print(motif_data[[1]])
  })

  # Structured tests
  expect_null(result)
  expect_true(length(motif_data) > 0)
  expect_type(motif_data[[1]]$vids, "integer")
  expect_length(motif_data[[1]]$vids, 3)
  expect_type(motif_data[[1]]$isoclass, "integer")
  expect_length(motif_data[[1]]$isoclass, 1)
})

test_that("motifs_randesu_callback_closure_impl errors", {
  igraph_local_seed(20250909)

  g <- make_graph(~ A - B - C)

  # Should error if callback is not a function
  expect_snapshot_igraph_error(
    motifs_randesu_callback_closure_impl(
      graph = g,
      size = 3,
      cut_prob = NULL,
      callback = "not a function"
    )
  )
})
