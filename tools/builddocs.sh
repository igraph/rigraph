#! /bin/bash

tempdir=$(mktemp -d 2>/dev/null || mktemp -d -t 'mytmpdir')
trap "rm -rf ${tempdir}" EXIT
rsync -avq \
    --exclude=cigraph \
    --exclude=.git \
    --exclude=revdep \
    --exclude=.venv \
    . ${tempdir}/

(
    cd ${tempdir}
    rm -rf src
    Rscript -e 'devtools::document()'
)

cp doc/*.Rd man/
cp ${tempdir}/NAMESPACE .
cp -r ${tempdir}/man/* man/
