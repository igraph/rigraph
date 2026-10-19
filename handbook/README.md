# The handbook

The single source of truth for everything this repository documents;
internal pages like this one navigate and state their area's principles,
leaves explain ([`meta/handbook/`](/handbook/meta/handbook/README.md)).

The areas divide by what a question is about, not by who is asking it.
A contributor fixing a bug and an agent running the vendoring routine who ask the same question arrive at the same leaf.
An audience split would need the same fact in two places, and the tree holds every fact once.
What stays outside the tree, intent and evidence, and where each lives, is [`meta/local/`](/handbook/meta/local/README.md)'s.

* [`usage/`](usage/): installing the package and its flavors, and the deprecated dotted function names
* [`architecture/`](architecture/): the R layer, the C glue, the vendored igraph C library, and the Stimulus code generator
* [`build/`](build/): the source build and its configuration, and the compiler warnings it may raise
* [`testing/`](testing/): the suite, snapshots, guards, and reverse dependencies
* [`branches/`](branches/): the series and their refs, the mirrors, the flavors, the invariants
* [`operations/`](operations/): vendoring, CI, releases, review, triage, and the site
* [`contributors/`](contributors/): setup, workflow, and where to help
* [`meta/`](meta/): the rules of this tree, its forms and growth moves, how prose is written here, the vocabulary,
  the evidence convention, and what this repository decides for itself

Everything this repository documents is reachable by walking down from this page:
internal nodes navigate, leaves explain, and every fact has exactly one leaf that owns it,
including the limits, the declined requests, and the reasons.
Start at the root and follow the scope sentences; searching the tree is the slower path.
