# Copyright (C) 2011 The Android Open Source Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)


DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Root
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.maya:root/fstab.maya \
    $(LOCAL_PATH)/power.maya.rc:system/etc/power.maya.rc \
    $(LOCAL_PATH)/ueventd.maya.rc:root/ueventd.maya.rc

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.maya.rc:root/init.maya.rc \
    $(LOCAL_PATH)/init/init.maya.usb.rc:root/init.maya.usb.rc
#    $(LOCAL_PATH)/init/init.tf.rc:root/init.tf.rc
#    $(LOCAL_PATH)/init/init.hdcp.rc:root/init.hdcp.rc \

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml

# GPS
# PRODUCT_COPY_FILES += \
#     $(LOCAL_PATH)/gps/gpsconfig.xml:system/etc/gpsconfig.xml \
#     $(LOCAL_PATH)/gps/libgps.conf:system/etc/libgps.conf \
#     $(LOCAL_PATH)/gps/gps.conf:system/etc/gps.conf


# Keylayout
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/keylayout/HP_Keyboard.idc:system/usr/idc/HP_Keyboard.idc \
  $(LOCAL_PATH)/keylayout/HP_Keyboard.kl:system/usr/keylayout/HP_Keyboard.kl \
  $(LOCAL_PATH)/keylayout/Maya_Base_Lid_Switch.kl:system/usr/keylayout/Maya_Base_Lid_Switch.kl \
  $(LOCAL_PATH)/keylayout/Maya_Charger_Event.kl:system/usr/keylayout/Maya_Charger_Event.kl \
  $(LOCAL_PATH)/keylayout/hid_06CB_2239.idc:system/usr/idc/hid_06CB_2239.idc \
  $(LOCAL_PATH)/keylayout/hid_06CB_0001.idc:system/usr/idc/hid_06CB_0001.idc \
  $(LOCAL_PATH)/keylayout/AT_Translated_Set_2_keyboard.kl:system/usr/keylayout/AT_Translated_Set_2_keyboard.kl \
  $(LOCAL_PATH)/keylayout/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
  $(LOCAL_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
  $(LOCAL_PATH)/keylayout/raydium_ts.idc:system/usr/idc/raydium_ts.idc \
  $(LOCAL_PATH)/keylayout/sensor00fn11.idc:system/usr/idc/sensor00fn11.idc \
  $(LOCAL_PATH)/keylayout/Synaptics_RMI4_TouchPad_Sensor.idc:system/usr/idc/Synaptics_RMI4_TouchPad_Sensor.idc \
  $(LOCAL_PATH)/keylayout/srsmodels.lic:system/etc/srsmodels.lic \
  $(LOCAL_PATH)/keylayout/srs_processing.cfg:system/etc/srs_processing.cfg

# Files to copy
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/bin/maya_ec_hpsign.bin:system/etc/firmware/maya_ec_hpsign.bin \
  $(LOCAL_PATH)/bin/OfficialPubKey.bin:system/etc/firmware/OfficialPubKey.bin \
  $(LOCAL_PATH)/bin/maya_ec.bin:system/etc/firmware/maya_ec.bin \
  $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab \
  $(LOCAL_PATH)/ueventd.maya.rc:root/ueventd.maya.rc \
  $(LOCAL_PATH)/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
  $(LOCAL_PATH)/scripts/wifi_loader.sh:system/bin/wifi_loader.sh \
  $(LOCAL_PATH)/scripts/input_cfboost_init.sh:system/bin/input_cfboost_init.sh \
  $(LOCAL_PATH)/scripts/set_hwui_params.sh:system/bin/set_hwui_params.sh \
  $(LOCAL_PATH)/include/nvcms/device.cfg:system/lib/nvcms/device.cfg

# Face detection model
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/include/ft/model_frontalface.xml:system/etc/model_frontal.xml

# Use nicer font rendering
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/include/Display/com.nvidia.display.xml:system/etc/permissions/com.nvidia.display.xml \
    $(LOCAL_PATH)/include/Graphics/com.nvidia.graphics.xml:system/etc/permissions/com.nvidia.graphics.xml


# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/asound.conf:system/etc/asound.conf \
    $(LOCAL_PATH)/audio/audioConfig_qvoice_icera_pc400.xml:system/etc/audioConfig_qvoice_icera_pc400.xml \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/nvaudio_conf.xml:system/etc/nvaudio_conf.xml \
    $(LOCAL_PATH)/media/enctune.conf:system/etc/enctune.conf

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/audio/alsa-lib/alsa.conf:system/usr/share/alsa/alsa.conf \
	$(LOCAL_PATH)/audio/alsa-lib/pcm/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
	$(LOCAL_PATH)/audio/alsa-lib/pcm/modem.conf:system/usr/share/alsa/pcm/modem.conf \
	$(LOCAL_PATH)/audio/alsa-lib/pcm/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
	$(LOCAL_PATH)/audio/alsa-lib/pcm/default.conf:system/usr/share/alsa/pcm/default.conf \
	$(LOCAL_PATH)/audio/alsa-lib/pcm/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
	$(LOCAL_PATH)/audio/alsa-lib/pcm/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
	$(LOCAL_PATH)/audio/alsa-lib/pcm/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
	$(LOCAL_PATH)/audio/alsa-lib/pcm/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
	$(LOCAL_PATH)/audio/alsa-lib/pcm/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
	$(LOCAL_PATH)/audio/alsa-lib/pcm/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
	$(LOCAL_PATH)/audio/alsa-lib/pcm/side.conf:system/usr/share/alsa/pcm/side.conf \
	$(LOCAL_PATH)/audio/alsa-lib/pcm/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
	$(LOCAL_PATH)/audio/alsa-lib/pcm/rear.conf:system/usr/share/alsa/pcm/rear.conf \
	$(LOCAL_PATH)/audio/alsa-lib/pcm/surround71.conf:system/usr/share/alsa/pcm/surround71.conf \
	$(LOCAL_PATH)/audio/alsa-lib/pcm/front.conf:system/usr/share/alsa/pcm/front.conf \
	$(LOCAL_PATH)/audio/alsa-lib/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
    $(LOCAL_PATH)/bin/bdaddr:system/etc/bluetooth/bdaddr \


# Wifi
PRODUCT_COPY_FILES += \
	hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/fw_bcm4330_abg.bin:system/vendor/firmware/bcm4330/fw_bcmdhd.bin \
	hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/fw_bcm4330_apsta_bg.bin:system/vendor/firmware/bcm4330/fw_bcmdhd_apsta.bin \
	hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/fw_bcm4329_abg.bin:system/vendor/firmware/bcm4329/fw_bcmdhd.bin \
	hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/fw_bcm4329_apsta.bin:system/vendor/firmware/bcm4329/fw_bcmdhd_apsta.bin \
    $(LOCAL_PATH)/include/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/include/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf


# Power
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/include/nvcpud.conf:system/etc/nvcpud.conf


# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Nvidia Miracast
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/include/miracast/com.nvidia.miracast.xml:system/etc/permissions/com.nvidia.miracast.xml


PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    ro.carrier=wifi-only \
    debug.hwui.render_dirty_regions=false \
    persist.tegra.nvmmlite = 1 \
    drm.service.enabled=true \
    tf.enable=y

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    HoloSpiralWallpaper \
    MagicSmokeWallpapers \
    NoiseField \
    Galaxy4 \
    VisualizationWallpapers \
    PhaseBeam \
    librs_jni

# Movie Studio
PRODUCT_PACKAGES += \
    VideoEditor
# Audio
PRODUCT_PACKAGES += \
	init.tf \
	sensors.maya \
	lights.maya \
	audio.primary.tegra \
	audio.a2dp.default \
	audio.usb.default \
	audio_policy.tegra \
	power.maya \
	setup_fs \
	drmserver \
	Gallery2 \
	libdrmframework_jni

# Misc
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory \
    libnetcmdiface \
    WiFiDirectDemo

# Filesystem management tools
PRODUCT_PACKAGES += \
       make_ext4fs \
       setup_fs

# Utility to create Bluetooth MAC address
PRODUCT_PACKAGES += \
    btmaccreator

# Rear camera(ov2722) IQ setting
PRODUCT_PACKAGES += \
    camera_overrides_front.isp

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_PACKAGES += charge_detect_daemon

# CPU volt cap daemon
PRODUCT_PACKAGES += \
	nvcpuvoltcapd

# HP apk - only for gms
ifeq ($(BOARD_WITH_GMS),true)
PRODUCT_PACKAGES += \
    Evernote \
    libBCTransform.so \
    libndk_utility.so \
    eBay \
    Kingsoft-office-JP \
    libredlaser.so \
    libCxImageKRF.so \
    libft2KRF.so \
    libicudataKRF.so \
    libicuucKRF.so \
    libjpegKRF.so \
    libKindleReaderJNI.so \
    libKRF.so \
    libNativeLibraryWrapper.so \
    libpngKRF.so \
    libskiaKRF.so \
    WildTangent-Game \
    NVIDIATegraZone

# HP apk - only for non-gms(china)
else
PRODUCT_PACKAGES += \
    HP-e-Service \
    libtermshell.so \
    Evernote_world \
    libBCTransform.so \
    Tencent-Myapp \
    libqqmd5.so \
    libqqpatch.so
endif

# HP apk for gms and non-gms
PRODUCT_PACKAGES += \
    Box \
    libcstringutils.so \
    Evernote-Skitch \
    HP-Camera \
    Splashtop \
    libaudio_player_sles.so \
    libavcodec.so \
    libavutil.so \
    libhw_decoder_tegra.so \
    libiris-jni_froyo.so \
    libiris-jni.so \
    libomxvideo-ics.so \
    libopencrypto.so \
    libopenssl.so \
    libswscale.so \
    libTegraH264HWDecode.so \
    HP-FileManager \
    HP-Media-Player \
    libactivation-jni.so \
    libCLMP4Reindex.so \
    libcom_cyberlink_MP4Reindex_MP4ReindexAPI.so \
    libphotoex.so \
    HP_ePrint-APP \
    libapdk.so \
    libbsnmp.so \
    libbsnmptools.so \
    libeprint_jpeg.so \
    libeprint_png.so \
    libhpcrypto.so \
    libhpssl.so \
    libmars.so \
    libReaderEngine.so \
    libViewBridge.so \
    Kingsoft-office \
    HP-PrinterControl \
    libpagePirateNeon.so \
    libpagePirate.so \
    libPdfGenerator.so \
    HP-RegistrationOOBE \
    HP-RegistrationOOBEService

# Battery Widget Application
PRODUCT_PACKAGES += \
	BatteryWidget

# InsydePhysicalKeyboard Application
PRODUCT_PACKAGES += \
    InsydePhysicalKeyboard

# InsydeIME
PRODUCT_PACKAGES += \
    InsydeIME \
    libjniPredictEngine.so \
    libwnndict.so \
    libWnnEngDic.so \
    libWnnJpnDic.so

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp
