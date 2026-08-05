# reading graph in NCOL format

    Code
      read_graph(ncol_path, "ncol")
    Output
      IGRAPH UN-- 3 2 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] 0--1 1--2

# reading graph in LGL format

    Code
      read_graph(lgl_path, "lgl")
    Output
      IGRAPH UN-- 3 2 -- 
      + attr: name (v/c)
      + edges (vertex names):
      [1] 0--1 1--2

# reading graph, unused argument

    Code
      read_graph(lgl_path, "lgl", useless = 1)
    Condition
      Error in `read.graph.lgl()`:
      ! unused argument (useless = 1)

# reading graph in unsupported format

    Code
      read_graph("bla", format = "blop")
    Condition
      Error in `read_graph()`:
      ! `format` must be one of "edgelist", "pajek", "ncol", "lgl", "graphml", "dimacs", "graphdb", "gml", or "dl", not "blop".

# writing graph in unsupported format

    Code
      write_graph(g, file, format = "blop")
    Condition
      Error in `write_graph()`:
      ! `format` must be one of "edgelist", "pajek", "ncol", "lgl", "graphml", "dimacs", "gml", "dot", or "leda", not "blop".

# reading GML file works with lesmis

    Code
      read_graph(igraphdata::lesmis_gml(), format = "gml")
    Output
      IGRAPH UN-- 77 254 -- 
      + attr: id (v/n), name (v/c), value (e/n)
      + edges (vertex names):
       [1] Myriel        --Napoleon       Myriel        --MlleBaptistine
       [3] Myriel        --MmeMagloire    MlleBaptistine--MmeMagloire   
       [5] Myriel        --CountessDeLo   Myriel        --Geborand      
       [7] Myriel        --Champtercier   Myriel        --Cravatte      
       [9] Myriel        --Count          Myriel        --OldMan        
      [11] Labarre       --Valjean        MmeMagloire   --Valjean       
      [13] MlleBaptistine--Valjean        Myriel        --Valjean       
      [15] Valjean       --Marguerite     Valjean       --MmeDeR        
      + ... omitted several edges

# reading GraphML file works with lesmis

    Code
      read_graph(igraphdata::lesmis_graphml(), format = "graphml")
    Condition
      Warning in `read_graph_graphml_impl()`:
      Could not add vertex ids, there is already an 'id' vertex attribute.
      Source: io/graphml.c:486
    Output
      IGRAPH UN-- 77 254 -- 
      + attr: id (v/n), name (v/c), value (e/n)
      + edges (vertex names):
       [1] Myriel        --Napoleon       Myriel        --MlleBaptistine
       [3] Myriel        --MmeMagloire    MlleBaptistine--MmeMagloire   
       [5] Myriel        --CountessDeLo   Myriel        --Geborand      
       [7] Myriel        --Champtercier   Myriel        --Cravatte      
       [9] Myriel        --Count          Myriel        --OldMan        
      [11] Labarre       --Valjean        MmeMagloire   --Valjean       
      [13] MlleBaptistine--Valjean        Myriel        --Valjean       
      [15] Valjean       --Marguerite     Valjean       --MmeDeR        
      + ... omitted several edges

# reading Pajek file works with lesmis

    Code
      read_graph(igraphdata::lesmis_pajek(), format = "pajek")
    Output
      IGRAPH UN-- 77 254 -- 
      + attr: id (v/c), name (v/c)
      + edges (vertex names):
       [1] Myriel        --Napoleon       Myriel        --MlleBaptistine
       [3] Myriel        --MmeMagloire    MlleBaptistine--MmeMagloire   
       [5] Myriel        --CountessDeLo   Myriel        --Geborand      
       [7] Myriel        --Champtercier   Myriel        --Cravatte      
       [9] Myriel        --Count          Myriel        --OldMan        
      [11] Labarre       --Valjean        MmeMagloire   --Valjean       
      [13] MlleBaptistine--Valjean        Myriel        --Valjean       
      [15] Valjean       --Marguerite     Valjean       --MmeDeR        
      + ... omitted several edges

# graph_from_graphdb works

    Code
      graph_from_graphdb()
    Condition
      Error in `graph_from_graphdb()`:
      ! Either `nodes`' or ``url`' must be non-null.

---

    Code
      graph_from_graphdb(nodes = 10, prefix = "not_existing")
    Condition
      Error in `graph_from_graphdb()`:
      ! not_existing is not a valid prefix.
      i Must be one of iso, si6, mcs10, mcs30, mcs50, mcs70, and mcs90.

---

    Code
      graph_from_graphdb(nodes = 10, type = "not_existing")
    Condition
      Error in `graph_from_graphdb()`:
      ! not_existing is not a valid graph type.
      i Must be one of r001, r005, r01, r02, m2D, m2Dr2, m2Dr4, m2Dr6, m3D, m3Dr2, m3Dr4, m3Dr6, m4D, m4Dr2, m4Dr4, m4Dr6, b03, b03m, ..., b09, and b09m.

