# Print the only the head of an R object

Print the only the head of an R object

## Usage

``` r
head_print(
  x,
  max_lines = 20,
  header = "",
  footer = "",
  omitted_footer = "",
  ...
)
```

## Arguments

- x:

  The object to print, or a callback function. See
  [`printer_callback()`](https://r.igraph.org/reference/printer_callback.md)
  for details.

- max_lines:

  Maximum number of lines to print, *not* including the header and the
  footer.

- header:

  The header, if a function, then it will be called, otherwise printed
  using `cat`.

- footer:

  The footer, if a function, then it will be called, otherwise printed
  using `cat`.

- omitted_footer:

  Footer that is only printed if anything is omitted from the printout.
  If a function, then it will be called, otherwise printed using `cat`.

- ...:

  Extra arguments to pass to
  [`print()`](https://rdrr.io/r/base/print.html).

## Value

`x`, invisibly.
