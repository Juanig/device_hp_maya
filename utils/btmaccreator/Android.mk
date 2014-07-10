LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := btmaccreator.c
LOCAL_MODULE := btmaccreator
LOCAL_SHARED_LIBRARIES := libcutils liblog
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)
