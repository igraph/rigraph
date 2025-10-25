# Takes an argument list and extracts the constructor specification and constructor modifiers from it.

This is a helper function for the common parts of
[`make_()`](https://r.igraph.org/reference/make_.md) and
[`sample_()`](https://r.igraph.org/reference/sample_.md).

## Usage

``` r
.extract_constructor_and_modifiers(..., .operation, .variant)
```

## Arguments

- ...:

  Parameters to extract from

- .operation:

  Human-readable description of the operation that this helper is a part
  of

- .variant:

  Constructor variant; must be one of ‘make’, ‘graph’ or ‘sample’. Used
  in cases when the same constructor specification has deterministic and
  random variants.

## Value

A named list with three items:

- cons:

  the constructor function

- mods:

  the modifiers

- args:

  the remaining, unparsed arguments.
