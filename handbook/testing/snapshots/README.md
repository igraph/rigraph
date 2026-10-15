# Snapshots

When a snapshot is the right test, and how it stays stable.

Tests cover behaviour both structurally and with snapshots, and error behaviour is preferably snapshot-tested.
A snapshot that involves randomness sets a seed, and one that prints graph IDs calls `local_igraph_options(print.id = FALSE)`.
An updated snapshot is accepted only after confirming the new output is correct.

*To deepen: say how SVG snapshots of plots are kept, and what `devtools::test()` does to snapshots it considers unused.*
