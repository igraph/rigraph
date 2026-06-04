# running_mean works

    Code
      running_mean(1:3, 4)
    Condition
      Error in `running_mean()`:
      ! Vector too short for this binwidth.

# serialization works

    Code
      g
    Output
      -- <igraph> Ring graph ---------------------------------------------------------
      i directed
      i 3 vertices * 3 edges
      
      -- Attributes ------------------------------------------------------------------
      -> graph:  name <chr>, mutual <lgl>, circular <lgl>
      
      -- Edges -----------------------------------------------------------------------
      [1] 1 -> 2  2 -> 3  3 -> 1 
    Code
      gs
    Output
      -- <igraph> Ring graph ---------------------------------------------------------
      i directed
      i 3 vertices * 3 edges
      
      -- Attributes ------------------------------------------------------------------
      -> graph:  name <chr>, mutual <lgl>, circular <lgl>
      
      -- Edges -----------------------------------------------------------------------
      [1] 1 -> 2  2 -> 3  3 -> 1 

# VS/ES require explicit conversion

    Code
      V(karate)
    Condition
      Error in `warn_version()`:
      ! This graph was created by a now unsupported old igraph version.
        Call upgrade_graph() before using igraph functions on that object.

