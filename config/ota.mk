# Liquid version
LIQUID_VERSION := LiquidDark-$(shell date +"%y%m%d")
DEVICE := $(subst liquid_,,$(TARGET_PRODUCT))

# Build.prop overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.liquid.version=$(LIQUID_VERSION)
    
    