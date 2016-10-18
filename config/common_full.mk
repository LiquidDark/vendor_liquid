# Inherit additional stuff
$(call inherit-product, vendor/nougat/config/common.mk)

# Wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker
