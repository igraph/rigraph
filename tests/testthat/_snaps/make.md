# error messages are proper

    Code
      make_()
    Condition
      Error in `.extract_constructor_and_modifiers()`:
      ! Don't know how to make_, nothing given
    Code
      make_(1:10)
    Condition
      Error in `.extract_constructor_and_modifiers()`:
      ! Don't know how to make_, nothing given
    Code
      graph_()
    Condition
      Error in `.extract_constructor_and_modifiers()`:
      ! Don't know how to graph_, nothing given
    Code
      graph_(1:10)
    Condition
      Error in `.extract_constructor_and_modifiers()`:
      ! Don't know how to graph_, nothing given
    Code
      graph_(directed_graph(), directed_graph())
    Condition
      Error in `.extract_constructor_and_modifiers()`:
      ! Don't know how to graph_, multiple constructors given
    Code
      sample_()
    Condition
      Error in `.extract_constructor_and_modifiers()`:
      ! Don't know how to sample_, nothing given
    Code
      sample_(1:10)
    Condition
      Error in `.extract_constructor_and_modifiers()`:
      ! Don't know how to sample_, nothing given
    Code
      sample_(directed_graph(), directed_graph())
    Condition
      Error in `.extract_constructor_and_modifiers()`:
      ! Don't know how to sample_, multiple constructors given

# graph_from_literal() and simple undirected graphs

    Code
      graph_from_literal(A - B)
    Output
      -- <igraph> --------------------------------------------------------------------
      i undirected * named
      i 2 vertices * 1 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: name <chr>
      
      -- Edges (vertex names) --------------------------------------------------------
      [1] A -- B 
    Code
      graph_from_literal(A - B - C)
    Output
      -- <igraph> --------------------------------------------------------------------
      i undirected * named
      i 3 vertices * 2 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: name <chr>
      
      -- Edges (vertex names) --------------------------------------------------------
      [1] A -- B  B -- C 
    Code
      graph_from_literal(A - B - C - A)
    Output
      -- <igraph> --------------------------------------------------------------------
      i undirected * named
      i 3 vertices * 3 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: name <chr>
      
      -- Edges (vertex names) --------------------------------------------------------
      [1] A -- B  A -- C  B -- C 

# graph_from_literal() and undirected explosion

    Code
      graph_from_literal(A:B:C - D:E, B:D - C:E)
    Output
      -- <igraph> --------------------------------------------------------------------
      i undirected * named
      i 5 vertices * 8 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: name <chr>
      
      -- Edges (vertex names) --------------------------------------------------------
      [1] A -- D  A -- E  B -- C  B -- D  B -- E  C -- D  C -- E  D -- E 
    Code
      graph_from_literal(A:B:C - D:E - F:G:H - I - J:K:L:M)
    Output
      -- <igraph> --------------------------------------------------------------------
      i undirected * named
      i 13 vertices * 19 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: name <chr>
      
      -- Edges (vertex names) --------------------------------------------------------
       [1] A -- D  A -- E  B -- D  B -- E  C -- D  C -- E  D -- F  D -- G  D -- H 
      [10] E -- F  E -- G  E -- H  F -- I  G -- I  H -- I  I -- J  I -- K  I -- L 
      [19] I -- M 

# graph_from_literal() and simple directed graphs

    Code
      graph_from_literal(A - +B)
    Output
      -- <igraph> --------------------------------------------------------------------
      i directed * named
      i 2 vertices * 1 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: name <chr>
      
      -- Edges (vertex names) --------------------------------------------------------
      [1] A -> B 
    Code
      graph_from_literal(A - +B - +C)
    Output
      -- <igraph> --------------------------------------------------------------------
      i directed * named
      i 3 vertices * 2 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: name <chr>
      
      -- Edges (vertex names) --------------------------------------------------------
      [1] A -> B  B -> C 
    Code
      graph_from_literal(A - +B - +C - +A)
    Output
      -- <igraph> --------------------------------------------------------------------
      i directed * named
      i 3 vertices * 3 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: name <chr>
      
      -- Edges (vertex names) --------------------------------------------------------
      [1] A -> B  B -> C  C -> A 
    Code
      graph_from_literal(A - +B + -C - +A)
    Output
      -- <igraph> --------------------------------------------------------------------
      i directed * named
      i 3 vertices * 3 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: name <chr>
      
      -- Edges (vertex names) --------------------------------------------------------
      [1] A -> B  C -> A  C -> B 

# graph_from_literal() and directed explosion

    Code
      graph_from_literal(A:B:C - +D:E, B:D + -C:E)
    Output
      -- <igraph> --------------------------------------------------------------------
      i directed * named
      i 5 vertices * 9 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: name <chr>
      
      -- Edges (vertex names) --------------------------------------------------------
      [1] A -> D  A -> E  B -> D  B -> E  C -> B  C -> D  C -> E  E -> B  E -> D 
    Code
      graph_from_literal(A:B:C - +D:E + -F:G:H - +I + -J:K:L:M)
    Output
      -- <igraph> --------------------------------------------------------------------
      i directed * named
      i 13 vertices * 19 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: name <chr>
      
      -- Edges (vertex names) --------------------------------------------------------
       [1] A -> D  A -> E  B -> D  B -> E  C -> D  C -> E  F -> D  F -> E  F -> I 
      [10] G -> D  G -> E  G -> I  H -> D  H -> E  H -> I  J -> I  K -> I  L -> I 
      [19] M -> I 

# graph_from_literal(simplify = FALSE)

    Code
      graph_from_literal(1 - 1, 1 - 2, 1 - 2)
    Output
      -- <igraph> --------------------------------------------------------------------
      i undirected * named
      i 2 vertices * 1 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: name <chr>
      
      -- Edges (vertex names) --------------------------------------------------------
      [1] 1 -- 2 
    Code
      graph_from_literal(1 - 1, 1 - 2, 1 - 2, simplify = FALSE)
    Output
      -- <igraph> --------------------------------------------------------------------
      i undirected * named
      i 2 vertices * 3 edges
      
      -- Attributes ------------------------------------------------------------------
      -> vertex: name <chr>
      
      -- Edges (vertex names) --------------------------------------------------------
      [1] 1 -- 1  1 -- 2  1 -- 2 

# make_empty_graph gives an error for invalid arguments

    Code
      make_empty_graph(NULL)
    Condition
      Error in `make_empty_graph()`:
      ! `n` must be numeric, not NULL.

---

    Code
      make_empty_graph("spam")
    Condition
      Error in `make_empty_graph()`:
      ! `n` must be numeric, not a string.

---

    Code
      make_empty_graph(10, "spam")
    Condition
      Error in `make_empty_graph()`:
      ! `directed` must be a logical, not a string.

