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

CFLAGS="-march=$CPU -mandroid $EXTRA_CFLAGS"
CFLAGS="$CFLAGS -I$this_dir/../openssl/$ARCH_ABI/include -I$this_dir/../bz2/$ARCH_ABI/include"
CXXFLAGS="$CFLAGS $EXTRA_CXXFLAGS"
LDFLAGS="$EXTRA_LDFLAGS"
LDFLAGS="$LDFLAGS -L$this_dir/../openssl/$ARCH_ABI/lib -L$this_dir/../bz2/$ARCH_ABI/lib"

CONFIGURE_OPTIONS="$CONFIGURE_OPTIONS --enable-pic --enable-static --disable-shared --disable-debug  --disable-programs --disable-doc --enable-network --disable-encoders --enable-encoder=aac --enable-encoder=mjpeg --disable-muxers --enable-muxer=mp4 --enable-muxer=mpegts --enable-muxer=spdif --enable-bsfs --disable-devices --disable-filters" 
CONFIGURE_OPTIONS="$CONFIGURE_OPTIONS --enable-zlib --enable-openssl --enable-bzlib "
CONFIGURE_OPTIONS="$CONFIGURE_OPTIONS --disable-decoder=eac3 --disable-decoder=truehd --disable-decoder=mlp"
echo "Configure options: $CONFIGURE_OPTIONS"
./configure --enable-static --disable-shared --cross-prefix=$TOOLCHAIN/bin/$SYSTEM- --prefix="$target_dir" --target-os=linux --arch=$ARCH --cpu=$CPU --enable-cross-compile --sysroot=$SYSROOT --extra-cflags="$CFLAGS" --extra-cxxflags="$CXXFLAGS" --extra-ldflags="$LDFLAGS" --optflags="$OPTFLAGS" $CONFIGURE_OPTIONS
perl -i -pe "s|-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE||g" config.mak
make install -j8


