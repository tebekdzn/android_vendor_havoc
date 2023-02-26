# Versioning System

ifndef HAVOC_BUILD_TYPE
    HAVOC_BUILD_TYPE := Beta
endif

# Only include Havoc OTA for official builds
ifeq ($(filter-out Official,$(HAVOC_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        Updater
endif

TARGET_PRODUCT_SHORT := $(subst havoc_,,$(HAVOC_BUILD_TYPE))

HAVOC_VERSION = 3.0
HAVOC_BUILD_DATE := $(shell date -u +%d-%m-%Y)
HAVOC_FINGERPRINT := MiksueROM/v$(HAVOC_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date -u +%Y%m%d)/$(shell date -u +%H%M)

ifeq ($(WITH_GAPPS),true)
    HAVOC_BUILD_VARIANT = GApps
    HAVOC_BUILD_VERSION := MiksueROM-v$(HAVOC_VERSION)-$(shell date -u +%Y%m%d)-$(HAVOC_BUILD)-$(HAVOC_BUILD_TYPE)-GApps
else
    HAVOC_BUILD_VARIANT = Vanilla
    HAVOC_BUILD_VERSION := MiksueROM-v$(HAVOC_VERSION)-$(shell date -u +%Y%m%d)-$(HAVOC_BUILD)-$(HAVOC_BUILD_TYPE)
endif
