# comato layout.spring() defunct
# Issue: comato:::plot.conceptmaps() passes layout = "spring", which dispatches
# to igraph::layout.spring() -- defunct since igraph 2.1.0.

library(igraph)

g <- make_ring(10)

# Old call -- now defunct in igraph 2.1.0
# layout.spring(g)
# Error:
# ! `layout.spring()` was deprecated in igraph 2.1.0 and is now defunct.
# i Please use `layout_with_fr()` instead.

# Working replacement
coords <- layout_with_fr(g)
dim(coords)

# Root cause:
# - layout.spring(), layout.svd(), and layout.fruchterman.reingold.grid()
#   all advanced from deprecated to defunct in #2634
# - comato hardcodes layout = "spring" in plot.conceptmaps()

# Assessment:
# - Bug in comato -- references a layout function deprecated since 2.1.0

# Recommendation:
# - For comato: switch layout = "spring" to the Fruchterman-Reingold layout,
#   either by passing layout = layout_with_fr or by computing coordinates
#   beforehand. Also rename graph.union() -> union() to silence the
#   remaining deprecation warning.
