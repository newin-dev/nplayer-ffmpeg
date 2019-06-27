#!/bin/sh

export EXTRA_CFLAGS="-mfpu=vfpv3-d16 -mfloat-abi=softfp"
export EXTRA_LDFLAGS="-Wl,--fix-cortex-a8"
export FPU="vfpv3-d16"
../tools/build_arm.sh
