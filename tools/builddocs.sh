#! /bin/bash

tempdir=$(mktemp -d 2>/dev/null || mktemp -d -t 'mytmpdir')
trap "rm -rf ${tempdir}" EXIT
rsync -avq --exclude=cigraph --exclude=.git --exclude revdep . ${tempdir}/

(
    cd ${tempdir}
    touch NAMESPACE # Create namespace, otherwise compile_dll will not work
    echo "Build DLL"
    Rscript -e 'pkgbuild::compile_dll();'
    echo "Update collate"
    Rscript -e 'roxygen2::update_collate(".")'
    rm NAMESPACE # Remove namespace, otherwise roxygen will not create proper NAMESPACE
    echo "Generate documentation and NAMESPACE"
    Rscript -e 'library(devtools); document()'
)

cp ${tempdir}/DESCRIPTION .
cp ${tempdir}/NAMESPACE .
cp ${tempdir}/man/* man/
