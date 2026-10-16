# FrF2 (2.3-5)

* Email: <mailto:ulrike.groemping@bht-berlin.de>
* GitHub mirror: <https://github.com/cran/FrF2>

Run `revdepcheck::revdep_details(, "FrF2")` for more info

## Newly broken

*   checking tests ... NOTE
     ```
     ...
     < Warning messages:
     < 1: The `edges` argument of `add_edges()` should be an n times 2 matrix with one
     < edge per row as of igraph 3.0.0.
     < ℹ A 2 times 2 matrix is ambiguous and is read column by column for now. Pass a
     <   data frame with two columns instead.
     < ℹ The deprecated feature was likely used in the igraph package.
     <   Please report the issue at <https://github.com/igraph/rigraph/issues>. 
     < 2: The `edges` argument of `add_edges()` should be an n times 2 matrix with one
     < edge per row as of igraph 3.0.0.
     < ℹ It is read column by column for now. Transpose the matrix with t(), or pass a
     <   data frame with two columns.
     < ℹ The deprecated feature was likely used in the igraph package.
     <   Please report the issue at <https://github.com/igraph/rigraph/issues>. 
       Running ‘godolphintest.R’
       Comparing ‘godolphintest.Rout’ to ‘godolphintest.Rout.save’ ...
     49,55d48
     < Warning message:
     < The `edges` argument of `add_edges()` should be an n times 2 matrix with one
     < edge per row as of igraph 3.0.0.
     < ℹ It is read column by column for now. Transpose the matrix with t(), or pass a
     <   data frame with two columns.
     < ℹ The deprecated feature was likely used in the igraph package.
     <   Please report the issue at <https://github.com/igraph/rigraph/issues>. 
       Running ‘pbtest.R’
       Comparing ‘pbtest.Rout’ to ‘pbtest.Rout.save’ ... OK
     ```

