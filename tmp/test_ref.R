library(igraph)

iterations <- 500000

# fin <- function(env) { print("fin") }

print(sum(gc()[,4]))
for (i in 1:iterations) { 
  if (i %% 50000 == 0) {
    print(sum(gc()[,4]))
  }
  env <- new.env()
  wref <- igraph:::make_weak_ref(env, NULL)
  rm(env)
}

print("Calling GC after loop")
sum(gc()[,4])

print("Removing env from workspace")
rm(env)

print("Calling GC after removal")
sum(gc()[,4])

print("Exiting after last GC")

