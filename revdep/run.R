me <- unname(desc::desc_get("Package"))

last <- dir(pattern = paste0("^", me, "_.*[.]tar[.]gz$"))
stopifnot(length(last) == 1)
last

revdepcheck::cloud_check(tarball = last, r_version = "4.4.0")
unlink(last)
revdepcheck::cloud_status()
revdepcheck::cloud_report()
