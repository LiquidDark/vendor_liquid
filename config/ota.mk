# OTA default build type
ifeq ($(OTA_TYPE),)
OTA_TYPE=Unofficial
endif

# Liquid version
LIQUID_VERSION := LiquidDark-$(shell date +"%Y%m%d-%H%M")
DEVICE := $(subst liquid_,,$(TARGET_PRODUCT))

# Build.prop overrides
PRODUCT_PROPERTY_OVERRIDES += \
ro.liquid.version=$(LIQUID_VERSION)