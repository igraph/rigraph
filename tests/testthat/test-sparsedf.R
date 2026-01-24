test_that("sdf works", {
  sdf <- igraph:::sdf
  `[.igraphSDF` <- igraph:::`[.igraphSDF`
  `[<-.igraphSDF` <- igraph:::`[<-.igraphSDF`
  as.data.frame.igraphSDF <- igraph:::as.data.frame.igraphSDF

  sdf <- sdf(id = 1:10, color = "black")
  expect_equal(
    as.data.frame(sdf),
    data.frame(id = 1:10, color = "black")
  )

  ## access

  expect_equal(sdf[1, "id"], 1)
  expect_equal(sdf[1:4, "id"], 1:4)
  expect_equal(sdf[, "id"], 1:10)

  expect_equal(sdf[1, "color"], "black")
  expect_equal(sdf[1:4, "color"], rep("black", 4))
  expect_equal(sdf[, "color"], rep("black", 10))

  ## set

  sdf2 <- sdf
  sdf2[5, "id"] <- 100
  expect_equal(
    as.data.frame(sdf2),
    data.frame(id = c(1:4, 100, 6:10), color = "black")
  )

  sdf2 <- sdf
  sdf2[, "id"] <- 0
  expect_equal(
    as.data.frame(sdf2),
    data.frame(id = rep(0, 10), color = "black")
  )

  sdf2 <- sdf
  sdf2[2:10, "id"] <- 1
  expect_equal(
    as.data.frame(sdf2),
    data.frame(id = rep(1, 10), color = "black")
  )

  sdf2 <- sdf
  sdf2[, "color"] <- "white"
  expect_equal(
    as.data.frame(sdf2),
    data.frame(id = 1:10, color = "white")
  )

  sdf2 <- sdf
  sdf2[5:6, "color"] <- "white"
  expect_equal(
    as.data.frame(sdf2),
    data.frame(
      id = 1:10,
      color = c(rep("black", 4), rep("white", 2), rep("black", 4))
    )
  )
})
