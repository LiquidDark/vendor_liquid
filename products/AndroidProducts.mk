ifeq (liquid_angler,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/liquid_angler.mk
endif

ifeq (liquid_bullhead,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/liquid_bullhead.mk
endif

ifeq (liquid_hammerhead,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/liquid_hammerhead.mk
endif
