oldsample_0_1_1 <- function() {
  list(
    3,
    TRUE,
    rep(c(0, 1, 2), each = 2L),
    c(1, 2, 2, 0, 0, 1),
    c(1, 0, 3, 2, 5, 4),
    c(4, 3, 5, 0, 2, 1),
    seq(0, 6, by = 2),
    seq(0, 6, by = 2),
    list(1, character(0), numeric(0)),
    list(3, character(0), numeric(0)),
    list(6, character(0), numeric(0))
  ) %>%
    structure(class = "igraph")
}
