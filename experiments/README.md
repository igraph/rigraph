# `experiments/`: measured evidence

One directory per experiment, holding everything it needs:
a `README.md` that says what was measured, when, on what, and which page relies on it,
plus whatever the run took: scripts, inputs, recorded output.

This file names the contents, so nothing here is an orphan.
The handbook page that will own these conventions is not installed yet;
until it is, `experiments/` in `duckdb/duckdb-r` is the model.

* [`2026-10-15-igraph-replay-statuses/`](2026-10-15-igraph-replay-statuses/):
  the CI verdict on every commit of the igraph 0.10.17 to 1.0.1 replay, and its distance from `1.0.1`.
