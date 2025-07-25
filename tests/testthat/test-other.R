test_that("convex_hull works", {
  xy <- cbind(
    c(0, 1, 2, 3, 4, 0, 1, 2, 3, 1, 2),
    c(0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2)
  )
  vp <- convex_hull(xy)
  expect_equal(vp$resverts, c(1, 6, 10, 11, 5))
  expect_equal(vp$rescoords, xy[vp$resverts, ])
})

test_that("convex_hull uses 1-based indexing, #613", {
  withr::local_seed(45)
  n <- 10
  xy <- cbind(runif(n), runif(n))
  vp <- convex_hull(xy)
  expect_equal(vp$resverts, c(8, 10, 7, 2, 1))
})

test_that("can create graphs when igraph is not attached", {
  g <- callr::r(function() {
    igraph::make_ring(3, directed = TRUE)
  })
  g2 <- make_ring(3, directed = TRUE)
  expect_identical(
    unclass(g)[-igraph_t_idx_env],
    unclass(g2)[-igraph_t_idx_env]
  )
})

test_that("running_mean works", {
  expect_equal(running_mean(1:10, 2), 2:10 - 0.5)
  expect_snapshot(
    running_mean(1:3, 4),
    error = TRUE
  )
})

test_that("R help contains guarantee on number of RNG bits", {
  skip_on_cran()

  # utils:::.getHelpFile
  get_help_file <- get(".getHelpFile", envir = asNamespace("utils"))
  text <- capture.output(tools::Rd2txt(get_help_file(help("Random"))))

  expect_true(any(grepl(
    "all give at least 30 varying bits",
    text,
    fixed = TRUE
  )))
})

test_that("serialization works", {
  local_igraph_options(print.id = FALSE)

  g <- make_ring(3, directed = TRUE)
  gs <- unserialize(serialize(g, NULL))

  expect_identical(
    unclass(g)[-igraph_t_idx_env],
    unclass(gs)[-igraph_t_idx_env]
  )

  expect_snapshot({
    g
    gs
  })
})

names <- c(
  "Mr Hi", "Actor 2", "Actor 3", "Actor 4",
  "Actor 5", "Actor 6", "Actor 7", "Actor 8", "Actor 9", "Actor 10",
  "Actor 11", "Actor 12", "Actor 13", "Actor 14", "Actor 15", "Actor 16",
  "Actor 17", "Actor 18", "Actor 19", "Actor 20", "Actor 21", "Actor 22",
  "Actor 23", "Actor 24", "Actor 25", "Actor 26", "Actor 27", "Actor 28",
  "Actor 29", "Actor 30", "Actor 31", "Actor 32", "Actor 33", "John A"
)

karate <- structure(
  list(
    34,
    FALSE,
    c(
      1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12,
      13, 17, 19, 21, 31, 2, 3, 7, 13, 17, 19, 21, 30, 3, 7, 8, 9,
      13, 27, 28, 32, 7, 12, 13, 6, 10, 6, 10, 16, 16, 30, 32, 33,
      33, 33, 32, 33, 32, 33, 32, 33, 33, 32, 33, 32, 33, 25, 27, 29,
      32, 33, 25, 27, 31, 31, 29, 33, 33, 31, 33, 32, 33, 32, 33, 32,
      33, 33
    ),
    c(
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
      1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5,
      5, 5, 6, 8, 8, 8, 9, 13, 14, 14, 15, 15, 18, 18, 19, 20, 20,
      22, 22, 23, 23, 23, 23, 23, 24, 24, 24, 25, 26, 26, 27, 28, 28,
      29, 29, 30, 30, 31, 31, 32
    ),
    c(
      0, 1, 16, 2, 17, 24, 3, 4, 5,
      35, 37, 6, 18, 25, 32, 7, 26, 27, 8, 36, 38, 9, 10, 33, 11, 19,
      28, 34, 39, 40, 12, 20, 13, 21, 14, 22, 57, 62, 29, 58, 63, 30,
      59, 66, 23, 41, 15, 64, 65, 69, 31, 42, 46, 48, 50, 53, 55, 60,
      71, 73, 75, 43, 44, 45, 47, 49, 51, 52, 54, 56, 61, 67, 68, 70,
      72, 74, 76, 77
    ),
    c(
      0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12,
      13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,
      29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44,
      45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
      61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76,
      77
    ),
    c(
      0, 0, 1, 3, 6, 7, 8, 11, 15, 17, 18, 21, 22, 24, 28, 28,
      28, 30, 32, 32, 34, 34, 36, 36, 36, 36, 38, 38, 41, 42, 44, 46,
      50, 61, 78
    ),
    c(
      0, 16, 24, 32, 35, 37, 40, 41, 41, 44, 45, 45,
      45, 45, 46, 48, 50, 50, 50, 52, 53, 55, 55, 57, 62, 65, 66, 68,
      69, 71, 73, 75, 77, 78, 78
    ),
    list(
      c(1, 0, 1),
      structure(
        list(
          name = "Zachary's karate club network",
          Citation = "Wayne W. Zachary. An Information Flow Model for Conflict and Fission in Small Groups. Journal of Anthropological Research Vol. 33, No. 4 452-473",
          Author = "Wayne W. Zachary"
        ),
        .Names = c("name", "Citation", "Author")
      ),
      structure(
        list(
          Faction = c(
            1, 1, 1, 1, 1, 1, 1, 1,
            2, 2, 1, 1, 1, 1, 2, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 2, 2, 2, 2,
            2, 2, 2, 2, 2
          ),
          name = names
        ),
        .Names = c("Faction", "name")
      ),
      structure(
        list(
          weight = c(
            4,
            5, 3, 3, 3, 3, 2, 2, 2, 3, 1, 3, 2, 2, 2, 2, 6, 3, 4, 5, 1, 2,
            2, 2, 3, 4, 5, 1, 3, 2, 2, 2, 3, 3, 3, 2, 3, 5, 3, 3, 3, 3, 3,
            4, 2, 3, 3, 2, 3, 4, 1, 2, 1, 3, 1, 2, 3, 5, 4, 3, 5, 4, 2, 3,
            2, 7, 4, 2, 4, 2, 2, 4, 2, 3, 3, 4, 4, 5
          )
        ),
        .Names = "weight"
      )
    )
  ),
  class = "igraph"
)

test_that("VS/ES require explicit conversion", {
  expect_snapshot(error = TRUE, {
    V(karate)
  })
})

test_that("VS/ES work with old data type", {
  karate2 <- upgrade_graph(karate)
  vs2 <- V(karate2)

  expect_equal(length(vs2), 34)
  expect_equal(vs2$name, names)
})
