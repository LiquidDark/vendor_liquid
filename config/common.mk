# Google property overides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.setupwizard.rotation_locked=true \
    ro.setupwizard.enterprise_mode=1

# Liquid property overides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.fw.bg_apps_limit=20 \
    wifi.supplicant_scan_interval=180 \
    windowsmgr.max_events_per_sec=150 \
    debug.performance.tuning=1 \
    ro.ril.power_collapse=1 \
    persist.service.lgospd.enable=0 \
    persist.service.pcsync.enable=0 \
    ro.facelock.black_timeout=400 \
    ro.facelock.det_timeout=1500 \
    ro.facelock.rec_timeout=2500 \
    ro.facelock.lively_timeout=2500 \
    ro.facelock.est_max_time=600 \
    ro.facelock.use_intro_anim=false \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    net.tethering.noprovisioning=true \
    persist.sys.dun.override=0 \
    ro.adb.secure=1 \
    ro.substratum.verified=true

# Google assistant
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.model=Pixel XL \
    ro.opa.eligible_device=true

# APN config
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Backup script
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/liquid/prebuilt/addon.d/50-nougat.sh:system/addon.d/50-nougat.sh \
    vendor/liquid/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions

# Boot animation
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip

# Enable SIP+VoIP
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Gestures libraries
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so \
    vendor/liquid/prebuilt/lib64/libjni_keyboarddecoder.so:system/lib64/libjni_keyboarddecoder \
    vendor/liquid/prebuilt/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so

# SuperSU
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/addon.d/supersu.zip:system/addon.d/supersu.zip

# ViPER
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/addon.d/viper.zip:system/addon.d/viper.zip
    
# Substratum Theme Engine    
PRODUCT_COPY_FILES += \
vendor/liquid/prebuilt/etc/projekt.substratum.apk:system/app/Substratum/Substratum.apk

# Kernel Auditor
PRODUCT_COPY_FILES += \
vendor/liquid/prebuilt/etc/KernelAdiutor.apk:system/app/Auditor/KernelAdiutor.apk     

# Include packages
PRODUCT_PACKAGES += \
    AOSPLinks \
    Busybox \
    Gallery2 \
    Calculator \
    Calendar \
    Camera2 \
    Launcher3 \
    masquerade \
    QuickSearchBox \
    GoogleWebView

# Exclude SystemUI tests
EXCLUDE_SYSTEMUI_TESTS := true

# Include explicitly to work around Facelock issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full

# Include overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/liquid/overlay/common

# Inherit build prop overrides
-include vendor/liquid/config/common_version.mk

