# cfid (0.1.8)

* GitHub: <https://github.com/santikka/cfid>
* Email: <mailto:santtuth@gmail.com>
* GitHub mirror: <https://github.com/cran/cfid>

Run `revdepcheck::revdep_details(, "cfid")` for more info

## Newly broken

*   checking tests ... ERROR
     ```
     ...
       Expected `import_graph(ig)` to be identical to `dag("X -> Z -> Y X <-> Y")`.
       Differences:
         `dim(actual)`: 5 5
       `dim(expected)`: 4 4
       
       `attr(actual, 'labels')[2:5]`:   "Z" "Y" "U[X,Y]" "U[Z,Y]"
       `attr(expected, 'labels')[2:4]`: "Z" "Y" "U[X,Y]"         
       
       `attr(actual, 'latent')[2:5]`:   FALSE FALSE TRUE TRUE
       `attr(expected, 'latent')[2:4]`: FALSE FALSE TRUE     
       
         `attr(actual, 'order')`: 4 5 3 1 2
       `attr(expected, 'order')`: 4 1 2 3  
       
       `attr(actual, 'text')`:   "X; Z; Y; X -> Z; Y -> X; X <-> Y; Z <-> Y"
       `attr(expected, 'text')`: "X; Z; Y; X -> Z; Z -> Y; X <-> Y"         
       
               `actual`: 0 0 1 1 0 1 0 0 0 1 and 15 more...
       `expected[2:16]`: 0 0 1 1 0 0 0 0 1 0            ...
       
       
       [ FAIL 1 | WARN 0 | SKIP 0 | PASS 204 ]
       Error:
       ! Test failures.
       Execution halted
     ```

