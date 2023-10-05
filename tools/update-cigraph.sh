#! /bin/sh

cd $(dirname $0)/..

rm -rf src/vendor/cigraph

mkdir -p src/vendor

git clone https://github.com/igraph/igraph src/vendor/cigraph

if [ -n "${1-}" ]; then
  git -C src/vendor/cigraph switch --detach "$1"
fi

version=$(git -C src/vendor/cigraph rev-parse HEAD)

rm -rf src/vendor/cigraph/.git

rm -rf src/vendor/cigraph/.github src/vendor/cigraph/doc src/vendor/cigraph/examples src/vendor/cigraph/fuzzing src/vendor/cigraph/tests src/vendor/cigraph/tools
git add src/vendor/cigraph
git commit -m "Update vendored igraph/C to igraph/igraph@${version}"
