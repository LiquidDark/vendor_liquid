
# OTA default build type
ifeq ($(OTA_TYPE),)
OTA_TYPE=Unofficial
endif

# Liquid version
LIQUID_VERSION := LiquidDark-$(shell date +"%y%m%d")
DEVICE := $(subst liquid_,,$(TARGET_PRODUCT))

# Build.prop overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.liquid.version=$(LIQUID_VERSION)
    ro.ota.device=$(DEVICE) \
    ro.ota.type=$(OTA_TYPE)
    
$(shell echo -e "# OTA_configuration\n \
ota_url=https://mirrors.c0urier.net/android/teamhorizon/N/$(OTA_TYPE)/$(DEVICE)/ota_nougat.xml\n \
ota-device=$(DEVICE)\n \
device_name=ro.ota.device\n \
release_type=Stable\n \
version_source=ro.xenonhd.version\n \
version_delimiter=-\n \
version_position=1\n \
version_format=yyMMdd" > $(ANDROID_BUILD_TOP)/ota_conf)    
    
