#!/bin/sh
trap exit ERR

pushd modules/bz2
./build_arm.sh
popd

pushd modules/openssl
./build_arm.sh
popd

pushd modules/FFmpeg
./build_arm-neon.sh
./copy_arm-neon_lib.sh
popd

ndk-build APP_ABI=armeabi-v7a