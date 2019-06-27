# The ARMv7 is significanly faster due to the use of the hardware FPU
APP_ABI := armeabi-v7a x86
APP_PLATFORM := android-14
APP_STL := c++_shared
APP_CPPFLAGS += -std=c++11 \
				-Wno-multichar \
				-Wno-return-type-c-linkage \
				-D_LIBCPP_VERSION \
				-D__STDINT_LIMITS \
				-D__STDINT_MACROS \
				-D__ANDROID__ 

APP_OPTIM := release

