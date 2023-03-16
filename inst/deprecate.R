# parse script ----
zzz_script <- here::here("R", "zzz-deprecate.R")

parse_script <- function(path) {
  path |>
    parse(keep.source = TRUE) |>
    xmlparsedata::xml_parse_data(pretty = TRUE) |>
    xml2::read_xml()
}

xml <- parse_script(zzz_script)

# extract all calls to deprecated()
deprecated_calls <- xml2::xml_find_all(
  xml,
  ".//SYMBOL_FUNCTION_CALL[text()='deprecated']"
)

tibblify_call <- function(deprecated_call) {
  args <- deprecated_call |>
    xml2::xml_parent() |>
    xml2::xml_siblings() |>
    purrr::keep(~xml2::xml_name(.x) == "expr")
  old <- xml2::xml_text(args[[1]])
  new <- xml2::xml_text(args[[2]])
  tibble::tibble(old = gsub('"', '', old), new = new)
}

deprecated_df <- purrr::map_df(deprecated_calls, tibblify_call)

# parse ALL the package scripts ----
parse_package_defs <- function() {
  scripts <- fs::dir_ls(here::here("R")) |>
    purrr::keep(~(.x != zzz_script)) |>
    purrr::map(parse_script)

  parse_script_function_call <- function(script, script_name) {
    fns <- xml2::xml_find_all(script, ".//FUNCTION[text()='function']")
    is_fn_definition <- function(fn) {
      siblings <- fn |> xml2::xml_parent() |> xml2::xml_siblings()
      (length(siblings) == 2) && (xml2::xml_name(siblings[[2]]) == "LEFT_ASSIGN")
    }
    fns <- purrr::keep(fns, is_fn_definition)

    parse_function <- function(fn) {
      whole_definition <- fn |> xml2::xml_parent()|> xml2::xml_parent()
      line1 <- xml2::xml_attr(whole_definition, "line1")
      line2 <- xml2::xml_attr(whole_definition, "line2")
      name <- whole_definition |> xml2::xml_child() |> xml2::xml_text()

      args <- xml2::xml_find_all(whole_definition, ".//SYMBOL_FORMALS") |> xml2::xml_text()
      if (length(args) > 0) {
        if ("..." %in% args) {
          if (length(args) == 1) {
            args <- "..."
          } else {
            args <- toString(c(glue::glue("{args[args!='...']} = {args[args!='...']}"), "..."))
          }
        } else {
          args <- toString(glue::glue("{args} = {args}"))
        }

        usage_wrap <- xml2::xml_children(whole_definition)[[3]] |> xml2::xml_children()
        # TODO use XPath not numbers? although this should work?
        usage <- usage_wrap[3:(length(usage_wrap)-2)] |> xml2::xml_text() |> paste(collapse = " ")
      } else {
        args <- ""
        usage <- ""
      }

      tibble::tibble(
        line1 = line1,
        line2 = line2,
        name = name,
        usage = usage,
        args = args
      )
    }
    script_df <- purrr::map_df(fns, parse_function)
    script_df$script_name <- script_name
    script_df
  }

  purrr::map2_df(scripts, names(scripts), parse_script_function_call)
}

# get function title from pkgdown ----
get_title <- function(fn_name) {
  rd_href <- pkgdown:::get_rd_from_help("igraph", fn_name)
  pkgdown:::extract_title(rd_href)
}

# treat calls ----
treat_call <- function(old, new) {

  if (old %in% c("igraph.eigen.default", "igraph.arpack.default", "graph.famous")) {
    return()
  }

  pkg_defs <- parse_package_defs()
  template <- paste(readLines(here::here("inst", "deprecate-template.txt")), collapse = "\n")
  relevant_row <- pkg_defs[pkg_defs[["name"]] == new,]

  if (nrow(relevant_row) == 0) {
    relevant_row <- pkg_defs[pkg_defs[["name"]] == sprintf("%s_impl", new),]
  }

  if (nrow(relevant_row) > 1) {
    relevant_row <- relevant_row[!grepl("aaa-auto", relevant_row[["script_name"]]),]
  }

  if (grepl("_impl$", new)) {
    new <- sub("_impl$", "", new)
  }

  new_text <- whisker::whisker.render(
    template,
    data = list(
      old = old,
      new = new,
      args = relevant_row[["args"]],
      new_usage = relevant_row[["usage"]],
      new_title = stringr::str_squish(get_title(new))
    )
  )
  script_lines <- brio::read_lines(relevant_row[["script_name"]])
  new_lines <- append(
    script_lines,
    values = c("", strsplit(new_text, "\n")[[1]]),
    after = as.numeric(relevant_row[["line2"]])
  )
  brio::write_lines(new_lines, relevant_row[["script_name"]])
}
purrr::walk2(
  deprecated_df[["old"]],
  deprecated_df[["new"]],
  treat_call
)

# document ----
usethis::use_lifecycle()
devtools::document()


# delete script ----
fs::file_delete(zzz_script)
