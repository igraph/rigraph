pkg_review <- function(pkg, pak = TRUE) {
  base_path <- "revdep/review"
  fs::dir_create(base_path)

  pkg_path <- fs::path(base_path, pkg)

  if (fs::dir_exists(pkg_path)) {
    system(paste0("git -C ", pkg_path, " fetch"))
    system(paste0("git -C ", pkg_path, " rebase"))
  } else {
    system(paste0("git -C ", base_path, " clone git@github.com:cran/", pkg))
  }

  withr::local_dir(pkg_path)
  system("rh")

  if (pak) {
    pak::pak(pkg, dependencies = TRUE, upgrade = TRUE, ask = FALSE)
  }
}
