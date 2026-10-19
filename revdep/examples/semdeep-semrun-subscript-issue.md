# SEMdeep `SEMml(algo = "sem")` — subscript out of bounds

## Issue

`SEMdeep::SEMml()` fails at its `algo = "sem"` step. The first three algorithms
(`tree`, `rf`, `xgb`) complete normally in the same example, so the graph and
the data reach that point intact.

## Evidence

From the `revdep2` run [31048405399](https://github.com/igraph/rigraph/actions/runs/31048405399),
`SEMdeep 1.1.1` checked against igraph 2.3.3.9026, `--run-donttest` examples:

```text
> res3<- SEMml(ig, data[train, ], algo="xgb", ncores = ncores)
Running SEM model via ML...
 done.

XGB solver ended normally after 23 iterations

 logL:69.930993  srmr:0.001418
>
> # ... sem
> res4<- SEMml(ig, data[train, ], algo="sem")
Running SEM model via ML...
Error in x[, ii] : subscript out of bounds
Calls: SEMml ... model.frame.default -> na.omit -> na.omit.data.frame
Execution halted
```

No igraph function appears on the backtrace: the failure is `model.frame()`
being handed a data frame narrower than the formula it is given, inside
`SEMgraph::SEMrun(dag, data, algo = "cggm")` — which is what `SEMml()` calls
for `algo = "sem"`.

## Reproducible example

Not reduced to an igraph call yet, and unrendered: `SEMgraph` needs
Bioconductor's `graph` and `Rgraphviz`, which do not install in the
environment where the other examples in this directory were rendered. The
script is [`semdeep-semrun-subscript-issue.R`](semdeep-semrun-subscript-issue.R)
and runs anywhere SEMdeep itself installs:

```r
library(SEMgraph)
library(igraph)

ig <- alsData$graph
data <- transformData(alsData$exprs)$data

nodes <- colnames(data)[colnames(data) %in% V(ig)$name]
graph <- induced_subgraph(ig, vids = which(V(ig)$name %in% nodes))
dag <- graph2dag(graph, data, bap = FALSE)
data <- data[, V(dag)$name]

SEMrun(dag, data = data, algo = "cggm")
```

## What to compare

The error is a column subscript running past the end of a data frame, so the
question is whether `dag` still describes the same vertices in the same order
under the development version:

```r
vcount(dag); ecount(dag)
V(dag)$name
setdiff(V(dag)$name, colnames(data))
igraph::degree(dag, mode = "in")   # SEMml() splits Vx/Vy on this
is_dag(dag)
```

A `graph2dag()` that now drops, renames or reorders vertices produces exactly
this failure downstream.

## Assessment

Not yet traced to a specific igraph change. It is the same shape as SEMgraph's
own open item in [#2646](https://github.com/igraph/rigraph/issues/2646)
(`SEMdag(LO = "TL")` → subscript out of bounds in `buildLevels()`), and
SEMdeep `Depends` on SEMgraph, so one cause may well explain both.

## Recommendation

Bisect against the ellipsis-move PRs (#2757–#2778, #2784) before contacting the
maintainer. A silently different result with no warning is what a positional
argument no longer binding where it used to looks like, and if the cause is
ours then SEMgraph, not SEMdeep, is where it should be fixed.
