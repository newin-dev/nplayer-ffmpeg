#!/bin/sh
trap exit ERR
export ARCH="arm"
export ARCH_ABI="armeabi-v7a"
export CPU="armv7-a"
export SYSTEM="arm-linux-androideabi"
export HOST="arm-linux-androideabi"
#export TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-$TOOLCHAIN_VERSION/prebuilt/$HOST_PLATFORM
#export SYSROOT=$NDK/platforms/$NDK_PLATFORM/arch-$ARCH
export NDK_PLATFORM=android-14
export TOOLCHAIN=$NDK_STANDALONE/$NDK_PLATFORM/$ARCH
export SYSROOT=$TOOLCHAIN/sysroot
export EXTRA_CFLAGS="$EXTRA_CFLAGS -D__ANDROID_API__=14"
export EXTRA_LDFLAGS="$EXTRA_LDFLAGS -L$SYSROOT/usr/lib"
rm -rf tmp/$ARCH_ABI
./build_core.sh
