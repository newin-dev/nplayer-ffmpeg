LOCAL_PATH:= $(call my-dir)
 
include $(CLEAR_VARS)
LOCAL_MODULE    := libssl.a
LOCAL_SRC_FILES := $(TARGET_ARCH_ABI)/lib/libssl.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := libcrypto.a
LOCAL_SRC_FILES := $(TARGET_ARCH_ABI)/lib/libcrypto.a
include $(PREBUILT_STATIC_LIBRARY)

# Merge all static libraries.
include $(CLEAR_VARS)

#LOCAL_LDLIBS := -lz

LOCAL_MODULE:= libopenssl
#LOCAL_LDFLAGS += -Wl,--fix-cortex-a8
LOCAL_DISABLE_FATAL_LINKER_WARNINGS := true

LOCAL_WHOLE_STATIC_LIBRARIES := libssl.a libcrypto.a
include $(BUILD_SHARED_LIBRARY)
