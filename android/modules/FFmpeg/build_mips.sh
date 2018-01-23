#!/bin/sh

export ARCH="mips"
export CPU="mips32r2"
export FPU=""
export SYSTEM="mipsel-linux-android"
export TOOLCHAIN=$NDK/toolchains/mipsel-linux-android-$TOOLCHAIN_VERSION/prebuilt/$HOST_PLATFORM
export SYSROOT=$SYSROOT_BASE/arch-$ARCH
export EXTRA_CFLAGS=""
export EXTRA_LDFLAGS=""
export OPTFLAGS="-O2 -fno-pic"
export CONFIGURE_OPTIONS="--disable-mipsfpu --disable-mipsdspr1 --disable-mipsdspr2"
./build_core.sh
