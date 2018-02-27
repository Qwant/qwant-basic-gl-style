#!/bin/bash

set -e

TAG=`git describe --tags --abbrev=0`
NEW_TAG=`semver -i minor $TAG`
REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
TARGET_BRANCH="gh-pages"

git checkout -b gh-pages

cp ./node_modules/mapbox-gl/dist/mapbox-gl.js ./
cp ./node_modules/mapbox-gl/dist/mapbox-gl-dev.js ./
cp ./node_modules/mapbox-gl/dist/mapbox-gl.css ./

cp ./build/built-style-debug.json ./style-debug.json
cp ./build/built-style.json ./style.json
cp ./build/style-omt.json ./style-omt.json
cp ./build/sprite.json ./sprite.json
cp ./build/sprite.png ./sprite.png

git add mapbox-gl.js mapbox-gl-dev.js mapbox-gl.css
git add style-debug.json style.json style-omt.json sprite.json sprite.png

# add screenshots
mkdir preview
cd preview
docker pull klokantech/thumbnail-gl
docker run -v $(pwd):/data klokantech/thumbnail-gl "https://qwantresearch.github.io/qwant-basic-gl-style/style-omt.json" "-x 2.3061 -y 48.8811 -z 7 -w 800 -h 600 -r 2"
cd ..
git add preview/*

git config user.name "Travis CI"
git config user.email "$COMMIT_AUTHOR_EMAIL"

ENCRYPTED_KEY_VAR="encrypted_${ENCRYPTION_LABEL}_key"
ENCRYPTED_IV_VAR="encrypted_${ENCRYPTION_LABEL}_iv"
ENCRYPTED_KEY=${!ENCRYPTED_KEY_VAR}
ENCRYPTED_IV=${!ENCRYPTED_IV_VAR}
openssl aes-256-cbc -K $ENCRYPTED_KEY -iv $ENCRYPTED_IV -in ./deploy_key.enc -out ./deploy_key -d
chmod 600 ./deploy_key
eval `ssh-agent -s`
ssh-add deploy_key

git commit --message "gh-pages $NEW_TAG"
git push $SSH_REPO $TARGET_BRANCH -f
