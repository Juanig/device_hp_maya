#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PACKAGE_OVERLAYS += device/hp/maya/overlay

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := false
BOARD_USES_GENERIC_AUDIO := false

# Use the non-open-source parts, if they're present
-include vendor/hp/maya/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
BOARD_USES_ALSA_AUDIO := true
BOARD_SUPPORT_NVOICE := true

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a15
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_USE_TEGRA_BIONIC_OPTIMIZATION := true
TARGET_USE_TEGRA11_MEMCPY_OPTIMIZATION := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := tegra
TARGET_TEGRA_VERSION := t114
TARGET_TEGRA_FAMILY := t11x
TARGET_BOOTLOADER_BOARD_NAME := maya

TARGET_USE_DTB := true
TARGET_KERNEL_DT_NAME := tegra114-maya
BOOTLOADER_SUPPORTS_DTB := true
TARGET_BOOTLOADER_BOARD_NAME := maya

# By default REFERENCE_DEVICE is dalmore. Override this setting since
# not all dalmore features are supported in Maya.
REFERENCE_DEVICE := maya

# Kernel
#BOARD_KERNEL_BASE := 0x10000000
#BOARD_KERNEL_CMDLINE :=
#BOARD_KERNEL_PAGESIZE := 2048
#BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100

# Try to build the kernel
TARGET_KERNEL_SOURCE := kernel/hp/maya

# Custom kernel config
TARGET_KERNEL_CONFIG := tegra11_maya_android_defconfig

# Partition
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608 # 8M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608 # 8M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28225568768 # 27.6G
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 2147483648 # 2.1G
USE_E2FSPROGS := true


# mediaplayer
BOARD_USES_HW_MEDIAPLUGINS := false
BOARD_USES_HW_MEDIASCANNER := false
BOARD_USES_HW_MEDIARECORDER := false

# powerhal
BOARD_USES_POWERHAL := true

# Bluetooth related defines
BOARD_HAVE_BLUETOOTH := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/hp/maya/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
# compile wpa_supplicant with WEXT and NL80211 support both
CONFIG_DRIVER_WEXT          := y
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WLAN_DEVICE_REV       := bcm4330_b2
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_STA     := "/data/misc/wifi/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/data/misc/wifi/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/data/misc/wifi/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_PARAM   := "/data/misc/wifi/firmware/firmware_path"
WIFI_DRIVER_MODULE_ARG      := "iface_name=wlan0"
WIFI_DRIVER_MODULE_NAME     := "bcmdhd"


# GPS
BOARD_HAVE_GPS_BCM := true

#NFC
BOARD_HAVE_NXP_PN544C3 := true


# Video
BOARD_EGL_CFG := device/hp/maya/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_HAVE_PIXEL_FORMAT_INFO := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Use nicer font rendering
BOARD_USE_SKIA_LCDTEXT := true
BOARD_INCLUDES_TEGRA_JNI:= graphics,cursor

# Audio
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true


BOARD_ROOT_DEVICE := emmc

# Dalvik option
DALVIK_ENABLE_DYNAMIC_GC := true


# TWRP recovery
DEVICE_RESOLUTION := 1920x1200
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

HAVE_SELINUX := false

ifeq ($(HAVE_SELINUX),true)

# SELINUX Defines
BOARD_SEPOLICY_DIRS := \
    device/hp/maya/sepolicy

BOARD_SEPOLICY_UNION := \
    file_contexts \
    genfs_contexts \
    app.te \
    bdaddwriter.te \
    device.te \
    drmserver.te \
    init_shell.te \
   file.te \
    sensors_config.te \
    system.te \
    zygote.te \
    healthd.te \
    domain.te \
    ueventd.te

endif
TARGET_BOOTANIMATION_PRELOAD := true
