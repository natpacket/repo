#!/usr/bin/env bash

set -e

PROJECT="$1"

if [ -z "$PROJECT" ]; then
    echo "Usage: $0 <project>"
    exit 1
fi

cd "$PROJECT"
make clean
export THEOS_PACKAGE_SCHEME=rootless
# export ARCHS=arm64 # use this one if you target AppStore apps
export ARCHS="arm64 arm64e"
export TARGET=iphone:clang:latest:14.0
make package FINALPACKAGE=1
export -n THEOS_PACKAGE_SCHEME
export -n ARCHS
export -n TARGET
