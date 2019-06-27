#!/bin/sh

trap exit ERR

./build_arm-vfpv3-d16.sh
./build_arm-neon.sh
./build_arm64.sh
#./build_x86-sse3.sh
./build_x86.sh
./build_x64.sh

#./copy_arm-vfpv3-d16.sh
./copy_arm-neon_lib.sh
./copy_arm64_lib.sh
#./copy_x86-sse3_lib.sh
./copy_x86_lib.sh
./copy_x64_lib.sh
