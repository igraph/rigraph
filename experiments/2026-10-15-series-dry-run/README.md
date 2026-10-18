# A dry run of the vendor stage along the replay

*What it measures:* how far [`scripts/vendor-one.sh`](/scripts/vendor-one.sh) walks the replay of igraph 0.10.17 to 1.0.1
from what `main` vendors before the walk first needs R-side work, with the glue check on and with it off, and what stops it each time.

*When and on what:* 2026-10-15, by hand, in a local worktree; nothing was pushed.
The tree was `main`, standing at `vendor: Update vendored sources (tag 0.10.17) to igraph/igraph@529e7be1`,
plus the reproducible-vendoring fix ([igraph/rigraph#2934](https://github.com/igraph/rigraph/pull/2934))
and the series tooling ([igraph/rigraph#2935](https://github.com/igraph/rigraph/pull/2935)).
The upstream clone was a full clone of igraph/igraph that also held `krlmlr/igraph`'s `replay-1.0.1`, tip `3c54c752`, with its tags.

*What it supports:* the claim that the replay needs R-side work early, on
[`operations/vendoring/series-loop/`](/handbook/operations/vendoring/series-loop/README.md).

## Method

A driver called `scripts/vendor-one.sh --commits 25` against the clone, again and again, until the first non-zero exit:
once with the glue check on, as the series loop runs it, and once with `--no-check-glue`, to see what generation alone reaches.

Two defects found on the way were fixed before the runs:

* a vendor commit for a tag that changes nothing but `src/vendor/igraph_version.h` was invisible to the base scan,
  so the run re-vendored the tag forever;
  the scan now covers `src/vendor`, `series_scan_dir` in [`scripts/series-config.sh`](/scripts/series-config.sh);
* Stimulus truncated a default value containing a space, fixed in igraph/rigraph#2934.

## Findings

**With the glue check on**, the run stopped with exit 3 at `krlmlr/igraph@868f59f7`,
"nfc: remove igraph_multiple_t enum, use igraph_bool_t".
That is the 27th first-parent commit past tag 0.11.0 and the sixth of them to change anything vendoring keeps,
so the sixth vendor commit past the tag.
It is the same break rigraph's earlier `next` branch met.

**With `--no-check-glue`**, the run vendored 52 replay commits:
2 before tag 0.11.0, the tag itself as a commit of its own, where the run stopped as designed, and 49 after it.
It then stopped with exit 7 at `krlmlr/igraph@d8febb1a`,
"nfc: merge weighted variants of diameter, eccentricity, radius, graph_center, pseudo_diameter, average_path_length".
There Stimulus failed: the parameter `unconn_pairs` of `igraph_average_path_length_dijkstra` was renamed,
and the dependency declarations (`DEPS`) for `pseudo_diameter` and `bipartite_iea_game` were missing.

**The size of the walk.**
The replay has 377 first-parent commits from 0.10.17 to its tip,
and about 260 vendor commits are expected from them, because a commit that changes nothing vendoring keeps is folded into the next one.
igraph/igraph's `main` had 89 first-parent commits past the seam, `7b4ae766`, at `36f7f7d2` (2026-10-14).

**Not reached.**
The seam and the stretch of igraph/igraph's `main` after it are beyond both stops.
[`scripts/vendor-one-test.sh`](/scripts/vendor-one-test.sh) covers them offline, against a synthetic upstream.

## Re-running it

A worktree of the series tooling at `main`'s vendor commit, an upstream clone set up as the series loop's setup stage sets one up,
the tools a vendor run needs, and absolute paths for both:

```sh
W=/abs/path/to/worktree      # the series tooling, clean
U=/abs/path/to/igraph        # igraph/igraph, full, with tags, plus replay-1.0.1 with its tags
while :; do
  VENDOR_REPO=$W scripts/vendor-one.sh --no-check-glue --commits 25 "$U" || { echo "exit $?"; break; }
done
git -C "$W" log --oneline --grep='^vendor:' | head
```

Drop `--no-check-glue` for the run with the glue check on.
