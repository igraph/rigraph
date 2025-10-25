# Decide if two graphs are identical

Two graphs are considered identical by this function if and only if they
are represented in exactly the same way in the internal R
representation. This means that the two graphs must have the same list
of vertices and edges, in exactly the same order, with same
directedness, and the two graphs must also have identical graph, vertex
and edge attributes.

## Usage

``` r
identical_graphs(g1, g2, attrs = TRUE)
```

## Arguments

- g1, g2:

  The two graphs

- attrs:

  Whether to compare the attributes of the graphs

## Value

Logical scalar

## Details

This is similar to `identical` in the `base` package, but it ignores the
mutable piece of igraph objects; those might be different even if the
two graphs are identical.

Attribute comparison can be turned off with the `attrs` parameter if the
attributes of the two graphs are allowed to be different.
