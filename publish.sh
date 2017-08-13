#!/bin/bash
USER="portugolonline"
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
git commit -m "Publicando o site (ver commit $USER/$SOURCE@$LAST_COMMIT_HASH)"
git push
cd "../$SOURCE"
git stash pop
