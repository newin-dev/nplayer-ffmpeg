#!/bin/sh

trap exit ERR

name="openssl-1.0.2o"
tmp_dir="tmp/$ARCH_ABI"
target_dir="$( (cd -P $(dirname $0) && pwd) )/$tmp_dir"
mkdir -p $tmp_dir
gzip -dcv $name.tar.gz  | tar -xv -C $tmp_dir

OPENSSL_DIR=$tmp_dir/$name

pushd $OPENSSL_DIR

export ANDROID_DEV=$SYSROOT/usr 
export CC="$TOOLCHAIN/bin/$SYSTEM-gcc"
export CPP="$TOOLCHAIN/bin/$SYSTEM-cpp"
export CXX="$TOOLCHAIN/bin/$SYSTEM-g++"
export LD="$TOOLCHAIN/bin/$SYSTEM-ld"
export AR="$TOOLCHAIN/bin/$SYSTEM-ar"
export AS="$TOOLCHAIN/bin/$SYSTEM-as"
export LD="$TOOLCHAIN/bin/$SYSTEM-ld"
export RANLIB="$TOOLCHAIN/bin/$SYSTEM-ranlib"
export NM="$TOOLCHAIN/bin/$SYSTEM-nm"
export STRIP="$TOOLCHAIN/bin/$SYSTEM-strip"
export CFLAGS="-std=gnu99 -march=$CPU --sysroot=$SYSROOT $EXTRA_CFLAGS" 
#export CFLAGS="$CFLAGS -mandroid"
export CPPFLAGS="$CFLAGS" 
export CXXFLAGS="$CFLAGS" 
export LDFLAGS="$EXTRA_LDFLAGS"

PATH=$PATH:/usr/local/ndk-standalone/$NDK_PLATFORM/$ARCH/bin

#./Configure $BUILD_TYPE --prefix="$target_dir" 
./Configure $BUILD_TYPE --prefix="$target_dir" $CONFIGURE_OPTIONS

#if [ "$BUILD_TYPE" == "linux-generic64" ]
#then
#perl -i -pe "s|^CC= gcc|CC=${GCC_PATH} -arch ${ARCH} |g" Makefile
#perl -i -pe "s|^CFLAG= (.*)|CFLAG= -isysroot $SYSROOT ${CFLAGS} \$1|g" Makefile
#fi
make -j8
make install_sw
#make build_libs -j8
#if ( test ! -d $target_dir/lib ) ; then mkdir -p $target_dir/lib ; fi
#if ( test ! -d $target_dir/include ) ; then mkdir -p $target_dir/include ; fi
#cp -f -R -L include/* $target_dir/include
#cp -f libcrypto.a $target_dir/lib
#cp -f libssl.a $target_dir/lib

popd

mkdir -p $ARCH_ABI/include
cp -R tmp/$ARCH_ABI/include/* $ARCH_ABI/include/
mkdir -p $ARCH_ABI/lib
cp -R tmp/$ARCH_ABI/lib/* $ARCH_ABI/lib
