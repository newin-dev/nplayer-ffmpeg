#!/bin/sh

trap exit ERR

name="bzip2-1.0.6"
tmp_dir="tmp/$ARCH_ABI"
target_dir="$( (cd -P $(dirname $0) && pwd) )/$tmp_dir/../../$ARCH_ABI"
mkdir -p $tmp_dir
gzip -dcv $name.tar.gz  | tar -xv -C $tmp_dir

BZ2_DIR=$tmp_dir/$name

pushd $BZ2_DIR

export CC="$TOOLCHAIN/bin/$SYSTEM-gcc"
#export CPP="$TOOLCHAIN/bin/$SYSTEM-cpp"
#export CXX="$TOOLCHAIN/bin/$SYSTEM-g++"
#export LD="$TOOLCHAIN/bin/$SYSTEM-ld"
export AR="$TOOLCHAIN/bin/$SYSTEM-ar"
#export AS="$TOOLCHAIN/bin/$SYSTEM-as"
#export LD="$TOOLCHAIN/bin/$SYSTEM-ld"
export RANLIB="$TOOLCHAIN/bin/$SYSTEM-ranlib"
#export NM="$TOOLCHAIN/bin/$SYSTEM-nm"
#export STRIP="$TOOLCHAIN/bin/$SYSTEM-strip"
export CFLAGS="-std=gnu99 -march=$CPU -mandroid --sysroot $SYSROOT -I$SYSROOT/usr/include $EXTRA_CFLAGS" 
export LDFLAGS="$EXTRA_LDFLAGS"
export CPPFLAGS="$CFLAGS" 
export CXXFLAGS="$CFLAGS" 

PATH=$PATH:/usr/local/ndk-standalone/$NDK_PLATFORM/$ARCH/bin

make install PREFIX="$target_dir" LDFLAGS="-static $LDFLAGS" CFLAGS="$CFLAGS" CPPFLAGS="$CPPFLAGS" CXXFLAGS="$CXXFLAGS" CC="$CC" AR="$AR" RANLIB="$RANLIB"

#make libbz2.a PREFIX="$target_dir" LDFLAGS="-static $LDFLAGS" CFLAGS="$CFLAGS" CPPFLAGS="$CPPFLAGS" CXXFLAGS="$CXXFLAGS" CC="$CC" AR="$AR" RANLIB="$RANLIB"
#if ( test ! -d $target_dir/lib ) ; then mkdir -p $target_dir/lib ; fi
#if ( test ! -d $target_dir/include ) ; then mkdir -p $target_dir/include ; fi
#cp -f bzlib.h $target_dir/include
#chmod a+r $target_dir/include/bzlib.h
#cp -f libbz2.a $target_dir/lib
#chmod a+r $target_dir/lib/libbz2.a

popd

#mkdir -p include
#cp -R tmp/$ARCH/include/* include/
#mkdir -p lib/$ARCH
#cp -R tmp/$ARCH/lib/* lib/$ARCH