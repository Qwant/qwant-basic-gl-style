#!/bin/bash

set -e

TAG=`git describe --tags --abbrev=0`
NEW_TAG=`semver -i minor $TAG`

MSG="version $NEW_TAG

$(git log --format=%B -1)"

git tag -a "v$NEW_TAG" -m "$MSG"
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

git commit --message "gh-pages $NEW_TAG"
git push --quiet --set-upstream origin gh-pages -f
