test_that("centr_degree works", {
  g <- make_star(5, "undirected")
  g_centr <- centr_degree(g, normalized = FALSE)
  g_centr_tmax <- centr_degree_tmax(g, loops = FALSE)
  expect_equal(g_centr$centralization, g_centr_tmax)
})

test_that("centr_betw works", {
  g <- make_star(5, "undirected")
  g_centr <- centr_betw(g, normalized = FALSE)
  g_centr_tmax <- centr_betw_tmax(g)
  expect_equal(g_centr$centralization, g_centr_tmax)
})

test_that("centr_clo works", {
  g <- make_star(5, "undirected")
  g_centr <- centr_clo(g, normalized = FALSE)
  g_centr_tmax <- centr_clo_tmax(g)
  expect_equal(g_centr$centralization, g_centr_tmax)
})


test_that("centr_eigen works", {
  g <- make_star(2, "undirected")
  g_centr <- centr_eigen(g, normalized = FALSE)
  g_centr_tmax <- centr_eigen_tmax(g)
  expect_equal(g_centr$centralization, g_centr_tmax)
})
