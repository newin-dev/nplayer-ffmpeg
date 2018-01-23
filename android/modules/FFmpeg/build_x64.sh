#!/bin/sh

export ARCH="x86_64"
export ARCH_ABI="x86_64"
export CPU="x86-64"
export FPU="sse3"
export SYSTEM="x86_64-linux-android"
export TOOLCHAIN=$NDK/toolchains/x86_64-$TOOLCHAIN_VERSION/prebuilt/$HOST_PLATFORM
export NDK_PLATFORM=android-21
export SYSROOT=$NDK/platforms/$NDK_PLATFORM/arch-$ARCH
export EXTRA_CFLAGS="-mtune=atom -msse3 -mssse3 -mfpmath=sse"
#export EXTRA_CFLAGS="$EXTRA_CFLAGS -fpredictive-commoning -fipa-cp-clone -funswitch-loops -fgcse-after-reload -ftree-vectorize -ffunction-sections  -ffunction-sections -funwind-tables -no-canonical-prefixes -mcmodel=large"
export EXTRA_LDFLAGS="" #"-no-canonical-prefixes"
#export OPTFLAGS="-fpic"
export CONFIGURE_OPTIONS="--disable-asm"	
./build_core.sh
