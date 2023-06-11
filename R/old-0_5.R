oldsample_0_5 <- function() {
  list(
    3,
    TRUE,
    c(0, 1, 2),
    c(1, 2, 0),
    c(0, 1, 2),
    c(2, 0, 1),
    seq(0, 3, by = 1),
    seq(0, 3, by = 1),
    list(
      c(1, 0),
      list() %>%
        structure(names = character(0)),
      list(bar = c("A", "B", "C")),
      list(foo = c("a", "b", "c"))
    )
  ) %>%
    structure(class = "igraph")
}
