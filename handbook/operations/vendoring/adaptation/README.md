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

**Every commit's tests are written for its own engine**, with no check of the engine's version inside a test:

* A test a vendor commit breaks is adapted in that commit.
* A test whose function upstream removed goes in the vendor commit that removes the function, with its snapshot entries.
  The comment the rules above ask for stands where the test stood, at the top level of the file.
  It names the upstream commit that vendor commit vendors: `# upstream igraph@<short-sha>: <what upstream removed>`.
  A file the removal empties keeps the comment.
* A test that only a later engine supports is added in the vendor commit that brings that engine.

**A series stops no other test `main` runs**, because a landing would carry the loss to `main`
([`series-loop/`](/handbook/operations/vendoring/series-loop/README.md)).
[`scripts/series-tests.sh`](/scripts/series-tests.sh) reads what a tree takes from `main`'s tests, and tells a removal by its comment.
The comment marks a removal rather than the commit message, for two reasons.
It is in the tree, where a pick or a carry is read before it is a commit.
And it names its place and its upstream commit, so it excuses no other loss in its file and none by another commit.
