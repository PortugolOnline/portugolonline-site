#!/bin/bash
SOURCE="portugolonline-site"
TARGET="portugolonline.github.io"

git add --all .
git stash
LAST_COMMIT_HASH=`git rev-parse HEAD`
bundle exec jekyll build
cd "../$TARGET"
git pull
git rm -rf *
touch .nojekyll
cp -r ../$SOURCE/_site/* .
git add --all .
git commit -m "Publicando o site (ver commit $LAST_COMMIT_HASH do repositório $SOURCE)"
git push
cd "../$SOURCE"
git stash pop
