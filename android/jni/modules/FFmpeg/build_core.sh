#!/bin/sh

trap exit ERR

name="ffmpeg-3.3.5"
tmp_dir="tmp/$ARCH_ABI-$FPU"
this_dir="$( (cd -P $(dirname $0) && pwd) )"
target_dir="$this_dir/$tmp_dir"

mkdir -p $tmp_dir
bzip2 -dcv $name.tar.bz2  | tar -xv -C $tmp_dir

FFMPEG_DIR=$tmp_dir/$name

cd $FFMPEG_DIR

CONFIGURE_OPTIONS="--enable-pic  --enable-runtime-cpudetect --enable-stripping --disable-small --disable-debug --disable-ffmpeg --disable-ffplay --disable-ffserver --disable-ffprobe --disable-doc --enable-network --disable-encoders --enable-encoder=aac --enable-encoder=mjpeg --disable-muxers  --enable-muxer=spdif --enable-muxer=mpegts --enable-bsfs --disable-devices --enable-filters" 
CONFIGURE_OPTIONS="$CONFIGURE_OPTIONS --enable-zlib" # --enable-bzlib
CONFIGURE_OPTIONS="--disable-decoder=eac3 --disable-decoder=truehd --disable-decoder=mlp"
echo $SYSROOT
./configure --enable-static --disable-shared --cross-prefix=$TOOLCHAIN/bin/$SYSTEM- --prefix="$target_dir" --target-os=linux --arch=$ARCH --cpu=$CPU --enable-cross-compile --sysroot=$SYSROOT --extra-cflags="-march=$CPU  -mandroid $EXTRA_CFLAGS" --extra-cxxflags="$EXTRA_CXXFLAGS" --extra-ldflags="$EXTRA_LDFLAGS" --optflags="$OPTFLAGS" $CONFIGURE_OPTIONS

make install -j8


