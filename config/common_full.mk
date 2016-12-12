# Inherit additional stuff
$(call inherit-product, vendor/liquid/config/common.mk)

# Wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker
