#! /bin/sh

set -euo pipefail

cd $(dirname $0)/..

rm -rf src/vendor/cigraph

mkdir -p src/vendor

git clone https://github.com/igraph/igraph src/vendor/cigraph

if [ "$1" != "" ]; then
  git -C src/vendor/cigraph switch --detach "$1"
fi

version=$(git -C src/vendor/cigraph rev-parse HEAD)

rm -rf src/vendor/cigraph/.git

rm -rf src/vendor/cigraph/{.github,doc,examples,fuzzing,tests,tools}
git add src/vendor/cigraph
git commit -m "Update vendored igraph/C to igraph/igraph@${version}"
