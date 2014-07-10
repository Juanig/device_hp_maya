TARGET_SCREEN_HEIGHT := 1200
TARGET_SCREEN_WIDTH := 1920

# Inherit device configuration for maya.
$(call inherit-product, device/hp/maya/maya.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cm_maya
PRODUCT_BRAND := hp
PRODUCT_DEVICE := maya
PRODUCT_MODEL := HP SlateBook 10 x2 PC
PRODUCT_MANUFACTURER := Hewlett-Packard


