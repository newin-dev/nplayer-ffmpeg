#!/bin/sh

mkdir -p arm64-v8a/include
cp -R tmp/arm64-v8a-/include/* arm64-v8a/include
mkdir -p arm64-v8a/lib
cp -R tmp/arm64-v8a-/lib/* arm64-v8a/lib
touch arm64-v8a/lib/*
