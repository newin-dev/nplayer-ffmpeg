#!/bin/sh

export ARCH="mips"
export CPU="mips32r2"
export SYSTEM="mipsel-linux-android"
export HOST="mipsel-linux-android"
export TOOLCHAIN=$NDK/toolchains/mipsel-linux-android-$TOOLCHAIN_VERSION/prebuilt/$HOST_PLATFORM
export SYSROOT=$SYSROOT_BASE/arch-$ARCH
export BUILD_TYPE=android

./build_core.sh