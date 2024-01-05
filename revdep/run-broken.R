broken <- revdepcheck::cloud_broken()
failing <- revdepcheck::cloud_failing()

packages <- c(broken, failing)
revdepcheck::cloud_check(revdep_packages = packages)
revdepcheck::cloud_status()
revdepcheck::cloud_report()
