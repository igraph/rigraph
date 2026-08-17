# sample_degseq() works -- exponential degree error

    Code
      sample_degseq(exponential_degrees, method = "vl")
    Condition
      Error in `degree_sequence_game_impl()`:
      ! Cannot make a connected graph from the given degree sequence. Invalid value
      Source: <file>:<line>

# sample_degseq() works -- Power-law degree error

    Code
      sample_degseq(powerlaw_degrees, method = "vl")
    Condition
      Error in `degree_sequence_game_impl()`:
      ! Cannot realize the given degree sequence as an undirected, simple graph. Invalid value
      Source: <file>:<line>

# sample_grg(nodes = ) is deprecated but still works

    Code
      g <- sample_grg(nodes = 10, radius = 1)
    Condition
      Warning:
      The `nodes` argument of `sample_grg()` is deprecated as of igraph 3.0.0.
      i Please use the `n` argument instead.

# sample_grg() rejects `n` supplied both directly and as `nodes`

    Code
      sample_grg(10, radius = 1, nodes = 10)
    Condition
      Error in `sample_grg()`:
      ! Argument `n` of `sample_grg()` was supplied more than once.
      i It was also supplied via its legacy name `nodes`.

