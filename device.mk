#
# Copyright (C) 2011 The Android Open-Source Project
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

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/amlogic/orion/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Inherit generic amlogic device
$(call inherit-product, device/amlogic/common/aml-common.mk)


# Modules
PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel \
	device/amlogic/orion/prebuilt/modules/mali.ko:system/lib/modules/mali.ko \
	device/amlogic/orion/prebuilt/modules/ump.ko:system/lib/modules/ump.ko \
	device/amlogic/orion/prebuilt/modules/dhd.ko:system/lib/modules/dhd.ko

# Sensors
PRODUCT_COPY_FILES += \
	device/amlogic/orion/prebuilt/sensors/sensors.amlogic.so:system/lib/hw/sensors.amlogic.so \
	device/amlogic/orion/prebuilt/sensors/memsicd:system/bin/memsicd

# Wifi firmware
PRODUCT_COPY_FILES += \
        device/amlogic/orion/prebuilt/firmware/sdio-g-cdc-roml-reclaim-wme-apsta-idsup-idauth.bin:/system/etc/sdio-g-cdc-roml-reclaim-wme-apsta-idsup-idauth.bin \
        device/amlogic/orion/prebuilt/firmware/sdio-g-cdc-full11n-reclaim-roml-wme-idsup.bin:/system/etc/sdio-g-cdc-full11n-reclaim-roml-wme-idsup.bin \
        device/amlogic/orion/prebuilt/firmware/nvram.txt:/system/etc/nvram.txt \

# Input device calibration files
PRODUCT_COPY_FILES += \
	device/amlogic/orion/prebuilt/Goodix_TouchScreen_of_Guitar.idc:system/usr/idc/Goodix_TouchScreen_of_Guitar.idc

# Display modes
PRODUCT_COPY_FILES += \
	device/amlogic/orion/prebuilt/set_display_mode.sh:system/bin/set_display_mode.sh \

# Gsensor
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.gsensorposition=2 \
	sys.fb.bits=32 \
	ro.setupwizard.mode=OPTIONAL
