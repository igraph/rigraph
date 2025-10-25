# Run code with a temporary igraph options setting

Run code with a temporary igraph options setting

## Usage

``` r
with_igraph_opt(options, code)
```

## Arguments

- options:

  A named list of the options to change.

- code:

  The code to run.

## Value

The result of the `code`.

## See also

Other igraph options:
[`igraph_options()`](https://r.igraph.org/reference/igraph_options.md)

## Examples

``` r
with_igraph_opt(
  list(sparsematrices = FALSE),
  make_ring(10)[]
)
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#>  [1,]    0    1    0    0    0    0    0    0    0     1
#>  [2,]    1    0    1    0    0    0    0    0    0     0
#>  [3,]    0    1    0    1    0    0    0    0    0     0
#>  [4,]    0    0    1    0    1    0    0    0    0     0
#>  [5,]    0    0    0    1    0    1    0    0    0     0
#>  [6,]    0    0    0    0    1    0    1    0    0     0
#>  [7,]    0    0    0    0    0    1    0    1    0     0
#>  [8,]    0    0    0    0    0    0    1    0    1     0
#>  [9,]    0    0    0    0    0    0    0    1    0     1
#> [10,]    1    0    0    0    0    0    0    0    1     0
igraph_opt("sparsematrices")
#> [1] TRUE
```
