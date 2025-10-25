# Hierarchical random graphs

Fitting and sampling hierarchical random graph models.

## Details

A hierarchical random graph is an ensemble of undirected graphs with
\\n\\ vertices. It is defined via a binary tree with \\n\\ leaf and
\\n-1\\ internal vertices, where the internal vertices are labeled with
probabilities. The probability that two vertices are connected in the
random graph is given by the probability label at their closest common
ancestor.

Please see references below for more about hierarchical random graphs.

igraph contains functions for fitting HRG models to a given network
([`fit_hrg()`](https://r.igraph.org/reference/fit_hrg.md), for
generating networks from a given HRG ensemble
([`sample_hrg()`](https://r.igraph.org/reference/sample_hrg.md)),
converting an igraph graph to a HRG and back
([`hrg()`](https://r.igraph.org/reference/hrg.md),
[`hrg_tree()`](https://r.igraph.org/reference/hrg_tree.md)), for
calculating a consensus tree from a set of sampled HRGs
([`consensus_tree()`](https://r.igraph.org/reference/consensus_tree.md))
and for predicting missing edges in a network based on its HRG models
([`predict_edges()`](https://r.igraph.org/reference/predict_edges.md)).

The igraph HRG implementation is heavily based on the code published by
Aaron Clauset, at his website (not functional any more).

## See also

Other hierarchical random graph functions:
[`consensus_tree()`](https://r.igraph.org/reference/consensus_tree.md),
[`fit_hrg()`](https://r.igraph.org/reference/fit_hrg.md),
[`hrg()`](https://r.igraph.org/reference/hrg.md),
[`hrg_tree()`](https://r.igraph.org/reference/hrg_tree.md),
[`predict_edges()`](https://r.igraph.org/reference/predict_edges.md),
[`print.igraphHRG()`](https://r.igraph.org/reference/print.igraphHRG.md),
[`print.igraphHRGConsensus()`](https://r.igraph.org/reference/print.igraphHRGConsensus.md),
[`sample_hrg()`](https://r.igraph.org/reference/sample_hrg.md)
