# Release name
PRODUCT_RELEASE_NAME := Nexus5X

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
    BPRIVATE_BUILD_DESC="bullhead-user 7.0 NRD90U 3155372 release-keys" \
    BUILD_FINGERPRINT="google/bullhead/bullhead:7.0/NRD90U/3155372:user/release-keys"

# Target device
export TARGET_DEVICE := bullhead