# FIXME: ASAN tests for this file are crashing on CRAN, can we replicate?
skip_on_cran()

# 228. hrg_fit_impl

test_that("hrg_fit_impl basic", {
  igraph_local_seed(20250909)
  g1 <- path_graph_impl(
    n = 3
  )

  expect_snapshot(hrg_fit_impl(
    graph = g1
  ))

  # Structured tests
  result <- hrg_fit_impl(
    graph = g1
  )
  expect_type(result, "list")
})

test_that("hrg_fit_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(hrg_fit_impl(
    graph = NULL
  ))
})

# 229. hrg_sample_impl

test_that("hrg_sample_impl basic", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  igraph_local_seed(20250909)
  g <- make_full_graph(10)
  hrg_model <- fit_hrg(g, hrg = NULL, start = FALSE, steps = 0)
  expect_snapshot(hrg_sample_impl(
    hrg = hrg_model
  ))

  # Structured tests
  result <- hrg_sample_impl(
    hrg = hrg_model
  )
  expect_type(result, "list")
})

test_that("hrg_sample_impl errors", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  igraph_local_seed(20250909)
  # FIXME: This test triggers an assertion failure in the C code when passing
  # NULL/empty HRG. The C code should validate input and return a proper error
  # message instead of an assertion failure.
  expect_snapshot_igraph_error(hrg_sample_impl(
    hrg = NULL
  ))
})

# 230. hrg_sample_many_impl

test_that("hrg_sample_many_impl basic", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  igraph_local_seed(20250909)
  g <- make_full_graph(10)
  hrg_model <- fit_hrg(g, hrg = NULL, start = FALSE, steps = 0)
  expect_snapshot(hrg_sample_many_impl(
    hrg = hrg_model,
    num_samples = 2
  ))

  # Structured tests
  result <- hrg_sample_many_impl(
    hrg = hrg_model,
    num_samples = 2
  )
  expect_type(result, "list")
})

test_that("hrg_sample_many_impl errors", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  igraph_local_seed(20250909)
  # FIXME: This test triggers an assertion failure in the C code when passing
  # NULL/empty HRG. The C code should validate input and return a proper error
  # message instead of an assertion failure.
  expect_snapshot_igraph_error(hrg_sample_many_impl(
    hrg = NULL,
    num_samples = 2
  ))
})

# 231. hrg_game_impl

test_that("hrg_game_impl basic", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  igraph_local_seed(20250909)
  g <- make_full_graph(10)
  hrg_model <- fit_hrg(g, hrg = NULL, start = FALSE, steps = 0)
  expect_snapshot(hrg_game_impl(
    hrg = hrg_model
  ))

  # Structured tests
  result <- hrg_game_impl(
    hrg = hrg_model
  )
  expect_s3_class(result, "igraph")
})

test_that("hrg_game_impl errors", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  igraph_local_seed(20250909)
  # FIXME: This test triggers an assertion failure in the C code when passing
  # NULL/empty HRG. The C code should validate input and return a proper error
  # message instead of an assertion failure.
  expect_snapshot_igraph_error(hrg_game_impl(
    hrg = NULL
  ))
})

# 232. hrg_consensus_impl

# test_that("hrg_consensus_impl basic", {
# igraph_local_seed(20250909)
# oldval <- igraph_opt("print.id")
# igraph_options(print.id = FALSE)
#   g <- path_graph_impl(3)
#   expect_snapshot(hrg_consensus_impl(g))
#   expect_snapshot(hrg_consensus_impl(g, hrg=list(left=1, right=2, prob=0.5, edges=1, vertices=1), start=TRUE, num_samples=2))
# })

test_that("hrg_consensus_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(hrg_consensus_impl(
    graph = NULL
  ))
})

# 233. hrg_predict_impl

# test_that("hrg_predict_impl basic", {
# igraph_local_seed(20250909)
# oldval <- igraph_opt("print.id")
# igraph_options(print.id = FALSE)
#   g <- path_graph_impl(3)
#   expect_snapshot(hrg_predict_impl(g))
#   expect_snapshot(hrg_predict_impl(g, hrg=list(left=1, right=2, prob=0.5, edges=1, vertices=1), start=TRUE, num_samples=2, num_bins=2))
# })

test_that("hrg_predict_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(hrg_predict_impl(
    graph = NULL
  ))
})

# 234. hrg_create_impl

test_that("hrg_create_impl basic", {
  igraph_local_seed(20250909)
  g <- make_tree(5)
  expect_snapshot(hrg_create_impl(
    graph = g,
    prob = rep(0.5, 2)
  ))

  # Structured tests
  result <- hrg_create_impl(
    graph = g,
    prob = rep(0.5, 2)
  )
  expect_type(result, "list")
})

test_that("hrg_create_impl errors", {
  igraph_local_seed(20250909)
  g <- make_full_graph(4, directed = TRUE)
  expect_snapshot_igraph_error(hrg_create_impl(
    graph = g,
    prob = 0.5
  ))
})

# 235. hrg_resize_impl

test_that("hrg_resize_impl basic", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  igraph_local_seed(20250909)
  g <- make_full_graph(10)
  hrg_model <- fit_hrg(g, hrg = NULL, start = FALSE, steps = 0)
  expect_snapshot(hrg_resize_impl(
    hrg = hrg_model,
    newsize = 5
  ))

  # Structured tests
  result <- hrg_resize_impl(
    hrg = hrg_model,
    newsize = 5
  )
  expect_type(result, "list")
})

test_that("hrg_resize_impl errors", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(hrg_resize_impl(
    hrg = -1,
    newsize = 2
  ))
})

# 236. hrg_size_impl

test_that("hrg_size_impl basic", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  igraph_local_seed(20250909)
  g <- make_full_graph(10)
  hrg_model <- fit_hrg(g, hrg = NULL, start = FALSE, steps = 0)
  expect_snapshot(hrg_size_impl(
    hrg = hrg_model
  ))

  # Structured tests
  result <- hrg_size_impl(
    hrg = hrg_model
  )
  expect_true(is.numeric(result))
})

test_that("hrg_size_impl errors", {
  skip_if(Sys.getenv("R_SANITIZER") == "true")
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(hrg_size_impl(
    hrg = -1
  ))
})

# 237. from_hrg_dendrogram_impl

test_that("from_hrg_dendrogram_impl basic", {
  igraph_local_seed(20250909)
  g <- make_full_graph(10)
  hrg_model <- fit_hrg(g, hrg = NULL, start = FALSE, steps = 0)
  expect_snapshot(from_hrg_dendrogram_impl(
    hrg = hrg_model
  ))

  # Structured tests
  result <- from_hrg_dendrogram_impl(
    hrg = hrg_model
  )
  expect_type(result, "list")
})

test_that("from_hrg_dendrogram_impl errors", {
  igraph_local_seed(20250909)
  expect_snapshot_igraph_error(from_hrg_dendrogram_impl(
    hrg = -1
  ))
})
