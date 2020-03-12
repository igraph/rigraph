#! /bin/bash

tempdir=$(mktemp -d 2>/dev/null || mktemp -d -t 'mytmpdir')
trap "rm -rf ${tempdir}" EXIT
rsync -avq --exclude=cigraph --exclude=.git --exclude revdep . ${tempdir}/

(
    cd ${tempdir}
    Rscript -e 'pkgbuild::compile_dll(); roxygen2::update_collate(".")'
    Rscript -e 'library(devtools); document()'
)

cp ${tempdir}/DESCRIPTION .
cp ${tempdir}/NAMESPACE .
cp ${tempdir}/man/* man/
