#!/usr/bin/env bash

# We start by building and deploying the documentation
SCRIPT_PATH="$(cd "$(dirname "$0")" && pwd -P)"
DATE=`date`
sudo pip install mkdocs
# Initialize gh-pages checkout
mkdir -p docs/html
(
cd docs/html
git init
git config user.name "${GH_USER_NAME}"
git config user.email "${GH_USER_EMAIL}"
git remote add upstream "https://$GH_TOKEN@${GH_REF}"
git fetch upstream
git reset upstream/gh-pages
)

cd $SCRIPT_PATH
mkdocs build --clean --site-dir docs/html

# Commit and push the documentation to gh-pages
(
cd docs/html
touch .
git add -A .
git commit -m "Rebuild pages at ${rev} $DATE"
git push -q upstream HEAD:gh-pages
)
cd $SCRIPT_PATH
