#!/bin/sh

mkdir -p x86_64/include
cp -R tmp/x86_64-/include/* x86_64/include
mkdir -p x86_64/lib
cp -R tmp/x86_64-/lib/* x86_64/lib
touch x86_64/lib/*
