#
# Copyright (C) 2022-2023 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#

# A/B
TARGET_IS_VAB := true

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Screen
TARGET_SCREEN_DENSITY := 400

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 400dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

PRODUCT_SHIPPING_API_LEVEL := 30

# Inherit from motorola sm7325-common
$(call inherit-product, device/motorola/sm7325-common/common.mk)

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResXpeng \
    LineagePlatformXpeng \
    LineageSystemUIXpeng \
    SettingsProviderResXpeng \
    SystemUIResXpeng

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/sku_lahaina/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_io_policy.conf \
    $(LOCAL_PATH)/audio/sku_lahaina/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/sku_lahaina/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/mixer_paths.xml \
    $(LOCAL_PATH)/audio/sku_lahaina/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/audio/sku_lahaina/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina/sound_trigger_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/audio/audio_ext_spkr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_ext_spkr.conf \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.xpeng \
    com.motorola.hardware.biometric.fingerprint@1.0.vendor

$(foreach f,$(wildcard $(LOCAL_PATH)/configs/idc/*.idc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/usr/idc/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/configs/keylayout/*.kl),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/$(notdir $f)))

# Init
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/etc/init/hw/*.rc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/etc/init/*.rc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/init/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/rootdir/bin/*.sh),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/bin/$(notdir $f)))

# Init (recovery)
PRODUCT_PACKAGES += \
    init.recovery.xpeng.rc \
    load_touch.sh

# Lineage Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.xpeng

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.xpeng

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2.vendor \
    android.hardware.nfc@1.2-service.st \
    android.hardware.secure_element@1.2.vendor \
    com.android.nfc_extras \
    libchrome.vendor \
    Tag \
    nfc_nci.st21nfc.default

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml

# Sensors
PRODUCT_PACKAGES += \
    sensors.xpeng

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine-xpeng-game-perf.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-xpeng.conf

# Inherit from vendor blobs
$(call inherit-product, vendor/motorola/xpeng/xpeng-vendor.mk)
