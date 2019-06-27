#!/bin/sh

pushd modules/bz2
./build_arm.sh
popd

pushd modules/openssl
./build_arm.sh
popd

pushd modules/FFmpeg
./build_arm-vfpv3-d16.sh
./copy_arm-vfpv3-d16_lib.sh
popd

ndk-build APP_ABI=armeabi-v7a