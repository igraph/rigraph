# jewel non-integer rewire iteration count
# Issue: jewel computes niter = p * 0.05 (fractional) and passes it through
# igraph::rewire(), whose C interface now strictly rejects non-integer values.

library(igraph)

g <- make_ring(20)

# Old call pattern -- niter ends up fractional
p <- 49
niter_bad <- p * 0.05    # 2.45

# rewire(g, with = keeping_degseq(niter = niter_bad))
# Error in rewire_impl(rewire = graph, n = niter, mode = mode) :
#   The value 2.45 is not representable as an integer. Invalid value
# Source: rinterface_extra.c:83

# Working replacement -- round to an integer up front
niter <- as.integer(ceiling(p * 0.05))
res <- rewire(g, with = keeping_degseq(niter = niter))
ecount(res)

# Root cause:
# - igraph's C interface now strictly validates that numeric arguments are
#   exactly representable as integers. Fractional values were previously
#   truncated silently.
# - jewel:::generateData_rewire() ultimately calls rewire() with
#   `niter = p * 0.05`, which is non-integer for many p.

# Assessment:
# - Bug in jewel -- a count of iterations should always be an integer.

# Recommendation:
# - For jewel: integer-round the value before the rewire() call, e.g.
#     niter <- as.integer(ceiling(p * 0.05))
#   (or floor(), or round() -- whichever matches the intended semantics).
# - For igraph (optional defensive measure): consider adding as.integer()
#   on the R side in rewire_keeping_degseq() before calling rewire_impl().
#   The strict C-side check is the correct contract.
