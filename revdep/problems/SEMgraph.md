# SEMgraph (1.2.4)

* GitHub: <https://github.com/fernandoPalluzzi/SEMgraph>
* Email: <mailto:barbara.tarantino01@universitadipavia.it>
* GitHub mirror: <https://github.com/cran/SEMgraph>

Run `revdepcheck::revdep_details(, "SEMgraph")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
       Please report the issue at <https://github.com/igraph/rigraph/issues>.
     > plot(dag0$dag, layout=layout.circle, main = "Output DAG")
     Warning: vertex attribute color contains NAs. Replacing with default value 1
     > plot(dag0$dag.old, layout=layout.circle, main = "Inferred old edges")
     Warning: vertex attribute color contains NAs. Replacing with default value 1
     > plot(dag0$dag.new, layout=layout.circle, main = "Inferred new edges")
     Warning: vertex attribute color contains NAs. Replacing with default value 1
     > par(old.par)
     > 
     > # Four DAG estimation
     > dag1 <- SEMdag(ig, X, LO="TO")
     WARNING: input graph is not acyclic !
      Applying graph -> DAG conversion...
     DAG conversion : TRUE
     Node Linear Ordering with TO setting
     
     > dag2 <- SEMdag(ig, X, LO="TL")
     WARNING: input graph is not acyclic !
      Applying graph -> DAG conversion...
     DAG conversion : TRUE
     Node Linear Ordering with TL setting
     
     Error in l2[[L]] : subscript out of bounds
     Calls: SEMdag -> getParents -> buildLevels
     Execution halted
     ```

