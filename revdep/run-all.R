me <- unname(desc::desc_get("Package"))

last <- dir(pattern = paste0("^", me, "_.*[.]tar[.]gz$"))
stopifnot(length(last) == 1)
last

strong <- unlist(tools::package_dependencies(me, which = "most", reverse = TRUE), use.names = FALSE)
# second <- unlist(tools::package_dependencies(strong, reverse = TRUE, recursive = TRUE), use.names = FALSE)
second <- unlist(tools::package_dependencies(strong, reverse = TRUE), use.names = FALSE)
bad <- c("streamDAG", "Seurat", "bsts")
packages <- unique(c(strong, second))

revdepcheck::cloud_check(tarball = last, revdep_packages = packages, r_version = "4.4.0")
revdepcheck::cloud_status()
revdepcheck::cloud_report()
