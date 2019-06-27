#!/bin/sh

pushd modules/bz2
./build_x86.sh
popd

pushd modules/openssl
./build_x86.sh
popd

pushd modules/FFmpeg
./build_x86-sse3.sh
./copy_x86-sse3_lib.sh
popd

ndk-build APP_ABI=x86