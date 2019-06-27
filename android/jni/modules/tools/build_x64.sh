#!/bin/sh
trap exit ERR
export ARCH="x86_64"
export ARCH_ABI="x86_64"
export CPU="x86-64"
export SYSTEM="x86_64-linux-android"
export HOST="x86_64-linux-android"
#export TOOLCHAIN=$NDK/toolchains/x86_64-$TOOLCHAIN_VERSION/prebuilt/$HOST_PLATFORM
#export SYSROOT=$NDK/platforms/$NDK_PLATFORM/arch-$ARCH
export NDK_PLATFORM=android-21
export TOOLCHAIN=$NDK_STANDALONE/$NDK_PLATFORM/$ARCH
export SYSROOT=$TOOLCHAIN/sysroot
export EXTRA_CFLAGS="$EXTRA_CFLAGS -D__ANDROID_API__=21"
export EXTRA_LDFLAGS="$EXTRA_LDFLAGS -L$SYSROOT/usr/lib64"
rm -rf tmp/$ARCH_ABI
./build_core.sh