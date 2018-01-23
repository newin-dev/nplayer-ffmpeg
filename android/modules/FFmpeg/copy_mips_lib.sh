#!/bin/sh

mkdir -p mips/include
cp -R tmp/mips-/include/* mips/include
mkdir -p mips/lib
cp -R tmp/mips-/lib/* mips/lib
touch mips/lib/*
