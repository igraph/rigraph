# File containing code to update auto-generated code

autogenerate_code <- function(file = c("R/aaa-auto.R", "src/interface.c")) {

  file <- rlang::arg_match(
    file, c("R/aaa-auto.R", "src/interface.c"),
    multiple = TRUE
  )

  purrr::walk(
    file,
    ~ system2(
      command = "docker",
      args = c("run",  "--rm", "-t",
        "--platform", "linux/amd64", "-v",
        "$(pwd):/root/workspace", "ghcr.io/cynkra/rig-ubuntu-igraph:main",
        "make", "-f", "Makefile-cigraph", "-B", .x)
    )

  )
}
