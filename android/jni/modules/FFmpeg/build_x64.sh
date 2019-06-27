#!/bin/sh

#export EXTRA_CFLAGS="-mtune=atom -msse3 -mssse3 -mfpmath=sse -fPIC"
#export EXTRA_LDFLAGS="" #"-no-canonical-prefixes"
#export CONFIGURE_OPTIONS=""	
export EXTRA_CFLAGS="-mtune=atom"
export EXTRA_LDFLAGS=""	
export CONFIGURE_OPTIONS="--disable-asm"
../tools/build_x64.sh
