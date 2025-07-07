me <- unname(desc::desc_get("Package"))

# pkgbuild::build(dest_path = ".", args = c("--no-build-vignettes", "--no-manual"))
last <- dir(pattern = paste0("^", me, "_.*[.]tar[.]gz$"))
stopifnot(length(last) == 1)
last

problems <- gsub(
  "^# ",
  "",
  grep("^# ", readLines("revdep/problems.md"), value = TRUE)
)
# broken <- revdepcheck::cloud_broken(install_failures = TRUE, timeout_failures = TRUE)
failed <- revdepcheck::cloud_failed()
failures <- gsub(
  "^# ",
  "",
  grep("^# ", readLines("revdep/failures.md"), value = TRUE)
)

broken <- c(problems, failed, failures)

print(broken)

revdepcheck::cloud_check(tarball = last, revdep_packages = broken)
unlink(last)
revdepcheck::cloud_status()
revdepcheck::cloud_report()
