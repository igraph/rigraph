packages <- revdepcheck::cloud_broken()

revdepcheck::cloud_check(revdep_packages = packages)
revdepcheck::cloud_status()
revdepcheck::cloud_report()
