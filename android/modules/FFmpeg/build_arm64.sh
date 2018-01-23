#!/bin/sh

export ARCH="arm64"
export ARCH_ABI="arm64-v8a"
export CPU="armv8-a"
export FPU=""
export SYSTEM="aarch64-linux-android"
export TOOLCHAIN=$NDK/toolchains/aarch64-linux-android-$TOOLCHAIN_VERSION/prebuilt/$HOST_PLATFORM
export NDK_PLATFORM=android-21
export SYSROOT=$NDK/platforms/$NDK_PLATFORM/arch-$ARCH
export EXTRA_CFLAGS=""
export EXTRA_LDFLAGS=""
#export OPTFLAGS="-Os -fpic"

./build_core.sh

