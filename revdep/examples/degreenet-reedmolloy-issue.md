# degreenet reedmolloy() fails through a defunct fallback method

## Issue
```
> simr <- reedmolloy(s4)
Error in reedmolloy(s4) :
  The reedmolloy function failed to form a valid network from the passed degree sequence.
```

No `lifecycle::deprecate_stop` trace is visible in the log because `degreenet::reedmolloy()` wraps its inner igraph calls in `.catchToList()`, which converts errors into retry attempts. After `maxit = 10` failed retries, `reedmolloy` emits its own error.

## Reproducible Example

```r
library(degreenet)
library(igraph)
set.seed(2)
s4 <- simpln(n = 100, v = c(-1, 1))
table(s4)
#>  1  2  3  4  5  6
#> 65 18  7  4  4  2

# Against CRAN igraph 2.3.1: succeeds.
# Against dev igraph 2.3.1.9005: fails.
reedmolloy(s4)
```

## What is happening

`reedmolloy` first calls `igraph::degree.sequence.game(deg, method = "vl")` and falls back to `method = "simple.no.multiple"` inside a jitter+retry loop if the first call errors:

1. **The VL call deterministically fails on this sequence.** Verified against CRAN igraph 2.3.1: VL errored 50/50 times. This is *not* a regression — VL only produces connected graphs, and `s4`'s 65 degree-1 vertices preclude a connected configuration here.
2. **Against CRAN 2.3.1** the fallback `method = "simple.no.multiple"` produces an igraph object with a deprecation warning, so `reedmolloy(s4)` succeeds.
3. **Against dev igraph** the fallback hard-errors:
   ```
   ! The `method` argument of `sample_degseq()` must be fast.heur.simple
     instead of simple.no.multiple as of igraph 2.1.0.
   ```
   `.catchToList()` swallows it, the loop reaches `maxit`, and `reedmolloy` emits its own error.

## Root Cause
Lifecycle promotion of `sample_degseq(method = "simple.no.multiple")` from `deprecate_warn` to `deprecate_stop` in [#2634](https://github.com/igraph/rigraph/pull/2634).

## Assessment
Bug in degreenet — depends on the obsolete fallback method name.

## Recommendation
**For degreenet**:
- Replace the fallback `method = "simple.no.multiple"` with `method = "fast.heur.simple"`.
- While there, rename `degree.sequence.game()` → `sample_degseq()` and `get.edgelist()` → `as_edgelist()`.
