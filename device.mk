#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
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
    FrameworksResDevice \
    LineageApertureAppDevice \
    LineagePlatformDevice \
    LineageSystemUIDevice \
    SystemUIResDevice \
    WifiResDevice

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
    android.hardware.biometrics.fingerprint@2.1-service.xpeng

$(foreach f,$(wildcard $(LOCAL_PATH)/configs/idc/*.idc),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/usr/idc/$(notdir $f)))
$(foreach f,$(wildcard $(LOCAL_PATH)/configs/keylayout/*.kl),\
        $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/$(notdir $f)))

# Init
PRODUCT_PACKAGES += \
    init.ets.rc \
    init.mmi.overlay.rc \
    init.recovery.xpeng.rc \
    init.vendor.st21nfc.rc \
    init.oem.fingerprint2.sh \
    load_touch.sh.recovery

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.lineage

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc-service.st \
    com.android.nfc_extras \
    Tag

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml

# Sensors
PRODUCT_PACKAGES += \
    sensors.xpeng

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine-xpeng-game-perf.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine-xpeng.conf

# Touch HAL
PRODUCT_PACKAGES += \
    vendor.lineage.touch-service.motorola

$(call soong_config_set, MOTOROLA_TOUCH, HIGH_TOUCH_POLLING_PATH, /sys/class/touchscreen/primary/interpolation)

# Inherit from vendor blobs
$(call inherit-product, vendor/motorola/xpeng/xpeng-vendor.mk)
