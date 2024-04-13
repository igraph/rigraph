problems <- gsub("^# ", "", grep("^# ", readLines("revdep/problems.md"), value = TRUE))
# broken <- revdepcheck::cloud_broken(install_failures = TRUE, timeout_failures = TRUE)
failed <- revdepcheck::cloud_failed()
failures <- gsub("^# ", "", grep("^# ", readLines("revdep/failures.md"), value = TRUE))

packages <- c(problems, failed, failures)
revdepcheck::cloud_check(revdep_packages = packages)
revdepcheck::cloud_status()
revdepcheck::cloud_report()
