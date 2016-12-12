# Release name
PRODUCT_RELEASE_NAME := Nexus5X

# Target device
export TARGET_DEVICE := bullhead

# Inherit device configuration
$(call inherit-product, device/lge/bullhead/aosp_bullhead.mk)

# Inherit some common stuff
$(call inherit-product, vendor/liquid/config/common.mk)
$(call inherit-product, vendor/liquid/config/common_full_phone.mk)

# Override build properties
PRODUCT_DEVICE := bullhead
PRODUCT_NAME := liquid_bullhead
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 5X
PRODUCT_MANUFACTURER := LGE
TARGET_VENDOR := lge

# Device fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=bullhead \
    PRIVATE_BUILD_DESC="bullhead-user 7.1.1 NMF26F 3425388 release-keys" \
    BUILD_FINGERPRINT=google/bullhead/bullhead:7.1.1/NMF26F/3425388:user/release-keys