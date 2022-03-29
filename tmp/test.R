library(igraph)
iterations <- 1000
g <-  make_tree(n = 5000, children = 3, mode = "out")

for (i in 1:length(V(g))) { V(g)[i]$name <- ifelse(i %% 10 == 0, "home", "away")}
for (i in 1:length(E(g))) { E(g)[i]$weight <- as.integer(runif(1, 1, 10)) }

print(sum(gc()[,4]))
for (i in 1:iterations) { 
  if (i %% 100 == 0) print(sum(gc()[,4]))
  sp <- shortest_paths(g, from = 3, to = V(g)[name == "home"], 
                   mode="out", output="vpath", weights = E(g)$weight) 
}

