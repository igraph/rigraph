# Create a printer callback function

A printer callback function is a function can performs the actual
printing. It has a number of subcommands, that are called by the
`printer` package, in a form

        printer_callback("subcommand", argument1, argument2, ...)

See the examples below.

## Usage

``` r
printer_callback(fun)
```

## Arguments

- fun:

  The function to use as a printer callback function.

## Details

The subcommands:

- `length`:

  The length of the data to print, the number of items, in natural
  units. E.g. for a list of objects, it is the number of objects.

- `min_width`:

  TODO

- `width`:

  Width of one item, if `no` items will be printed. TODO

- `print`:

  Argument: `no`. Do the actual printing, print `no` items.

- `done`:

  TODO

## See also

Other printer callbacks:
[`is_printer_callback()`](https://r.igraph.org/reference/is_printer_callback.md)
