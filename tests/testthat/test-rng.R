test_that("R help contains guarantee on number of RNG bits", {
  skip_on_cran()

  # utils:::.getHelpFile
  get_help_file <- get(".getHelpFile", envir = asNamespace("utils"))
  text <- capture.output(tools::Rd2txt(get_help_file(help("Random"))))

  expect_true(any(grepl("all give at least 30 varying bits", text, fixed = TRUE)))
})
