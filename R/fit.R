#' Fitting a power-law distribution function to discrete data
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' `power.law.fit()` was renamed to [fit_power_law()] to create a more
#' consistent API.
#' @inheritParams fit_power_law
#' @keywords internal
#' @export
power.law.fit <- function(
  x,
  xmin = NULL,
  start = 2,
  force.continuous = FALSE,
  implementation = c("plfit", "R.mle"),
  ...
) {
  # nocov start
  lifecycle::deprecate_soft("2.0.0", "power.law.fit()", "fit_power_law()")
  fit_power_law(
    x = x,
    xmin = xmin,
    start = start,
    force.continuous = force.continuous,
    implementation = implementation,
    ...
  )
} # nocov end
#   IGraph R package
#   Copyright (C) 2005-2012  Gabor Csardi <csardi.gabor@gmail.com>
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

###################################################################
# Pit a power-law (khmm a Yule really) distribution,
# this is a common degree distribution in networks
###################################################################

#' Fitting a power-law distribution function to discrete data
#'
#' `fit_power_law()` fits a power-law distribution to a data set.
#'
#' This function fits a power-law distribution to a vector containing samples
#' from a distribution (that is assumed to follow a power-law of course). In a
#' power-law distribution, it is generally assumed that \eqn{P(X=x)} is
#' proportional to \eqn{x^{-\alpha}}{x^-alpha}, where \eqn{x} is a positive
#' number and \eqn{\alpha}{alpha} is greater than 1. In many real-world cases,
#' the power-law behaviour kicks in only above a threshold value
#' \eqn{x_\text{min}}{xmin}. The goal of this function is to determine
#' \eqn{\alpha}{alpha} if \eqn{x_\text{min}}{xmin} is given, or to determine
#' \eqn{x_\text{min}}{xmin} and the corresponding value of \eqn{\alpha}{alpha}.
#'
#' `fit_power_law()` provides two maximum likelihood implementations.  If
#' the `implementation` argument is \sQuote{`R.mle`}, then the BFGS
#' optimization (see [stats4::mle()]) algorithm is applied.  The additional
#' arguments are passed to the mle function, so it is possible to change the
#' optimization method and/or its parameters.  This implementation can
#' *not* to fit the \eqn{x_\text{min}}{xmin} argument, so use the
#' \sQuote{`plfit`} implementation if you want to do that.
#'
#' The \sQuote{`plfit`} implementation also uses the maximum likelihood
#' principle to determine \eqn{\alpha}{alpha} for a given \eqn{x_\text{min}}{xmin};
#' When \eqn{x_\text{min}}{xmin} is not given in advance, the algorithm will attempt
#' to find its optimal value for which the \eqn{p}-value of a Kolmogorov-Smirnov
#' test between the fitted distribution and the original sample is the largest.
#' The function uses the method of Clauset, Shalizi and Newman to calculate the
#' parameters of the fitted distribution. See references below for the details.
#'
#' `r lifecycle::badge("experimental")`
#'
#' Pass `p.value = TRUE` to include the p-value in the output.
#' This is not returned by default because the computation may be slow.
#'
#' @param x The data to fit, a numeric vector. For implementation
#'   \sQuote{`R.mle`} the data must be integer values. For the
#'   \sQuote{`plfit`} implementation non-integer values might be present and
#'   then a continuous power-law distribution is fitted.
#' @param xmin Numeric scalar, or `NULL`. The lower bound for fitting the
#'   power-law. If `NULL`, the smallest value in `x` will be used for
#'   the \sQuote{`R.mle`} implementation, and its value will be
#'   automatically determined for the \sQuote{`plfit`} implementation. This
#'   argument makes it possible to fit only the tail of the distribution.
#' @param start Numeric scalar. The initial value of the exponent for the
#'   minimizing function, for the \sQuote{`R.mle`} implementation. Usually
#'   it is safe to leave this untouched.
#' @param force.continuous Logical scalar. Whether to force a continuous
#'   distribution for the \sQuote{`plfit`} implementation, even if the
#'   sample vector contains integer values only (by chance). If this argument is
#'   false, igraph will assume a continuous distribution if at least one sample
#'   is non-integer and assume a discrete distribution otherwise.
#' @param p.value `r lifecycle::badge("experimental")`
#'
#'   Set to `TRUE` to compute the p-value with `implementation = "plfit"`.
#' @param p.precision `r lifecycle::badge("experimental")`
#'
#'   The desired precision of the p-value calculation. The
#'   precision ultimately depends on the number of resampling attempts. The
#'   number of resampling trials is determined by 0.25 divided by the square
#'   of the required precision. For instance, a required precision of 0.01
#'   means that 2500 samples will be drawn.
#' @param implementation Character scalar. Which implementation to use. See
#'   details below.
#' @param \dots Additional arguments, passed to the maximum likelihood
#'   optimizing function, [stats4::mle()], if the \sQuote{`R.mle`}
#'   implementation is chosen. It is ignored by the \sQuote{`plfit`}
#'   implementation.
#' @return Depends on the `implementation` argument. If it is
#'   \sQuote{`R.mle`}, then an object with class \sQuote{`mle`}. It can
#'   be used to calculate confidence intervals and log-likelihood. See
#'   [stats4::mle-class()] for details.
#'
#'   If `implementation` is \sQuote{`plfit`}, then the result is a
#'   named list with entries:
#'   \describe{
#'     \item{continuous}{
#'       Logical scalar, whether the
#'       fitted power-law distribution was continuous or discrete.
#'     }
#'     \item{alpha}{
#'       Numeric scalar, the exponent of the fitted power-law distribution.
#'     }
#'     \item{xmin}{
#'       Numeric scalar, the minimum value from which the
#'       power-law distribution was fitted. In other words, only the values larger
#'       than `xmin` were used from the input vector.
#'     }
#'     \item{logLik}{
#'       Numeric scalar, the log-likelihood of the fitted parameters.
#'     }
#'     \item{KS.stat}{
#'       Numeric scalar, the test statistic of a Kolmogorov-Smirnov test
#'       that compares the fitted distribution with the input vector.
#'       Smaller scores denote better fit.
#'     }
#'     \item{KS.p}{
#'       Only for `p.value = TRUE`. Numeric scalar, the p-value of the Kolmogorov-Smirnov
#'       test. Small p-values (less than 0.05) indicate that the test rejected the
#'       hypothesis that the original data could have been drawn from the fitted
#'       power-law distribution.
#'     }
#'   }
#' @author Tamas Nepusz \email{ntamas@@gmail.com} and Gabor Csardi
#' \email{csardi.gabor@@gmail.com}
#' @seealso [stats4::mle()]
#' @references Power laws, Pareto distributions and Zipf's law, M. E. J.
#' Newman, *Contemporary Physics*, 46, 323-351, 2005.
#'
#' Aaron Clauset, Cosma R .Shalizi and Mark E.J. Newman: Power-law
#' distributions in empirical data. SIAM Review 51(4):661-703, 2009.
#' @family fit
#' @export
#' @keywords graphs
#' @examples
#'
#' # This should approximately yield the correct exponent 3
#' g <- sample_pa(1000) # increase this number to have a better estimate
#' d <- degree(g, mode = "in")
#' fit1 <- fit_power_law(d + 1, 10)
#' fit2 <- fit_power_law(d + 1, 10, implementation = "R.mle")
#'
#' fit1$alpha
#' stats4::coef(fit2)
#' fit1$logLik
#' stats4::logLik(fit2)
#'
fit_power_law <- function(
  x,
  xmin = NULL,
  start = 2,
  force.continuous = FALSE,
  implementation = c("plfit", "R.mle"),
  p.value = FALSE,
  p.precision = NULL,
  ...
) {
  implementation <- igraph.match.arg(implementation)

  if (implementation == "r.mle") {
    if (isTRUE(p.value)) {
      cli::cli_abort(
        "{.arg p.value} is not supported for {.arg implementation} = {.str R.mle}"
      )
    }
    power.law.fit.old(x, xmin, start, ...)
  } else if (implementation == "plfit.p") {
    lifecycle::deprecate_stop(
      "2.1.0",
      'fit_power_law(implementation = "cannot be \\"plfit.p\\"")',
      I('`fit_power_law(implementation = "plfit", p.value = TRUE)`')
    )
  } else if (implementation == "plfit") {
    xmin <- xmin %||% -1
    p.precision <- p.precision %||% 0.01
    power.law.fit.new(
      x,
      xmin = xmin,
      force.continuous = force.continuous,
      p.value = p.value,
      p.precision = p.precision
    )
  }
}

power.law.fit.old <- function(x, xmin = NULL, start = 2, ...) {
  if (length(x) < 2) {
    cli::cli_abort(
      "{.arg x} must be a vector of length at least 2, not {length(x)}."
    )
  }

  xmin <- xmin %||% min(x)

  n <- length(x)
  x <- x[x >= xmin]
  if (length(x) != n) {
    n <- length(x)
  }

  #  mlogl <- function(alpha) {
  #    if (xmin > 1) {
  #      C <- 1/(1/(alpha-1)-sum(beta(1:(xmin-1), alpha)))
  #    } else {
  #      C <- alpha-1
  #    }
  #    -n*log(C)-sum(lbeta(x, alpha))
  #  }

  mlogl <- function(alpha) {
    C <- 1 / sum((xmin:10000)^-alpha)
    -n * log(C) + alpha * sum(log(x))
  }

  alpha <- stats4::mle(mlogl, start = list(alpha = start), ...)

  alpha
}

power.law.fit.new <- function(
  data,
  xmin = -1,
  force.continuous = FALSE,
  p.value = FALSE,
  p.precision = 0.01
) {
  # Argument checks
  data <- as.numeric(data)
  xmin <- as.numeric(xmin)
  force.continuous <- as.logical(force.continuous)

  on.exit(.Call(R_igraph_finalizer))
  # Function call
  res <- .Call(
    R_igraph_power_law_fit_new,
    data,
    xmin,
    force.continuous,
    p.value,
    p.precision
  )

  res
}
