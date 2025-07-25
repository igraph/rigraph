#   IGraph R package
#   Copyright (C) 2014  Gabor Csardi <csardi.gabor@gmail.com>
#   334 Harvard street, Cambridge, MA 02139 USA
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
#   02110-1301 USA
#
###################################################################

#' @rdname sir
#' @export
time_bins <- function(x, middle = TRUE) {
  UseMethod("time_bins")
}

#' @method time_bins sir
#' @rdname sir
#' @export
#' @importFrom stats IQR
time_bins.sir <- function(x, middle = TRUE) {
  sir <- x

  big.time <- unlist(sapply(sir, "[[", "times"))
  medlen <- median(sapply(lapply(sir, "[[", "times"), length))
  ## Adhoc use of Freedman-Diaconis binwidth; rescale time accordingly.
  w <- 2 * IQR(big.time) / (medlen^(1 / 3))
  minbt <- min(big.time)
  maxbt <- max(big.time)
  res <- seq(minbt, maxbt, length.out = ceiling((maxbt - minbt) / w))
  if (middle) {
    res <- (res[-1] + res[-length(res)]) / 2
  }
  res
}

#' @importFrom stats median
#' @method median sir
#' @rdname sir
#' @export
median.sir <- function(x, na.rm = FALSE, ...) {
  sir <- x
  times <- unlist(sapply(sir, "[[", "times"))
  big.N.NS <- unlist(sapply(sir, "[[", "NS"))
  big.N.NI <- unlist(sapply(sir, "[[", "NI"))
  big.N.NR <- unlist(sapply(sir, "[[", "NR"))
  time.bin <- cut(times, time_bins(sir, middle = FALSE), include.lowest = TRUE)
  NS <- tapply(big.N.NS, time.bin, median, na.rm = na.rm)
  NI <- tapply(big.N.NI, time.bin, median, na.rm = na.rm)
  NR <- tapply(big.N.NR, time.bin, median, na.rm = na.rm)
  list(NS = NS, NI = NI, NR = NR)
}

#' @importFrom stats quantile
#' @method quantile sir
#' @rdname sir
#' @export
quantile.sir <- function(x, comp = c("NI", "NS", "NR"), prob, ...) {
  sir <- x
  comp <- toupper(igraph.match.arg(comp))
  times <- unlist(sapply(sir, "[[", "times"))
  big.N <- unlist(sapply(sir, function(x) {
    x[[comp]]
  }))
  time.bin <- cut(times, time_bins(sir, middle = FALSE), include.lowest = TRUE)
  res <- lapply(prob, function(pp) {
    tapply(big.N, time.bin, function(x) {
      quantile(x, prob = pp)
    })
  })
  if (length(res) == 1) {
    res <- res[[1]]
  }
  res
}

# R function to plot compartment total curves from simul.net.epi .
# Inputs:  sim.res :=  list of simulated network SIR processes
#             comp := compartment (i.e., "NS", "NI", or "NR")
#                q := vector of lower and upper quantiles, resp
#             cols := char vector of colors for lines, median, and quantiles, resp.
# Outputs:  None.  Just produces the plot of all compartment curves,
#           with median and quantiles.

#' Plotting the results on multiple SIR model runs
#'
#' This function can conveniently plot the results of multiple SIR model
#' simulations.
#'
#' The number of susceptible/infected/recovered individuals is plotted over
#' time, for multiple simulations.
#'
#' @param x The output of the SIR simulation, coming from the [sir()]
#'   function.
#' @param comp Character scalar, which component to plot. Either \sQuote{NI}
#'   (infected, default), \sQuote{NS} (susceptible) or \sQuote{NR} (recovered).
#' @param median Logical scalar, whether to plot the (binned) median.
#' @param quantiles A vector of (binned) quantiles to plot.
#' @param color Color of the individual simulation curves.
#' @param median_color Color of the median curve.
#' @param quantile_color Color(s) of the quantile curves. (It is recycled if
#'   needed and non-needed entries are ignored if too long.)
#' @param lwd.median Line width of the median.
#' @param lwd.quantile Line width of the quantile curves.
#' @param lty.quantile Line type of the quantile curves.
#' @param xlim The x limits, a two-element numeric vector. If `NULL`, then
#'   it is calculated from the data.
#' @param ylim The y limits, a two-element numeric vector. If `NULL`, then
#'   it is calculated from the data.
#' @param xlab The x label.
#' @param ylab The y label. If `NULL` then it is automatically added based
#'   on the `comp` argument.
#' @param \dots Additional arguments are passed to [plot()], that is run
#'   before any of the curves are added, to create the figure.
#' @return Nothing.
#' @author Eric Kolaczyk (<http://math.bu.edu/people/kolaczyk/>) and Gabor
#' Csardi \email{csardi.gabor@@gmail.com}.
#' @seealso [sir()] for running the actual simulation.
#' @references Bailey, Norman T. J. (1975). The mathematical theory of
#' infectious diseases and its applications (2nd ed.). London: Griffin.
#' @method plot sir
#' @family processes
#' @export
#' @importFrom graphics plot lines
#' @keywords graphs
#' @examples
#'
#' g <- sample_gnm(100, 100)
#' sm <- sir(g, beta = 5, gamma = 1)
#' plot(sm)
#'
plot.sir <- function(
  x,
  comp = c("NI", "NS", "NR"),
  median = TRUE,
  quantiles = c(0.1, 0.9),
  color = NULL,
  median_color = NULL,
  quantile_color = NULL,
  lwd.median = 2,
  lwd.quantile = 2,
  lty.quantile = 3,
  xlim = NULL,
  ylim = NULL,
  xlab = "Time",
  ylab = NULL,
  ...
) {
  sir <- x

  comp <- toupper(igraph.match.arg(comp))
  if (!all(quantiles >= 0 & quantiles <= 1)) {
    cli::cli_abort("All {.arg quantiles} should be in [0,1].")
  }

  if (is.null(color)) {
    color <- c(NI = "skyblue", NS = "pink", NR = "palegoldenrod")[comp]
  }
  if (is.null(median_color)) {
    median_color <- c(NI = "blue", NS = "red", NR = "gold")[comp]
  }
  if (is.null(quantile_color)) {
    quantile_color <- c(NI = "blue", NS = "red", NR = "gold")[comp]
  }
  quantile_color <- rep(quantile_color, length.out = length(quantiles))

  ns <- length(sir)
  xlim <- xlim %||% c(0, max(sapply(sir, function(x) max(x$times))))
  ylim <- ylim %||% c(0, max(sapply(sir, function(x) max(x[[comp]]))))

  ## Generate the plot, first with individual curves, and then
  ## adding median and quantile curves.

  if (is.null(ylab)) {
    if (comp == "NI") {
      ylab <- expression(N[I](t))
    }
    if (comp == "NR") {
      ylab <- expression(N[R](t))
    }
    if (comp == "NS") {
      ylab <- expression(N[S](t))
    }
  }

  # Plot the stochastic curves individually.
  plot(
    0,
    0,
    type = "n",
    xlim = xlim,
    ylim = ylim,
    xlab = xlab,
    ylab = ylab,
    ...
  )
  lapply(seq_along(sir), function(i) {
    lines(sir[[i]]$times, sir[[i]][[comp]], col = color[1])
  })

  # Plot the median and quantiles.
  if (median || length(quantiles) > 0) {
    time.bin <- time_bins(sir, middle = TRUE)
  }
  if (median) {
    lines(
      time.bin,
      median(sir)[[comp]],
      type = "l",
      lwd = lwd.median,
      col = median_color
    )
  }
  for (i in seq_along(quantiles)) {
    my.ql <- quantile(sir, comp, quantiles[i])
    lines(
      time.bin,
      my.ql,
      type = "l",
      lty = lty.quantile,
      lwd = lwd.quantile,
      col = quantile_color[i]
    )
  }

  invisible()
}
