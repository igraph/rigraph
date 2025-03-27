parse_script <- function(path) {
  path |>
    parse(keep.source = TRUE) |>
    xmlparsedata::xml_parse_data(pretty = TRUE) |>
    xml2::read_xml()
}

# get tibble impl to C -----
impl_script <- file.path("R", "aaa-auto.R")
impl_xml <- parse_script(impl_script)

impl_kiddos <- impl_xml |>
  xml2::xml_children() |>
  purrr::keep(\(x) xml2::xml_name(x) == "expr")

treat_impl <- function(impl) {
  name <- xml2::xml_text(xml2::xml_child(impl))
  if (!endsWith(name, "_impl")) {
    return(NULL)
  }

  function_body <- xml2::xml_children(impl)[[3]]
  dotcall_calls <- xml2::xml_find_all(function_body, ".//SYMBOL_FUNCTION_CALL[contains(text(), '.Call')]")

  treat_dotcall_call <- function(dotcall_call) {
    dotcall_call |>
      xml2::xml_parent() |>
      xml2::xml_parent() |>
      xml2::xml_children() |>
      purrr::pluck(3) |>
      xml2::xml_text()
  }

  tibble::tibble(
    impl = name,
    rrrigraph = purrr::map(dotcall_calls, treat_dotcall_call)
  )
}

impl_df <- purrr::map_df(impl_kiddos, treat_impl) |>
  tidyr::unnest(rrrigraph)
impl_df <- impl_df[impl_df$rrrigraph != "R_igraph_finalizer",]

## Find igraph functions
igraph_yaml <- yaml::read_yaml(file.path("tools", "stimulus", "functions-R.yaml"))
igraph_functions <- names(igraph_yaml)
igraph_yaml2 <- yaml::read_yaml(file.path("src", "vendor", "cigraph", "interfaces", "functions.yaml"))
igraph_functions2 <- names(igraph_yaml2)
# setdiff(igraph_functions2, igraph_functions)
# ???
igraph_functions <- union(igraph_functions2, igraph_functions)
find_igraph <- function(rrr_igraph, igraph_functions) {
  if (sub("^R_", "", rrr_igraph) %in% igraph_functions) {
    return(sub("^R_", "", rrr_igraph))
  } else {
    ""
  }
}

impl_df$igraph <- purrr::map_chr(impl_df$rrrigraph, find_igraph, igraph_functions = igraph_functions)

## Now find where to add the cdogs tags yay
r_scripts <- fs::dir_ls("R", glob = "*.R")
r_scripts <- setdiff(r_scripts, file.path("R", "aaa-auto.R"))

tibblify_funs <- function(script) {
  script_xml <- parse_script(script)

  kiddos <- script_xml |>
    xml2::xml_children() |>
    purrr::keep(\(x) xml2::xml_name(x) == "expr")

  treat_fun <- function(impl) {
    name <- xml2::xml_text(xml2::xml_child(impl))

    if (name == "NULL") {
      return(NULL)
    }

    if (grepl("How to print HRGs", name)) {
      return(NULL)
    }

    if (grepl("PACKAGE", name)) {
      return(NULL)
    }

    if (grepl("Andre, Diane, Ed, Garth", name)) {
      return(NULL)
    }

    body <- xml2::xml_children(impl)[[3]]
    if (grepl("_impl", xml2::xml_text(body))) {
      body_children <- xml2::xml_children(body)
      if (length(body_children) > 1) {
        called_fns <- xml2::xml_find_all(body, ".//SYMBOL_FUNCTION_CALL") |>
          xml2::xml_text()
        impl_fns <- grep("_impl$", called_fns, value = TRUE)
      } else {
        impl_fns <- xml2::xml_text(body_children)
      }

      tibble::tibble(
        script = script,
        name = name,
        impl = impl_fns
      )
    } else {
      return(NULL)
    }
  }
  purrr::map_df(kiddos, treat_fun)
}

all_funs <- purrr::map_df(r_scripts, tibblify_funs)
all_funs <- dplyr::left_join(all_funs, impl_df, by = "impl")

## code to prepare `clinks` dataset goes here

index_url <- "https://igraph.org/c/html/latest/ix01.html"
index <- xml2::read_html(index_url)

entries <- xml2::xml_find_all(index, ".//dt")

handle_dt <- function(dt) {
  href <- xml2::xml_attr(xml2::xml_child(dt), "href")
  url <- sprintf("https://igraph.org/c/doc/%s", href)
  method <- sub(".*#", "", href)
  tibble::tibble(
    igraph = method,
    url = url
  )
}

clinks <- purrr::map_df(entries, handle_dt)
all_funs <- dplyr::left_join(all_funs, clinks, by = "igraph")
all_funs <- dplyr::filter(all_funs, !is.na(url))

for (i in 1:nrow(all_funs)) {
  if (all_funs$name[i] %in%  getNamespaceExports("igraph")) {
    cli::cli_alert_info(all_funs$impl[i])
    script_lines <- brio::read_lines(all_funs$script[i])

    target_line <- which(startsWith(script_lines, sprintf("%s <- ", all_funs$name[i])))

    script_lines <- append(
      script_lines,
      sprintf("#' @cdocs %s", all_funs$igraph[i]),
      after = target_line - 1
    )

    brio::write_lines(script_lines, all_funs$script[i])
    devtools::document()
    gert::git_commit_all(sprintf("docs: add cdocs tag for %s", all_funs$name[i]))
    gert::git_push()
  }

}


