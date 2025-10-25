# Plotting the results on multiple SIR model runs

This function can conveniently plot the results of multiple SIR model
simulations.

## Usage

``` r
# S3 method for class 'sir'
plot(
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
)
```

## Arguments

- x:

  The output of the SIR simulation, coming from the
  [`sir()`](https://r.igraph.org/reference/sir.md) function.

- comp:

  Character scalar, which component to plot. Either ‘NI’ (infected,
  default), ‘NS’ (susceptible) or ‘NR’ (recovered).

- median:

  Logical scalar, whether to plot the (binned) median.

- quantiles:

  A vector of (binned) quantiles to plot.

- color:

  Color of the individual simulation curves.

- median_color:

  Color of the median curve.

- quantile_color:

  Color(s) of the quantile curves. (It is recycled if needed and
  non-needed entries are ignored if too long.)

- lwd.median:

  Line width of the median.

- lwd.quantile:

  Line width of the quantile curves.

- lty.quantile:

  Line type of the quantile curves.

- xlim:

  The x limits, a two-element numeric vector. If `NULL`, then it is
  calculated from the data.

- ylim:

  The y limits, a two-element numeric vector. If `NULL`, then it is
  calculated from the data.

- xlab:

  The x label.

- ylab:

  The y label. If `NULL` then it is automatically added based on the
  `comp` argument.

- ...:

  Additional arguments are passed to
  [`plot()`](https://rdrr.io/r/graphics/plot.default.html), that is run
  before any of the curves are added, to create the figure.

## Value

Nothing.

## Details

The number of susceptible/infected/recovered individuals is plotted over
time, for multiple simulations.

## References

Bailey, Norman T. J. (1975). The mathematical theory of infectious
diseases and its applications (2nd ed.). London: Griffin.

## See also

[`sir()`](https://r.igraph.org/reference/sir.md) for running the actual
simulation.

Processes on graphs
[`time_bins()`](https://r.igraph.org/reference/sir.md)

## Author

Eric Kolaczyk (<https://kolaczyk.github.io/>) and Gabor Csardi
<csardi.gabor@gmail.com>.

## Examples

``` r
g <- sample_gnm(100, 100)
sm <- sir(g, beta = 5, gamma = 1)
plot(sm)

```
