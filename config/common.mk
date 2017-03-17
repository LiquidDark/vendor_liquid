# Liquidproduct
PRODUCT_BRAND ?= liquid
PRODUCT_NAME ?= liquid

# Definitions
CONFIG := vendor/liquid/config
OVERLAY := vendor/liquid/overlay
PREBUILT := vendor/liquid/prebuilt/common

# Copy prebuilt files
PRODUCT_COPY_FILES +=  \
    $(PREBUILT)/media/bootanimation.zip:system/media/bootanimation.zip

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=$(shell date +"%s")

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true
    ro.opa.eligible_device=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Default notification/alarm sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.notification_sound=Argon.ogg \
    ro.config.alarm_alert=Helium.ogg

# Enable root and ADB
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=3 \
    ro.secure=0
    
# UBER property overides
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
    ro.substratum.verified=true \
    ro.opa.eligible_device=true \
    ro.adb.secure=1    

# Backup Tool
PRODUCT_COPY_FILES += \
    $(PREBUILT)/bin/backuptool.sh:install/bin/backuptool.sh \
    $(PREBUILT)/bin/backuptool.functions:install/bin/backuptool.functions \
    $(PREBUILT)/bin/50-cm.sh:system/addon.d/50-cm.sh \
    $(PREBUILT)/bin/blacklist:system/addon.d/blacklist

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    $(CONFIG)/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    $(PREBUILT)/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    $(PREBUILT)/etc/init.d/00banner:system/etc/init.d/00banner \
    $(PREBUILT)/bin/sysinit:system/bin/sysinit

# userinit support
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += \
    $(PREBUILT)/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# Liquid-specific init file
PRODUCT_COPY_FILES += \
    $(PREBUILT)/etc/init.local.rc:root/init.liquid.rc

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    $(PREBUILT)/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# This is Liquid!
PRODUCT_COPY_FILES += \
    $(CONFIG)/permissions/com.cyanogenmod.android.xml:system/etc/permissions/com.cyanogenmod.android.xml

# Include OTA config
include $(CONFIG)/ota.mk

# Include Liquid audio files
include $(CONFIG)/liquid_audio.mk

# Theme engine
include $(CONFIG)/themes_common.mk

# OMS7 substratum & masquerade
PRODUCT_PACKAGES += \
   substratum \
   ThemeInterfacer

ifneq ($(TARGET_DISABLE_CMSDK), true)
# CMSDK
include $(CONFIG)/cmsdk_common.mk
endif

# Viper4Android
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/addon.d/viper.zip:system/addon.d/viper.zip

# Include packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    CMAudioService \
    CMParts \
    CustomTiles \
    Development \
    Profiles \
    WeatherManagerService

# Optional Liquid packages
PRODUCT_PACKAGES += \
    libemoji \
    LiveWallpapersPicker \
    PhotoTable \
    Terminal

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Custom Liquid packages
PRODUCT_PACKAGES += \
    Adaway \
    MiXplorer \
    AudioFX \
    CMSettingsProvider \
    Eleven \
    ExactCalculator \
    KernelAdiutor \
    LiveLockScreenService \
    LockClock \
    NovaLauncher \
    WallpaperPicker \
    WeatherProvider

# Optional SuperSU apk
ifeq ($(WITH_SUPERSU),true)
PRODUCT_PACKAGES += \
    SuperSU
endif

# Extra tools in Liquid
PRODUCT_PACKAGES += \
    7z \
    bash \
    bzip2 \
    curl \
    fsck.ntfs \
    gdbserver \
    htop \
    lib7z \
    libsepol \
    micro_bench \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs \
    oprofiled \
    pigz \
    powertop \
    sqlite3 \
    strace \
    tune2fs \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Custom off-mode charger
ifneq ($(WITH_CM_CHARGER),false)
PRODUCT_PACKAGES += \
    charger_res_images \
    cm_charger_res_images \
    font_log.png \
    libhealthd.cm
endif

# ExFAT support
WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank \
    su
endif

DEVICE_PACKAGE_OVERLAYS += $(OVERLAY)/common

PRODUCT_EXTRA_RECOVERY_KEYS += \
  vendor/liquid/build/target/product/security/lineage

-include vendor/cm-priv/keys/keys.mk

ifneq ($(PRODUCT_DEFAULT_DEV_CERTIFICATE),)
ifneq ($(PRODUCT_DEFAULT_DEV_CERTIFICATE),build/target/product/security/testkey)
    ifndef TARGET_VENDOR_RELEASE_BUILD_ID
      TARGET_VENDOR_RELEASE_BUILD_ID := $(shell date -u +%Y%m%d)
    endif
endif
endif

-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include $(CONFIG)/partner_gms.mk
-include vendor/cyngn/product.mk

$(call prepend-product-if-exists, vendor/extra/product.mk)
