#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm6225-common
$(call inherit-product, device/motorola/sm6225-common/bengal.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Audio - Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service.st

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Rootdir
PRODUCT_PACKAGES += \
    fstab.qcom_ufs \
    init.oem.fingerprint2.sh \
    init.mmi.overlay.rc

# Permissions
DEVICE_SKUS := b d f

PRODUCT_COPY_FILES += \
$(foreach DEVICE_SKU, $(DEVICE_SKUS), \
    $(LOCAL_PATH)/permissions/unavail.android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_$(DEVICE_SKU)/unavail.android.hardware.nfc.hce.xml \
    $(LOCAL_PATH)/permissions/unavail.android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_$(DEVICE_SKU)/unavail.android.hardware.nfc.hcef.xml \
    $(LOCAL_PATH)/permissions/unavail.android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_$(DEVICE_SKU)/unavail.android.hardware.nfc.uicc.xml \
    $(LOCAL_PATH)/permissions/unavail.android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_$(DEVICE_SKU)/unavail.android.hardware.nfc.xml)

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 31

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/motorola/devon/devon-vendor.mk)
