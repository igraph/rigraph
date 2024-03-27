oldsample_1_5_0 <- function() {
  ..env.1.. <- new.env(parent = baseenv())
  ..env.1..$me <- list(
    3,
    TRUE,
    c(0, 1, 2),
    c(1, 2, 0),
    NULL,
    NULL,
    NULL,
    NULL,
    list(
      c(1, 0, 1),
      list(name = "Ring graph", mutual = FALSE, circular = TRUE),
      list(bar = c("A", "B", "C")),
      list(foo = c("a", "b", "c"))
    ),
    ..env.1..
  ) %>%
    structure(class = "igraph")

  # This will be reconstructed on demand.
  # ..env.1..$igraph <- constructive::.xptr("0x0")

  ..env.1..$.__igraph_version__. <- ver_1_5_0
  ..env.1..$myid <- "0fb28c05-9cc1-4a24-ba62-f5c319a3051b"
  ..env.1..$me
}
