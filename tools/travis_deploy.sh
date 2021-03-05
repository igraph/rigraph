#! /bin/bash

set -ex

# Where to push it
branch=master
package=$1

mkdir _deploy
cp ${package} _deploy/
cd _deploy

# Get the current history

git clone -b master https://github.com/"${TRAVIS_REPO_SLUG}" igraph
mv igraph/.git gitbak
rm -rf igraph

# Get the current files for the new commit and
# put back the history

tar xzf ${package}
rm ${package}
mv gitbak igraph/.git

# Record changes
cd igraph
git add -A .

git config --global user.name "igraph builder robot"
git config --global user.email "vincent@traag.net"
git config --global push.default matching
git remote set-branches --add origin ${branch}

## Authentication

git config credential.helper "store --file=.git/credentials"
python -c 'import os; print "https://" + os.environ["GH_TOKEN"] + ":@github.com"' > .git/credentials

## OK, ready to deploy

git commit -q --allow-empty -m "${TRAVIS_COMMIT} - ${TRAVIS_COMMIT_MSG}"
git push -q origin ${branch}
