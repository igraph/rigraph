library(styler)
library(tidyverse)

cache_deactivate()

normalize_igraph_arrows <- function(pd) {
  if (length(pd$token) == 0) {
    return(pd)
  }

  if (pd$token[[1]] %in% c("'-'", "'+'")) {
    if (pd$child[[2]]$token[[1]] %in% c("'-'", "'+'")) {
      if (!(pd$child[[2]]$child[[2]]$token[[1]] %in% c("'-'", "'+'"))) {
        browser()
        #pd$child[[2]]$spaces[[1]] <- 1L
      }
    }
  }
  if (nrow(pd) >= 2 && pd$token[[2]] %in% c("'-'", "'+'")) {
    if (pd$child[[3]]$token[[1]] %in% c("'-'", "'+'")) {
      if (!(pd$child[[3]]$child[[2]]$token[[1]] %in% c("'-'", "'+'"))) {
        browser()
        #pd$child[[3]]$spaces[[1]] <- 1L
      }
      pd$spaces[[2]] <- 0L
    }
  }
  pd
}

style <- create_style_guide(
  style_guide_name = "igraph",
  style_guide_version = "0.0.1",
  space = list(
    normalize_igraph_arrows = normalize_igraph_arrows
  )
)

style_text(style_text("A+-+B"), transformers = style)
style_text(style_text("A+--+B"), transformers = style)
style_text(style_text("A+---+B"), transformers = style)
style_text(style_text("A+-B"), transformers = style)
style_text(style_text("A+--B"), transformers = style)
style_text(style_text("A+---B"), transformers = style)
style_text(style_text("A-+B"), transformers = style)
style_text(style_text("A--+B"), transformers = style)
style_text(style_text("A---+B"), transformers = style)
style_text(style_text("A----+B"), transformers = style)
