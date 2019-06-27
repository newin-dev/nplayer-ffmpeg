#!/bin/sh
trap exit ERR

pushd modules/bz2
./build_arm64.sh
popd

pushd modules/openssl
./build_arm64.sh
popd

pushd modules/FFmpeg
./build_arm64.sh
./copy_arm64_lib.sh
popd

ndk-build APP_ABI=arm64-v8a
