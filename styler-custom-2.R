library(styler)
library(tidyverse)

cache_deactivate()

normalize_igraph_arrows <- function(pd) {
  if (length(pd$token) == 0) {
    return(pd)
  }

  if (pd$token[[1]] %in% c("'-'", "'+'")) {
    if (pd$token_before[[1]] %in% c("'-'", "'+'")) {
      if (!(pd$token_after[[1]] %in% c("'-'", "'+'"))) {
        pd$spaces[[1]] <- 1L
      }
    }
  }

  if (nrow(pd) > 1) {
    evens <- seq.int(2L, nrow(pd), by = 2L)
    if (all(pd$token[evens] %in% c("'-'", "'+'"))) {
      after_ops <- pd$token_after[evens] %in% c("'-'", "'+'")
      pd$spaces[evens][after_ops] <- 0L
    }
  }
  pd
}

igraph_style <- function(scope = "tokens", ...) {
  style <- tidyverse_style(scope = scope, ...)

  if ("space" %in% names(style)) {
    style$space <- c(
      style$space,
      list(
        normalize_igraph_arrows = normalize_igraph_arrows
      )
    )
  }

  style
}

style_text("A -- B -- C")
style_text("A -- B -- C -- D", style = igraph_style)
style_text("A - +B:C")
style_text("A - +B:C", style = igraph_style)
style_text("A+-+B", style = igraph_style)
style_text("A+--+B", style = igraph_style)
style_text("A+---+B", style = igraph_style)
style_text("A+-B", style = igraph_style)
style_text("A+--B", style = igraph_style)
style_text("A+---B", style = igraph_style)
style_text("A-+B", style = igraph_style)
style_text("A--+B", style = igraph_style)
style_text("A---+B", style = igraph_style)
style_text("A----+B", style = igraph_style)
