# The igraph console

The igraph console is a GUI window that shows what the currently running
igraph function is doing.

## Usage

``` r
console()
```

## Value

`NULL`, invisibly.

## Details

The console can be started by calling the `console()` function. Then it
stays open, until the user closes it.

Another way to start it to set the `verbose` igraph option to
“tkconsole” via
[`igraph_options()`](https://r.igraph.org/reference/igraph_options.md).
Then the console (re)opens each time an igraph function supporting it
starts; to close it, set the `verbose` option to another value.

The console is written in Tcl/Tk and required the `tcltk` package.

## See also

[`igraph_options()`](https://r.igraph.org/reference/igraph_options.md)
and the `verbose` option.

## Author

Gabor Csardi <csardi.gabor@gmail.com>
