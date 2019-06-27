#!/bin/sh
trap exit ERR
export ARCH="x86"
export ARCH_ABI="x86"
export CPU="i686"
export SYSTEM="i686-linux-android"
export HOST="i686-linux-android"
#export TOOLCHAIN=$NDK/toolchains/x86-$TOOLCHAIN_VERSION/prebuilt/$HOST_PLATFORM
#export SYSROOT=$NDK/platforms/$NDK_PLATFORM/arch-$ARCH
export NDK_PLATFORM=android-14
export TOOLCHAIN=$NDK_STANDALONE/$NDK_PLATFORM/$ARCH
export SYSROOT=$TOOLCHAIN/sysroot
export EXTRA_CFLAGS="$EXTRA_CFLAGS -D__ANDROID_API__=14"
export EXTRA_LDFLAGS="$EXTRA_LDFLAGS -L$SYSROOT/usr/lib"
rm -rf tmp/$ARCH_ABI
./build_core.sh