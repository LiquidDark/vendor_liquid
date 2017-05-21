# Inherit common Liquid stuff
$(call inherit-product, vendor/liquid/config/common.mk)

PRODUCT_SIZE := full

PRODUCT_PROPERTY_OVERRIDES += \
    ro.substratum.verified=true

# Recorder
PRODUCT_PACKAGES += \
    Recorder
