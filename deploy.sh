#!/usr/bin/env bash
# Build and deploy the documentation
SCRIPT_PATH="$(cd "$(dirname "$0")" && pwd -P)"
sudo pip install mkdocs
mkdir mkdocs_build
cd mkdocs_build
# Initialize gh-pages checkout
DATE=`date`
git clone https://github.com/jupeg/reportM2.git
cd docs
git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials
mkdocs gh-deploy --clean -m "gh-deployed by travis $DATE"
cd $SCRIPT_PATH