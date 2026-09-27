# Query a single igraph parameter

Retrieve the current value of one igraph option set via
[`igraph_options()`](https://r.igraph.org/reference/igraph_options.md).

## Usage

``` r
igraph_opt(x, ..., default = NULL)
```

## Arguments

- x:

  A character string holding an option name.

- ...:

  These dots are for future extensions and must be empty.

- default:

  If the specified option is not set in the options list, this value is
  returned. This facilitates retrieving an option and checking whether
  it is set and setting it separately if not.

## Value

The current value set for option `x`, or `NULL` if the option is unset.

## See also

Similar to [`getOption()`](https://rdrr.io/r/base/options.html). See
[`igraph_options()`](https://r.igraph.org/reference/igraph_options.md)
to set options.

Other igraph options:
[`igraph_options()`](https://r.igraph.org/reference/igraph_options.md),
[`with_igraph_opt()`](https://r.igraph.org/reference/with_igraph_opt.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
oldval <- igraph_opt("verbose")
igraph_options(verbose = TRUE)
layout_with_kk(make_ring(10))
#> Make graph external pointer.
#> Materializing 'from' vector.
#> Materializing 'to' vector.
#>             [,1]         [,2]
#>  [1,]  1.1483519 -0.003216317
#>  [2,]  0.9291475  0.676715503
#>  [3,]  0.3521535  1.097946790
#>  [4,] -0.3622379  1.099581508
#>  [5,] -0.9411536  0.680995251
#>  [6,] -1.1634674  0.002073742
#>  [7,] -0.9442631 -0.677858079
#>  [8,] -0.3672691 -1.099089365
#>  [9,]  0.3471224 -1.100724083
#> [10,]  0.9260381 -0.682137826
igraph_options(verbose = oldval)
```
