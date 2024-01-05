broken <- revdepcheck::cloud_broken()
failed <- revdepcheck::cloud_failed()

packages <- c(broken, failed)
revdepcheck::cloud_check(revdep_packages = packages)
revdepcheck::cloud_status()
revdepcheck::cloud_report()
