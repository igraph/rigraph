# Query igraph's version string

Returns the R package version, prints the R package version and C
library version.

## Usage

``` r
igraph_version()
```

## Value

A character scalar, the igraph version string, with an attribute
`"c_version"` giving the C library version string.

## Related documentation in the C library

[`version`](https://igraph.org/c/html/0.10.17/igraph-Nongraph.html#igraph_version)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
igraph_version()
```
