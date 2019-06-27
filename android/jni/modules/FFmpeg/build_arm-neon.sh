#!/bin/sh

#export EXTRA_CFLAGS="-mfpu=neon -mfloat-abi=softfp -mtune=cortex-a8"
export EXTRA_LDFLAGS="-Wl,--fix-cortex-a8"
export FPU="neon"
../tools/build_arm.sh
