# The igraph console

**\[defunct\]**

`console()` used to open a Tcl/Tk window that showed what the currently
running igraph function was doing. It is defunct since igraph 3.0.0 and
throws an error when called. For text progress bars in the R console,
set the `verbose` option to `TRUE` via
[`igraph_options()`](https://r.igraph.org/reference/igraph_options.md).

## Usage

``` r
console()
```

## Value

`console()` throws an error.

## See also

[`igraph_options()`](https://r.igraph.org/reference/igraph_options.md)
and the `verbose` option.

## Author

Gabor Csardi <csardi.gabor@gmail.com>
