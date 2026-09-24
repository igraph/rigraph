# threejs (0.3.4)

* GitHub: <https://github.com/bwlewis/rthreejs>
* Email: <mailto:blewis@illposed.net>
* GitHub mirror: <https://github.com/cran/threejs>

Run `revdepcheck::revdep_details(, "threejs")` for more info

## Newly broken

*   checking examples ... ERROR
     ```
     ...
     > r     <- 1.0
     > x <- (R + r * cos(theta)) * cos(phi)
     > y <- (R + r * cos(theta)) * sin(phi)
     > z <- r * sin(theta)
     > d <- 6
     > h <- 6
     > t <- 2 * runif (N) - 1
     > w <- t^2 * sqrt(1 - t^2)
     > x1 <- d * cos(theta) * sin(phi) * w
     > y1 <- d * sin(theta) * sin(phi) * w
     > i <- order(phi)
     > j <- order(t)
     > col <- c( rainbow(length(phi))[order(i)],
     +          rainbow(length(t), start=0, end=2/6)[order(j)])
     > M <- cbind(x=c(x, x1), y=c(y, y1), z=c(z, h*t))
     > scatterplot3js(M, size=0.5, color=col, bg="black", pch=".")
     > 
     > # Plot generic text using 'pch' (we label some points in this example)
     > set.seed(1)
     > x <- rnorm(5); y <- rnorm(5); z <- rnorm(5)
     > scatterplot3js(x, y, z, pch="@") %>%
     +    points3d(x + 0.1, y + 0.1, z, color="red", pch=paste("point", 1:5))
     Error in scatterplot3js(x, y, z, pch = "@") %>% points3d(x + 0.1, y +  : 
       could not find function "%>%"
     Execution halted
     ```

