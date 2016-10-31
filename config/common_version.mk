# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=NDE63P BUILD_ID=NDE63P BUILD_VERSION_TAGS=release-keys BUILD_UTC_DATE=0

TARGET_DEVICE := Nexus
export TARGET_DEVICE

ROM_DATE := $(shell date -u +%Y%m%d)-$(shell date -u +%H%M)
ROM_VERSION := $(ROM_DATE)-$(PRODUCT_NAME)
export ROM_VERSION

PRODUCT_PROPERTY_OVERRIDES += \
  ro.nougat.version=$(ROM_VERSION) \
  ro.modversion=$(ROM_VERSION)
