#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Enable virtual A/B OTA
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-evolution

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Boot animation
TARGET_BOOT_ANIMATION_RES := 1440

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Device init scripts
PRODUCT_PACKAGES += \
    fstab.qcom

# OPFeature
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/odm_feature_list:$(TARGET_COPY_OUT_ODM)/etc/odm_feature_list

PRODUCT_SHIPPING_API_LEVEL := 30

# Inherit from oneplus sm8250-common
$(call inherit-product, device/oneplus/sm8250-common/common.mk)

# Fingerprint
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fingerprint/lib/libgf_ud_hal.so:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/30/lib/libgf_ud_hal.so \
    $(LOCAL_PATH)/fingerprint/lib/libgf_g6_ud_hal.so:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/30/lib/libgf_g6_ud_hal.so \
    $(LOCAL_PATH)/fingerprint/lib64/libgf_ud_hal.so:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/30/lib64/libgf_ud_hal.so \
    $(LOCAL_PATH)/fingerprint/lib64/libgf_g6_ud_hal.so:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/30/lib64/libgf_g6_ud_hal.so

# Inherit from vendor blobs
$(call inherit-product, vendor/oneplus/kebab/kebab-vendor.mk)
