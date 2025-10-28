# sample_degseq() works -- exponential degree error

    Code
      sample_degseq(exponential_degrees, method = "vl")
    Condition
      Warning:
      The `method` argument of `sample_degseq()` is deprecated as of igraph 2.1.0.
      i Please use the `algorithm` argument instead.
      Error in `sample_degseq()`:
      ! At vendor/cigraph/src/games/degree_sequence_vl/gengraph_mr-connected.cpp:<linenumber> : Cannot make a connected graph from the given degree sequence. Invalid value

# sample_degseq() works -- Power-law degree error

    Code
      sample_degseq(powerlaw_degrees, method = "vl")
    Condition
      Warning:
      The `method` argument of `sample_degseq()` is deprecated as of igraph 2.1.0.
      i Please use the `algorithm` argument instead.
      Error in `sample_degseq()`:
      ! At vendor/cigraph/src/games/degree_sequence_vl/gengraph_mr-connected.cpp:<linenumber> : Cannot realize the given degree sequence as an undirected, simple graph. Invalid value

