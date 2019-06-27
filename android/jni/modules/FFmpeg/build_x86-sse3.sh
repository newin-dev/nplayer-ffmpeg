#!/bin/sh

export EXTRA_CFLAGS="-mtune=atom -msse3 -mssse3 -mfpmath=sse"
export EXTRA_LDFLAGS=""
export FPU="sse3"
../tools/build_x86.sh
