# Inherit device configuration
$(call inherit-product, device/huawei/angler/aosp_angler.mk)

# Inherit some common stuff
$(call inherit-product, vendor/liquid/config/common.mk)

# Inherit some phone stuff
$(call inherit-product, vendor/liquid/config/common_full_phone.mk)

# Override build properties

PRODUCT_NAME := liquid_angler
PRODUCT_BRAND := google
PRODUCT_DEVICE := angler
PRODUCT_MODEL := Nexus 6P
PRODUCT_MANUFACTURER := Huawei

# Device fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=angler \
    PRIVATE_BUILD_DESC="angler-user 7.0 NBD90X 3254009 release-keys" \
    BUILD_FINGERPRINT="google/angler/angler:7.0/NBD90X/3254009:user/release-keys"

