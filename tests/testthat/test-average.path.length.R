test_that("mean_distance works", {
  apl <- function(graph) {
    sp <- distances(graph, mode = "out")
    if (is_directed(graph)) {
      diag(sp) <- NA
    } else {
      sp[lower.tri(sp, diag = TRUE)] <- NA
    }
    sp[sp == "Inf"] <- NA
    mean(sp, na.rm = TRUE)
  }

  giant.component <- function(graph, mode = "weak") {
    clu <- components(graph, mode = mode)
    induced_subgraph(graph, which(clu$membership == which.max(clu$csize)))
  }

  g <- giant.component(sample_gnp(100, 3 / 100))
  expect_that(apl(g), equals(mean_distance(g)))

  g <- giant.component(sample_gnp(100, 6 / 100, directed = TRUE), mode = "strong")
  expect_that(apl(g), equals(mean_distance(g)))

  g <- sample_gnp(100, 2 / 100)
  expect_that(apl(g), equals(mean_distance(g)))

  g <- sample_gnp(100, 4 / 100, directed = TRUE)
  expect_that(apl(g), equals(mean_distance(g)))
})

test_that("mean_distance works correctly for disconnected graphs", {
  g <- make_full_graph(5) %du% make_full_graph(7)
  md <- mean_distance(g, unconnected = FALSE)
  expect_that(Inf, equals(md))
  md <- mean_distance(g, unconnected = TRUE)
  expect_that(1, equals(md))
})

test_that("mean_distance can provide details", {
  apl <- function(graph) {
    sp <- distances(graph, mode = "out")
    if (is_directed(graph)) {
      diag(sp) <- NA
    } else {
      sp[lower.tri(sp, diag = TRUE)] <- NA
    }
    sp[sp == "Inf"] <- NA
    mean(sp, na.rm = TRUE)
  }

  giant.component <- function(graph, mode = "weak") {
    clu <- components(graph, mode = mode)
    induced_subgraph(graph, which(clu$membership == which.max(clu$csize)))
  }

  g <- giant.component(sample_gnp(100, 3 / 100))
  md <- mean_distance(g, details = TRUE)
  expect_that(apl(g), equals(md$res))

  g <- make_full_graph(5) %du% make_full_graph(7)
  md <- mean_distance(g, details = TRUE, unconnected = TRUE)
  expect_that(1, equals(md$res))
  expect_that(70, equals(md$unconnected))

  g <- make_full_graph(5) %du% make_full_graph(7)
  md <- mean_distance(g, details = TRUE, unconnected = FALSE)
  expect_that(Inf, equals(md$res))
  expect_that(70, equals(md$unconnected))
})
