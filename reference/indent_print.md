# Indent a printout

Indent a printout

## Usage

``` r
indent_print(..., .indent = " ", .printer = NULL)
```

## Arguments

- ...:

  Passed to the printing function.

- .indent:

  Character scalar, indent the printout with this.

- .printer:

  The printing function. The default `NULL` uses
  [print](https://rdrr.io/r/base/print.html).

## Value

The first element in `...`, invisibly.
