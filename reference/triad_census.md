# Triad census, subgraphs with three vertices

This function counts the different induced subgraphs of three vertices
in a graph.

## Usage

``` r
triad_census(graph)
```

## Arguments

- graph:

  The input graph, it should be directed. An undirected graph results a
  warning, and undefined results.

## Value

A numeric vector, the subgraph counts, in the order given in the above
description.

## Details

Triad census was defined by David and Leinhardt (see References below).
Every triple of vertices (A, B, C) are classified into the 16 possible
states:

- 003:

  A,B,C, the empty graph.

- 012:

  A-\>B, C, the graph with a single directed edge.

- 102:

  A\<-\>B, C, the graph with a mutual connection between two vertices.

- 021D:

  A\<-B-\>C, the out-star.

- 021U:

  A-\>B\<-C, the in-star.

- 021C:

  A-\>B-\>C, directed line.

- 111D:

  A\<-\>B\<-C.

- 111U:

  A\<-\>B-\>C.

- 030T:

  A-\>B\<-C, A-\>C.

- 030C:

  A\<-B\<-C, A-\>C.

- 201:

  A\<-\>B\<-\>C.

- 120D:

  A\<-B-\>C, A\<-\>C.

- 120U:

  A-\>B\<-C, A\<-\>C.

- 120C:

  A-\>B-\>C, A\<-\>C.

- 210:

  A-\>B\<-\>C, A\<-\>C.

- 300:

  A\<-\>B\<-\>C, A\<-\>C, the complete graph.

This functions uses the RANDESU motif finder algorithm to find and count
the subgraphs, see
[`motifs()`](https://r.igraph.org/reference/motifs.md).

## Related documentation in the C library

[`triad_census`](https://igraph.org/c/html/0.10.17/igraph-Motifs.html#igraph_triad_census)

## References

See also Davis, J.A. and Leinhardt, S. (1972). The Structure of Positive
Interpersonal Relations in Small Groups. In J. Berger (Ed.),
Sociological Theories in Progress, Volume 2, 218-251. Boston: Houghton
Mifflin.

## See also

[`dyad_census()`](https://r.igraph.org/reference/dyad_census.md) for
classifying binary relationships,
[`motifs()`](https://r.igraph.org/reference/motifs.md) for the
underlying implementation.

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- sample_gnm(15, 45, directed = TRUE)
triad_census(g)
#>  [1] 132 154  52  12  16  24  19  12  10   1   6   1   2   9   5   0
```
