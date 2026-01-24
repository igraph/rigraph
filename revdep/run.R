me <- unname(desc::desc_get("Package"))

# pkgbuild::build(dest_path = ".", args = c("--no-build-vignettes", "--no-manual"))
last <- dir(pattern = paste0("^", me, "_.*[.]tar[.]gz$"))
stopifnot(length(last) == 1)
last

revdepcheck::cloud_check(tarball = last)
unlink(last)
revdepcheck::cloud_status()
revdepcheck::cloud_report()
