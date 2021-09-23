#! /bin/bash

tempdir=$(mktemp -d 2>/dev/null || mktemp -d -t 'mytmpdir')
trap "rm -rf ${tempdir}" EXIT
rsync -avq --exclude=cigraph --exclude=.git --exclude revdep . ${tempdir}/

(
    cd ${tempdir}
    rm -rf src
    Rscript -e 'roxygen2::update_collate(".")'
    Rscript -e 'library(devtools) ; document()'
)

cp doc/*.Rd man/
cp ${tempdir}/DESCRIPTION .
cp ${tempdir}/NAMESPACE .
cp ${tempdir}/man/* man/
