parse_script <- function(path) {

  cli::cli_alert_info("Refactoring {path}.")

  lines <- brio::read_lines(path)

  xml <- path |>
    parse(keep.source = TRUE) |>
    xmlparsedata::xml_parse_data(pretty = TRUE) |>
    xml2::read_xml()

  deprecated <- xml2::xml_find_all(
    xml,
    ".//SYMBOL_FUNCTION_CALL[text()='expect_that']"
  )

  purrr::walk(deprecated, treat_deprecated, path = path)

  for (deprecated_call in deprecated) {

    parent <- xml2::xml_parent(xml2::xml_parent(deprecated_call))

    line1 <- as.numeric(xml2::xml_attr(parent, "line1"))
    line2 <- as.numeric(xml2::xml_attr(parent, "line2"))

    if (line1 == line2) {
      lines[line1] <- xml2::xml_text(parent)
    } else {
      for (line in line1:line2) {
        siblings <- xml2::xml_children(parent)
        lines[line] <- paste(
          xml2::xml_text(siblings[xml2::xml_attr(siblings, "line1") == line]),
          collapse = ""
        )
      }
    }


  }

  brio::write_lines(lines, path)

  if (! (path %in% gert::git_status()[["file"]])) {
    return(invisible(TRUE))
  }

  styler::style_file(path)

  gert::git_add(path)
  gert::git_commit(
    sprintf("refactor: remove deprecated expect_that() from %s", fs::path_file(path))
  )
}

treat_deprecated <- function(xml, path) {
  siblings <- xml2::xml_parent(xml) |> xml2::xml_siblings()
  equal <- siblings[grepl("equals\\(", xml2::xml_text(siblings))]
  if (length(equal) == 0) {
    cli::cli_alert_warning("WARNING AT {path}.")
    return()
  }
  xml2::xml_text(xml) <- "expect_equal"
  text <- xml2::xml_contents(equal)[[3]] |> xml2::xml_text()
  xml2::xml_remove(xml2::xml_contents(equal))
  xml2::xml_text(equal) <- text
}

paths <- fs::dir_ls("tests/testthat", regex = "test-")

purrr::walk(paths, parse_script)
