.onLoad <- function(...) {
  # The C callbacks that report progress run R code in this namespace,
  # and cannot look it up by name: the package is published under several.
  .Call(Rx_igraph_set_namespace, get_package_env())
  rlang::run_on_load()
}
