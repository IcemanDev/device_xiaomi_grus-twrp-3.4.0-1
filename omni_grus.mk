#
# Copyright 2017 The Android Open Source Project
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

# Release name
PRODUCT_RELEASE_NAME := grus

# Specify phone tech before including full_phone
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit Telephony packages
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit language packages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit 64bit support
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := grus
PRODUCT_NAME := omni_grus
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := MI 9 SE
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	sys.usb.controller=a600000.dwc3 \
	persist.sys.isUsbOtgEnabled=true \
	ro.treble.enabled=true \
	ro.build.system_root_image=true \
	ro.secure=0 \
	ro.adb.secure=0

# Copy updated tzdata
PRODUCT_COPY_FILES += system/timezone/output_data/iana/tzdata:recovery/root/system_root/system/usr/share/zoneinfo/tzdata

# Copy root file
PRODUCT_COPY_FILES += \
    device/xiaomi/grus/file-root/MAGISK-2040.zip:recovery/root/sbin/iceroot/MAGISK-2040.zip \
    device/xiaomi/grus/file-root/NO_VERITY_ENCRYPT.zip:recovery/root/sbin/iceroot/NO_VERITY_ENCRYPT.zip \
    device/xiaomi/grus/file-root/SIGNED_BOOT.zip:recovery/root/sbin/iceroot/SIGNED_BOOT.zip \
    device/xiaomi/grus/file-root/UNROOT.zip:recovery/root/sbin/iceroot/UNROOT.zip \
	device/xiaomi/grus/file-root/portrait.xml:recovery/root/twres/portrait.xml

# HACK: Set vendor patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31