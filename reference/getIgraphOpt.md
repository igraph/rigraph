# Parameters for the igraph package

**\[deprecated\]**

`getIgraphOpt()` was renamed to
[`igraph_opt()`](https://r.igraph.org/reference/igraph_options.md) to
create a more consistent API.

## Usage

``` r
getIgraphOpt(x, default = NULL)
```

## Arguments

- x:

  A character string holding an option name.

- default:

  If the specified option is not set in the options list, this value is
  returned. This facilitates retrieving an option and checking whether
  it is set and setting it separately if not.
