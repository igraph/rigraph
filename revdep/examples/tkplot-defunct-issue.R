# tkplot() defunct (igraph 3.0.0)
# Issue: tkplot() advanced to deprecate_stop in #2615. Five revdep packages
# call it directly from their examples:
#   Boptbd::graphoptBbd()
#   c3net::netplot() (used by c3net::c3net(..., network = TRUE))
#   ggm::AG(..., plot = TRUE)
#   optbdmaeAT::graphoptbd.mae()
#   optrcdmaeAT::graphoptrcd.mae()

library(igraph)

g <- make_ring(5)

# Old call -- now defunct in igraph 3.0.0
# tkplot(g)
# Error:
# ! `tkplot()` was deprecated in igraph 3.0.0 and is now defunct.

# Working replacement -- non-interactive plot
plot(g)

# Root cause:
# - The interactive Tk-based plotter has been removed; non-interactive plot()
#   is the recommended drop-in replacement.
# - All five affected packages are direct callers.

# Assessment:
# - Intentional removal in igraph (#2615).

# Recommendation:
# - For each affected package: replace igraph::tkplot(g, ...) with
#   igraph::plot.igraph(g, ...) (or just plot(g, ...)).
# - Tk-specific tuning functions (tkplot.canvas, tkplot.setcoords, ...) are
#   themselves deprecated and have no direct replacement. Packages that
#   genuinely needed interactive editing should adopt a JS-based plotter
#   (e.g. visNetwork) instead.
