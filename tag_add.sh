#!/usr/bin/env bash
TAG=`date "+%Y%m%d%H%m"` 
git tag $TAG
git push origin $TAG
git push origin master