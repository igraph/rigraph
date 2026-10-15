# Adaptation

How the R side follows a change in the C library, so that every vendor commit stays green without changing what users see.

**The rules**, which a repair in the series loop follows ([`series-loop/`](/handbook/operations/vendoring/series-loop/README.md)):

* Wrap new C behaviour without changing the R interface.
* Put new arguments behind `...`, checked with `check_dots_empty()`.
* Guard fallbacks for old behaviour with `lifecycle::signal_stage("superseded")`.
  Where the old behaviour can be composed from existing igraph calls, compose it, so that no snapshot moves.
* In any function you touch, replace `.Call()` outside `aaa-*.R` with `_impl()` calls, adapting the Stimulus definitions where needed.
* The `aaa-*.R` files are always generated, never changed by hand ([`architecture/stimulus/`](/handbook/architecture/stimulus/README.md));
  the per-commit gate regenerates them and fails on a difference.
* For genuine igraph problems, prefer `patch/` and Stimulus over handwritten workarounds.
* Change tests only as a last resort, with a comment saying why: `# upstream igraph@<short-sha>: <reason>`.

**Where a fix lives, in the order to try:**

1. `patch/`, when the C library itself is wrong or does not build here;
   the patch and its effect on `src/vendor/cigraph/` change together ([`pipeline/`](/handbook/operations/vendoring/pipeline/README.md)).
2. The Stimulus definitions in `tools/stimulus/*.yaml`, when the generated bridge no longer fits the C API.
3. R code under `R/`, following the rules above.
4. Snapshots, only after confirming the new output is correct ([`testing/snapshots/`](/handbook/testing/snapshots/README.md)).
5. Tests, last.

**Every fix is folded into the vendor commit that needs it**, never stacked above it,
and the vendor commit's message gains an `R-side fix` section saying what was adapted;
the generated files need no mention.

**A series never stops a test `main` runs.**
Where an older C library cannot pass a test, the test gets `skip_if_engine_before("<version>", "<why>")` from `tests/testthat/helper-skip.R`,
naming the version that brings the behaviour back, instead of being deleted, rewritten or skipped without end;
[`scripts/series-tests.sh`](/scripts/series-tests.sh) reads what a tree takes from `main`'s tests.
