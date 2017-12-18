#!/bin/bash

set -e

TAG=`git describe --tags --abbrev=0`
NEW_TAG=`semver -i minor $TAG`

MSG="version $NEW_TAG

$(git log --format=%B -1)"

git tag -a "v$NEW_TAG" -m "$MSG"
