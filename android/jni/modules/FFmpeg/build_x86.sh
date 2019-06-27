#!/bin/sh

export EXTRA_CFLAGS="-mtune=atom"
export EXTRA_LDFLAGS=""	
export CONFIGURE_OPTIONS="--disable-mmx --disable-mmxext"
../tools/build_x86.sh
