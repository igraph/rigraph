# metainsight (7.1.0)

* Email: <mailto:ajs22@leicester.ac.uk>
* GitHub mirror: <https://github.com/cran/metainsight>

Run `revdepcheck::revdep_details(, "metainsight")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       [ FAIL 1 | WARN 3 | SKIP 61 | PASS 1137 ]
       Error:
       ! Test failures.
       Warning messages:
       1: `graph.empty()` was deprecated in igraph 2.1.0.
       ℹ Please use `make_empty_graph()` instead.
       ℹ The deprecated feature was likely used in the gemtc package.
         Please report the issue to the authors. 
       2: `set.edge.attribute()` was deprecated in igraph 2.0.0.
       ℹ Please use `set_edge_attr()` instead.
       ℹ The deprecated feature was likely used in the gemtc package.
         Please report the issue to the authors. 
       3: `shortest.paths()` was deprecated in igraph 2.0.0.
       ℹ Please use `distances()` instead.
       ℹ The deprecated feature was likely used in the gemtc package.
         Please report the issue to the authors. 
       4: `get.edge.attribute()` was deprecated in igraph 2.0.0.
       ℹ Please use `edge_attr()` instead.
       ℹ The deprecated feature was likely used in the gemtc package.
         Please report the issue to the authors. 
       5: `get.shortest.paths()` was deprecated in igraph 2.0.0.
       ℹ Please use `shortest_paths()` instead.
       ℹ The deprecated feature was likely used in the gemtc package.
         Please report the issue to the authors. 
       Execution halted
     ```

