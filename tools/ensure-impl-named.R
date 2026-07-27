source_files <-
  fs::dir_ls("R", glob = "*.R") |>
  setdiff("R/aaa-auto.R")

test_file <- "tests/testthat/test-aaa-auto.R"

all_files <- c(source_files, test_file)

# all_files <- test_file

# all_files <- all_files[1:10]

pkgload::load_all()
library(dplyr)
library(stringr)

for (file in all_files) {
  cat(sprintf("Processing %s...\n", file))

  text <- readLines(file)

  data <-
    parse(text = text, keep.source = TRUE) |>
    utils::getParseData(includeText = TRUE) |>
    as_tibble()

  parents <-
    data |>
    filter(token == "expr", str_detect(text, "_impl$")) |>
    filter(row_number() == 1, .by = line1)

  repl_data <-
    data[match(parents$parent, data$id), ] |>
    mutate(fun = !!parents$text) |>
    arrange(desc(line2), desc(col2))

  for (i in seq_len(nrow(repl_data))) {
    repl_line <- repl_data[i, ]

    sub_expr <- parse(text = repl_line$text)[[1]]
    print(sub_expr)

    func_def <- get(repl_line$fun, envir = asNamespace("igraph"))

    matched_call <- tryCatch(
      rlang::call_match(
        sub_expr,
        func_def,
        dots_expand = FALSE
      ),
      error = function(e) {
        cat("Failed to match call for ", repl_line$fun, "\n")
        cat("Original call:\n")
        print(sub_expr)
        cat("Function definition:\n")
        print(func_def)
        sub_expr
      }
    )

    # Convert dots to underscores in parameter names
    names_idx <- which(names(matched_call) != "...")[-1]
    names(matched_call)[names_idx] <- gsub(
      ".",
      "_",
      names(matched_call)[names_idx],
      fixed = TRUE
    )

    deparsed <- deparse(matched_call, width.cutoff = 500)
    deparsed[[1]] <- sub("(", "(\n    ", deparsed[[1]], fixed = TRUE)
    print(deparsed)

    # Splice
    text <- c(
      text[seq2(1, repl_line$line1 - 1)],
      paste0(str_sub(text[repl_line$line1], 1, repl_line$col1 - 1), paste(deparsed, collapse = "\n"), str_sub(text[repl_line$line2], repl_line$col2 + 1)),
      text[seq2(repl_line$line2 + 1, length(text))]
    )
  }

  writeLines(text, con = file)
}

system("air format .")
