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

# remove ALL the aliases ----
# to the deprecated functions as they will
# get an actual page
clean_alias <- function(aliases, x) {
  output <- gsub(sprintf(" %s ", x), " ", aliases)
  output <- gsub(sprintf(" %s$", x), "", output)

  output[!grepl("@aliases", output)] <- sub(
    "#' ", "#' @aliases ",
    output[!grepl("@aliases", output)]
  )

  output
}


remove_aliases <- function(script, to_be_deprecated) {
  lines <- brio::read_lines(script)

  which_aliases <- grepl("@aliases", lines) |
  (grepl("@aliases", dplyr::lag(lines, 1)) &
      grepl("^#' (?!\\@)", lines, perl = TRUE))
  aliases_present <- (sum(which_aliases) > 0)

  if (aliases_present) {

    aliases <- lines[which_aliases]
    aliases <- purrr::reduce(
      to_be_deprecated,
      \(aliases, x) clean_alias(aliases, x ),
      .init = aliases
    )
    lines[which_aliases] <- aliases
    lines <- purrr::discard(
      lines,
      \(x) trimws(x) == "#' @aliases"
    )
  }

  brio::write_lines(lines, script)
}

purrr::walk(
  fs::dir_ls(here::here("R")) ,
  remove_aliases,
  to_be_deprecated = deprecated_df$old,
  .progress = TRUE
)

# parse ALL the package scripts ----
file.create("R/aaa-NOT-auto.R")

.parse_impl_assignements <- function() {
  scripts <- fs::dir_ls(here::here("R")) |>
    purrr::keep(~(.x != zzz_script)) |>
    purrr::map(parse_script)

  parse_script_function_call <- function(xml) {
    kiddos <- xml2::xml_children(xml)
    candidates <- kiddos[xml2::xml_name(kiddos) == "expr"]
    candidates <- candidates[purrr::map_int(candidates, ~length(xml2::xml_children(.x))) == 3]

    purrr::map_df(
      candidates,
      ~ tibble::tibble(
        left = xml2::xml_children(.x)[[1]] |> xml2::xml_text(),
        right = xml2::xml_children(.x)[[3]] |> xml2::xml_text()
      )
    )
  }

  purrr::map_df(scripts, parse_script_function_call)
}
parse_impl_assignements <- memoise::memoise(.parse_impl_assignements)

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

      if (name %in% c(
        "tk_off",
        "get_all_options",
        "tkigraph",
        ".tkigraph.clusters",
        "show.communities",
        "sortPopup"
      )) {
        return(
          tibble::tibble(
            line1 = line1,
            line2 = line2,
            name = name,
            usage = "",
            args = ""
          )
        )
      }

      args <- xml2::xml_find_all(whole_definition, "./*/SYMBOL_FORMALS") |> xml2::xml_text()
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

# get docs from pkgdown ----
get_title <- function(fn_name) {

  if (fn_name == "adjacent_triangles") {
    fn_name <- "count_triangles"
  }

  rd_href <- pkgdown:::get_rd_from_help("igraph", fn_name)
  pkgdown:::extract_title(rd_href)
}
topics <- pkgdown::as_pkgdown()[["topics"]]

# treat calls ----
treat_call <- function(old, new, topics) {

  if (old %in% c("igraph.eigen.default", "igraph.arpack.default")) {
    return()
  }

  pkg_defs <- parse_package_defs()
  template <- paste(readLines(here::here("tools", "deprecate-template.txt")), collapse = "\n")

  relevant_row <- pkg_defs[pkg_defs[["name"]] == new,]

  if (nrow(relevant_row) == 0) {
    relevant_row <- pkg_defs[pkg_defs[["name"]] == sprintf("%s_impl", new),]
  }

  if (nrow(relevant_row) == 0) {
    assignments <- parse_impl_assignements()
    actual_def <- assignments[["right"]][assignments[["left"]] == new]
    relevant_row <- pkg_defs[pkg_defs[["name"]] == actual_def,]
  }

  if (nrow(relevant_row) > 1) {
    relevant_row <- relevant_row[!grepl("aaa-auto", relevant_row[["script_name"]]),]
  }

  if (grepl("_impl$", new)) {
    new <- sub("_impl$", "", new)
  }

  if (!nzchar(relevant_row[["args"]])) {
    inheritParamsOrNot <- "#'"
  } else {
    inheritParamsOrNot <- sprintf("#' @inheritParams %s", new)
  }

  new_text <- whisker::whisker.render(
    template,
    data = list(
      old = old,
      new = new,
      args = relevant_row[["args"]],
      inheritParamsOrNot = inheritParamsOrNot,
      new_usage = relevant_row[["usage"]],
      new_title = stringr::str_squish(get_title(new))
    )
  )
  if (grepl("aaa\\-auto\\.R", relevant_row[["script_name"]])) {

    script_lines <- brio::read_lines("R/aaa-NOT-auto.R")
    new_lines <- append(
      script_lines,
      values = c("", strsplit(new_text, "\n")[[1]])
    )
    brio::write_lines(new_lines, "R/aaa-NOT-auto.R")
  } else {
    script_lines <- brio::read_lines(relevant_row[["script_name"]])
    new_lines <- append(
      script_lines,
      values = c("", strsplit(new_text, "\n")[[1]]),
      after = as.numeric(relevant_row[["line2"]])
    )
    brio::write_lines(new_lines, relevant_row[["script_name"]])
  }
}
purrr::walk2(
  deprecated_df[["old"]],
  deprecated_df[["new"]],
  treat_call,
  topics = topics,
  .progress = TRUE
)

# document ----
usethis::use_lifecycle()
devtools::document()


# delete script ----
fs::file_delete(zzz_script)
