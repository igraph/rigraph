# `branches/`

What a ref in either repository means, and what holds it there.

**The refs are the interface.**
Every ref has one meaning and one allowed motion,
so a reader, human or automation, acts on a ref without having to read the history behind it.

* [`model/`](model/): the two repositories, the series and its refs
* [`mirrors/`](mirrors/): the canonical branches the fork also carries, and the one copy that travels back
* [`flavors/`](flavors/): one source, two package names
* [`invariants/`](invariants/): what a series guarantees, and what checks it
