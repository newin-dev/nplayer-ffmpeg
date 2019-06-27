#!/bin/sh

pushd modules/bz2
./build_x64.sh
popd

pushd modules/openssl
./build_x64.sh
popd

pushd modules/FFmpeg
./build_x64.sh
./copy_x64_lib.sh
popd

ndk-build APP_ABI=x86_64
